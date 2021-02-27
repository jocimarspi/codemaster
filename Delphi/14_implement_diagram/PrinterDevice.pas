unit PrinterDevice;

interface

uses
  Device,
  Multifunctional;

type
  TPrinter = class(TDevice)
  private
    FMultiFunctional: TMultifunctional;
  public
    property MultiFunctional: TMultifunctional read FMultifunctional;
  end;

implementation

{ TPrinter }

end.
