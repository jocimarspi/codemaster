unit uTrianglePerimeterCalc;

interface

uses
  System.SysUtils,
  Winapi.Windows,
  uGeometricShapeCalc;

type
  TTrianglePerimeterCalc = class(TGeometricShapeCalc)
  private
    FEdgeA: Extended;
    FEdgeB: Extended;
    FEdgeC: Extended;

    function TrianglePerimeter: Extended;
  protected
    procedure ReadParameters; override;
    procedure Calculate; override;
  end;

implementation

type
  TTrianglePerimeter = function (AEdgeA, AEdgeB, AEdgeC: Extended): Extended;

{ TTrianglePerimeterCalc }

function TTrianglePerimeterCalc.TrianglePerimeter: Extended;
var
  Handle: HMODULE;
  Func: TTrianglePerimeter;
begin
  Result := 0;
  Handle := LoadGeometricLib;
  try
    @Func := GetProcAddress(Handle, 'TrianglePerimeter');

    if @Func <> nil then
      Result := Func(FEdgeA, FEdgeB, FEdgeC);
  finally
    FreeLibrary(Handle);
  end;
end;

procedure TTrianglePerimeterCalc.Calculate;
var
  Perimeter: Extended;
begin
  inherited;

  Perimeter := TrianglePerimeter;

  WriteLn;
  WriteLn('Perimetro: ' + FormatFloat('#.####################', Perimeter));
end;

procedure TTrianglePerimeterCalc.ReadParameters;
begin
  inherited;

  FEdgeA := ReadParameter('Aresta A: ');
  FEdgeB := ReadParameter('Aresta B: ');
  FEdgeC := ReadParameter('Aresta C: ');
end;

end.
