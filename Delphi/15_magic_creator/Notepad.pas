unit Notepad;

interface

uses
  Windows, ShellAPI;

type
  TNotepad = class
  public
    procedure Execute;
  end;

implementation

{ TNotepad }

procedure TNotepad.Execute;
begin
  ShellExecute(0, 'open', 'Notepad.exe', nil, nil, SW_SHOWNORMAL);
end;

initialization
  TNotepad.ClassName;

end.
