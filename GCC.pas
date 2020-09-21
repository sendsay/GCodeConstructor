unit GCC;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, JvExControls,
  JvgShadow, Vcl.ComCtrls, JvExComCtrls, JvStatusBar, JvSpeedbar, JvExExtCtrls,
  JvExtComponent, System.ImageList, Vcl.ImgList, System.Actions, Vcl.ActnList,
  Vcl.Menus, JvMenus, JvFormPlacement, JvComponentBase, JvAppStorage,
  JvAppIniStorage, Vcl.Grids, JvExGrids, JvStringGrid, System.UITypes, JvLabel,
  Vcl.StdCtrls, JvExStdCtrls, JvEdit, JvGroupBox, JvPanel, Vcl.Mask, JvExMask,
  JvToolEdit, JvBaseEdits, PerlRegEx, JvDialogs ;

type
  TMainForm = class(TForm)
    JvStatusBar1: TJvStatusBar;
    JvSpeedBar1: TJvSpeedBar;
    JvSpeedBarSection1: TJvSpeedBarSection;
    JvSpeedItem1: TJvSpeedItem;
    JvSpeedItem2: TJvSpeedItem;
    JvSpeedItem3: TJvSpeedItem;
    ImageList1: TImageList;
    ActionList1: TActionList;
    Action_AddLine: TAction;
    Action_EditLine: TAction;
    Action_DeleteLine: TAction;
    JvAppIniFileStorage1: TJvAppIniFileStorage;
    JvFormStorage1: TJvFormStorage;
    JvStringGrid1: TJvStringGrid;
    Action_Exit: TAction;
    MainMenu1: TMainMenu;
    Action_OkButtonAddLine: TAction;
    Action_CancelButtonAddLine: TAction;
    JvPanel1: TJvPanel;
    JvSpeedItem4: TJvSpeedItem;
    Action_Process: TAction;
    PerlRegEx1: TPerlRegEx;
    JvSpeedItem5: TJvSpeedItem;
    ActionCancelButtonOptions: TAction;
    Action_CallParamsForm: TAction;
    JvSaveDialog1: TJvSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure Action_ExitExecute(Sender: TObject);
    procedure Action_AddLineExecute(Sender: TObject);
    procedure Action_OkButtonAddLineExecute(Sender: TObject);
    procedure Action_CancelButtonAddLineExecute(Sender: TObject);
    procedure Action_DeleteLineExecute(Sender: TObject);
    procedure Action_ProcessExecute(Sender: TObject);
    procedure ActionCancelButtonOptionsExecute(Sender: TObject);
    procedure Action_CallParamsFormExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

  TMyPoint = record
    PosX, PosY : Double;
  end;

var
  MainForm: TMainForm;

function MoveCoord(S: string; NewPosX, NewPosY: Double):string;

implementation

uses
  AddLine, Params;

{$R *.dfm}

function MoveCoord(S: string; NewPosX, NewPosY: Double):string;
var
  PosX, PosY : Double;
  PosXStr, PosYStr : string;
begin
  with MainForm.PerlRegEx1 do
  begin
    Subject := S;

    if NewPosX <> 0 then
    begin
        RegEx := 'X\d+(.|,)\d+';
        if Match then
        begin
          PosXStr := MatchedExpression;
          Delete(PosXStr, 1, 1);
          PosX := StrToFloat(PosXStr);

          if NewPosX > 0 then PosX := PosX + NewPosX
          else
          if NewPosX < 0 then PosX := PosX - Abs(NewPosX);

          Replacement := 'X' + FloatToStr(PosX);
          if Match then Replace;
        end;
    end;

    if NewPosY <> 0 then
    begin
        RegEx := 'Y\d+(.|,)\d+';
        if Match then
        begin
          PosYStr := MatchedExpression;
          Delete(PosYStr, 1, 1);
          PosY := StrToFloat(PosYStr);

          if NewPosY > 0 then PosY := PosY + NewPosY
          else
          if NewPosY < 0 then PosY := PosY - Abs(NewPosY);

          Replacement := 'Y' + FloatToStr(PosY);
          if Match then Replace;
        end;
    end;
    Result := Subject;
  end;
end;

procedure TMainForm.Action_OkButtonAddLineExecute(Sender: TObject);
var
  FName : string;
  BackPoint : TMyPoint;
begin
  FName := AddForm.JvFilenameEdit1.FileName;

  if (FName <> '') then
    begin

    BackPoint.PosX := AddForm.JvCalcEdit1.Value;
    BackPoint.PosY := AddForm.JvCalcEdit2.Value;

    JvStringGrid1.InsertRow(JvStringGrid1.RowCount);
    JvStringGrid1.ActivateCell(0, JvStringGrid1.RowCount - 1);

    JvStringGrid1.Cells[0, JvStringGrid1.RowCount - 1] := FName;
    JvStringGrid1.Cells[1, JvStringGrid1.RowCount - 1] := FloatToStr(BackPoint.PosX);
    JvStringGrid1.Cells[2, JvStringGrid1.RowCount - 1] := FloatToStr(BackPoint.PosY);
    JvStringGrid1.FixedRows := 1;

    AddForm.Close;
    Action_DeleteLine.Enabled := True;
    end
  else
    begin
      MessageDlg('Select file to add!', mtInformation, [mbOk], 0, mbOk);
    end;
end;

procedure TMainForm.Action_ProcessExecute(Sender: TObject);
var
  InList, OutList : TStringList;
  FName : string;
  PosX, PosY : Double;
  I, J: Integer;
  NewPos, HeaderFooter : string;
  K, L: Integer;
begin
  InList := TStringList.Create;
  OutList := TStringList.Create;

  for I := 1 to JvStringGrid1.RowCount - 1 do
  begin
    FName := JvStringGrid1.Cells[0, I];
    PosX := StrToFloat(JvStringGrid1.Cells[1, I]);
    PosY := StrToFloat(JvStringGrid1.Cells[2, I]);

    InList.Clear;
    InList.LoadFromFile(FName);

    for J := 0 to InList.Count - 1 do
    begin
      NewPos := MoveCoord(InList.Strings[J], PosX, PosY);
      OutList.Append(NewPos);
    end;
  end;

  for K := ParamsForm.JvEditor1.Lines.Count - 1 downto 0 do
  begin
    HeaderFooter := ParamsForm.JvEditor1.Lines[K];
    OutList.Insert(0, HeaderFooter);
    showmessage(headerfooter);
  end;

  for L := 0 to ParamsForm.JvEditor2.Lines.Count - 1 do
  begin
    HeaderFooter := ParamsForm.JvEditor2.Lines[L];
    OutList.Append(HeaderFooter);
    showmessage(headerfooter);
  end;







  InList.Destroy;
  OutList.Destroy;
end;

procedure TMainForm.ActionCancelButtonOptionsExecute(Sender: TObject);
begin
  ParamsForm.Close;
end;

procedure TMainForm.Action_AddLineExecute(Sender: TObject);
begin
  AddForm.ShowModal;
end;

procedure TMainForm.Action_CallParamsFormExecute(Sender: TObject);
begin
  ParamsForm.ShowModal;
end;

procedure TMainForm.Action_CancelButtonAddLineExecute(Sender: TObject);
begin
  AddForm.Close;
end;

procedure TMainForm.Action_DeleteLineExecute(Sender: TObject);
begin
  if MessageDlg('Are you sure?', mtConfirmation,
    [mbYes, mbNo], 0, mbYes) = mrYes then
    begin
      JvStringGrid1.RemoveRow(JvStringGrid1.Row);
    end;

  if (JvStringGrid1.Row = 0) then
    begin
      Action_DeleteLine.Enabled := False;
    end;

end;

procedure TMainForm.Action_ExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  JvStringGrid1.Cells[0, 0] := 'File name';
  JvStringGrid1.Cells[1, 0] := 'Start on X';
  JvStringGrid1.Cells[2, 0] := 'Start on Y';
end;

end.
