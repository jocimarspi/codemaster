unit Employee;

interface

uses
  System.Sysutils;

type
  TEmployee = class
  private
    FName: String;
    FEmail: String;
    FPhone: String;
    procedure SetEmail(const Value: String);
    procedure SetName(const Value: String);
    procedure SetPhone(const Value: String);
  public
    property Name: String read FName write SetName;
    property Email: String read FEmail write SetEmail;
    property Phone: String read FPhone write SetPhone;

    function ToString: String; override;
  end;

implementation

{ TEmployee }

procedure TEmployee.SetEmail(const Value: String);
begin
  FEmail := Value;
end;

procedure TEmployee.SetName(const Value: String);
begin
  FName := Value;
end;

procedure TEmployee.SetPhone(const Value: String);
begin
  FPhone := Value;
end;

function TEmployee.ToString: String;
var
  str: TStringBuilder;
begin
  str := TStringBuilder.Create;
  try
    str.AppendFormat('Nome: %s', [FName]);
    str.AppendLine;
    str.AppendFormat('E-mail: %s', [FEmail]);
    str.AppendLine;
    str.AppendFormat('Phone: %s', [FPhone]);
    str.AppendLine;

    Result := str.ToString;
  finally
    FreeAndNil(str);
  end;
end;

end.
