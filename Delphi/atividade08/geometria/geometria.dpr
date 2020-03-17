library geometria;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  System.SysUtils,
  System.Classes,
  Math;

{$R *.res}

function AreaRetangulo(LadoA, LadoB: Double) :Double; stdcall; export;
begin
  Result := LadoA * LadoB;
end;

function PerimetroRetangulo(LadoA, LadoB: Double) :Double; stdcall; export;
begin
  Result := (2 * LadoA) + (2 * LadoB);
end;

function AreaTriangulo(Base, Altura: Double): Double;
begin
  Result := Base * Altura;
end;

function PerimetroTriangulo(LadoA, LadoB, LadoC: Double): Double;
begin
  Result := LadoA + LadoB + LadoC;
end;

function AreaCirculo(Raio: Double): Double;
begin
  Result := Pi * Power(Raio,2);
end;

function PerimetroCirculo(Raio: Double): Double;
begin
  Result := 2 * Pi * Raio;
end;

exports
  AreaRetangulo,
  PerimetroRetangulo,
  AreaTriangulo,
  PerimetroTriangulo,
  AreaCirculo,
  PerimetroCirculo;

begin

end.
