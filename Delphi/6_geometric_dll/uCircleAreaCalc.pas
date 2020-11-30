unit uCircleAreaCalc;

interface

uses
  System.SysUtils,
  Winapi.Windows,
  uGeometricShapeCalc;

type
  TCircleAreaCalc = class(TGeometricShapeCalc)
  private
    FRadius: Extended;

    function CircleArea: Extended;
  protected
    procedure ReadParameters; override;
    procedure Calculate; override;
  end;

implementation

type
  TCircleArea = function (ARadius: Extended): Extended;

{ TCircleAreaCalc }

function TCircleAreaCalc.CircleArea: Extended;
var
  Handle: HMODULE;
  Func: TCircleArea;
begin
  Result := 0;
  Handle := LoadGeometricLib;
  try
    @Func := GetProcAddress(Handle, 'CircleArea');

    if @Func <> nil then
      Result := Func(FRadius);
  finally
    FreeLibrary(Handle);
  end;
end;

procedure TCircleAreaCalc.Calculate;
var
  Area: Extended;
begin
  inherited;

  Area := CircleArea;

  WriteLn;
  WriteLn('Area: ' + FormatFloat('#.####################', Area));
end;

procedure TCircleAreaCalc.ReadParameters;
begin
  inherited;
  FRadius := ReadParameter('Raio: ');
end;

end.
