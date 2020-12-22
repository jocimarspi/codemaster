unit CodeMasterPlayer;

interface

uses
  System.Generics.Collections,
  System.SysUtils,
  System.JSON,
  Territory;

type
  TCodeMasterPlayer = class
  private
    FActive: Boolean;
    FTerritories: TList<TTerritory>;
    FPlayer: String;
    procedure SetActive(const Value: Boolean);
    procedure SetPlayer(const Value: String);
    procedure SetTerritories(const Value: TList<TTerritory>);
    function GetTerritoriesJson: TJSONArray;
  public
    property Player: String read FPlayer write SetPlayer;
    property Active: Boolean read FActive write SetActive;
    property Territories: TList<TTerritory> read FTerritories write SetTerritories;

    constructor Create;
    destructor Destroy; override;

    function ToJson: String;
  end;

implementation

{ TCodeMasterPlayer }

constructor TCodeMasterPlayer.Create;
begin
  FTerritories := TList<TTerritory>.Create;
end;

destructor TCodeMasterPlayer.Destroy;
begin
  FreeAndNil(FTerritories);
  inherited;
end;

function TCodeMasterPlayer.GetTerritoriesJson: TJSONArray;
var
  territoriesJson: TJSONArray;
  territory: TTerritory;
begin
  territoriesJson := TJSONArray.Create;

  for territory in FTerritories do
    territoriesJson.Add(territory.ToJsonValue);

  result := territoriesJson;
end;

procedure TCodeMasterPlayer.SetActive(const Value: Boolean);
begin
  FActive := Value;
end;

procedure TCodeMasterPlayer.SetPlayer(const Value: String);
begin
  FPlayer := Value;
end;

procedure TCodeMasterPlayer.SetTerritories(const Value: TList<TTerritory>);
begin
  FTerritories := Value;
end;

function TCodeMasterPlayer.ToJson: String;
var
  playerJson: TJSONObject;
begin
  playerJson := TJSONObject.Create;
  try
    playerJson.AddPair('player', TJSONString.Create(FPlayer));
    playerJson.AddPair('active', TJSONBool.Create(FActive));
    playerJson.AddPair('territories', GetTerritoriesJson);

    Result := playerJson.ToJSON;
  finally
    FreeAndNil(playerJson);
  end;
end;

end.
