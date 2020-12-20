unit MathCalculatorConsole;

interface

uses
  System.SysUtils,
  MathClass;

type
  TMathCalculatorConsole = class
  private
    FMathCalc: TMathClass;
    FSelectedOperation: TOperation;

    procedure PrintTitle;
    procedure ShowOperations;
    procedure ReadOperation;
    function ReadValue(const ALabel: String): Double;
    procedure Calculate;
    function IsValidOperation(const AReadOperation: String): Boolean;
    function IsValidNumber(const AReadValue: String): Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Execute;
  end;

implementation

{ TMathCalculatorConsole }

procedure TMathCalculatorConsole.Calculate;
begin
  FMathCalc.Operation := function: Double
                     begin
                       Result := 0;

                       case FSelectedOperation of
                         opAddiction: Result := FMathCalc.Left + FMathCalc.Right;
                         opSubtraction: Result := FMathCalc.Left - FMathCalc.Right;
                         opMutiplication: Result := FMathCalc.Left * FMathCalc.Right;
                         opDivision: Result := FMathCalc.Left / FMathCalc.Right;
                       end;
                     end;

  WriteLn('RESULTADO');
  WriteLn(
    Format(
      '%s %s %s = %s',
      [
        FMathCalc.Left.ToString,
        FSelectedOperation.AsMathSymbol,
        FMathCalc.Right.ToString,
        FMathCalc.Operation.ToString
      ]
    )
  );
end;

constructor TMathCalculatorConsole.Create;
begin
  FMathCalc := TMathClass.Create;
end;

destructor TMathCalculatorConsole.Destroy;
begin
  FreeAndNil(FMathCalc);
  inherited;
end;

procedure TMathCalculatorConsole.Execute;
begin
  PrintTitle;
  WriteLn;
  ShowOperations;
  WriteLn;
  ReadOperation;
  WriteLn;
  FMathCalc.Left := ReadValue('Valor esquedo: ');
  WriteLn;
  FMathCalc.Right := ReadValue('Valor direito: ');
  WriteLn;
  Calculate;
end;

function TMathCalculatorConsole.IsValidNumber(const AReadValue: String): Boolean;
var
  number: Double;
begin
  Result := TryStrToFloat(AReadValue, number)
    and (number >= Double.MinValue )
    and (number <= Double.MaxValue);
end;

function TMathCalculatorConsole.IsValidOperation(const AReadOperation: String): Boolean;
var
  number: Integer;
begin
  Result := TryStrToInt(AReadOperation, number)
    and (number > 0)
    and (number <= (High(TOperation).AsByte));
end;

procedure TMathCalculatorConsole.PrintTitle;
begin
  WriteLn('MATH CALCULATOR');
  WriteLn;
end;

procedure TMathCalculatorConsole.ReadOperation;
var
  valid: Boolean;
  value: String;
begin
  repeat
    Write('Operation: ');
    ReadLn(value);

    valid := IsValidOperation(value);
    if valid then
    begin
      FSelectedOperation := FSelectedOperation.Parse(StrToInt(value));
      WriteLn;
      WriteLn(FSelectedOperation.AsLabel);
    end
    else
    begin
      WriteLn('Operação inválida.');
      WriteLn;
    end;
  until valid;
end;

function TMathCalculatorConsole.ReadValue(const ALabel: String): Double;
var
  valid: Boolean;
  value: String;
begin
  Result := 0;

  repeat
    Write(ALabel);
    ReadLn(value);

    valid := IsValidNumber(value);
    if valid then
      Result := StrToFloat(value)
    else
    begin
      WriteLn('Valor inválido.');
      WriteLn;
    end;
  until valid;
end;

procedure TMathCalculatorConsole.ShowOperations;
var
  operation: TOperation;
begin
  WriteLn('Escolha a operação:');
  for operation := Low(TOperation) to High(TOperation) do
  begin
    if operation.AsByte > 0 then
      WriteLn(Format('  %d - %s',[operation.AsByte, operation.AsLabel]));
  end;
end;

end.
