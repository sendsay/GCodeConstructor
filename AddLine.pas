unit AddLine;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  JvExExtCtrls, JvExtComponent, JvPanel, JvExControls, JvLabel, JvExStdCtrls,
  JvEdit, Vcl.Mask, JvExMask, JvToolEdit, JvComponentBase, JvFormPlacement,
  System.Actions, Vcl.ActnList, JvBaseEdits;

type
  TAddForm = class(TForm)
    JvFilenameEdit1: TJvFilenameEdit;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    JvPanel1: TJvPanel;
    Button1: TButton;
    Button2: TButton;
    JvCalcEdit2: TJvCalcEdit;
    JvCalcEdit1: TJvCalcEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddForm: TAddForm;

implementation

uses
  GCC;

{$R *.dfm}


procedure TAddForm.FormShow(Sender: TObject);
begin
  JvFilenameEdit1.SetFocus;
end;

end.
