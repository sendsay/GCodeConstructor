unit AddLine;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  JvExExtCtrls, JvExtComponent, JvPanel, JvExControls, JvLabel, JvExStdCtrls,
  JvEdit, Vcl.Mask, JvExMask, JvToolEdit, JvComponentBase, JvFormPlacement;

type
  TAddForm = class(TForm)
    JvFilenameEdit1: TJvFilenameEdit;
    JvEdit1: TJvEdit;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    JvEdit2: TJvEdit;
    JvPanel1: TJvPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddForm: TAddForm;

implementation

{$R *.dfm}

procedure TAddForm.Button2Click(Sender: TObject);
begin
  AddForm.Close;
end;

end.
