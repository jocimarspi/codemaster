unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Math,
  Vcl.ExtCtrls, uExtensoDecimal;

type

  TfrmPrincipal = class(TForm)
    pgcFormas: TPageControl;
    tsRetangulo: TTabSheet;
    tsTriangulo: TTabSheet;
    tsCirculo: TTabSheet;
    btCalcularRetangulo: TButton;
    Label2: TLabel;
    edtLadoA: TEdit;
    Label3: TLabel;
    edtLadoB: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    FlowPanel1: TFlowPanel;
    pnBaseTriangulo: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    edtBaseTriangulo: TEdit;
    pnAlturaTriangulo: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    edtAlturaTriangulo: TEdit;
    pnLadoATriangulo: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    edtLadoATriangulo: TEdit;
    pnLadoBTriangulo: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    edtLadoBTriangulo: TEdit;
    pnLadoCTriangulo: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    edtLadoCTriangulo: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    btCalcularCirculo: TButton;
    edtRaioCirculo: TEdit;
    pnl1: TPanel;
    grp1: TGroupBox;
    mmResultadoPorExtenso: TMemo;
    pnl2: TPanel;
    lb1: TLabel;
    edtResultado: TEdit;
    btnCalcular: TButton;
    GroupBox1: TGroupBox;
    rbArea: TRadioButton;
    rbPerimetro: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure rbAreaClick(Sender: TObject);
    procedure rbPerimetroClick(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
  private
    procedure ControlarVisibilidadeCampoTriangulo;
    procedure CalcularAreaTriangulo;
    procedure CalcularPerimetroTriangulo;
    procedure CalcularRetangulo;
    procedure CalcularTriangulo;
    procedure CalcularCirculo;
    procedure EscreverPorExtenso(const pValor: Extended);
    procedure ValidarValor(const pValor: String);
    procedure LimparResultado;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses uGeometria;

{$R *.dfm}

procedure TfrmPrincipal.btnCalcularClick(Sender: TObject);
begin
  if pgcFormas.ActivePage = tsRetangulo then
    CalcularRetangulo;

  if pgcFormas.ActivePage = tsTriangulo then
    CalcularTriangulo;

  if pgcFormas.ActivePage = tsCirculo then
    CalcularCirculo;
end;

procedure TfrmPrincipal.CalcularAreaTriangulo;
var
  Base: Double;
  Altura: Double;
  Resultado: Double;
begin
  ValidarValor(edtBaseTriangulo.Text);
  ValidarValor(edtAlturaTriangulo.Text);

  Base := StrToFloatDef(edtBaseTriangulo.Text, ZeroValue);
  Altura := StrToFloatDef(edtAlturaTriangulo.Text, ZeroValue);

  Resultado := AreaTriangulo(Base,Altura);

  edtResultado.Text := FloatToStr(Resultado);
  EscreverPorExtenso(Resultado);
end;

procedure TfrmPrincipal.CalcularCirculo;
var
  Raio: Double;
  Resultado: Double;
begin
  Raio := StrToFloatDef(edtRaioCirculo.Text, ZeroValue);

  if rbArea.Checked then
    Resultado := AreaCirculo(Raio)
  else
    Resultado := PerimetroCirculo(Raio);

  edtResultado.Text := FloatToStr(Resultado);
  EscreverPorExtenso(Resultado);
end;

procedure TfrmPrincipal.CalcularPerimetroTriangulo;
var
  LadoA: Double;
  LadoB: Double;
  LadoC: Double;
  Resultado: Double;
begin
  ValidarValor(edtLadoATriangulo.Text);
  ValidarValor(edtLadoBTriangulo.Text);
  ValidarValor(edtLadoCTriangulo.Text);

  LadoA := StrToFloatDef(edtLadoATriangulo.Text, ZeroValue);
  LadoB := StrToFloatDef(edtLadoBTriangulo.Text, ZeroValue);
  LadoC := StrToFloatDef(edtLadoCTriangulo.Text, ZeroValue);

  Resultado := PerimetroTriangulo(LadoA, LadoB, LadoC);

  edtResultado.Text := FloatToStr(Resultado);
  EscreverPorExtenso(Resultado);
end;

procedure TfrmPrincipal.CalcularRetangulo;
var
  LadoA: Double;
  LadoB: Double;
  Resultado: Double;
  extenso: TExtensoDecimal;
begin
  ValidarValor(edtLadoA.Text);
  ValidarValor(edtLadoB.Text);

  LadoA := StrToFloatDef(edtLadoA.Text, ZeroValue);
  LadoB := StrToFloatDef(edtLadoB.Text, ZeroValue);

  if rbArea.Checked then
    Resultado := AreaRetangulo(LadoA,LadoB)
  else
    Resultado := PerimetroRetangulo(LadoA,LadoB);

  edtResultado.Text := FloatToStr(Resultado);

  EscreverPorExtenso(Resultado);
end;

procedure TfrmPrincipal.CalcularTriangulo;
begin
  if rbArea.Checked then
    CalcularAreaTriangulo;

  if rbPerimetro.Checked then
    CalcularPerimetroTriangulo;
end;

procedure TfrmPrincipal.ControlarVisibilidadeCampoTriangulo;
begin
  pnBaseTriangulo.Visible := rbArea.Checked;
  pnAlturaTriangulo.Visible := rbArea.Checked;
  pnLadoATriangulo.Visible := rbPerimetro.Checked;
  pnLadoBTriangulo.Visible := rbPerimetro.Checked;
  pnLadoCTriangulo.Visible := rbPerimetro.Checked;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  ControlarVisibilidadeCampoTriangulo;
end;

procedure TfrmPrincipal.LimparResultado;
begin
  edtResultado.Text := EmptyStr;
  mmResultadoPorExtenso.Clear;
end;

procedure TfrmPrincipal.rbAreaClick(Sender: TObject);
begin
  ControlarVisibilidadeCampoTriangulo;
end;

procedure TfrmPrincipal.rbPerimetroClick(Sender: TObject);
begin
  ControlarVisibilidadeCampoTriangulo;
end;

procedure TfrmPrincipal.ValidarValor(const pValor: String);
var
  Lixo: Extended;
begin
  if TryStrToFloat(pValor,Lixo) then
    exit;

  MessageDlg(Format('O Valor "%s" é inválido',[pValor]),mtError,[mbOK],0);
  Abort;
end;

procedure TfrmPrincipal.EscreverPorExtenso(const pValor: Extended);
var
  extenso: TExtensoDecimal;
begin
  extenso := TExtensoDecimal.Create(pValor);
  try
    mmResultadoPorExtenso.Text :=  extenso.ToString;
  finally
    FreeAndNil(extenso);
  end;
end;

end.
