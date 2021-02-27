program e03_vendedor;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uVendedor in 'uVendedor.pas';

var
  nomeVendedor: String;
  salarioFixo: String;
  totalVendas: String;
  valorAReceber: Currency;
  vend: TVendedor;

function PegarNomeVendedor: String;
begin
  repeat
    Write('Nome do vendedor: ');
    Readln(Result);

    if Result.IsEmpty then
    begin
      Writeln('O nome do vendedor deve ser informado.');
      Readln;
    end;

  until (not Result.IsEmpty);
end;

function PegarSalarioFixo: Currency;
var
  valorEntrada: string;
  valorSalario: Currency;
  entradaValida: Boolean;
begin
  repeat
    Write('Salario fixo: ');
    Readln(valorEntrada);

    entradaValida := TryStrToCurr(valorEntrada, valorSalario);
    if not entradaValida then
    begin
      Writeln('O valor do salário fixo é inválido.');
      Readln;
    end;

  until entradaValida;

  result := valorSalario;
end;

function PegarTotalVendas: Currency;
var
  valorEntrada: string;
  valorVendas: Currency;
  entradaValida: Boolean;
begin
  Result := 0;

  repeat
    Write('Total vendas: ');
    Readln(valorEntrada);

    entradaValida := TryStrToCurr(valorEntrada, valorVendas);
    if not entradaValida then
    begin
      Writeln('O valor do total de vendas é inválido.');
      Readln;
    end;

  until entradaValida;

  result := valorVendas;
end;

begin
  try
    Writeln('Informe os dados do vendedor. ');
    Writeln(
      Format(
        'Use (%s) como separador de valores decimais',
        [FormatSettings.DecimalSeparator]
        )
      );

    Writeln;

    vend := TVendedor.Create;
    try
      vend.Nome := PegarNomeVendedor;
      vend.SalarioFixo := PegarSalariofixo;
      vend.TotalVendas := PegarTotalVendas;

      Writeln;
      Writeln(vend.ToString);

      Writeln(Format('Total a receber: %f', [vend.ValorReceber]));
    finally
      FreeAndNil(vend);
    end;

    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
