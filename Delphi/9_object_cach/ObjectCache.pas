unit ObjectCache;

interface

uses
  System.Classes,
  System.Sysutils,
  System.Generics.Collections;

type
  TObjectCache = class
  private
    FCache: TList<TObject>;
  public
    constructor Create;
    destructor Destroy; override;

    function GetInstance<T:class, constructor>: T;
  end;

implementation

{ TOjectCache }

constructor TObjectCache.Create;
begin
  FCache := TList<TObject>.Create;
end;

destructor TObjectCache.Destroy;
begin
  FreeAndNil(FCache);

  inherited;
end;

function TObjectCache.GetInstance<T>: T;
var
  instanceFinded: T;
  index: Integer;
begin
  instanceFinded := nil;

  for index := 0 to Pred(FCache.Count) do
  begin
    if FCache.Items[index].ClassType = T then
      instanceFinded := T(FCache.Items[index]);
  end;

  if not Assigned(instanceFinded) then
  begin
    instanceFinded := T.Create;
    FCache.Add(instanceFinded);
  end;

  Result := instanceFinded;
end;

end.
