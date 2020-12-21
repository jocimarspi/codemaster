program magiccreatorapp;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Notepad in 'Notepad.pas',
  MagicCreator in 'MagicCreator.pas';

var
  magic: TMagicCreator;

begin
  try
    magic := TMagicCreator.Create;
    try
      magic.Open;
    finally
      FreeAndNil(magic);
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
