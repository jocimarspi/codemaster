unit MagicCreator;

interface

uses
  System.RTTI;

type
  TMagicCreator = class
  public
    procedure Open;
  end;

implementation

{ TMagicCreator }

procedure TMagicCreator.Open;
var
  RttiContext: TRttiContext;
  RttiInstanceType: TRttiInstanceType;
  RttiMethod: TRttiMethod;
  Instance: TValue;
begin
  RttiContext := TRttiContext.Create;
  try
    RttiInstanceType := RttiContext.FindType('Notepad.TNotepad').AsInstance;

    RttiMethod := RttiInstanceType.GetMethod('Create');
    Instance := RttiMethod.Invoke(RttiInstanceType.MetaclassType,[]);

    RttiMethod := RttiInstanceType.GetMethod('Execute');
    RttiMethod.Invoke(Instance, []);
  finally
    RttiContext.Free;
  end;
end;

end.
