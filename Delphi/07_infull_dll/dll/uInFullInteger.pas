
unit uInFullInteger;

interface

uses System.SysUtils, Math, System.Classes, Generics.Collections;

const
  sZERO_INFULL = 'zero';
  sNEGATIVE_INFULL = 'negativo';
  sTEXT_CONNECTOR_INFULL = ' e ';
  sHUNDRED_INFULL = 'cento';
  sSPACE_SEPARATOR = ' ';
  sNUMBER_FORMAT = '#,###,###,###,##0.0########';

type
  TUnit = (unUnit, unDozen, unHundred, unThousand, unMillion, unBillion, unTrillion);
  TDecompositionArray = array[TUnit] of SmallInt;
  TUnitDescripition = record
    Singular: String;
    Plural: String;
  end;

  TInFullInteger = class
  private
    FInFullValue: String;
    FDecomposition: TDecompositionArray;
    FDividers: array[TUnit] of Extended;

    FNumberValue: Extended;
    FUnitsDictionary: TDictionary<Integer,String>;
    FTenDictionary: TDictionary<Integer,String>;
    FDozensDictionary: TDictionary<Integer,String>;
    FHundredsDictionary :TDictionary<Integer,String>;
    FPlacesDictionary: TDictionary<TUnit,TUnitDescripition>;

    procedure InitUnitDescription;
    procedure InitTenDescription;
    procedure InitDozensDescripiton;
    procedure InitHundredsDescription;
    procedure InitDividers;
    procedure InitPlaces;

    function GetDivider(const pUnit: TUnit): Extended;
    function DecomposeByUnit(var pNumberValue: Extended;
      const pUnit: TUnit): Integer;

    procedure Decompose(var pDecompositionArray: TDecompositionArray;
      var pNumberValue: Extended); overload;
    procedure Decompose; overload;

    function GetInFullHundred(const pHundred, pDozen, pUnit: Integer) :String;
    function GetInFullDozen(const pDozen, pUnit: Integer) :String;
    function GetInFullUnit(const pDozen, pUnit: Integer) :String;
    function GetInFullGroup(const pHundred, pDozen, pUnit: Integer) :String;
    function GetInFullMajorGroup(const pUnit: TUnit): String;

    procedure ShowInFull;
    procedure AddInFull(const pInFull: String);
    procedure InitValue;

    procedure SetValor(const Value: Extended);
  public
    constructor Create;
    destructor Destroy; override;
    property NumberValue: Extended read FNumberValue write SetValor;
    function ToString: string; override;
  end;

implementation

{ TExtensoInteiro }

procedure TInFullInteger.Decompose;
begin
  Decompose(FDecomposition,FNumberValue);
end;

procedure TInFullInteger.Decompose(var pDecompositionArray: TDecompositionArray;
  var pNumberValue: Extended);
var
  NumberValue: Extended;
  Index: Integer;
begin
  NumberValue := pNumberValue;
  for Index := Ord(High(TUnit)) downto Ord(Low(TUnit)) do
  begin
    pDecompositionArray[TUnit(Index)] :=
      DecomposeByUnit(NumberValue, TUnit(Index));
  end;
end;

function TInFullInteger.DecomposeByUnit(var pNumberValue: Extended;
  const pUnit: TUnit): Integer;
var
  Divider: Extended;
begin
  Divider := GetDivider(pUnit);
  result := Trunc(pNumberValue / Divider);
  pNumberValue := pNumberValue - (result * Divider);
end;

constructor TInFullInteger.Create;
begin
  FNumberValue := ZeroValue;

  InitUnitDescription;
  InitTenDescription;
  InitDozensDescripiton;
  InitHundredsDescription;
  InitDividers;
  InitPlaces;
  InitValue;
end;

destructor TInFullInteger.Destroy;
begin
  FreeAndNil(FUnitsDictionary);
  FreeAndNil(FTenDictionary);
  FreeAndNil(FDozensDictionary);
  FreeAndNil(FHundredsDictionary);
  FreeAndNil(FPlacesDictionary);
  inherited;
end;

procedure TInFullInteger.InitPlaces;
var
  UnitDescription: TUnitDescripition;
begin
  FPlacesDictionary := TDictionary<TUnit, TUnitDescripition>.Create;

  UnitDescription.Singular := 'mil';
  UnitDescription.Plural := 'mil';
  FPlacesDictionary.Add(unThousand,UnitDescription);

  UnitDescription.Singular := 'milhão';
  UnitDescription.Plural := 'milhões';
  FPlacesDictionary.Add(unMillion,UnitDescription);

  UnitDescription.Singular := 'bilhão';
  UnitDescription.Plural := 'bilhões';
  FPlacesDictionary.Add(unBillion,UnitDescription);

  UnitDescription.Singular := 'trilhão';
  UnitDescription.Plural := 'trilhões';
  FPlacesDictionary.Add(unTrillion,UnitDescription);
end;

procedure TInFullInteger.InitHundredsDescription;
begin
  FHundredsDictionary := TDictionary<Integer, String>.Create;
  FHundredsDictionary.Add(1,'cem');
  FHundredsDictionary.Add(2,'duzentos');
  FHundredsDictionary.Add(3,'trezentos');
  FHundredsDictionary.Add(4,'quatrocentos');
  FHundredsDictionary.Add(5,'quinhentos');
  FHundredsDictionary.Add(6,'seiscentos');
  FHundredsDictionary.Add(7,'setecentos');
  FHundredsDictionary.Add(8,'oitocentos');
  FHundredsDictionary.Add(9,'novecentos');
end;

procedure TInFullInteger.InitTenDescription;
begin
  FTenDictionary := TDictionary<Integer, String>.Create;
  FTenDictionary.Add(1,'onze');
  FTenDictionary.Add(2,'doze');
  FTenDictionary.Add(3,'treze');
  FTenDictionary.Add(4,'quatorze');
  FTenDictionary.Add(5,'quinze');
  FTenDictionary.Add(6,'dezesseis');
  FTenDictionary.Add(7,'dezessete');
  FTenDictionary.Add(8,'dezoito');
  FTenDictionary.Add(9,'dezenove');
end;

procedure TInFullInteger.InitDozensDescripiton;
begin
  FDozensDictionary := TDictionary<Integer, String>.Create;
  FDozensDictionary.Add(1,'dez');
  FDozensDictionary.Add(2,'vinte');
  FDozensDictionary.Add(3,'trinta');
  FDozensDictionary.Add(4,'quarenta');
  FDozensDictionary.Add(5,'cinquenta');
  FDozensDictionary.Add(6,'sessenta');
  FDozensDictionary.Add(7,'setenta');
  FDozensDictionary.Add(8,'oitenta');
  FDozensDictionary.Add(9,'noventa');
end;

procedure TInFullInteger.InitDividers;
begin
  FDividers[unUnit] := 1;
  FDividers[unDozen] := 10;
  FDividers[unHundred] := 100;
  FDividers[unThousand] := 1000;
  FDividers[unMillion] := 1000000;
  FDividers[unBillion] := 1000000000;
  FDividers[unTrillion] := 1000000000000;
end;

procedure TInFullInteger.InitValue;
var
  NumberUnit: TUnit;
begin
  FInFullValue := EmptyStr;

  for NumberUnit := Low(FDecomposition) to High(FDecomposition) do
    FDecomposition[NumberUnit] := ZeroValue;
end;

procedure TInFullInteger.InitUnitDescription;
begin
  FUnitsDictionary := TDictionary<Integer, String>.Create;
  FUnitsDictionary.Add(1,'um');
  FUnitsDictionary.Add(2,'dois');
  FUnitsDictionary.Add(3,'três');
  FUnitsDictionary.Add(4,'quatro');
  FUnitsDictionary.Add(5,'cinco');
  FUnitsDictionary.Add(6,'seis');
  FUnitsDictionary.Add(7,'sete');
  FUnitsDictionary.Add(8,'oito');
  FUnitsDictionary.Add(9,'nove');
end;

procedure TInFullInteger.AddInFull(const pInFull: String);
begin
  if pInFull = EmptyStr then
    exit;

  if FInFullValue = EmptyStr then
    FInFullValue := Concat(FInFullValue, EmptyStr, Trim(pInFull))
  else
    FInFullValue := Concat(FInFullValue, sTEXT_CONNECTOR_INFULL, Trim(pInFull));
end;

procedure TInFullInteger.ShowInFull;
var
  Index: Integer;
  NumberUnit: TUnit;
  InFullLastGroup: String;
  InFullGroup: String;
begin
  FInFullValue := EmptyStr;

  for Index := Ord(unTrillion) downto Ord(unThousand) do
  begin
    NumberUnit := TUnit(Index);
    InFullGroup := GetInFullMajorGroup(NumberUnit);

    AddInFull(InFullGroup);
  end;

  InFullLastGroup := GetInFullGroup(
    FDecomposition[unHundred],
    FDecomposition[unDozen],
    FDecomposition[unUnit]
  );

  AddInFull(InFullLastGroup);
end;

function TInFullInteger.GetInFullUnit(const pDozen, pUnit: Integer) : String;
var
  IsBetweenTenAndTweny: Boolean;
begin
  result := EmptyStr;

  if pUnit = 0 then
    exit;

  IsBetweenTenAndTweny := (pDozen = 1) and (pUnit > 0);

  if IsBetweenTenAndTweny then
    exit;

  FUnitsDictionary.TryGetValue(pUnit,result);
end;

procedure TInFullInteger.SetValor(const Value: Extended);
begin
  FNumberValue := Value;
  InitValue;
end;

function TInFullInteger.GetDivider(const pUnit: TUnit): Extended;
begin
  result := FDividers[pUnit];
end;

function TInFullInteger.GetInFullHundred(const pHundred, pDozen,
  pUnit: Integer): String;
var
  GreatThenHundred: Boolean;
  HasDozenOrUnit: Boolean;
begin
  result := EmptyStr;
  if pHundred = 0 then
    exit;

  HasDozenOrUnit := (pUnit > 0) or (pDozen > 0);
  GreatThenHundred := HasDozenOrUnit;

  if GreatThenHundred and (pHundred = 1) then
    result := sHUNDRED_INFULL
  else
    FHundredsDictionary.TryGetValue(pHundred, result);

  if HasDozenOrUnit then
    result := Concat(result,sTEXT_CONNECTOR_INFULL);
end;

function TInFullInteger.GetInFullDozen(const pDozen,
  pUnit: Integer): String;
var
  IsBetweenTenAndTweny: Boolean;
begin
  result := EmptyStr;

  if pDozen = 0 then
    exit;

  IsBetweenTenAndTweny := (pDozen = 1) and (pUnit > 0);

  if IsBetweenTenAndTweny then
    FTenDictionary.TryGetValue(pUnit,result)
  else
    FDozensDictionary.TryGetValue(pDozen,result);

  if IsBetweenTenAndTweny then
    exit;

  if pUnit > 0 then
    result := Concat(result, sTEXT_CONNECTOR_INFULL);
end;

function TInFullInteger.GetInFullGroup(const pHundred, pDozen,
  pUnit: Integer): String;
begin
  result := Concat(
      GetInFullHundred(pHundred, pDozen, pUnit),
      GetInFullDozen(pDozen, pUnit),
      GetInFullUnit(pDozen, pUnit)
    );
end;

function TInFullInteger.GetInFullMajorGroup(const pUnit: TUnit): String;
var
  GroupValue: Extended;
  DecompositionArray: TDecompositionArray;
  UnitDescription: TUnitDescripition;
begin
  GroupValue := FDecomposition[pUnit];

  Decompose(DecompositionArray, GroupValue);

  result := GetInFullGroup(
              DecompositionArray[unHundred],
              DecompositionArray[unDozen],
              DecompositionArray[unUnit]
            );

  if result <> EmptyStr then
  begin
    FPlacesDictionary.TryGetValue(pUnit,UnitDescription);

    if FDecomposition[pUnit] = 1 then
      result := Concat(result, sSPACE_SEPARATOR, UnitDescription.Singular)
    else
      result := Concat(result, sSPACE_SEPARATOR, UnitDescription.Plural);
  end;
end;

function TInFullInteger.ToString: string;
begin
  Decompose;
  ShowInFull;
  result := FInFullValue;
end;

end.

