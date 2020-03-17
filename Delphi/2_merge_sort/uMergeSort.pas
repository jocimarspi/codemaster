unit uMergeSort;

interface

uses
  System.Types;

type
  TMergeSort = class
  private
    FVetor: TIntegerDynArray;
    procedure Dividir(const indiceInicio, indiceFim: Integer);
    procedure Juntar(const indiceInicio, indiceMeio, indiceFim: Integer);
  public
    constructor Create(var vetor: TIntegerDynArray);
    procedure Ordenar;
  end;

implementation

{ TMergeSort }

constructor TMergeSort.Create(var vetor: TIntegerDynArray);
begin
  FVetor := vetor;
end;

procedure TMergeSort.Dividir(const indiceInicio, indiceFim: Integer);
var
  indiceMeio: Integer;
begin
  if (indiceInicio >= indiceFim) then
    exit;

  if (indiceInicio < 0) then
    exit;

  if (indiceFim >= Length(FVetor)) then
    exit;

  indiceMeio := (indiceInicio + indiceFim) div 2;

  Dividir(indiceInicio, indiceMeio);
  Dividir(indiceMeio+1, indiceFim);

  Juntar(indiceInicio, indiceMeio, indiceFim);
end;

procedure TMergeSort.Juntar(const indiceInicio, indiceMeio, indiceFim: Integer);
var
  auxiliar: TIntegerDynArray;
  indice: Integer;

  i, j, k: integer;
begin
  SetLength(auxiliar, Length(FVetor));
  for indice := 0 to Length(FVetor)-1 do
    auxiliar[indice] := FVetor[indice];


  i := indiceInicio;
  j := indiceMeio + 1;
  k := indiceInicio;

  while ((i <= indiceMeio) and (j <= indiceFim)) do
  begin
    if (auxiliar[i] < auxiliar[j]) then
    begin
      FVetor[k] := auxiliar[i];
      Inc(i);
    end
    else
    begin
      FVetor[k] := auxiliar[j];
      Inc(j);
    end;

    Inc(k);
  end;

  while (i <= indiceMeio) do
  begin
    FVetor[k] := auxiliar[i];
    Inc(i);
    Inc(k);
  end;

  while (j <= indiceFim) do
  begin
    FVetor[k] := auxiliar[j];
    Inc(j);
    Inc(k);
  end;
end;

procedure TMergeSort.Ordenar;
var
  indiceInicio: Integer;
  indiceFim: Integer;
begin
  if Length(FVetor) = 0 then
    exit;

  indiceInicio := 0;
  indiceFim := Length(FVetor)-1;

  Dividir(indiceInicio, indiceFim);
end;

end.
