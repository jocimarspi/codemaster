unit Multifunctional;

interface

uses
  ScannerIntf,
  FaxIntf,
  CopierIntf,
  PrinterIntf;

type
  TMultifunctional = class(TInterfacedObject, IScanner, IFax, ICopier, IPrinterDevice)
  public
    procedure Scan;
    procedure Send;
    procedure Receive;
    procedure Print;
    procedure Copy;
  end;

implementation

{ TMultifunctional }

procedure TMultifunctional.Copy;
begin
  WriteLn('Copiado');
end;

procedure TMultifunctional.Print;
begin
  WriteLn('Impresso');
end;

procedure TMultifunctional.Receive;
begin
  WriteLn('Fax Recebido');
end;

procedure TMultifunctional.Scan;
begin
  WriteLn('Escaneado');
end;

procedure TMultifunctional.Send;
begin
  WriteLn('Fax enviado');
end;

end.
