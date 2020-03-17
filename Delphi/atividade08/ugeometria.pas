unit ugeometria;

interface

function AreaRetangulo(LadoA, LadoB: Double) :Double; external 'geometria.dll';
function PerimetroRetangulo(LadoA, LadoB: Double) :Double; external 'geometria.dll';
function AreaTriangulo(Base, Altura: Double) :Double; external 'geometria.dll';
function PerimetroTriangulo(LadoA, LadoB, LadoC: Double) :Double; external 'geometria.dll';
function AreaCirculo(Raio: Double): Double; external 'geometria.dll';
function PerimetroCirculo(Raio: Double): Double; external 'geometria.dll';

implementation

end.
