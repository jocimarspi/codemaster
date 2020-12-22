program jsonapp;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  CodeMasterPlayer in 'CodeMasterPlayer.pas',
  Territory in 'Territory.pas';

var
  player: TCodeMasterPlayer;
  t: TTerritory;

begin
  try
     player := TCodeMasterPlayer.Create;
     try
       player.Player := 'Mystery';
       player.Active := True;

       t := TTerritory.Create;
       t.Territory := 'Delphi';
       t.Level := 'Squire';
       t.Experience := 17;
       t.DateLastMission := StrToDate('20/08/2019');
       player.Territories.Add(t);

       t := TTerritory.Create;
       t.Territory := 'SQL';
       player.Territories.Add(t);

       t := TTerritory.Create;
       t.Territory := 'Software Architecture';
       t.Level := 'Knight';
       t.Experience := 34;
       t.DateLastMission := StrToDate('01/07/2019');
       player.Territories.Add(t);

       WriteLn(player.ToJson);
       ReadLn;
     finally
       FreeAndNil(player);
     end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
