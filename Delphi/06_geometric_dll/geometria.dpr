program geometria;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uGeometricFormDll in 'dll\uGeometricFormDll.pas',
  uGeometricFormAPI in 'dll\uGeometricFormAPI.pas',
  uTriangle in 'dll\uTriangle.pas',
  uRectangle in 'dll\uRectangle.pas',
  uCircle in 'dll\uCircle.pas',
  uGeometricForm in 'dll\uGeometricForm.pas';

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
