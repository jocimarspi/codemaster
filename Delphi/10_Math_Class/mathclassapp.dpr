program mathclassapp;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  MathClass in 'MathClass.pas',
  MathCalculatorConsole in 'MathCalculatorConsole.pas';

var
  mathCalc: TMathCalculatorConsole;

begin

  try
    mathCalc := TMathCalculatorConsole.Create;
    try
      mathCalc.Execute;
      ReadLn;
    finally
      FreeAndNil(mathCalc);
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
