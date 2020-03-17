
unit uExtensoInteiro;

interface

uses System.SysUtils, Math, System.Classes, Generics.Collections;

const
  sZERO = 'zero';
  sNEGATIVO = 'negativo';
  sCONECTOR = ' e ';
  sCENTO = 'cento';
  sESPACO = ' ';
  sFORMATO = '#,###,###,###,##0.0########';

type
  TUnidade = (unUnidade, unDezena, unCentena, unMilhar, unMilhao, unBilhao, unTrilhao);
  TArrayDecomposicao = array[TUnidade] of SmallInt;
  TDescricaoUnidade = record
    Singular: String;
    Plural: String;
  end;

  TExtensoInteiro = class
  private
    FExtenso: String;
    FDecomposicao: TArrayDecomposicao;
    FDivisores: array[TUnidade] of Extended;

    FValor: Extended;
    FUnidades: TDictionary<Integer,String>;
    FDez: TDictionary<Integer,String>;
    FDezenas: TDictionary<Integer,String>;
    FCentenas :TDictionary<Integer,String>;
    FCasas: TDictionary<TUnidade,TDescricaoUnidade>;

    procedure IniciarDescricaoUnidades;
    procedure IniciarDescricaoDez;
    procedure IniciarDescricaoDezenas;
    procedure IniciarDescricaoCentenas;
    procedure IniciarDivisores;
    procedure IniciarCasas;

    function RetornarDivisor(const pUnidade: TUnidade): Extended;
    function DecomporPorUnidade(var pValor: Extended;
      const pUnidade: TUnidade): Integer;

    procedure Decompor(var pArrayDecomposicao: TArrayDecomposicao;
      var pValor: Extended); overload;
    procedure Decompor; overload;

    function RetornarExtensoCentena(const pCentena, pDezena, pUnidade: Integer) :String;
    function RetornarExtensoDezena(const pDezena, pUnidade: Integer) :String;
    function RetornarExtensoUnidade(const pDezena, pUnidade: Integer) :String;
    function RetornarExtensoGrupo(const pCentena, pDezena, pUnidade: Integer) :String;
    function RetornarExtensoGrupoMaior(const pUnidade: TUnidade): String;

    procedure MontarExtenso;
    procedure AdicionarExtenso(const pExtenso: String);
    procedure IniciarValor;

    procedure SetValor(const Value: Extended);
  public
    constructor Create(const pValor: Extended);
    destructor Destroy; override;
    property Valor: Extended read FValor write SetValor;
    function ToString: string; override;
  end;

implementation

{ TExtensoInteiro }

procedure TExtensoInteiro.Decompor;
begin
  Decompor(FDecomposicao,FValor);
end;

procedure TExtensoInteiro.Decompor(var pArrayDecomposicao: TArrayDecomposicao;
  var pValor: Extended);
var
  Valor: Extended;
  Indice: Integer;
begin
  Valor := pValor;
  for Indice := Ord(High(TUnidade)) downto Ord(Low(TUnidade)) do
  begin
    pArrayDecomposicao[TUnidade(Indice)] :=
      DecomporPorUnidade(Valor, TUnidade(Indice));
  end;
end;

function TExtensoInteiro.DecomporPorUnidade(var pValor: Extended;
  const pUnidade: TUnidade): Integer;
var
  Divisor: Extended;
begin
  Divisor := RetornarDivisor(pUnidade);
  result := Trunc(pValor / Divisor);
  pValor := pValor - (result * Divisor);
end;

constructor TExtensoInteiro.Create(const pValor: Extended);
begin
  FValor := pValor;

  IniciarDescricaoUnidades;
  IniciarDescricaoDez;
  IniciarDescricaoDezenas;
  IniciarDescricaoCentenas;
  IniciarDivisores;
  IniciarCasas;
  IniciarValor;
end;

destructor TExtensoInteiro.Destroy;
begin
  FreeAndNil(FUnidades);
  FreeAndNil(FDez);
  FreeAndNil(FDezenas);
  FreeAndNil(FCentenas);
  FreeAndNil(FCasas);
  inherited;
end;

procedure TExtensoInteiro.IniciarCasas;
var
  descricao: TDescricaoUnidade;
begin
  FCasas := TDictionary<TUnidade, TDescricaoUnidade>.Create;

  descricao.Singular := 'mil';
  descricao.Plural := 'mil';
  FCasas.Add(unMilhar,descricao);

  descricao.Singular := 'milhão';
  descricao.Plural := 'milhões';
  FCasas.Add(unMilhao,descricao);

  descricao.Singular := 'bilhão';
  descricao.Plural := 'bilhões';
  FCasas.Add(unBilhao,descricao);

  descricao.Singular := 'trilhão';
  descricao.Plural := 'trilhões';
  FCasas.Add(unTrilhao,descricao);
end;

procedure TExtensoInteiro.IniciarDescricaoCentenas;
begin
  FCentenas := TDictionary<Integer, String>.Create;
  FCentenas.Add(1,'cem');
  FCentenas.Add(2,'duzentos');
  FCentenas.Add(3,'trezentos');
  FCentenas.Add(4,'quatrocentos');
  FCentenas.Add(5,'quinhentos');
  FCentenas.Add(6,'seiscentos');
  FCentenas.Add(7,'setecentos');
  FCentenas.Add(8,'oitocentos');
  FCentenas.Add(9,'novecentos');
end;

procedure TExtensoInteiro.IniciarDescricaoDez;
begin
  FDez := TDictionary<Integer, String>.Create;
  FDez.Add(1,'onze');
  FDez.Add(2,'doze');
  FDez.Add(3,'treze');
  FDez.Add(4,'quatorze');
  FDez.Add(5,'quinze');
  FDez.Add(6,'dezesseis');
  FDez.Add(7,'dezessete');
  FDez.Add(8,'dezoito');
  FDez.Add(9,'dezenove');
end;

procedure TExtensoInteiro.IniciarDescricaoDezenas;
begin
  FDezenas := TDictionary<Integer, String>.Create;
  FDezenas.Add(1,'dez');
  FDezenas.Add(2,'vinte');
  FDezenas.Add(3,'trinta');
  FDezenas.Add(4,'quarenta');
  FDezenas.Add(5,'cinquenta');
  FDezenas.Add(6,'sessenta');
  FDezenas.Add(7,'setenta');
  FDezenas.Add(8,'oitenta');
  FDezenas.Add(9,'noventa');
end;

procedure TExtensoInteiro.IniciarDivisores;
begin
  FDivisores[unUnidade] := 1;
  FDivisores[unDezena] := 10;
  FDivisores[unCentena] := 100;
  FDivisores[unMilhar] := 1000;
  FDivisores[unMilhao] := 1000000;
  FDivisores[unBilhao] := 1000000000;
  FDivisores[unTrilhao] := 1000000000000;
end;

procedure TExtensoInteiro.IniciarValor;
var
  Unidade: TUnidade;
begin
  FExtenso := EmptyStr;

  for Unidade := Low(FDecomposicao) to High(FDecomposicao) do
    FDecomposicao[Unidade] := ZeroValue;
end;

procedure TExtensoInteiro.IniciarDescricaoUnidades;
begin
  FUnidades := TDictionary<Integer, String>.Create;
  FUnidades.Add(1,'um');
  FUnidades.Add(2,'dois');
  FUnidades.Add(3,'três');
  FUnidades.Add(4,'quatro');
  FUnidades.Add(5,'cinco');
  FUnidades.Add(6,'seis');
  FUnidades.Add(7,'sete');
  FUnidades.Add(8,'oito');
  FUnidades.Add(9,'nove');
end;

procedure TExtensoInteiro.AdicionarExtenso(const pExtenso: String);
begin
  if pExtenso = EmptyStr then
    exit;

  if FExtenso = EmptyStr then
    FExtenso := Concat(FExtenso, EmptyStr, Trim(pExtenso))
  else
    FExtenso := Concat(FExtenso, sCONECTOR, Trim(pExtenso));
end;

procedure TExtensoInteiro.MontarExtenso;
var
  Indice: Integer;
  Unidade: TUnidade;
  ExtensoUltimoGrupo: String;
  ExtensoGrupo: String;

begin
  FExtenso := EmptyStr;

  for Indice := Ord(unTrilhao) downto Ord(unMilhar) do
  begin
    Unidade := TUnidade(Indice);
    ExtensoGrupo := RetornarExtensoGrupoMaior(Unidade);

    AdicionarExtenso(ExtensoGrupo);
  end;

  ExtensoUltimoGrupo := RetornarExtensoGrupo(
    FDecomposicao[unCentena],
    FDecomposicao[unDezena],
    FDecomposicao[unUnidade]
  );

  AdicionarExtenso(ExtensoUltimoGrupo);
end;

function TExtensoInteiro.RetornarExtensoUnidade(const pDezena, pUnidade: Integer) : String;
var
  EhMenorQueVinteMaiorQueDez: Boolean;
begin
  result := EmptyStr;

  if pUnidade = 0 then
    exit;

  EhMenorQueVinteMaiorQueDez := (pDezena = 1) and (pUnidade > 0);

  if EhMenorQueVinteMaiorQueDez then
    exit;

  FUnidades.TryGetValue(pUnidade,result);
end;

procedure TExtensoInteiro.SetValor(const Value: Extended);
begin
  FValor := Value;
  IniciarValor;
end;

function TExtensoInteiro.RetornarDivisor(const pUnidade: TUnidade): Extended;
begin
  result := FDivisores[pUnidade];
end;

function TExtensoInteiro.RetornarExtensoCentena(const pCentena, pDezena,
  pUnidade: Integer): String;
var
  MaiorQueCem: Boolean;
  TemDezenaUnidade: Boolean;
begin
  result := EmptyStr;
  if pCentena = 0 then
    exit;

  TemDezenaUnidade := (pUnidade > 0) or (pDezena > 0);
  MaiorQueCem := TemDezenaUnidade;

  if MaiorQueCem and (pCentena = 1) then
    result := sCENTO
  else
    FCentenas.TryGetValue(pCentena, result);

  if TemDezenaUnidade then
    result := Concat(result,sCONECTOR);
end;

function TExtensoInteiro.RetornarExtensoDezena(const pDezena,
  pUnidade: Integer): String;
var
  EhMenorQueVinteMaiorQueDez: Boolean;
begin
  result := EmptyStr;

  if pDezena = 0 then
    exit;

  EhMenorQueVinteMaiorQueDez := (pDezena = 1) and (pUnidade > 0);

  if EhMenorQueVinteMaiorQueDez then
    FDez.TryGetValue(pUnidade,result)
  else
    FDezenas.TryGetValue(pDezena,result);

  if EhMenorQueVinteMaiorQueDez then
    exit;

  if pUnidade > 0 then
    result := Concat(result, sCONECTOR);
end;

function TExtensoInteiro.RetornarExtensoGrupo(const pCentena, pDezena,
  pUnidade: Integer): String;
begin
  result := Concat(
      RetornarExtensoCentena(pCentena, pDezena, pUnidade),
      RetornarExtensoDezena(pDezena, pUnidade),
      RetornarExtensoUnidade(pDezena, pUnidade)
    );
end;

function TExtensoInteiro.RetornarExtensoGrupoMaior(const pUnidade: TUnidade): String;
var
  ValorGrupo: Extended;
  ArrayDecomposicao: TArrayDecomposicao;
  DescricaoUnidade: TDescricaoUnidade;
begin
  ValorGrupo := FDecomposicao[pUnidade];

  Decompor(ArrayDecomposicao, ValorGrupo);

  result := RetornarExtensoGrupo(
              ArrayDecomposicao[unCentena],
              ArrayDecomposicao[unDezena],
              ArrayDecomposicao[unUnidade]
            );

  if result <> EmptyStr then
  begin
    FCasas.TryGetValue(pUnidade,DescricaoUnidade);

    if FDecomposicao[pUnidade] = 1 then
      result := Concat(result, sESPACO, DescricaoUnidade.Singular)
    else
      result := Concat(result, sESPACO, DescricaoUnidade.Plural);
  end;
end;

function TExtensoInteiro.ToString: string;
begin
  Decompor;
  MontarExtenso;
  result := FExtenso;
end;

end.
