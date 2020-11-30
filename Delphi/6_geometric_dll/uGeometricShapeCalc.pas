unit uGeometricShapeCalc;

interface

uses
  System.SysUtils,
  Winapi.Windows,
  uGeometricShapeCalcIntf;

type
  TGeometricShapeCalc = class(TInterfacedObject, IGeometricShapeCalc)
  protected
    const
      GEOMETRIC_LIB =  'geometriclib.dll';

    function ReadParameter(const ADescription: String): Extended;
    function IsValidNumber(const AParameter: String): Boolean;
    procedure ReadParameters; virtual; abstract;
    procedure Calculate; virtual; abstract;
    function LoadGeometricLib: HMODULE;
  public
    procedure Execute;
  end;

implementation

{ TGeometricShapeCalc }

function TGeometricShapeCalc.LoadGeometricLib: HMODULE;
begin
  Result := LoadLibrary(GEOMETRIC_LIB);
  if Result = 0 then
    raise Exception.Create(Format('Nao foi possivel carregar "%s"',[GEOMETRIC_LIB]));
end;

procedure TGeometricShapeCalc.Execute;
begin
  WriteLn('Informe os parametros');
  ReadParameters;
  Calculate;
end;

function TGeometricShapeCalc.IsValidNumber(const AParameter: String): Boolean;
begin
  try
    StrToFloat(AParameter);
    Result := True;
  except
    Result := False;
  end;
end;

function TGeometricShapeCalc.ReadParameter(const ADescription: String): Extended;
var
  Parameter: String;
begin
  repeat
    Write(ADescription);
    ReadLn(Parameter);

    if not IsValidNumber(Parameter) then
    begin
      Parameter := EmptyStr;
      WriteLn('Numero invalido.');
    end;

  until IsValidNumber(Parameter);

  Result := StrToFloat(Parameter);
end;

end.
