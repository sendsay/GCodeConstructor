unit GCC;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, JvExControls,
  JvgShadow, Vcl.ComCtrls, JvExComCtrls, JvStatusBar;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    JvStatusBar1: TJvStatusBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

end.
