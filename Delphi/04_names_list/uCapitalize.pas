unit uCapitalize;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.Types;

type
  TCapitalize = class
  private
    function IsPreposition(const Name: String): Boolean;
    function ArrayToString(const Words: TStringDynArray;
      const Delimiter: String): String;
  public
    function Capitalize(const Text: String): String;
  end;

implementation

const
  SPACE_DELIMITER = ' ';
  PREPOSITIONS: Array[0..5] of String = ('da', 'das', 'de', 'do', 'dos', 'e');


{ TCapitalize }

function TCapitalize.Capitalize(const Text: String): String;
var
  Words: TStringDynArray;
  NameWord: String;
  Index: Integer;
begin
  Words := SplitString(Text, SPACE_DELIMITER);

  for Index := 0 to Length(Words) - 1 do
  begin
    NameWord := AnsiLowerCase(Words[Index]);

    if not IsPreposition(NameWord) then
      NameWord[1] := AnsiUpperCase(NameWord)[1];

    Words[Index] := NameWord;
  end;

  Result := ArrayToString(Words, SPACE_DELIMITER);
end;

function TCapitalize.IsPreposition(const Name: String): Boolean;
var
  Prepostion: String;
begin
  for Prepostion in PREPOSITIONS do
  begin
    Result := Prepostion = LowerCase(Name);
    if Result then
      Break;
  end;
end;

function TCapitalize.ArrayToString(const Words: TStringDynArray;
  const Delimiter: String): String;
var
  NameBuilder: TStringBuilder;
  NameWord: String;
begin
  NameBuilder := TStringBuilder.Create;
  try
    for NameWord in Words do
    begin
      NameBuilder.Append(NameWord);
      NameBuilder.Append(Delimiter);
    end;

    Result := NameBuilder.ToString.Trim;
  finally
    FreeAndNil(NameBuilder);
  end;
end;

end.
