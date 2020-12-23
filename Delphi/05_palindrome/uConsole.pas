unit uConsole;

interface

uses
  System.Classes,
  System.SysUtils,
  System.StrUtils;

type
  TConsole = class
    FPhrasaList: TStringList;
    FHasPhrase: Boolean;
  private
    function HasPhrase: Boolean;
    procedure AddPhrase;
    procedure ShowPalindromos;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Run;
  end;

implementation

{ TConsole }

constructor TConsole.Create;
begin
  FPhrasaList := TStringList.Create;
end;

destructor TConsole.Destroy;
begin
  FreeAndNil(FPhrasaList);
  inherited;
end;

function TConsole.HasPhrase: Boolean;
begin
  Result := FHasPhrase;
end;

procedure TConsole.Run;
begin
  FPhrasaList.Clear;
  try
    Writeln('Informe uma frase e pressione ENTER para incluí-la.');
    Writeln('Pressione ENTER duas vezes para mostrar somente os palíndromos.');
    Writeln('');

    repeat
      AddPhrase;
    until not HasPhrase;

    ShowPalindromos;

    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end;

procedure TConsole.ShowPalindromos;
var
  Phrase: String;
begin
  Writeln('');
  Writeln('Palíndromos encontrados');
  for Phrase in FPhrasaList do
  begin
    if Phrase.LowerCase(Phrase.Trim)= Phrase.LowerCase(ReverseString(Phrase.Trim)) then
      Writeln(Format(' - %s', [Phrase]));
  end;
end;

procedure TConsole.AddPhrase;
var
  Phrase: String;
begin
  Write(Format('Phrase(%d): ',[FPhrasaList.Count+1]));
  Readln(Phrase);

  FHasPhrase := not Phrase.Trim.IsEmpty;

  if FHasPhrase then  
    FPhrasaList.Add(Phrase.Trim);
end;

end.
