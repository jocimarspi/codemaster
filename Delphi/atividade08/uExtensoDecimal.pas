unit uExtensoDecimal;

interface

uses SysUtils, uExtensoInteiro, Generics.Collections, Math;

type
  TDescricaoCasa = record
    Singular: String;
    Plural: String;
  end;

  TCasaDecimal = (
    cdNenhuma, cdDecimo, cdCentesimo, cdMilesimo, cdDecimoMilisimo,
    cdCentesimoMilesimo, cdMilionesimo, cdDecimoMilionesimo,
    cdCentesimoMilionesimo, cdBilionesimo);

  TExtensoDecimal = class
  private
    FExtensoInteiro: TExtensoInteiro;
    FCasas: TDictionary<TCasaDecimal,TDescricaoCasa>;
    FCasaDecimal :TCasaDecimal;
    FValor: Extended;
    FValorAbsoluto: Extended;
    FValorDecimal: Int64;
    FExtenso: String;

    procedure IniciarCasas;
    procedure CalcularCasaDecimal;
    procedure CalcularValorDecimal;
    function PossuiDecimal: Boolean;
    function RetornarExtenso: String;
    procedure TratarResultadoNegativo;
    procedure TratarResultadoDecimal;
    procedure TratarResultadoInteiro;
    procedure SetValor(const Value: Extended);
  public
    constructor Create; overload;
    constructor Create(const pValor: Extended); overload;

    destructor Destroy; override;

    property Valor: Extended read FValor write SetValor;

    function ToString: string; override;
  end;

implementation

{ TExtensoDecimal }

procedure TExtensoDecimal.CalcularCasaDecimal;
var
  ValorDecimal: Extended;
  ValorString: String;
  Casa: Integer;
begin
  ValorDecimal := Frac(FValorAbsoluto);

  if ValorDecimal = ZeroValue then
  begin
    FCasaDecimal := cdNenhuma;
    Exit;
  end;

  ValorString := FormatFloat(sFORMATO,ValorDecimal);
  ValorString := StringReplace(ValorString,'0,',EmptyStr,[]);


  for Casa := 1 to Length(ValorString) do
  begin
    if ValorString[Casa] <> '0' then
    begin
      FCasaDecimal := TCasaDecimal(Casa);
      Exit;
    end;
  end;
end;

procedure TExtensoDecimal.CalcularValorDecimal;
var
  ValorString: String;
begin
  FValorDecimal := ZeroValue;

  if FCasaDecimal = cdNenhuma then
    Exit;

  ValorString := FormatFloat(sFORMATO,Frac(FValorAbsoluto));
  ValorString := StringReplace(ValorString,'0,',EmptyStr,[]);
  FValorDecimal := StrToInt(ValorString);
end;

constructor TExtensoDecimal.Create;
begin
  FExtensoInteiro := TExtensoInteiro.Create(FValorAbsoluto);
  FCasas := TDictionary<TCasaDecimal,TDescricaoCasa>.Create;
  IniciarCasas;
end;

constructor TExtensoDecimal.Create(const pValor: Extended);
begin
  FValor := pValor;
  Create;
end;

destructor TExtensoDecimal.Destroy;
begin
  FreeAndNil(FExtensoInteiro);
  FreeAndNil(FCasas);
  inherited;
end;

procedure TExtensoDecimal.IniciarCasas;
var
  rCasa: TDescricaoCasa;
begin
  rCasa.Singular := 'décimo';
  rCasa.Plural := 'décimos';
  FCasas.Add(cdDecimo, rCasa);

  rCasa.Singular := 'centésimo';
  rCasa.Plural := 'centésimos';
  FCasas.Add(cdCentesimo, rCasa);

  rCasa.Singular := 'milésimo';
  rCasa.Plural := 'milésimos';
  FCasas.Add(cdMilesimo, rCasa);

  rCasa.Singular := 'décimo de milésimo';
  rCasa.Plural := 'décimos de milésimo';
  FCasas.Add(cdDecimoMilisimo, rCasa);

  rCasa.Singular := 'centésimo de milésimo';
  rCasa.Plural := 'centésimos de milésimo';
  FCasas.Add(cdCentesimoMilesimo, rCasa);

  rCasa.Singular := 'milionésimo';
  rCasa.Plural := 'milionésimos';
  FCasas.Add(cdMilionesimo, rCasa);

  rCasa.Singular := 'décimo de milionésimo';
  rCasa.Plural := 'décimos de milionésimo';
  FCasas.Add(cdDecimoMilionesimo, rCasa);

  rCasa.Singular := 'centésimo de milionésimo';
  rCasa.Plural := 'centésimos de milionésimo';
  FCasas.Add(cdCentesimoMilionesimo, rCasa);

  rCasa.Singular := 'bilionésimo';
  rCasa.Plural := 'bilionésimos';
  FCasas.Add(cdBilionesimo, rCasa);
end;

function TExtensoDecimal.ToString: string;
begin
  FValorAbsoluto := Abs(FValor);

  TratarResultadoInteiro;
  TratarResultadoDecimal;

  result := FExtenso;
end;

procedure TExtensoDecimal.TratarResultadoDecimal;
begin
  if not PossuiDecimal then
    exit;

  CalcularCasaDecimal;
  CalcularValorDecimal;

  FExtensoInteiro.Valor := FValorDecimal;

  if FExtenso <> EmptyStr then
    FExtenso := Concat(FExtenso ,sCONECTOR);

  FExtenso := Concat(FExtenso, FExtensoInteiro.ToString, sESPACO,
    RetornarExtenso);

  TratarResultadoNegativo;
end;

procedure TExtensoDecimal.TratarResultadoInteiro;
begin
  FExtenso := sZERO;

  if FValor = ZeroValue then
    exit;

  FExtensoInteiro.Valor := FValorAbsoluto;
  FExtenso := FExtensoInteiro.ToString;

  if not PossuiDecimal then
    TratarResultadoNegativo;
end;

procedure TExtensoDecimal.TratarResultadoNegativo;
begin
  if FValor >= 0 then
    exit;

  FExtenso := Concat(FExtenso, sESPACO, sNEGATIVO);
end;

function TExtensoDecimal.PossuiDecimal: Boolean;
begin
  Result := Frac(FValorAbsoluto) > ZeroValue;
end;

function TExtensoDecimal.RetornarExtenso: String;
begin
  result := EmptyStr;

  if FCasaDecimal = cdNenhuma then
    exit;

  if FValorDecimal > 1 then
    result := FCasas[FCasaDecimal].Plural
  else
    result := FCasas[FCasaDecimal].Singular;
end;

procedure TExtensoDecimal.SetValor(const Value: Extended);
begin
  FValor := Value;
end;

end.
