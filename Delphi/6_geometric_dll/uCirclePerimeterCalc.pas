unit uCirclePerimeterCalc;

interface

uses
  System.SysUtils,
  Winapi.Windows,
  uGeometricShapeCalc;

type
  TCirclePerimeterCalc = class(TGeometricShapeCalc)
  private
    FRadius: Extended;
    
    function CirclePerimeter: Extended;
  protected
    procedure ReadParameters; override;
    procedure Calculate; override;
  end;

implementation

type
  TCirclePerimeter = function (ARadius: Extended): Extended;

{ TCirclePerimeterCalca }

function TCirclePerimeterCalc.CirclePerimeter: Extended;
var
  Handle: HMODULE;
  Func: TCirclePerimeter;
begin
  Result := 0;
  Handle := LoadGeometricLib;
  try
    @Func := GetProcAddress(Handle, 'CirclePerimeter');

    if @Func <> nil then
      Result := Func(FRadius);
  finally
    FreeLibrary(Handle);
  end;
end;

procedure TCirclePerimeterCalc.Calculate;
var
  Perimeter: Extended;
begin
  inherited;

  Perimeter := CirclePerimeter;

  WriteLn;
  WriteLn('Perimetro: ' + FormatFloat('#.####################', Perimeter));
end;

procedure TCirclePerimeterCalc.ReadParameters;
begin
  inherited;
  FRadius := ReadParameter('Raio: ');
end;

end.
