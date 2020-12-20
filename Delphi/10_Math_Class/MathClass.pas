unit MathClass;

interface

type
  TOperation = (opNone, opAddiction, opSubtraction, opMutiplication, opDivision);

  TOperationHelper = record helper for TOperation
    function AsLabel: String;
    function AsByte: Byte;
    function Parse(const AEnum: Byte): TOperation;
    function AsMathSymbol: String;
  end;

  TMathOperation = reference to function: Double;

  TMathClass = class
  private
    FRight: Double;
    FOperation: TMathOperation;
    FLeft: Double;
    procedure SetLeft(const Value: Double);
    procedure SetOperation(const Value: TMathOperation);
    procedure SetRight(const Value: Double);
  public
    constructor Create;
    property Left: Double read FLeft write SetLeft;
    property Right: Double read FRight write SetRight;
    property Operation: TMathOperation read FOperation write SetOperation;
  end;

implementation

{ TMathClass }

constructor TMathClass.Create;
begin
  FLeft := 0;
  FRight := 0;
end;

procedure TMathClass.SetLeft(const Value: Double);
begin
  FLeft := Value;
end;

procedure TMathClass.SetOperation(const Value: TMathOperation);
begin
  FOperation := Value;
end;

procedure TMathClass.SetRight(const Value: Double);
begin
  FRight := Value;
end;

{ TOperationHelper }

function TOperationHelper.AsByte: Byte;
begin
  Result := Ord(Self);
end;

function TOperationHelper.AsLabel: String;
const
  ARRAY_LABEL: array[TOperation] of String = (
    'Nenhum',
    'Adição',
    'Subtração' ,
    'Multiplicação',
    'Divisão'
  );
begin
  Result :=  ARRAY_LABEL[Self];
end;

function TOperationHelper.AsMathSymbol: String;
const
  ARRAY_MATH_SYMBOL: array[TOperation] of char = (' ', '+', '-', '*', '/');
begin
  Result := ARRAY_MATH_SYMBOL[Self];
end;

function TOperationHelper.Parse(const AEnum: Byte): TOperation;
begin
  Result := TOperation(AEnum);
end;

end.
