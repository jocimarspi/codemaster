unit uExtensoTest;

interface
uses
  DUnitX.TestFramework, uExtensoDecimal, SysUtils;

type

  [TestFixture]
  TExtensoTest = class(TObject) 
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure TestExtenso;
  end;

implementation

type
  TCenarioExtenso = record
    Numero: SmallInt;
    Valor: Extended;
    ExtensoValor: String;
  end;

const
  aValoresTesteExtenso: Array[0..23] of TCenarioExtenso =
    (
      (Numero: 1; Valor: 0; ExtensoValor: 'zero'),
      (Numero: 2; Valor: 1; ExtensoValor: 'um'),
      (Numero: 3; Valor: 999999999999999; ExtensoValor: 'novecentos e noventa e nove trilh�es e novecentos e noventa e nove bilh�es e novecentos e noventa e nove milh�es e novecentos e noventa e nove mil e novecentos e noventa e nove'),
      (Numero: 4; Valor: 0.1; ExtensoValor: 'um d�cimo'),
      (Numero: 5; Valor: 0.01; ExtensoValor: 'um cent�simo'),
      (Numero: 6; Valor: 0.001; ExtensoValor: 'um mil�simo'),
      (Numero: 7; Valor: 0.0001; ExtensoValor: 'um d�cimo de mil�simo'),
      (Numero: 8; Valor: 0.00001; ExtensoValor: 'um cent�simo de mil�simo'),
      (Numero: 9; Valor: 0.000001; ExtensoValor: 'um milion�simo'),
      (Numero: 10; Valor: 0.0000001; ExtensoValor: 'um d�cimo de milion�simo'),
      (Numero: 11; Valor: 0.00000001; ExtensoValor: 'um cent�simo de milion�simo'),
      (Numero: 12; Valor: 0.000000001; ExtensoValor: 'um bilion�simo'),
      (Numero: 13; Valor: 0.2; ExtensoValor: 'dois d�cimos'),
      (Numero: 14; Valor: 0.02; ExtensoValor: 'dois cent�simos'),
      (Numero: 15; Valor: 0.002; ExtensoValor: 'dois mil�simos'),
      (Numero: 16; Valor: 0.0002; ExtensoValor: 'dois d�cimos de mil�simo'),
      (Numero: 17; Valor: 0.00002; ExtensoValor: 'dois cent�simos de mil�simo'),
      (Numero: 18; Valor: 0.000002; ExtensoValor: 'dois milion�simos'),
      (Numero: 19; Valor: 0.0000002; ExtensoValor: 'dois d�cimos de milion�simo'),
      (Numero: 20; Valor: 0.00000002; ExtensoValor: 'dois cent�simos de milion�simo'),
      (Numero: 21; Valor: 0.000000002; ExtensoValor: 'dois bilion�simos'),
      (Numero: 22; Valor: -1; ExtensoValor: 'um negativo'),
      (Numero: 23; Valor: -999999999999999; ExtensoValor: 'novecentos e noventa e nove trilh�es e novecentos e noventa e nove bilh�es e novecentos e noventa e nove milh�es e novecentos e noventa e nove mil e novecentos e noventa e nove negativo'),
      (Numero: 24; Valor: -0.000000002; ExtensoValor: 'dois bilion�simos negativo')
    );

procedure TExtensoTest.Setup;
begin
end;

procedure TExtensoTest.TearDown;
begin
end;

procedure TExtensoTest.TestExtenso;
var
  Extenso: TExtensoDecimal;
  Cenario: TCenarioExtenso;
  bSucesso: Boolean;
begin
  Extenso := TExtensoDecimal.Create(1);
  try
    bSucesso := True;
    for Cenario in aValoresTesteExtenso do
    begin
      Extenso.Valor := Cenario.Valor;

      if Cenario.ExtensoValor = Extenso.ToString then
        TDUnitX.CurrentRunner.Log(TLogLevel.Information, Format('Cen�rio %d... OK',[Cenario.Numero]))
      else
      begin
        TDUnitX.CurrentRunner.Log(TLogLevel.Error, Format('Cen�rio %d... FALHOU',[Cenario.Numero]));
        bSucesso := False;
      end;
    end;

    Assert.IsTrue(bSucesso);
  finally
    Extenso.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TExtensoTest);
end.
