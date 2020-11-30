program e01_fatorial;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uUtilitades in 'uUtilitades.pas';

var
  entrada: string;
  resultado: Extended;
begin
  try
    Write('Calcular o fatorial de: ');
    ReadLn(entrada);

    resultado := TUtilidades.Fatorial(entrada.ToExtended);
    Writeln;
    Write('Resultado: ');
    Writeln(resultado.ToString);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
