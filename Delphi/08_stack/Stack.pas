unit Stack;

interface

uses
  System.SysUtils,
  System.Generics.Collections;

type
  TStack<T> = class
  private
    FStack: TList<T>;
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

constructor TStack<T>.Create;
begin
  FStack := TList<T>.Create;
end;

destructor TStack<T>.Destroy;
begin
  FreeAndNil(FStack);
  inherited;
end;

function TStack<T>.GetItem(Index: Integer): T;
begin
  if Index > Pred(FStack.Count) then
    Exit;

  if Index < 0 then
    Exit;

  Result := FStack.Items[Pred(FStack.Count) - Index];
end;

function TStack<T>.IsEmpty: Boolean;
begin
  Result := FStack.Count = 0;
end;

function TStack<T>.Pop: T;
var
  item: T;
begin
  if IsEmpty then
    Exit;

  item := FStack.Last;
  FStack.Delete(FStack.LastIndexOf(FStack.Last));
  Result := item;
end;

procedure TStack<T>.Push(AItem: T);
begin
  FStack.Add(AItem);
end;

function TStack<T>.Size: Integer;
begin
  Result := FStack.Count;
end;

end.
