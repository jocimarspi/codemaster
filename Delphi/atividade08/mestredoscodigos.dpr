program mestredoscodigos;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  Vcl.Themes,
  Vcl.Styles,
  ugeometria in 'ugeometria.pas',
  uExtensoInteiro in 'uExtensoInteiro.pas',
  uExtensoDecimal in 'uExtensoDecimal.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Iceberg Classico');
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
