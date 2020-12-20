unit FileLoadIntf;

interface

type
  IFileLoad = interface
    ['{C8C73EED-85DD-4788-9D33-6E91F04A3FD4}']
    procedure LoadFromFile(const AFile: String);
  end;

implementation

end.
