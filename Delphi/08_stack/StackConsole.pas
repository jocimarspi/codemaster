unit StackConsole;

interface

uses
  System.SysUtils,
  Stack;

type
  TStackConsole = class
  private
    FIntegerStack: TMyStack<Integer>;
    FStringStack: TMyStack<String>;

    procedure PrintTitle;

    procedure InputIntergerStack;
    procedure ReadInteger(const AIndex: Integer);
    procedure ShowIntegerStack;
    function IsValidInteger(const AString: String): Boolean;
    procedure ProcessIntegerStack;

    procedure InputStringStack;
    procedure ReadString(const AIndex: Integer);
    procedure ShowStringStack;
    procedure ProcessStringStack;

    procedure ShowSizes;

  public
    constructor Create;
    destructor Destroy; override;
    procedure Execute;
  end;

implementation

const
  MAX_INTEGER_READ = 15;
  MAX_STRING_READ = 3;
  INDENT_TOPIC = '  * ';

{ TStackConsole }

constructor TStackConsole.Create;
begin
  FIntegerStack := TMyStack<Integer>.Create;
  FStringStack  := TMyStack<String>.Create;
end;

destructor TStackConsole.Destroy;
begin
  FreeAndNil(FIntegerStack);
  FreeAndNil(FStringStack);

  inherited;
end;

procedure TStackConsole.Execute;
begin
  PrintTitle;

  InputStringStack;
  WriteLn;

  InputIntergerStack;
  WriteLn;

  ShowSizes;
  WriteLn;

  ProcessStringStack;
  WriteLn;

  ProcessIntegerStack;
  WriteLn;

  ShowSizes;
end;

procedure TStackConsole.InputIntergerStack;
var
  index: Integer;
begin
  WriteLn('Input values to Integer Stack');
  WriteLn;

  for index := 1 to MAX_INTEGER_READ do
    ReadInteger(index);
end;

procedure TStackConsole.InputStringStack;
var
  index: Integer;
begin
  WriteLn('Input values to String Stack');
  WriteLn;

  for index := 1 to MAX_STRING_READ do
    ReadString(index);
end;

function TStackConsole.IsValidInteger(const AString: String): Boolean;
var
  lixo: Integer;
begin
  Result := TryStrToInt(AString, lixo);
end;

procedure TStackConsole.PrintTitle;
begin
  WriteLn('STACK APPLICATION');
  WriteLn;
end;

procedure TStackConsole.ProcessIntegerStack;
var
  index: Integer;
begin
  WriteLn('PROCESSING INTEGER STACK');
  WriteLn;

  for index := 0 to Pred(MAX_INTEGER_READ) do
  begin
    WriteLn(Concat('Poped integer ',FIntegerStack.Pop.ToString));
    WriteLn;
    ShowIntegerStack;
    WriteLn('-------------------------------');
  end;
end;

procedure TStackConsole.ProcessStringStack;
var
  index: Integer;
begin
  WriteLn('PROCESSING STRING STACK');
  WriteLn;
  for index := 0 to Pred(MAX_STRING_READ) do
  begin
    WriteLn(Concat('Poped string ',FStringStack.Pop));
    WriteLn;
    ShowStringStack;
    WriteLn('-------------------------------');
  end;
end;

procedure TStackConsole.ReadInteger(const AIndex: Integer);
var
  readValue: String;
  valid: Boolean;
begin
  repeat
    Write(Format('Value %d of %d: ', [AIndex, MAX_INTEGER_READ]));
    ReadLn(readValue);

    valid := IsValidInteger(readValue);

    if valid then
      FIntegerStack.Push(StrToInt(readValue))
    else
    begin
      WriteLn(Format('The value "%s" is invalid integer', [readValue]));
      WriteLn;
    end


  until valid;
end;

procedure TStackConsole.ReadString(const AIndex: Integer);
var
  readValue: String;
  valid: Boolean;
begin
  repeat
    Write(Format('Value %d of %d: ', [AIndex, MAX_STRING_READ]));
    ReadLn(readValue);

    valid := not readValue.Trim.IsEmpty;

    if valid then
      FStringStack.Push(readValue)
    else
    begin
      WriteLn(Format('The string is empty.', [readValue]));
      WriteLn;
    end


  until valid;
end;

procedure TStackConsole.ShowIntegerStack;
var
  index: Integer;
begin
  WriteLn('INTEGER STACK');
  if FIntegerStack.IsEmpty then
  begin
    WriteLn('(Empty stack)');
    exit;
  end;

  for index := 0 to Pred(FIntegerStack.Size)do
    Writeln(Concat(INDENT_TOPIC, FIntegerStack.Item[index].ToString));
end;

procedure TStackConsole.ShowSizes;
begin
  WriteLn('SIZES:');
  WriteLn(Format('%sSTRING STACK: %d',[INDENT_TOPIC, FStringStack.Size]));
  WriteLn(Format('%sINTEGER STACK: %d',[INDENT_TOPIC, FIntegerStack.Size]));
end;

procedure TStackConsole.ShowStringStack;
var
  index: Integer;
begin
  WriteLn('STRING STACK');
  if FStringStack.IsEmpty then
  begin
    WriteLn(Concat('(Empty Stack)'));
    exit;
  end;

  for index := 0 to Pred(FStringStack.Size)do
    Writeln(Concat(INDENT_TOPIC, FStringStack.Item[index]));
end;

end.
