program implementdiagramapp;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  CopierIntf in 'CopierIntf.pas',
  Device in 'Device.pas',
  FaxIntf in 'FaxIntf.pas',
  Multifunctional in 'Multifunctional.pas',
  PrinterDevice in 'PrinterDevice.pas',
  PrinterIntf in 'PrinterIntf.pas',
  ScannerIntf in 'ScannerIntf.pas';

var
  printer: TPrinter;

begin
  try
    printer := TPrinter.Create;
    try
      printer.Marca := 'HP';
      printer.Modelo := 'Deskjet 3050';
      printer.Cor := 'Preta';
      printer.NumeroSerie := '49CJ4939DJ5JJ9339M';
      printer.TipoDispositivo := 'Multifunctional';
      printer.DataCompra := Now;
      printer.DataCadastro := Now;
      printer.Ativo := False;

      WriteLn(printer.ToString);
      WriteLn;

      printer.MultiFunctional.Scan;
      printer.MultiFunctional.Copy;
      printer.MultiFunctional.Print;
      printer.MultiFunctional.Send;
      printer.MultiFunctional.Receive;

      ReadLn;
    finally
      FreeAndNil(printer);
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
