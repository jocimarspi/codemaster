unit PrinterDevice;

interface

uses
  Multifunctional;

type
  TPrinter = class
  private
    FMultiFunctional: TMultifunctional;
  public
    property MultiFunctional: TMultifunctional read FMultifunctional;
  end;

implementation

{ TPrinter }

end.
