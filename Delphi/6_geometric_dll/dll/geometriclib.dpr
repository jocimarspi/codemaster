library geometriclib;

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
  uGeometric in 'uGeometric.pas';

{$R *.res}

function TrianglePerimeter(AEdgeA, AEdgeB, AEdgeC: Extended): Extended; stdcall;
var
  Attributes: TTriangleAttributes;
begin
  Attributes.EdgeA := AEdgeA;
  Attributes.EdgeB := AEdgeB;
  Attributes.EdgeC := AEdgeC;

  Result := CalculatePerimeter(Attributes);
end;

function RectanglePerimeter(ALenght, AWidth: Extended): Extended; stdcall;
var
  Attributes: TRectangleAttributes;
begin
  Attributes.Lenght := ALenght;
  Attributes.Width := AWidth;

  Result := CalculatePerimeter(Attributes);
end;

function CirclePerimeter(ARadius: Extended): Extended; stdcall;
begin
  Result := CalculatePerimeter(ARadius);
end;

function TriangleArea(ABase, AHeight: Extended): Extended; stdcall;
var
  Attributes: TTriangleAttributes;
begin
  Attributes.Base := ABase;
  Attributes.Height := AHeight;

  Result := CalculateArea(Attributes);
end;

function RectangleArea(ALenght, AWidth: Extended): Extended; stdcall;
var
  Attributes: TRectangleAttributes;
begin
  Attributes.Lenght := ALenght;
  Attributes.Width := AWidth;

  Result := CalculateArea(Attributes);
end;

function CircleArea(ARadius: Extended): Extended; stdcall;
begin
  Result := CalculateArea(ARadius);
end;

exports
  TrianglePerimeter,
  RectanglePerimeter,
  CirclePerimeter,
  TriangleArea,
  RectangleArea,
  CircleArea;

end.
