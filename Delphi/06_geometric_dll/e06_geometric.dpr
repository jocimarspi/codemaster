program e06_geometric;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Winapi.Windows,
  uGeometric in 'dll\uGeometric.pas',
  uCaculatorConsole in 'uCaculatorConsole.pas',
  uTrianglePerimeterCalc in 'uTrianglePerimeterCalc.pas',
  uGeometricShapeCalc in 'uGeometricShapeCalc.pas',
  uGeometricShapeCalcIntf in 'uGeometricShapeCalcIntf.pas',
  uRectanglePerimeterCalc in 'uRectanglePerimeterCalc.pas',
  uCirclePerimeterCalc in 'uCirclePerimeterCalc.pas',
  uTriangleAreaCalc in 'uTriangleAreaCalc.pas',
  uRectangleAreaCalc in 'uRectangleAreaCalc.pas',
  uCircleAreaCalc in 'uCircleAreaCalc.pas';

var
  CalcConsole: TCalculatorConsole;

begin
  try
    CalcConsole := TCalculatorConsole.Create;
    try
      CalcConsole.Execute;
    finally
      FreeAndNil(CalcConsole);
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
