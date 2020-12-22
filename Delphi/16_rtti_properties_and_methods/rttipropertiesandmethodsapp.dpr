program rttipropertiesandmethodsapp;

uses
  Vcl.Forms,
  RttiPropertiesAndMethodsForm in 'RttiPropertiesAndMethodsForm.pas' {RttiPropertiesAndMethodsF},
  ClassInformation in 'ClassInformation.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TRttiPropertiesAndMethodsF, RttiPropertiesAndMethodsF);
  Application.Run;
end.
