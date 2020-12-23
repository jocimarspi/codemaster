program xmldatabindapp;

uses
  Vcl.Forms,
  XMLDataBindForm in 'XMLDataBindForm.pas' {XMLDataBindF},
  UsersDelphiXML in 'UsersDelphiXML.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TXMLDataBindF, XMLDataBindF);
  Application.Run;
end.
