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
  device: TDevice;

begin
  try
    device := TDevice.Create;
    try
      device.Marca := 'HP';
      device.Modelo := 'Deskjet 3050';
      device.Cor := 'Preta';
      device.NumeroSerie := '49CJ4939DJ5JJ9339M';
      device.TipoDispositivo := 'Multifunctional';
      device.DataCompra := Now;
      device.DataCadastro := Now;
      device.Ativo := False;

      WriteLn(device.ToString);
      WriteLn;

      device.MultiFunctional.Scan;
      device.MultiFunctional.Copy;
      device.MultiFunctional.Print;
      device.MultiFunctional.Send;
      device.MultiFunctional.Receive;

      ReadLn;
    finally
      FreeAndNil(device);
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
