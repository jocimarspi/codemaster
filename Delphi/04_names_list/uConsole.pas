unit uConsole;

interface

uses
  System.Classes,
  System.SysUtils,
  System.Types,
  System.StrUtils,
  uCapitalize;

type
  TConsole = class
  private
    FCapitalize: TCapitalize;
    FNamesList: TStringList;
    FHasName: Boolean;
    procedure AddName;
    function HasName: Boolean;
    procedure CapitalizeNames;
    procedure ShowCapitalizedNames;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Run;
  end;

implementation

{ TConsole }

procedure TConsole.AddName;
var
  Name: String;
begin
  Write(Format('Nome(%d): ',[FNamesList.Count+1]));
  Readln(Name);

  FHasName  := not Name.Trim.IsEmpty;

  if FHasName then
    FNamesList.Add(Name.Trim);
end;

constructor TConsole.Create;
begin
  FHasName := False;
  FNamesList := TStringList.Create;
  FCapitalize := TCapitalize.Create;
end;

destructor TConsole.Destroy;
begin
  FreeAndNil(FCapitalize);
  FreeAndNil(FNamesList);
  inherited;
end;

function TConsole.HasName: Boolean;
begin
  Result := FHasName;
end;

procedure TConsole.CapitalizeNames;
var
  Index: Integer;
begin
  for Index := 0 to FNamesList.Count - 1 do
    FNamesList[Index] :=  FCapitalize.Capitalize(FNamesList[Index]);
end;

procedure TConsole.Run;
begin
  FNamesList.Clear;
  try
    Writeln('Informe um nome e pressione ENTER para incluí-lo.');
    Writeln('Pressione ENTER duas vezes para converter os nomes para caixa mista.');
    Writeln('');

    repeat
      AddName;
    until not HasName;

    CapitalizeNames;

    ShowCapitalizedNames;

    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end;

procedure TConsole.ShowCapitalizedNames;
var
  Name: String;
begin
  Writeln('');
  Writeln('Nomes convertidos para caixa mista.');

  for Name in FNamesList do
    Writeln(Format(' - %s',[Name]));
end;

end.
