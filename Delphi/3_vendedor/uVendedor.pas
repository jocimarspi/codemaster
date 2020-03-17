unit uVendedor;

interface

uses
  System.SysUtils;

type
  TVendedor = class
  private
    FTotalVendas: Currency;
    FSalarioFixo: Currency;
    FPercetualComissao: Double;
    FNome: String;
    procedure SetNome(const Value: String);
    procedure SetSalarioFixo(const Value: Currency);
    procedure SetTotalVendas(const Value: Currency);
    function GetValorComissao: Currency;
  public
    constructor Create;
    property Nome: String read FNome write SetNome;
    property SalarioFixo: Currency read FSalarioFixo write SetSalarioFixo;
    property TotalVendas: Currency read FTotalVendas write SetTotalVendas;
    property PercentualComissao: Double read FPercetualComissao;
    property ValorComissao: Currency read GetValorComissao;

    function ToString: String; override;
  end;

implementation

{ TVendedor }

const
  TOSTRING_TEXT =
    'Nome: %s '+sLineBreak+
    'Salário fixo: %f';


constructor TVendedor.Create;
begin
  FPercetualComissao := 15;
  FSalarioFixo := 0;
  FTotalVendas := 0;
end;

function TVendedor.GetValorComissao: Currency;
begin
  Result := (FTotalVendas * FPercetualComissao) / 100;
end;

procedure TVendedor.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TVendedor.SetSalarioFixo(const Value: Currency);
begin
  FSalarioFixo := Value;
end;

procedure TVendedor.SetTotalVendas(const Value: Currency);
begin
  FTotalVendas := Value;
end;

function TVendedor.ToString: String;
begin
  Result :=
    Format(
      TOSTRING_TEXT,
      [FNome, FSalarioFixo]
      );
end;

end.
