unit uGeometria;

interface

uses
  System.Math;

type
  TTriangleAttributes = record
    EdgeA: Extended;
    EdgeB: Extended;
    EdgeC: Extended;
    Height: Extended;
    Base: Extended;
  end;

  TRectangleAttributes = record
    Lenght: Extended;
    Width: Extended;
  end;

function CalculatePerimeter(ATriangleAttributes: TTriangleAttributes): Extended; overload;
function CalculatePerimeter(ARectangleAttributes: TRectangleAttributes): Extended; overload;
function CalculatePerimeter(ARadius: Extended): Extended; overload;

function CalculateArea(ATriangleAttributes: TTriangleAttributes): Extended; overload;
function CalculateArea(ARectangleAttributes: TRectangleAttributes): Extended; overload;
function CalculateArea(ARadius: Extended): Extended; overload;

implementation

function CalculatePerimeter(ATriangleAttributes: TTriangleAttributes): Extended;
begin
  Result := ATriangleAttributes.EdgeA + ATriangleAttributes.EdgeB + ATriangleAttributes.EdgeC;
end;

function CalculatePerimeter(ARectangleAttributes: TRectangleAttributes): Extended;
begin
  Result := (2 * ARectangleAttributes.Lenght)
    + (2 * ARectangleAttributes.Width);
end;

function CalculatePerimeter(ARadius: Extended): Extended;
begin
  Result := 2 * Pi * ARadius;
end;

function CalculateArea(ATriangleAttributes: TTriangleAttributes): Extended;
begin
  Result := (ATriangleAttributes.Height * ATriangleAttributes.Base) / 2
end;

function CalculateArea(ARectangleAttributes: TRectangleAttributes): Extended;
begin
  Result := ARectangleAttributes.Lenght * ARectangleAttributes.Width
end;

function CalculateArea(ARadius: Extended): Extended;
begin
  Result := Pi * Power(ARadius, 2);
end;

end.
