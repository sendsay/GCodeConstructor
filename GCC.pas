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
    Action_CancelButtonEdit: TAction;
    Action_OkButtonEdit: TAction;
    JvSpeedItem6: TJvSpeedItem;
    Action_NewProject: TAction;
    JvSaveDialog1: TJvSaveDialog;
    Action_LoadProjectFile: TAction;
    JvOpenDialog1: TJvOpenDialog;
    JvSpeedItem7: TJvSpeedItem;
    Action_SaveProjectFile: TAction;
    JvSpeedItem8: TJvSpeedItem;
    procedure Action_ExitExecute(Sender: TObject);
    procedure Action_AddLineExecute(Sender: TObject);
    procedure Action_OkButtonAddLineExecute(Sender: TObject);
    procedure Action_CancelButtonAddLineExecute(Sender: TObject);
    procedure Action_DeleteLineExecute(Sender: TObject);
    procedure Action_ProcessExecute(Sender: TObject);
    procedure ActionCancelButtonOptionsExecute(Sender: TObject);
    procedure Action_CallParamsFormExecute(Sender: TObject);
    procedure Action_EditLineExecute(Sender: TObject);
    procedure Action_CancelButtonEditExecute(Sender: TObject);
    procedure Action_OkButtonEditExecute(Sender: TObject);
    procedure Action_NewProjectExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Action_LoadProjectFileExecute(Sender: TObject);
    procedure Action_SaveProjectFileExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     TableEdited: boolean;


  end;

  TMyPoint = record
    PosX, PosY : Double;
  end;

var
  MainForm: TMainForm;


function MoveCoord(S: string; NewPosX, NewPosY: Double):string;
procedure FillFixedRow;
procedure SaveProjectFile;

implementation

uses
  AddLine, Params, EditLine;

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
    Action_EditLine.Enabled := True;
    Action_Process.Enabled := True;
    TableEdited := True;
    end
  else
    begin
      MessageDlg('Select file to add!', mtInformation, [mbOk], 0, mbOk);
    end;
end;

procedure TMainForm.Action_ProcessExecute(Sender: TObject);
var
  InList, OutList, HeaderList : TStringList;
  FName : string;
  PosX, PosY : Double;
  I, J: Integer;
  NewPos, HeaderFooter : string;
  K, L: Integer;
begin
  InList := TStringList.Create;
  OutList := TStringList.Create;
  HeaderList := TStringList.Create;

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

  MainForm.JvAppIniFileStorage1.ReadStringList('ParamsForm\JvEditor1_Lines', HeaderList, True);
  for K := HeaderList.Count - 1 downto 0 do
  begin
    HeaderFooter := HeaderList.Strings[K];
    OutList.Insert(0, HeaderFooter);
  end;

  MainForm.JvAppIniFileStorage1.ReadStringList('ParamsForm\JvEditor2_Lines', HeaderList, True);
  for L := 0 to HeaderList.Count - 1 do
  begin
    HeaderFooter := HeaderList.Strings[L];
    OutList.Append(HeaderFooter);
  end;

  if (Mainform.JvSaveDialog1.Execute) then
    OutList.SaveToFile(MainForm.JvSaveDialog1.FileName);


  InList.Destroy;
  OutList.Destroy;
  HeaderList.Destroy;
end;

procedure TMainForm.Action_SaveProjectFileExecute(Sender: TObject);
begin
  SaveProjectFile;
end;

procedure TMainForm.Action_LoadProjectFileExecute(Sender: TObject);
var
  FName :string;
begin
  if MainForm.JvOpenDialog1.Execute then
  begin
    FName := MainForm.JvOpenDialog1.FileName;
    MainForm.JvStringGrid1.LoadFromFile(FName);
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  FillFixedRow;
end;

procedure TMainForm.ActionCancelButtonOptionsExecute(Sender: TObject);
begin
  ParamsForm.Close;
end;

procedure TMainForm.Action_OkButtonEditExecute(Sender: TObject);
var
  SelLine : integer;
begin
  SelLine := JvStringGrid1.Row;

  JvStringGrid1.Cells[0, SelLine] := EditForm.JvFilenameEdit1.FileName;
  JvStringGrid1.Cells[1, SelLine] := FloatToStr(EditForm.JvCalcEdit1.Value);
  JvStringGrid1.Cells[2, SelLine] := FloatToStr(EditForm.JvCalcEdit2.Value);

  JvStringGrid1.Update;

  EditForm.Close;


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

procedure TMainForm.Action_CancelButtonEditExecute(Sender: TObject);
begin
  EditForm.Close;
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
      Action_EditLine.Enabled := False;
      Action_Process.Enabled := False;
      TableEdited := False;
    end;

end;

procedure TMainForm.Action_EditLineExecute(Sender: TObject);
var
  SelLine : integer;
  FName, PosX, PosY : string;
begin
  SelLine := JvStringGrid1.Row;

  FName := JvStringGrid1.Cells[0, SelLine];
  PosX := JvStringGrid1.Cells[1, SelLine];
  PosY := JvStringGrid1.Cells[2, SelLine];

  EditForm.JvFilenameEdit1.FileName := FName;
  EditForm.JvCalcEdit1.Value := StrToFloat(PosX);
  EditForm.JvCalcEdit2.Value := StrToFloat(PosY);

  EditForm.ShowModal;
end;

procedure TMainForm.Action_ExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.Action_NewProjectExecute(Sender: TObject);
var
  I: Integer;
  FName : string;
begin
  if TableEdited then
  begin
    case Application.MessageBox('Save current poject?', 'Application.Title',
      MB_YESNOCANCEL + MB_ICONQUESTION) of
      IDYES:
        begin
          SaveProjectFile;

        end;
      IDNO:
        begin
            for I := 0 to MainForm.JvStringGrid1.RowCount - 1 do
            begin
              MainForm.JvStringGrid1.RemoveRow(MainForm.JvStringGrid1.RowCount - 1);
            end;

            Action_AddLine.Execute;
        end;
    end;

    end;


end;

procedure FillFixedRow;
begin
  MainForm.JvStringGrid1.Cells[0, 0] := 'File name';
  MainForm.JvStringGrid1.Cells[1, 0] := 'Start on X';
  MainForm.JvStringGrid1.Cells[2, 0] := 'Start on Y';
end;

procedure SaveProjectFile;
var
  FName : string;
begin
    if MainForm.JvSaveDialog1.Execute then
    begin
      FName := MAinForm.JvSaveDialog1.FileName;
      MainForm.JvStringGrid1.SaveToFile(FName);
    end;
end;

end.
