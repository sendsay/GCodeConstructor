program Project_GCC;

uses
  Vcl.Forms,
  GCC in 'GCC.pas' {MainForm},
  Vcl.Themes,
  Vcl.Styles,
  AddLine in 'AddLine.pas' {AddForm},
  Params in 'Params.pas' {ParamsForm};

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
  Application.Run;
end.
