unit EditLine;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvBaseEdits, Vcl.StdCtrls, Vcl.ExtCtrls,
  JvExExtCtrls, JvExtComponent, JvPanel, Vcl.Mask, JvExMask, JvToolEdit,
  JvExControls, JvLabel;

type
  TEditForm = class(TForm)
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    JvFilenameEdit1: TJvFilenameEdit;
    JvPanel1: TJvPanel;
    Button1: TButton;
    Button2: TButton;
    JvCalcEdit2: TJvCalcEdit;
    JvCalcEdit1: TJvCalcEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditForm: TEditForm;

implementation

{$R *.dfm}

uses GCC;

end.
