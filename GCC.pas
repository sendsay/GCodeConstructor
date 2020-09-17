unit GCC;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, JvExControls,
  JvgShadow, Vcl.ComCtrls, JvExComCtrls, JvStatusBar, JvSpeedbar, JvExExtCtrls,
  JvExtComponent, System.ImageList, Vcl.ImgList, System.Actions, Vcl.ActnList,
  Vcl.Menus, JvMenus, JvFormPlacement, JvComponentBase, JvAppStorage,
  JvAppIniStorage, Vcl.Grids, JvExGrids, JvStringGrid, AddLine;

type
  TMainForm = class(TForm)
    JvStatusBar1: TJvStatusBar;
    JvSpeedBar1: TJvSpeedBar;
    JvSpeedBarSection1: TJvSpeedBarSection;
    JvSpeedItem1: TJvSpeedItem;
    JvSpeedItem2: TJvSpeedItem;
    JvSpeedItem3: TJvSpeedItem;
    ImageList1: TImageList;
    JvMainMenu1: TJvMainMenu;
    Projects1: TMenuItem;
    ables1: TMenuItem;
    Help1: TMenuItem;
    Add1: TMenuItem;
    Insertline1: TMenuItem;
    Deleteline1: TMenuItem;
    About1: TMenuItem;
    ActionList1: TActionList;
    Action_AddLine: TAction;
    Action_InsLine: TAction;
    Action_DeleteLine: TAction;
    JvAppIniFileStorage1: TJvAppIniFileStorage;
    JvFormStorage1: TJvFormStorage;
    JvStringGrid1: TJvStringGrid;
    File1: TMenuItem;
    Exit1: TMenuItem;
    Action_Exit: TAction;
    procedure FormCreate(Sender: TObject);
    procedure Action_ExitExecute(Sender: TObject);
    procedure Action_AddLineExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.Action_AddLineExecute(Sender: TObject);
begin
  AddForm.ShowModal;
end;

procedure TMainForm.Action_ExitExecute(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  JvStringGrid1.Cells[0, 0] := 'File name';
  JvStringGrid1.Cells[1, 0] := 'Back to X';
  JvStringGrid1.Cells[2, 0] := 'Back to Y';
end;

end.
