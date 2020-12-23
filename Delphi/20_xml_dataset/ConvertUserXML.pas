unit ConvertUserXML;

interface

uses
  System.Classes,
  System.SysUtils,
  DBClient,
  UsersDelphiXML;

type
  TConvertUserXML = class
  private
    FResponse: IXMLResponseType;
  public
    procedure XMLToDataset(AUsers: TClientDataset);
    procedure DatasetToXML(AUsers: TClientDataset);
  end;

implementation

{ TConvertUserXML }

procedure TConvertUserXML.DatasetToXML(AUsers: TClientDataset);
var
  item: IXMLItemType;
  xml: TStringList;
  clone: TClientDataSet;
begin
  xml := TStringList.Create;
  clone := TClientDataSet.Create(nil);
  try
    FResponse := Newresponse;

    clone.CloneCursor(AUsers, false, true);

    clone.First;
    while not clone.Eof do
    begin
      item := FResponse.Result.Add;
      item.Id := clone.FieldByName('id').AsInteger;
      item.First_name := clone.FieldByName('first_name').AsString;
      item.Last_name := clone.FieldByName('last_name').AsString;
      item.Gender := clone.FieldByName('gender').AsString;
      item.Dob := FormatDateTime('yyyy-mm-dd',clone.FieldByName('dob').AsDateTime);
      item.Email := clone.FieldByName('email').AsString;
      item.Phone := clone.FieldByName('phone').AsString;
      item.Website := clone.FieldByName('website').AsString;
      item.Status := clone.FieldByName('status').AsString;
      item.Address := clone.FieldByName('address').AsString;
      item._links.Self.Href := clone.FieldByName('link_self').AsString;
      item._links.Edit.Href := clone.FieldByName('link_edit').AsString;
      item._links.Avatar.Href := clone.FieldByName('link_avatar').AsString;

      clone.Next;
    end;

    xml.Text := FResponse.XML;
    xml.SaveToFile('users-delphi.xml');
  finally
    FreeAndNil(xml);
    FreeAndNil(clone);
  end;
end;

procedure TConvertUserXML.XMLToDataset(AUsers: TClientDataset);
var
  item: IXMLItemType;
  index: Integer;
begin
  FResponse := Loadresponse('users-delphi.xml');

  if FResponse.Result.Count = 0 then
    exit;

  for index := 0 to Pred(FResponse.Result.Count) do
  begin
    item := FResponse.Result.Item[index];

    AUsers.Append;
    AUsers['id'] := item.Id;
    AUsers['first_name'] := item.First_name;
    AUsers['last_name'] := item.Last_name;
    AUsers['gender'] := item.Gender;
    AUsers['dob'] := item.Dob;
    AUsers['email'] := item.Email;
    AUsers['phone'] := item.Phone;
    AUsers['website'] := item.Website;
    AUsers['status'] := item.Status;
    AUsers['address'] := item.Address;
    AUsers['link_self'] := item._links.Self.Href;
    AUsers['link_edit'] := item._links.Edit.Href;
    AUsers['link_avatar'] := item._links.Avatar.Href;
    AUsers.Post;
  end;
end;

end.
