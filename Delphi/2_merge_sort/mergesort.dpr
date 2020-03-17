program mergesort;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Types,
  System.StrUtils,
  uMergeSort in 'uMergeSort.pas';

var
  entrada: String;
  indice: integer;
  arrayEntrada: TStringDynArray;
  arrayNumeros: TIntegerDynArray;
  valorOrdenado: Integer;
  ordenacao: TMergeSort;
  valorEntrada: Integer;
  tamanhoArrayNumeros: Integer;
begin
  try
    Writeln('Informe uma lista de números separados por ponto e vírgula (;):');

    Writeln;
    Readln(entrada);

    tamanhoArrayNumeros := 0;
    arrayEntrada := SplitString(entrada,';');
    for indice := 0 to Length(arrayEntrada)-1 do
    begin
      if TryStrToInt(arrayEntrada[indice].Trim, valorEntrada) then
      begin
        Inc(tamanhoArrayNumeros);
        SetLength(arrayNumeros, tamanhoArrayNumeros);
        arrayNumeros[tamanhoArrayNumeros-1] := valorEntrada;
      end;
    end;

    ordenacao := TMergeSort.Create(arrayNumeros);
    try
      ordenacao.Ordenar;

      Writeln;
      Write('Resultado ordenado: ');
      for valorOrdenado in arrayNumeros do
      begin
        Write(valorOrdenado.ToString);
        Write(' ');
      end;

      Readln;
    finally
      FreeAndNil(ordenacao);
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
