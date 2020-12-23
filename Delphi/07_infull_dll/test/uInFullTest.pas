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
      (Id: 3; NumberValue: 999999999999999; InFullValue: 'novecentos e noventa e nove trilhões e novecentos e noventa e nove bilhões e novecentos e noventa e nove milhões e novecentos e noventa e nove mil e novecentos e noventa e nove'),
      (Id: 4; NumberValue: 0.1; InFullValue: 'um décimo'),
      (Id: 5; NumberValue: 0.01; InFullValue: 'um centésimo'),
      (Id: 6; NumberValue: 0.001; InFullValue: 'um milésimo'),
      (Id: 7; NumberValue: 0.0001; InFullValue: 'um décimo de milésimo'),
      (Id: 8; NumberValue: 0.00001; InFullValue: 'um centésimo de milésimo'),
      (Id: 9; NumberValue: 0.000001; InFullValue: 'um milionésimo'),
      (Id: 10; NumberValue: 0.0000001; InFullValue: 'um décimo de milionésimo'),
      (Id: 11; NumberValue: 0.00000001; InFullValue: 'um centésimo de milionésimo'),
      (Id: 12; NumberValue: 0.000000001; InFullValue: 'um bilionésimo'),
      (Id: 13; NumberValue: 0.2; InFullValue: 'dois décimos'),
      (Id: 14; NumberValue: 0.02; InFullValue: 'dois centésimos'),
      (Id: 15; NumberValue: 0.002; InFullValue: 'dois milésimos'),
      (Id: 16; NumberValue: 0.0002; InFullValue: 'dois décimos de milésimo'),
      (Id: 17; NumberValue: 0.00002; InFullValue: 'dois centésimos de milésimo'),
      (Id: 18; NumberValue: 0.000002; InFullValue: 'dois milionésimos'),
      (Id: 19; NumberValue: 0.0000002; InFullValue: 'dois décimos de milionésimo'),
      (Id: 20; NumberValue: 0.00000002; InFullValue: 'dois centésimos de milionésimo'),
      (Id: 21; NumberValue: 0.000000002; InFullValue: 'dois bilionésimos'),
      (Id: 22; NumberValue: -1; InFullValue: 'um negativo'),
      (Id: 23; NumberValue: -999999999999999; InFullValue: 'novecentos e noventa e nove trilhões e novecentos e noventa e nove bilhões e novecentos e noventa e nove milhões e novecentos e noventa e nove mil e novecentos e noventa e nove negativo'),
      (Id: 24; NumberValue: -0.000000002; InFullValue: 'dois bilionésimos negativo')
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
            'Cenário %d... OK',
            [InFullTestCase.Id]
          )
        );
      end
      else
      begin
        TDUnitX.CurrentRunner.Log(
          TLogLevel.Error,
          Format(
            'Cenário %d... FALHOU',
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
