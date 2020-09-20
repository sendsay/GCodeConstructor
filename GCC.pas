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
  JvToolEdit, JvBaseEdits, PerlRegEx ;

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
    JvGroupBox1: TJvGroupBox;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    JvSpeedItem4: TJvSpeedItem;
    Action_Process: TAction;
    JvCalcEdit1: TJvCalcEdit;
    JvCalcEdit2: TJvCalcEdit;
    PerlRegEx1: TPerlRegEx;
    procedure FormCreate(Sender: TObject);
    procedure Action_ExitExecute(Sender: TObject);
    procedure Action_AddLineExecute(Sender: TObject);
    procedure Action_OkButtonAddLineExecute(Sender: TObject);
    procedure Action_CancelButtonAddLineExecute(Sender: TObject);
    procedure Action_DeleteLineExecute(Sender: TObject);
    procedure Action_ProcessExecute(Sender: TObject);
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
  AddLine;

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

          Replacement := 'X' + FloatToStr(PosY);
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
  FileOutput, FileInput : file;

begin



//  AssignFile(FileOutput, 'C:\test.txt');
//  Rewrite(FileOutput);
//
//  ShowMessage(FloatToStr(JvCalcEdit1.Value));
//
//
//
//
//
//  CloseFile(FileOutput);
end;

procedure TMainForm.Action_AddLineExecute(Sender: TObject);
begin
  AddForm.ShowModal;
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
  JvStringGrid1.Cells[1, 0] := 'Back to X';
  JvStringGrid1.Cells[2, 0] := 'Back to Y';
end;

end.
