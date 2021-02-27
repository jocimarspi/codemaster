unit Device;

interface

uses
  System.SysUtils;

type
  TDevice = class
  private
    FCor: String;
    FAtivo: Boolean;
    FDataCompra: TDateTime;
    FModelo: String;
    FDataCadastro: TDateTime;
    FTipoDispositivo: String;
    FMarca: String;
    FNumeroSerie: String;
    procedure SetAtivo(const Value: Boolean);
    procedure SetCor(const Value: String);
    procedure SetDataCadastro(const Value: TDateTime);
    procedure SetDataCompra(const Value: TDateTime);
    procedure SetMarca(const Value: String);
    procedure SetModelo(const Value: String);
    procedure SetNumeroSerie(const Value: String);
    procedure SetTipoDispositivo(const Value: String);
  public
    property Marca: String read FMarca write SetMarca;
    property Modelo: String read FModelo write SetModelo;
    property Cor: String read FCor write SetCor;
    property NumeroSerie: String read FNumeroSerie write SetNumeroSerie;
    property DataCompra: TDateTime read FDataCompra write SetDataCompra;
    property DataCadastro: TDateTime read FDataCadastro write SetDataCadastro;
    property Ativo: Boolean read FAtivo write SetAtivo;
    property TipoDispositivo: String read FTipoDispositivo write SetTipoDispositivo;

    function ToString: String; override;
  end;

implementation

{ TDevice }

procedure TDevice.SetAtivo(const Value: Boolean);
begin
  FAtivo := Value;
end;

procedure TDevice.SetCor(const Value: String);
begin
  FCor := Value;
end;

procedure TDevice.SetDataCadastro(const Value: TDateTime);
begin
  FDataCadastro := Value;
end;

procedure TDevice.SetDataCompra(const Value: TDateTime);
begin
  FDataCompra := Value;
end;

procedure TDevice.SetMarca(const Value: String);
begin
  FMarca := Value;
end;

procedure TDevice.SetModelo(const Value: String);
begin
  FModelo := Value;
end;

procedure TDevice.SetNumeroSerie(const Value: String);
begin
  FNumeroSerie := Value;
end;

procedure TDevice.SetTipoDispositivo(const Value: String);
begin
  FTipoDispositivo := Value;
end;

function TDevice.ToString: String;
var
  stringBuilder: TStringBuilder;
begin
  stringBuilder := TStringBuilder.Create;
  try
    stringBuilder.AppendFormat('Marcar: %s', [FMarca]);
    stringBuilder.AppendLine;
    stringBuilder.AppendFormat('Modelo: %s', [FModelo]);
    stringBuilder.AppendLine;
    stringBuilder.AppendFormat('Cor: %s', [FCor]);
    stringBuilder.AppendLine;
    stringBuilder.AppendFormat('Série: %s', [FNumeroSerie]);
    stringBuilder.AppendLine;
    stringBuilder.AppendFormat('Compra: %s', [DateToStr(FDataCompra)]);
    stringBuilder.AppendLine;
    stringBuilder.AppendFormat('Cadastro: %s', [DateToStr(FDataCadastro)]);
    stringBuilder.AppendLine;

    if FAtivo then
      stringBuilder.AppendFormat('Ativo: %s', ['Sim'])
    else
      stringBuilder.AppendFormat('Ativo: %s', ['Não']);

    stringBuilder.AppendLine;
    stringBuilder.AppendFormat('Tipo: %s', [FTipoDispositivo]);

    Result := stringBuilder.ToString;
  finally
    FreeAndNil(stringBuilder);
  end;
end;

end.
