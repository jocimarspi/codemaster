program infullconsole;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  uExtenso in 'uExtenso.pas',
  System.SysUtils,
  System.StrUtils;

procedure ReadANumber;
var
  NumberValue: Double;
  StringNumberValue: String;
  ValidNumber: Boolean;
begin
  repeat
    Writeln('Informe um n�mero para escrever por extenso.');
    Writeln(
      Format(
        '(Usar o separador decimal "%s") para n�meros decimais',
        [FormatSettings.DecimalSeparator]
      )
    );

    Writeln('');
    Write('Digite o n�mero: ');
    Readln(StringNumberValue);
    Writeln('');

    ValidNumber := TryStrToFloat(StringNumberValue, NumberValue);

    if not ValidNumber then
    begin
      Writeln('N�mero inv�lido');
      Writeln('');
      Exit;
    end;
  until ValidNumber;

  Writeln('');
  Write('Resultado: ');
  Writeln(InFull(NumberValue));
end;

begin
  try
    ReadANumber;
    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
