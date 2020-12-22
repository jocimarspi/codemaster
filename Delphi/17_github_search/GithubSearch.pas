unit GithubSearch;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  System.Net.HttpClient,
  System.JSON,
  REST.Client,
  REST.Types,
  GithubProject;

type
  EGithubSearch = class(Exception);

  TGithubSearch = class
    FProjects: TList<TGithubProject>;

    FProtocalError: Boolean;
    FRestClient: TRESTClient;
    FRestRequest: TRESTRequest;
    FRestResponse: TRESTResponse;
  private
    FSearchText: String;
    FTotalProjects: Integer;
    FCurrentPage: Integer;
    FTotalFetchedProjects: Integer;
    procedure SetSearchText(const Value: String);
    procedure ParseProjects;
    procedure OnHTTPProtocolError(Sender: TCustomRESTRequest);
    function HasProtocolError: Boolean;
    procedure Search;
    function GetFirstCountProject: Integer;
    function GetLastCountProject: Integer;
  public
    const MAX_PER_PAGE: Integer = 10;
    constructor Create;
    destructor Destroy; override;

    property CurrentPage: Integer read FCurrentPage;
    property TotalProjects: Integer read FTotalProjects;
    property SearchText: String read FSearchText write SetSearchText;
    property Projects: TList<TGithubProject> read FProjects;
    property FirstCountProject: Integer read GetFirstCountProject;
    property LastCountProject: Integer read GetLastCountProject;

    procedure Execute;
    function NextPage: Boolean;
  end;

implementation



{ TGithubSearch }

constructor TGithubSearch.Create;
begin
  FProjects := TList<TGithubProject>.Create;
  FRestClient := TRESTClient.Create('https://api.github.com');

  FRestResponse := TRESTResponse.Create(nil);

  FRestRequest := TRESTRequest.Create(nil);
  FRestRequest.Resource := '/search/repositories';
  FRestRequest.Client := FRestClient;
  FRestRequest.Response := FRestResponse;

  FCurrentPage := 0;
  FTotalProjects := 0;
  FTotalFetchedProjects := 0;
end;

destructor TGithubSearch.Destroy;
begin
  FreeAndNil(FProjects);
  FreeAndNil(FRestClient);
  FreeAndNil(FRestRequest);
  FreeAndNil(FRestResponse);
  inherited;
end;

procedure TGithubSearch.Execute;
begin
  FCurrentPage := 1;
  FTotalProjects := 0;
  FTotalFetchedProjects := 0;
  Search;
end;

function TGithubSearch.GetFirstCountProject: Integer;
begin
  Result := 1;
  if FTotalFetchedProjects >= MAX_PER_PAGE then
    Result := FTotalFetchedProjects - FProjects.Count + 1;
end;

function TGithubSearch.GetLastCountProject: Integer;
begin
  Result := FTotalFetchedProjects;
end;

function TGithubSearch.HasProtocolError: Boolean;
begin
  Result := FProtocalError;
end;

function TGithubSearch.NextPage: Boolean;
begin
  Result := False;

  if (FTotalFetchedProjects < FTotalProjects) then
  begin
    Inc(FCurrentPage);
    Search;
    Result := True;
  end;
end;

procedure TGithubSearch.OnHTTPProtocolError(Sender: TCustomRESTRequest);
begin
  raise EGithubSearch.Create('Falha ao consultar.');
end;

procedure TGithubSearch.ParseProjects;
var
  projectsJson: TJSONValue;
  itemsJson: TJSONArray;
  project: TGithubProject;
  index: Integer;
begin
  projectsJson := TJSONObject.Create;
  try
    projectsJson := TJSONObject.ParseJSONValue(FRestResponse.Content);

    FTotalProjects := projectsJson.GetValue<Integer>('total_count');

    itemsJson := projectsJson.GetValue<TJSONArray>('items');

    for index := 0 to Pred(itemsJson.Count) do
    begin
      projectsJson := itemsJson.Items[index];

      project := TGithubProject.Create;
      project.Id := projectsJson.GetValue<Integer>('id');
      project.Name := projectsJson.GetValue<String>('name');
      project.Description := projectsJson.GetValue<String>('description');
      project.Html_url := projectsJson.GetValue<String>('html_url');

      FProjects.Add(project);
    end;
  finally
    FreeAndNil(projectsJson);
  end;
end;

procedure TGithubSearch.Search;
begin
  FProjects.Clear;

  FProtocalError := False;

  FRestRequest.Method := rmGet;
  FRestRequest.Params.Clear;
  FRestRequest.AddParameter('q', FSearchText);
  FRestRequest.AddParameter('per_page', MAX_PER_PAGE.ToString);
  FRestRequest.AddParameter('page', FCurrentPage.ToString);
  FRestRequest.OnHTTPProtocolError := OnHTTPProtocolError;
  FRestRequest.Execute;

  if not HasProtocolError then
    ParseProjects;

  FTotalFetchedProjects := FTotalFetchedProjects + FProjects.Count;
end;

procedure TGithubSearch.SetSearchText(const Value: String);
begin
  FSearchText := Value;
end;

end.
