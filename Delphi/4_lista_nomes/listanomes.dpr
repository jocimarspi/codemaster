program listanomes;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uConsole in 'uConsole.pas';
var
  MyConsole: TConsole;
begin
  MyConsole := TConsole.Create;
  try
    MyConsole.Run;
  finally
    FreeAndNil(MyConsole);
  end;
end.
