unit ClassInformation;

interface

uses
  System.Classes,
  System.SysUtils,
  System.RTTI;

type
  TClassInformation = class
  private
    FProperties: TStrings;
    FMethods: TStrings;

    function GetParameters(AMethod: TRttiMethod): String;
  public
    constructor Create;
    destructor Destroy; override;

    property Properties: TStrings read FProperties;
    property Methods: TStrings read FMethods;

    procedure Generate(const AQualifiedClassName: String);
  end;

implementation

{ TClassInformation }

constructor TClassInformation.Create;
begin
  FProperties := TStringList.Create;
  FMethods := TStringList.Create;
end;

destructor TClassInformation.Destroy;
begin
  FreeAndNil(FProperties);
  FreeAndNil(FMethods);

  inherited;
end;

procedure TClassInformation.Generate(const AQualifiedClassName: String);
var
  rttiContext: TRttiContext;
  rttiInstanceType: TRttiInstanceType;
  rttiMethod: TRttiMethod;
  rttiProperty: TRttiProperty;

begin
  rttiInstanceType := rttiContext.FindType(AQualifiedClassName).AsInstance;


  FProperties.Clear;
  for rttiProperty in rttiInstanceType.GetDeclaredProperties do
    FProperties.Add(Format('%s: %s', [rttiProperty.Name, rttiProperty.PropertyType.Name]));

  FMethods.Clear;
  for RttiMethod in rttiInstanceType.GetDeclaredMethods do
    FMethods.Add(Format('%s %s%s %s', ['', rttiMethod.Name, GetParameters(rttiMethod), '']));
end;

function TClassInformation.GetParameters(AMethod: TRttiMethod): String;
var
  rttiParameter: TRttiParameter;
  parameters: TStringBuilder;
begin
  Result := EmptyStr;
  parameters := TStringBuilder.Create;
  try
    for rttiParameter in AMethod.GetParameters do
      parameters.AppendFormat('%s: %s; ', [rttiParameter.Name, rttiParameter.ParamType.Name]);

    Result := parameters.ToString;

    if not Result.IsEmpty then
      Result := Concat('(', Copy(Result, 1, Length(Result)-2), ')');
  finally
    FreeAndNil(parameters);
  end;
end;

end.
