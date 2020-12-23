unit uCaculatorConsole;

interface

uses
  SysUtils,
  uGeometricShapeCalcIntf;

type
  TGeometricShapeType = (gsTriangle, gsRectangle, gsCircle);
  TCalcType = (ctPerimeter, ctArea);

  TCalculatorConsole = class
  private
    FGeometricShape: TGeometricShapeType;
    FCalcType: TCalcType;

    procedure ShowTitle;
    procedure ShowShapeOptions;
    procedure ReadShapeOption;
    function IsValidShapeOption(const AShapeOption: String): Boolean;

    procedure ShowCalcOptions;
    procedure ReadCalcOption;
    function IsValidCalcTypeOption(const ACalcTypeOption: String): Boolean;

    procedure ConfirmContinuation;
    procedure Calculate;

    function OptionToGeometricType(const AOption: String): TGeometricShapeType;
    function OptionToCalcType(const AOption: String): TCalcType;

    function GetCalc: IGeometricShapeCalc;
  public
    procedure Execute;
  end;

implementation

uses
  uTrianglePerimeterCalc,
  uRectanglePerimeterCalc,
  uCirclePerimeterCalc,
  uTriangleAreaCalc,
  uRectangleAreaCalc,
  uCircleAreaCalc;

{ TCalculadoraConsole }

procedure TCalculatorConsole.Calculate;
begin
  GetCalc.Execute;
end;

procedure TCalculatorConsole.ConfirmContinuation;
var
  Option: String;
begin
  repeat
    Write('Deseja realizar mais um cálculo? [S/N]: ');
    ReadLn(Option);

    Option := AnsiUpperCase(Option);

    if Option = 'N' then
      Abort;

  until (Option = 'S') OR (Option = 'N');

  WriteLn;
end;

procedure TCalculatorConsole.Execute;
begin
  ShowTitle;

  while true do
  begin
    try
      ShowShapeOptions;
      ReadShapeOption;
      ShowCalcOptions;
      ReadCalcOption;

      Calculate;
      ConfirmContinuation;
      WriteLn;
    except
      on E: EAbort do
      begin
        Exit;
      end;

      on E: Exception do
      begin
        WriteLn('ERRO: '+E.Message);
      end;
    end;
  end;
end;

function TCalculatorConsole.GetCalc: IGeometricShapeCalc;
begin
  case FGeometricShape of
    gsTriangle:
    begin
      case FCalcType of
        ctPerimeter: Result := TTrianglePerimeterCalc.Create;
        ctArea: Result := TTriangleAreaCalc.Create;
      end;
    end;
    gsRectangle:
    begin
      case FCalcType of
        ctPerimeter: Result := TRectanglePerimeterCalc.Create;
        ctArea: Result := TRectangleAreaCalc.Create;
      end;
    end;
    gsCircle:
    begin
      case FCalcType of
        ctPerimeter: Result := TCirclePerimeterCalc.Create;
        ctArea: Result := TCircleAreaCalc.Create;
      end;
    end;
  end;
end;

function TCalculatorConsole.IsValidCalcTypeOption(const ACalcTypeOption: String): Boolean;
begin
  Result := (not ACalcTypeOption.Trim.IsEmpty)
    and CharInSet(ACalcTypeOption[1], ['1'..'2']);
end;

function TCalculatorConsole.IsValidShapeOption(const AShapeOption: String): Boolean;
begin
  Result := (not AShapeOption.Trim.IsEmpty)
    and CharInSet(AShapeOption[1], ['1'..'3']);
end;

function TCalculatorConsole.OptionToCalcType(const AOption: String): TCalcType;
begin
  Result := ctPerimeter;

  if AOption.Trim.IsEmpty then
    Exit;

  case AOption[1] of
    '1': Result := ctArea;
    '2': Result := ctPerimeter;
  end;
end;

function TCalculatorConsole.OptionToGeometricType(const AOption: String): TGeometricShapeType;
begin
  Result := gsTriangle;

  if AOption.Trim.IsEmpty then
    Exit;

  case AOption[1] of
    '1': Result := gsTriangle;
    '2': Result := gsRectangle;
    '3': Result := gsCircle;
  end;
end;

procedure TCalculatorConsole.ReadCalcOption;
var
  Option: String;
begin
  repeat
    Write('Opcao: ');
    ReadLn(Option);

    if not IsValidCalcTypeOption(Option) then
      WriteLn('Opcao invalida.');

    FCalcType := OptionToCalcType(Option);
  until IsValidCalcTypeOption(Option);

  WriteLn;
end;

procedure TCalculatorConsole.ReadShapeOption;
var
  Option: String;
begin
  repeat
    Write('Opcao: ');
    ReadLn(Option);

    if not IsValidShapeOption(Option) then
      WriteLn('Opcao invalida.');

    FGeometricShape := OptionToGeometricType(Option);
  until IsValidShapeOption(Option);

  WriteLn;
end;

procedure TCalculatorConsole.ShowCalcOptions;
begin
  WriteLn('Informe o tipo de calculo: ');
  WriteLn('    [1] - Area');
  WriteLn('    [2] - Perimetro');
  WriteLn;
end;

procedure TCalculatorConsole.ShowShapeOptions;
begin
  WriteLn('Escolha a forma geometrica: ');
  WriteLn('    [1] Triangulo.');
  WriteLn('    [2] Retangulo.');
  WriteLn('    [3] Circulo.');
  WriteLn;
end;

procedure TCalculatorConsole.ShowTitle;
begin
  WriteLn('CALCULADORA GEOMETRICA');
  WriteLn;
  WriteLn;
end;

end.
