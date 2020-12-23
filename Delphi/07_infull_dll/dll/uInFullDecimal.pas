unit uInFullDecimal;

interface

uses SysUtils, uInFullInteger, Generics.Collections, Math;

type
  TDecimalPlaceDescription = record
    Singular: String;
    Plural: String;
  end;

  TDecimalPlace = (
    dpNone, dpTenth, dpHundredth, dpThousandth, dpTenthThousandth,
    dpHundredthThousandth, dpMillionth, dpTenthMillionth,
    dpHundredthMillionth, dpBillionth);

  TInFullDecimal = class
  private
    FInFullInteger: TInFullInteger;
    DecimalPlacesDictionary: TDictionary<TDecimalPlace,TDecimalPlaceDescription>;
    FDecimalPlace :TDecimalPlace;
    FNumberValue: Extended;
    FAbsoluleNumberValue: Extended;
    FDecimalNumberValue: Int64;
    FInFullValue: String;

    procedure InitPlaces;
    procedure CalculateDecimalPlace;
    procedure CalculateDecimalValue;
    function HasDecimalDigits: Boolean;
    function RetornarExtenso: String;
    procedure HandleNegativeResult;
    procedure HandleDecimalResult;
    procedure HandleIntegerResult;
    procedure SetNumberValue(const Value: Extended);
  public
    constructor Create; overload;
    destructor Destroy; override;

    property NumberValue: Extended read FNumberValue write SetNumberValue;

    function ToString: string; override;
  end;

implementation

{ TExtensoDecimal }

procedure TInFullDecimal.CalculateDecimalPlace;
var
  ValorDecimal: Extended;
  ValorString: String;
  Casa: Integer;
begin
  ValorDecimal := Frac(FAbsoluleNumberValue);

  if ValorDecimal = ZeroValue then
  begin
    FDecimalPlace := dpNone;
    Exit;
  end;

  ValorString := FormatFloat(sNUMBER_FORMAT,ValorDecimal);
  ValorString := StringReplace(ValorString,'0,',EmptyStr,[]);


  for Casa := 1 to Length(ValorString) do
  begin
    if ValorString[Casa] <> '0' then
    begin
      FDecimalPlace := TDecimalPlace(Casa);
      Exit;
    end;
  end;
end;

procedure TInFullDecimal.CalculateDecimalValue;
var
  ValorString: String;
begin
  FDecimalNumberValue := ZeroValue;

  if FDecimalPlace = dpNone then
    Exit;

  ValorString := FormatFloat(sNUMBER_FORMAT,Frac(FAbsoluleNumberValue));
  ValorString := StringReplace(ValorString,'0,',EmptyStr,[]);
  FDecimalNumberValue := StrToInt(ValorString);
end;

constructor TInFullDecimal.Create;
begin
  FNumberValue := ZeroValue;
  FInFullInteger := TInFullInteger.Create;
  DecimalPlacesDictionary := TDictionary<TDecimalPlace,TDecimalPlaceDescription>.Create;
  InitPlaces;
end;

destructor TInFullDecimal.Destroy;
begin
  FreeAndNil(FInFullInteger);
  FreeAndNil(DecimalPlacesDictionary);
  inherited;
end;

procedure TInFullDecimal.InitPlaces;
var
  rDecimalPlace: TDecimalPlaceDescription;
begin
  rDecimalPlace.Singular := 'd�cimo';
  rDecimalPlace.Plural := 'd�cimos';
  DecimalPlacesDictionary.Add(dpTenth, rDecimalPlace);

  rDecimalPlace.Singular := 'cent�simo';
  rDecimalPlace.Plural := 'cent�simos';
  DecimalPlacesDictionary.Add(dpHundredth, rDecimalPlace);

  rDecimalPlace.Singular := 'mil�simo';
  rDecimalPlace.Plural := 'mil�simos';
  DecimalPlacesDictionary.Add(dpThousandth, rDecimalPlace);

  rDecimalPlace.Singular := 'd�cimo de mil�simo';
  rDecimalPlace.Plural := 'd�cimos de mil�simo';
  DecimalPlacesDictionary.Add(dpTenthThousandth, rDecimalPlace);

  rDecimalPlace.Singular := 'cent�simo de mil�simo';
  rDecimalPlace.Plural := 'cent�simos de mil�simo';
  DecimalPlacesDictionary.Add(dpHundredthThousandth, rDecimalPlace);

  rDecimalPlace.Singular := 'milion�simo';
  rDecimalPlace.Plural := 'milion�simos';
  DecimalPlacesDictionary.Add(dpMillionth, rDecimalPlace);

  rDecimalPlace.Singular := 'd�cimo de milion�simo';
  rDecimalPlace.Plural := 'd�cimos de milion�simo';
  DecimalPlacesDictionary.Add(dpTenthMillionth, rDecimalPlace);

  rDecimalPlace.Singular := 'cent�simo de milion�simo';
  rDecimalPlace.Plural := 'cent�simos de milion�simo';
  DecimalPlacesDictionary.Add(dpHundredthMillionth, rDecimalPlace);

  rDecimalPlace.Singular := 'bilion�simo';
  rDecimalPlace.Plural := 'bilion�simos';
  DecimalPlacesDictionary.Add(dpBillionth, rDecimalPlace);
end;

function TInFullDecimal.ToString: string;
begin
  FAbsoluleNumberValue := Abs(FNumberValue);

  HandleIntegerResult;
  HandleDecimalResult;

  result := FInFullValue;
end;

procedure TInFullDecimal.HandleDecimalResult;
begin
  if not HasDecimalDigits then
    exit;

  CalculateDecimalPlace;
  CalculateDecimalValue;

  FInFullInteger.NumberValue := FDecimalNumberValue;

  if FInFullValue <> EmptyStr then
    FInFullValue := Concat(FInFullValue, sTEXT_CONNECTOR_INFULL);

  FInFullValue := Concat(FInFullValue, FInFullInteger.ToString, sSPACE_SEPARATOR,
    RetornarExtenso);

  HandleNegativeResult;
end;

procedure TInFullDecimal.HandleIntegerResult;
begin
  FInFullValue := sZERO_INFULL;

  if FNumberValue = ZeroValue then
    exit;

  FInFullInteger.NumberValue := FAbsoluleNumberValue;
  FInFullValue := FInFullInteger.ToString;

  if not HasDecimalDigits then
    HandleNegativeResult;
end;

procedure TInFullDecimal.HandleNegativeResult;
begin
  if FNumberValue >= 0 then
    exit;

  FInFullValue := Concat(FInFullValue, sSPACE_SEPARATOR, sNEGATIVE_INFULL);
end;

function TInFullDecimal.HasDecimalDigits: Boolean;
begin
  Result := Frac(FAbsoluleNumberValue) > ZeroValue;
end;

function TInFullDecimal.RetornarExtenso: String;
begin
  result := EmptyStr;

  if FDecimalPlace = dpNone then
    exit;

  if FDecimalNumberValue > 1 then
    result := DecimalPlacesDictionary[FDecimalPlace].Plural
  else
    result := DecimalPlacesDictionary[FDecimalPlace].Singular;
end;

procedure TInFullDecimal.SetNumberValue(const Value: Extended);
begin
  FNumberValue := Value;
end;

end.
