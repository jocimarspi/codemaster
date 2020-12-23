unit uRectanglePerimeterCalc;

interface

uses
  System.SysUtils,
  Winapi.Windows,
  uGeometricShapeCalc;

type
  TRectanglePerimeterCalc = class(TGeometricShapeCalc)
  private
    FLenght: Extended;
    FWidth: Extended;

    function RectanglePerimeter: Extended;
  protected
    procedure ReadParameters; override;
    procedure Calculate; override;
  end;

implementation

type
  TRectanglePerimeter = function (ALenght, AWidth: Extended): Extended;

{ TRectanglePerimeterCalc }

function TRectanglePerimeterCalc.RectanglePerimeter: Extended;
var
  Handle: HMODULE;
  Func: TRectanglePerimeter;
begin
  Result := 0;
  Handle := LoadGeometricLib;
  try
    @Func := GetProcAddress(Handle, 'RectanglePerimeter');

    if @Func <> nil then
      Result := Func(FLenght, FWidth);
  finally
    FreeLibrary(Handle);
  end;
end;

procedure TRectanglePerimeterCalc.Calculate;
var
  Perimeter: Extended;
begin
  inherited;

  Perimeter := RectanglePerimeter;

  WriteLn;
  WriteLn('Perimetro: ' + FormatFloat('#.####################', Perimeter));
end;

procedure TRectanglePerimeterCalc.ReadParameters;
begin
  inherited;
  FLenght := ReadParameter('Comprimento: ');
  FWidth := ReadParameter('Largura: ');
end;

end.
