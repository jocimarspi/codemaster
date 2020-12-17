program stackapp;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Stack in 'Stack.pas',
  StackConsole in 'StackConsole.pas';
var
  console: TStackConsole;
begin
  try
    console := TStackConsole.Create;
    try
      console.Execute;

      Readln;
    finally
      FreeAndNil(console);
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
