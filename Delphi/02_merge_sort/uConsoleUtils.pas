unit uConsoleUtils;

interface

uses
  Windows;

type
  TConsoleUtils = class
  public
    class function LimparTelaConsole: Boolean;
  end;

implementation

{ TConsoleUtils }

class function TConsoleUtils.LimparTelaConsole: Boolean;
const
  BUFSIZE = 80*25;
var
  Han,Dummy: LongWord;
  buf: string;
  coord: TCoord;
begin
  Result := false;
  Han := GetStdHandle(STD_OUTPUT_HANDLE);
  if Han <> INVALID_HANDLE_VALUE then
  begin
    if SetConsoleTextAttribute(han, FOREGROUND_RED or FOREGROUND_GREEN or FOREGROUND_BLUE) then
    begin
      SetLength(buf,BUFSIZE);
      FillChar(buf[1],Length(buf),' ');
      if WriteConsole(han,PChar(buf),BUFSIZE,Dummy,nil) then
      begin
        coord.X := 0;
        coord.Y := 0;
        if SetConsoleCursorPosition(han,coord) then
          Result := true;
      end;
    end;
  end;
end;

end.
