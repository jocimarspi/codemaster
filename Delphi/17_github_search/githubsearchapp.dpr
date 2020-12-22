program githubsearchapp;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.StrUtils,
  GithubSearch in 'GithubSearch.pas',
  GithubProject in 'GithubProject.pas';

var
  search: TGithubSearch;
  project: TGithubProject;
  textSearch: String;

procedure ShowPageInformation;
begin
  WriteLn(StringOfChar('-',60));
  WriteLn(
    Format(
      'Página %d. Mostrando %d a %d de um total de %d',
      [
        search.CurrentPage,
        search.FirstCountProject,
        search.LastCountProject,
        search.TotalProjects
      ]
    )
  );
  WriteLn(StringOfChar('-',60));
end;

begin
  WriteLn('CONSULTA GITHUB');
  WriteLn;
  try
     search := TGithubSearch.Create;
     try
       Write('CONSULTAR POR: ');
       ReadLn(textSearch);
       WriteLn;

       search.SearchText := textSearch;
       WriteLn('Consultando. Aguarde...');
       WriteLn;
       search.Execute;

       if search.Projects.Count = 0 then
         WriteLn('(Nada encontrado)')
       else
       begin
         repeat
           ShowPageInformation;
           WriteLn;
           for project in search.Projects do
           begin
             WriteLn(project.ToString);
             WriteLn;
           end;

           ShowPageInformation;
           WriteLn;

           WriteLn('[ENTER] - Próxima página    [CTRL+C] - Sair');
           ReadLn;

         until not Search.NextPage;
       end;

       WriteLn;
     finally
       FreeAndNil(search);
     end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
