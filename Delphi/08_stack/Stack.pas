unit Stack;

interface

uses
  System.SysUtils,
  System.Generics.Collections;

type
  TMyStack<T> = class
  private
    FStack: TStack<T>;
    function GetItem(Index: Integer): T;
  public
    property Item[Index: Integer]: T read GetItem;

    constructor Create;
    destructor Destroy; override;

    procedure Push(AItem: T);
    function Pop: T;
    function Size: Integer;
    function IsEmpty: Boolean;
  end;

implementation

{ TStack<T> }

constructor TMyStack<T>.Create;
begin
  FStack := TStack<T>.Create;
end;

destructor TMyStack<T>.Destroy;
begin
  FreeAndNil(FStack);
  inherited;
end;

function TMyStack<T>.GetItem(Index: Integer): T;
begin
  if Index > Pred(FStack.Count) then
    Exit;

  if Index < 0 then
    Exit;

  Result := FStack.List[Pred(FStack.Count) - Index];
end;

function TMyStack<T>.IsEmpty: Boolean;
begin
  Result := FStack.Count = 0;
end;

function TMyStack<T>.Pop: T;
begin
  if IsEmpty then
    Exit;

  Result := FStack.Pop;
end;

procedure TMyStack<T>.Push(AItem: T);
begin
  FStack.Push(AItem);
end;

function TMyStack<T>.Size: Integer;
begin
  Result := FStack.Count;
end;

end.
