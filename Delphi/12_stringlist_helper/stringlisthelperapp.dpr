program stringlisthelperapp;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.Classes,
  System.SysUtils,
  StringListHelper in 'StringListHelper.pas';

var
  valuesList: TStringList;

begin
  try
    valuesList := TStringList.Create;
    try
      valuesList.Values['id'] := '78';
      valuesList.Values['name'] := 'JOCIMAR BORGES ABRANTES HUSS';
      valuesList.Values['email'] := 'jocimar.huss@gmail.com';
      valuesList.Values['phone'] := '(44) 9 9942-1641';

      WriteLn(valuesList.ToJson);

      valuesList.Clear;
      if valuesList.HasDuplicate then
        WriteLn('Tem duplicados.')
      else
        WriteLn('Não possui duplicados');

      valuesList.Clear;
      valuesList.Add('jocimar');
      valuesList.Add('Mariana');
      valuesList.Add('jocimar');

      if valuesList.HasDuplicate then
        WriteLn('Tem duplicados.')
      else
        WriteLn('Não possui duplicados');

      valuesList.Clear;
      valuesList.Add('eduardo');
      valuesList.Add('mariana');
      valuesList.Add('jocimar');

      if valuesList.HasDuplicate then
        WriteLn('Tem duplicados.')
      else
        WriteLn('Não possui duplicados');

      ReadLn;
    finally
      FreeAndNil(valuesList);
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
