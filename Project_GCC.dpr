program Project_GCC;

uses
  Vcl.Forms,
  GCC in 'GCC.pas' {MainForm},
  Vcl.Themes,
  Vcl.Styles,
  AddLine in 'AddLine.pas' {AddForm},
  Params in 'Params.pas' {ParamsForm},
  EditLine in 'EditLine.pas' {EditForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Smokey Quartz Kamri');
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAddForm, AddForm);
  Application.CreateForm(TAddForm, AddForm);
  Application.CreateForm(TAddForm, AddForm);
  Application.CreateForm(TParamsForm, ParamsForm);
  Application.CreateForm(TEditForm, EditForm);
  Application.Run;
end.
