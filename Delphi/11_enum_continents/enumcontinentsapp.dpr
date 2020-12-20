program enumcontinentsapp;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Continent in 'Continent.pas';

var
  index: Byte;
  enum: TContinentEnum;

procedure ShowContinentEnumInfo(const AContinent: TContinentEnum);
begin
  WriteLn(Concat('Nome: ', AContinent.AsLabel));
  WriteLn(Concat('Enum: ', AContinent.AsString));
  WriteLn(Concat('Byte: ', AContinent.AsByte.ToString));
end;

begin
  try
    for index := Low(TContinentEnum).AsByte to High(TContinentEnum).AsByte do
    begin
      enum := enum.Parse(index);
      ShowContinentEnumInfo(enum);
      WriteLn;
    end;

    ReadLn;
      
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
