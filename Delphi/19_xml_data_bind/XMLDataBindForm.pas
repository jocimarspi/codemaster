unit XMLDataBindForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UsersDelphiXML;

type
  TXMLDataBindF = class(TForm)
    Button1: TButton;
    mmXml: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    procedure ListarLinks(ALinks: IXML_linksType);
  public
  end;

var
  XMLDataBindF: TXMLDataBindF;

implementation

{$R *.dfm}

procedure TXMLDataBindF.Button1Click(Sender: TObject);
var
  response: IXMLResponseType;
  item: IXMLItemType;
  index: Integer;
begin
  LockWindowUpdate(Self.Handle);
  try
    response := Loadresponse('users-delphi.xml');

    for index := 0 to Pred(response.Result.Count) do
    begin
      item := response.Result.Item[index];
      mmXML.Lines.Add(Format('Id: %d', [item.Id]));
      mmXML.Lines.Add(Format('Nome: %s', [item.First_name]));
      mmXML.Lines.Add(Format('Sobrenome: %s', [item.Last_name]));
      mmXML.Lines.Add(Format('Genêro: %s', [item.Gender]));
      mmXML.Lines.Add(Format('Data nascimento: %s', [item.Dob]));
      mmXML.Lines.Add(Format('E-mail: %s', [item.Email]));
      mmXML.Lines.Add(Format('Telefone: %s', [item.Phone]));
      mmXML.Lines.Add(Format('Website: %s', [item.Website]));
      mmXML.Lines.Add(Format('Endereço: %s', [item.Address]));
      mmXML.Lines.Add(Format('Status: %s', [item.Status]));
      mmXML.Lines.Add('Link (HATEOS)' );
      ListarLinks(item._links);
      mmXML.Lines.Add('----------------------------------------------------------------');
      mmXML.Lines.Add(EmptyStr);
    end;
  finally
    LockWindowUpdate(0);
  end;
end;

procedure TXMLDataBindF.ListarLinks(ALinks: IXML_linksType);
begin
  mmXML.Lines.Add(Format('    * Recurso: %s', [ALinks.Self.Href]));
  mmXML.Lines.Add(Format('    * Editar: %s', [ALinks.Edit.Href]));
  mmXML.Lines.Add(Format('    * Avatar: %s', [ALinks.Avatar.Href]));
end;

end.
