unit StringListHelper;

interface

uses
  System.Classes,
  System.SysUtils;

type
  TStringListHelper = class helper for TStringList
    function IsEmpty: Boolean;
    function HasDuplicate: Boolean;
    function ToJson: String;
  end;

implementation

{ TStringListHelper }

function TStringListHelper.HasDuplicate: Boolean;
var
  findedIndex: Integer;
  lastString: String;
begin
  Result := false;

  if Self.IsEmpty then
    exit;

  Self.Sort;

  lastString := Self[0];
  for var index := 1 to Pred(Self.Count) do
  begin
    if lastString = Self[index] then
    begin
      Result := True;
      Break;
    end;

    lastString := Self[0];
  end;
end;

function TStringListHelper.IsEmpty: Boolean;
begin
  Result := Self.Count = 0;
end;

function TStringListHelper.ToJson: String;
const
  JSON_BRAKETS = '{%s}';
  JSON_PAIR = '%s:"%s",';
var
  index: Integer;
  valuesJson: TStringBuilder;
  name: String;
begin
  valuesJson := TStringBuilder.Create;
  try
    for index := 0 to Pred(Self.Count) do
    begin
      name := Self.Names[index];
      if name = EmptyStr then
      begin
        Result := EmptyStr;
        Exit;
      end;

      valuesJson.Append(Format(JSON_PAIR, [name, Self.Values[name]]));
    end;

    Result := valuesJson.ToString;
    Result := Format(JSON_BRAKETS, [Copy(Result, 1, Length(Result)-1)]);
  finally
    FreeAndNil(valuesJson);
  end;
end;

end.
