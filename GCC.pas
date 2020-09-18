unit GCC;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, JvExControls,
  JvgShadow, Vcl.ComCtrls, JvExComCtrls, JvStatusBar, JvSpeedbar, JvExExtCtrls,
  JvExtComponent, System.ImageList, Vcl.ImgList, System.Actions, Vcl.ActnList,
  Vcl.Menus, JvMenus, JvFormPlacement, JvComponentBase, JvAppStorage,
  JvAppIniStorage, Vcl.Grids, JvExGrids, JvStringGrid, System.UITypes ;

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
    Action_InsLine: TAction;
    Action_DeleteLine: TAction;
    JvAppIniFileStorage1: TJvAppIniFileStorage;
    JvFormStorage1: TJvFormStorage;
    JvStringGrid1: TJvStringGrid;
    Action_Exit: TAction;
    MainMenu1: TMainMenu;
    Action_OkButtonAddLine: TAction;
    Action_CancelButtonAddLine: TAction;
    procedure FormCreate(Sender: TObject);
    procedure Action_ExitExecute(Sender: TObject);
    procedure Action_AddLineExecute(Sender: TObject);
    procedure Action_OkButtonAddLineExecute(Sender: TObject);
    procedure Action_CancelButtonAddLineExecute(Sender: TObject);
    procedure Action_DeleteLineExecute(Sender: TObject);
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


implementation

uses
  AddLine;

{$R *.dfm}

procedure TMainForm.Action_OkButtonAddLineExecute(Sender: TObject);
var
  FName : string;
  BackPoint : TMyPoint;
begin
  FName := AddForm.JvFilenameEdit1.FileName;

  if (FName <> '') then
    begin

    BackPoint.PosX := StrToInt(AddForm.JvEdit1.Text);
    BackPoint.PosY := StrToInt(AddForm.JvEdit2.Text);

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
