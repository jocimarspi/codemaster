unit MyFile;

interface

uses
  System.Classes,
  System.SysUtils,
  FileSaveIntf,
  FileLoadIntf;

type
  TMyFile = class(TInterfacedObject, IFileSave, IFileLoad)
  private
    FContent: TStringList;
  public
    constructor Create;
    destructor Destroy; override;
    procedure SaveToFile(const AFile: String);
    procedure LoadFromFile(const AFile: String);
    function ToString: String; override;
  end;

implementation

{ TMyFile }

constructor TMyFile.Create;
begin
  FContent := TStringList.Create;
end;

destructor TMyFile.Destroy;
begin
  FreeAndNil(FContent);
  inherited;
end;

procedure TMyFile.LoadFromFile(const AFile: String);
begin
  FContent.LoadFromFile(AFile);
end;

procedure TMyFile.SaveToFile(const AFile: String);
begin
  FContent.SaveToFile(AFile);
end;

function TMyFile.ToString: String;
begin
  Result := FContent.Text;
end;

end.
