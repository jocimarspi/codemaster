unit Continent;

interface

type
  TContinentEnum = (
    conAsia,
    conAfrica,
    conAmerica,
    conAntarctica,
    conEurope,
    conOceania
  );

  TContinetEnumHelper = record helper for TContinentEnum
    function AsLabel: String;
    function AsString: String;
    function AsByte: Byte;
    function Parse(const AEnum: Byte): TContinentEnum;
  end;

implementation

uses
  TypInfo;

const
  ARRAY_LABEL: array[TContinentEnum] of String = (
    'Ásia',
    'Africa',
    'América',
    'Antártida',
    'Europa',
    'Oceania'
  );

{ TContinetEnumHelper }

function TContinetEnumHelper.AsByte: Byte;
begin
  Result := Ord(Self);
end;

function TContinetEnumHelper.AsLabel: String;
begin
  Result := ARRAY_LABEL[Self];
end;

function TContinetEnumHelper.AsString: String;
begin
  Result := GetEnumName(TypeInfo(TContinentEnum), Ord(Self));
end;

function TContinetEnumHelper.Parse(const AEnum: Byte): TContinentEnum;
begin
  Result := TContinentEnum(AEnum);
end;

end.
