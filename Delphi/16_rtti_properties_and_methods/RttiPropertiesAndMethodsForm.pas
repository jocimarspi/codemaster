unit RttiPropertiesAndMethodsForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TRttiPropertiesAndMethodsF = class(TForm)
    mmClassInfomation: TMemo;
    edQualifiedClassName: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RttiPropertiesAndMethodsF: TRttiPropertiesAndMethodsF;

implementation

uses
  ClassInformation;

{$R *.dfm}

procedure TRttiPropertiesAndMethodsF.Button1Click(Sender: TObject);
var
  classInformation: TClassInformation;
begin
  mmClassInfomation.Clear;

  classInformation := TClassInformation.Create;
  try
    classInformation.Generate(edQualifiedClassName.Text);

    mmClassInfomation.Lines.Add('PRORIEDADES');
    mmClassInfomation.Lines.AddStrings(classInformation.Properties);
    mmClassInfomation.Lines.Add('');
    mmClassInfomation.Lines.Add('MÉTODOS');
    mmClassInfomation.Lines.AddStrings(classInformation.Methods);
  finally
    FreeAndNil(classInformation);
  end;
end;

end.
