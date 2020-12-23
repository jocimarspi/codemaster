program xmldatasetapp;

uses
  Vcl.Forms,
  XMLDatasetForm in 'XMLDatasetForm.pas' {XMLDatasetF},
  ConvertUserXML in 'ConvertUserXML.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TXMLDatasetF, XMLDatasetF);
  Application.Run;
end.
