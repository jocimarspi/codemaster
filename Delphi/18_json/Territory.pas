unit Territory;

interface

uses
  System.SysUtils,
  System.DateUtils,
  System.JSON;

type
  TTerritory = class
  private
    FLevel: String;
    FTerritory: String;
    FExperience: Integer;
    FDateLastMission: TDateTime;
    procedure SetDateLastMission(const Value: TDateTime);
    procedure SetExperience(const Value: Integer);
    procedure SetLevel(const Value: String);
    procedure SetTerritory(const Value: String);
  public
    property Territory: String read FTerritory write SetTerritory;
    property Level: String read FLevel write SetLevel;
    property Experience: Integer read FExperience write SetExperience;
    property DateLastMission: TDateTime read FDateLastMission write SetDateLastMission;

    function ToJson: String;
    function ToJsonValue: TJSONObject;
  end;

implementation

{ TTerritory }

procedure TTerritory.SetDateLastMission(const Value: TDateTime);
begin
  FDateLastMission := Value;
end;

procedure TTerritory.SetExperience(const Value: Integer);
begin
  FExperience := Value;
end;

procedure TTerritory.SetLevel(const Value: String);
begin
  FLevel := Value;
end;

procedure TTerritory.SetTerritory(const Value: String);
begin
  FTerritory := Value;
end;

function TTerritory.ToJson: String;
var
  territoryJson: TJSONObject;
begin
  territoryJson := ToJsonValue;
  try
    Result := territoryJson.ToJSON;
  finally
    FreeAndNil(territoryJson);
  end;
end;

function TTerritory.ToJsonValue: TJSONObject;
const
  NULL_DATE = 0;
begin
  Result := TJSONObject.Create;

  if FTerritory.IsEmpty then
    Result.AddPair('territory', TJSONNull.Create)
  else
    Result.AddPair('territory', TJSONString.Create(FTerritory));

  if FLevel.IsEmpty then
    Result.AddPair('level', TJSONNull.Create)
  else
    Result.AddPair('level', TJSONString.Create(FLevel));

  Result.AddPair('experience', TJSONNumber.Create(FExperience));

  if FDateLastMission = NULL_DATE then
    Result.AddPair('dateLastMission', TJSONNull.Create)
  else
  begin
    Result.AddPair(
      'dateLastMission',
      TJSONString.Create(FormatDateTime('yyyy-mm-dd',FDateLastMission))
    );
  end;
end;

end.
