unit uRectangleAreaCalc;

interface

uses
  System.SysUtils,
  Winapi.Windows,
  uGeometricShapeCalc;

type
  TRectangleAreaCalc = class(TGeometricShapeCalc)
  private
    FLenght: Extended;
    FWidth: Extended;
    
    function RectangleArea: Extended;
  protected
    procedure ReadParameters; override;
    procedure Calculate; override;
  end;

implementation

type
  TRectangleArea = function (ALenght, AWidth: Extended): Extended;

{ TRectangleAreaCalc }

function TRectangleAreaCalc.RectangleArea: Extended;
var
  Handle: HMODULE;
  Func: TRectangleArea;
begin
  Result := 0;
  Handle := LoadGeometricLib;
  try
    @Func := GetProcAddress(Handle, 'RectangleArea');

    if @Func <> nil then
      Result := Func(FLenght, FWidth);
  finally
    FreeLibrary(Handle);
  end;
end;

procedure TRectangleAreaCalc.Calculate;
var
  Area: Extended;
begin
  inherited;

  Area := RectangleArea;

  WriteLn;
  WriteLn('Area: ' + FormatFloat('#.####################', Area));
end;

procedure TRectangleAreaCalc.ReadParameters;
begin
  inherited;
  FLenght := ReadParameter('Comprimento: ');
  FWidth := ReadParameter('Largura: ');
end;

end.
