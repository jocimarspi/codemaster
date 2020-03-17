unit uUtilitades;

interface

uses
  System.SysUtils, Math;

type
  TUtilidades = class
  public
    class function Fatorial(const pNumero: Extended): Extended;
  end;

implementation

{ TUtilidades }

class function TUtilidades.Fatorial(const pNumero: Extended): Extended;
begin
  result := 1;

  if IsZero(pNumero) then
    exit;

  result := pNumero * Fatorial(pNumero - 1)
end;

end.
