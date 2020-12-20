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
begin

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
