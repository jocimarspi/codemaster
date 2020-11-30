unit uTriangleAreaCalc;

interface

uses
  System.SysUtils,
  Winapi.Windows,
  uGeometricShapeCalc;

type
  TTriangleAreaCalc = class(TGeometricShapeCalc)
  private
    FBase: Extended;
    FHeight: Extended;

    function TriangleArea: Extended;
  protected
    procedure ReadParameters; override;
    procedure Calculate; override;
  end;

implementation

type
  TTriangleArea = function (ABase, AHeight: Extended): Extended;

{ TTriangleAreaCalc }

function TTriangleAreaCalc.TriangleArea: Extended;
var
  Handle: HMODULE;
  Func: TTriangleArea;
begin
  Result := 0;
  Handle := LoadGeometricLib;
  try
    @Func := GetProcAddress(Handle, 'TriangleArea');

    if @Func <> nil then
      Result := Func(FBase, FHeight);
  finally
    FreeLibrary(Handle);
  end;
end;

procedure TTriangleAreaCalc.Calculate;
var
  Area: Extended;
begin
  inherited;

  Area := TriangleArea;

  WriteLn;
  WriteLn('Area: ' + FormatFloat('#.####################', Area));
end;

procedure TTriangleAreaCalc.ReadParameters;
begin
  inherited;
  FBase := ReadParameter('Base: ');
  FHeight := ReadParameter('Altura: ');
end;

end.
