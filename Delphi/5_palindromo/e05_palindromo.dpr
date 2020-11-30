program e05_palindromo;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uConsole in 'uConsole.pas';

var
  Console: TConsole;

begin
  Console := TConsole.Create;
  try
    Console.Run;
  finally
    FreeAndNil(Console);
  end;
end.
