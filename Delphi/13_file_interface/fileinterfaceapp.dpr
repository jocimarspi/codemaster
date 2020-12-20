program fileinterfaceapp;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  FileSaveIntf in 'FileSaveIntf.pas',
  FileLoadIntf in 'FileLoadIntf.pas',
  MyFile in 'MyFile.pas';

var

  myFile: TMyFile;

begin
  try
    myFile := TMyFile.Create;
    try
      myFile.LoadFromFile('..\..\exemple_file.txt');

      WriteLn(myFile.ToString);

      myFile.SaveToFile('..\..\file_saved.txt');

      ReadLn;
    finally
      FreeAndNil(myFile);
    end;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
