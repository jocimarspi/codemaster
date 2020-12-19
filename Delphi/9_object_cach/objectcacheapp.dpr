program objectcacheapp;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Employee in 'Employee.pas',
  ObjectCache in 'ObjectCache.pas';

var
  cache: TObjectCache;
  employee1: TEmployee;
  employee2: TEmployee;

begin
  try
    cache := TObjectCache.Create;

    employee1 := cache.GetInstance<TEmployee>;
    employee1.Name := 'Jocimar';
    employee1.Email := 'jocimarspi@gmail.com';
    employee1.Phone := '(44) 9 9942-1641';

    WriteLn('FUNCIONARIO 1');
    WriteLn(employee1.ToString);

    WriteLn('-------------------------------------------');

    employee2 := cache.GetInstance<TEmployee>;
    WriteLn('FUNCIONARIO 2');
    WriteLn(employee2.ToString);

    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
