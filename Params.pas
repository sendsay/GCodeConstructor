unit Params;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvExControls, JvLabel, JvEditorCommon,
  JvEditor, Vcl.StdCtrls, Vcl.ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel,
  JvComponentBase, JvFormPlacement;

type
  TParamsForm = class(TForm)
    JvPanel1: TJvPanel;
    Button1: TButton;
    Button2: TButton;
    JvEditor1: TJvEditor;
    JvLabel1: TJvLabel;
    JvEditor2: TJvEditor;
    JvLabel2: TJvLabel;
    JvFormStorage1: TJvFormStorage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ParamsForm: TParamsForm;

implementation

uses
  GCC;

{$R *.dfm}

end.
