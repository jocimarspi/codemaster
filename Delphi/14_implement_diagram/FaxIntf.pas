unit FaxIntf;

interface

type
  IFax = interface
    ['{E980B318-2E5E-4F1F-AC59-CAE4582E2AF7}']
    procedure Send;
    procedure Receive;
  end;

implementation

end.
