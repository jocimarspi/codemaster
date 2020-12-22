unit GithubProject;

interface

uses
  System.SysUtils;

type
  TGithubProject = class
  private
    FName: String;
    FId: Integer;
    FDescription: String;
    FHtml_url: String;
    procedure SetDescription(const Value: String);
    procedure SetHtml_url(const Value: String);
    procedure SetId(const Value: Integer);
    procedure SetName(const Value: String);
  public
    property Id: Integer read FId write SetId;
    property Name: String read FName write SetName;
    property Html_url: String read FHtml_url write SetHtml_url;
    property Description: String read FDescription write SetDescription;

    function ToString: String; override;
  end;

implementation

{ TGithubProject }

procedure TGithubProject.SetDescription(const Value: String);
begin
  FDescription := Value;
end;

procedure TGithubProject.SetHtml_url(const Value: String);
begin
  FHtml_url := Value;
end;

procedure TGithubProject.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TGithubProject.SetName(const Value: String);
begin
  FName := Value;
end;

function TGithubProject.ToString: String;
var
  str: TStringBuilder;
begin
  str := TStringBuilder.Create;
  try
    str.AppendFormat('Id: %d', [FId]);
    str.AppendLine;
    str.AppendFormat('Nome: %s', [FName]);
    str.AppendLine;
    str.AppendFormat('Descrição: %s', [FDescription]);
    str.AppendLine;
    str.AppendFormat('URL: %s', [FHtml_url]);

    Result := str.ToString;
  finally
    FreeAndNil(str);
  end;
end;

end.
