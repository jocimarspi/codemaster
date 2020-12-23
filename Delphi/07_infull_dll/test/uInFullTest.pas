unit uInFullTest;

interface
uses
  DUnitX.TestFramework, SysUtils, uInFullDecimal;

type

  [TestFixture]
  TExtensoTest = class(TObject) 
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure InFullTest;
  end;

implementation

type
  TTestCaseInFull = record
    Id: SmallInt;
    NumberValue: Extended;
    InFullValue: String;
  end;

const
  aInFullValuesTest: Array[0..23] of TTestCaseInFull =
    (
      (Id: 1; NumberValue: 0; InFullValue: 'zero'),
      (Id: 2; NumberValue: 1; InFullValue: 'um'),
      (Id: 3; NumberValue: 999999999999999; InFullValue: 'novecentos e noventa e nove trilh�es e novecentos e noventa e nove bilh�es e novecentos e noventa e nove milh�es e novecentos e noventa e nove mil e novecentos e noventa e nove'),
      (Id: 4; NumberValue: 0.1; InFullValue: 'um d�cimo'),
      (Id: 5; NumberValue: 0.01; InFullValue: 'um cent�simo'),
      (Id: 6; NumberValue: 0.001; InFullValue: 'um mil�simo'),
      (Id: 7; NumberValue: 0.0001; InFullValue: 'um d�cimo de mil�simo'),
      (Id: 8; NumberValue: 0.00001; InFullValue: 'um cent�simo de mil�simo'),
      (Id: 9; NumberValue: 0.000001; InFullValue: 'um milion�simo'),
      (Id: 10; NumberValue: 0.0000001; InFullValue: 'um d�cimo de milion�simo'),
      (Id: 11; NumberValue: 0.00000001; InFullValue: 'um cent�simo de milion�simo'),
      (Id: 12; NumberValue: 0.000000001; InFullValue: 'um bilion�simo'),
      (Id: 13; NumberValue: 0.2; InFullValue: 'dois d�cimos'),
      (Id: 14; NumberValue: 0.02; InFullValue: 'dois cent�simos'),
      (Id: 15; NumberValue: 0.002; InFullValue: 'dois mil�simos'),
      (Id: 16; NumberValue: 0.0002; InFullValue: 'dois d�cimos de mil�simo'),
      (Id: 17; NumberValue: 0.00002; InFullValue: 'dois cent�simos de mil�simo'),
      (Id: 18; NumberValue: 0.000002; InFullValue: 'dois milion�simos'),
      (Id: 19; NumberValue: 0.0000002; InFullValue: 'dois d�cimos de milion�simo'),
      (Id: 20; NumberValue: 0.00000002; InFullValue: 'dois cent�simos de milion�simo'),
      (Id: 21; NumberValue: 0.000000002; InFullValue: 'dois bilion�simos'),
      (Id: 22; NumberValue: -1; InFullValue: 'um negativo'),
      (Id: 23; NumberValue: -999999999999999; InFullValue: 'novecentos e noventa e nove trilh�es e novecentos e noventa e nove bilh�es e novecentos e noventa e nove milh�es e novecentos e noventa e nove mil e novecentos e noventa e nove negativo'),
      (Id: 24; NumberValue: -0.000000002; InFullValue: 'dois bilion�simos negativo')
    );

procedure TExtensoTest.Setup;
begin
end;

procedure TExtensoTest.TearDown;
begin
end;

procedure TExtensoTest.InFullTest;
var
  InFull: TInFullDecimal;
  InFullTestCase: TTestCaseInFull;
  bAllOk: Boolean;
begin
  InFull := TInFullDecimal.Create;
  try
    bAllOk := True;
    for InFullTestCase in aInFullValuesTest do
    begin
      InFull.NumberValue := InFullTestCase.NumberValue;

      if InFullTestCase.InFullValue = InFull.ToString then
      begin
        TDUnitX.CurrentRunner.Log(
          TLogLevel.Information,
          Format(
            'Cen�rio %d... OK',
            [InFullTestCase.Id]
          )
        );
      end
      else
      begin
        TDUnitX.CurrentRunner.Log(
          TLogLevel.Error,
          Format(
            'Cen�rio %d... FALHOU',
            [InFullTestCase.Id]
          )
        );
        bAllOk := False;
      end;
    end;

    Assert.IsTrue(bAllOk);
  finally
    InFull.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TExtensoTest);
end.
