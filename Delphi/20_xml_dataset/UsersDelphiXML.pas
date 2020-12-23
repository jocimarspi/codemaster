
{**************************************************************************************************}
{                                                                                                  }
{                                         XML Data Binding                                         }
{                                                                                                  }
{         Generated on: 22/12/2020 22:12:48                                                        }
{       Generated from: D:\OneDrive\Projetos\codemaster\Delphi\19_xml_data_bind\users-delphi.xml   }
{   Settings stored in: D:\OneDrive\Projetos\codemaster\Delphi\19_xml_data_bind\users-delphi.xdb   }
{                                                                                                  }
{**************************************************************************************************}

unit UsersDelphiXML;

interface

uses Xml.xmldom, Xml.XMLDoc, Xml.XMLIntf;

type

{ Forward Decls }

  IXMLResponseType = interface;
  IXML_metaType = interface;
  IXMLRateLimitType = interface;
  IXMLResultType = interface;
  IXMLItemType = interface;
  IXML_linksType = interface;
  IXMLSelfType = interface;
  IXMLEditType = interface;
  IXMLAvatarType = interface;

{ IXMLResponseType }

  IXMLResponseType = interface(IXMLNode)
    ['{6E99F01A-4FFC-475B-BD2D-B599030EBC83}']
    { Property Accessors }
    function Get__meta: IXML_metaType;
    function Get_Result: IXMLResultType;
    { Methods & Properties }
    property _meta: IXML_metaType read Get__meta;
    property Result: IXMLResultType read Get_Result;
  end;

{ IXML_metaType }

  IXML_metaType = interface(IXMLNode)
    ['{E77EA813-8BC2-49F5-B916-94F0CC5AA3A6}']
    { Property Accessors }
    function Get_Success: UnicodeString;
    function Get_Code: Integer;
    function Get_Message: UnicodeString;
    function Get_TotalCount: Integer;
    function Get_PageCount: Integer;
    function Get_CurrentPage: Integer;
    function Get_PerPage: Integer;
    function Get_RateLimit: IXMLRateLimitType;
    procedure Set_Success(Value: UnicodeString);
    procedure Set_Code(Value: Integer);
    procedure Set_Message(Value: UnicodeString);
    procedure Set_TotalCount(Value: Integer);
    procedure Set_PageCount(Value: Integer);
    procedure Set_CurrentPage(Value: Integer);
    procedure Set_PerPage(Value: Integer);
    { Methods & Properties }
    property Success: UnicodeString read Get_Success write Set_Success;
    property Code: Integer read Get_Code write Set_Code;
    property Message: UnicodeString read Get_Message write Set_Message;
    property TotalCount: Integer read Get_TotalCount write Set_TotalCount;
    property PageCount: Integer read Get_PageCount write Set_PageCount;
    property CurrentPage: Integer read Get_CurrentPage write Set_CurrentPage;
    property PerPage: Integer read Get_PerPage write Set_PerPage;
    property RateLimit: IXMLRateLimitType read Get_RateLimit;
  end;

{ IXMLRateLimitType }

  IXMLRateLimitType = interface(IXMLNode)
    ['{73C5E106-D213-4157-ABC3-79B2E931BC8F}']
    { Property Accessors }
    function Get_Limit: Integer;
    function Get_Remaining: Integer;
    function Get_Reset: Integer;
    procedure Set_Limit(Value: Integer);
    procedure Set_Remaining(Value: Integer);
    procedure Set_Reset(Value: Integer);
    { Methods & Properties }
    property Limit: Integer read Get_Limit write Set_Limit;
    property Remaining: Integer read Get_Remaining write Set_Remaining;
    property Reset: Integer read Get_Reset write Set_Reset;
  end;

{ IXMLResultType }

  IXMLResultType = interface(IXMLNodeCollection)
    ['{9C3FB52C-7CFB-48C7-BAC9-2F80E7517702}']
    { Property Accessors }
    function Get_Item(Index: Integer): IXMLItemType;
    { Methods & Properties }
    function Add: IXMLItemType;
    function Insert(const Index: Integer): IXMLItemType;
    property Item[Index: Integer]: IXMLItemType read Get_Item; default;
  end;

{ IXMLItemType }

  IXMLItemType = interface(IXMLNode)
    ['{6FDFABCB-7A02-41AA-A747-D88281957218}']
    { Property Accessors }
    function Get_Id: Integer;
    function Get_First_name: UnicodeString;
    function Get_Last_name: UnicodeString;
    function Get_Gender: UnicodeString;
    function Get_Dob: UnicodeString;
    function Get_Email: UnicodeString;
    function Get_Phone: UnicodeString;
    function Get_Website: UnicodeString;
    function Get_Address: UnicodeString;
    function Get_Status: UnicodeString;
    function Get__links: IXML_linksType;
    procedure Set_Id(Value: Integer);
    procedure Set_First_name(Value: UnicodeString);
    procedure Set_Last_name(Value: UnicodeString);
    procedure Set_Gender(Value: UnicodeString);
    procedure Set_Dob(Value: UnicodeString);
    procedure Set_Email(Value: UnicodeString);
    procedure Set_Phone(Value: UnicodeString);
    procedure Set_Website(Value: UnicodeString);
    procedure Set_Address(Value: UnicodeString);
    procedure Set_Status(Value: UnicodeString);
    { Methods & Properties }
    property Id: Integer read Get_Id write Set_Id;
    property First_name: UnicodeString read Get_First_name write Set_First_name;
    property Last_name: UnicodeString read Get_Last_name write Set_Last_name;
    property Gender: UnicodeString read Get_Gender write Set_Gender;
    property Dob: UnicodeString read Get_Dob write Set_Dob;
    property Email: UnicodeString read Get_Email write Set_Email;
    property Phone: UnicodeString read Get_Phone write Set_Phone;
    property Website: UnicodeString read Get_Website write Set_Website;
    property Address: UnicodeString read Get_Address write Set_Address;
    property Status: UnicodeString read Get_Status write Set_Status;
    property _links: IXML_linksType read Get__links;
  end;

{ IXML_linksType }

  IXML_linksType = interface(IXMLNode)
    ['{6B67DDCB-FD51-4F1E-89E8-70F12E99FE6C}']
    { Property Accessors }
    function Get_Self: IXMLSelfType;
    function Get_Edit: IXMLEditType;
    function Get_Avatar: IXMLAvatarType;
    { Methods & Properties }
    property Self: IXMLSelfType read Get_Self;
    property Edit: IXMLEditType read Get_Edit;
    property Avatar: IXMLAvatarType read Get_Avatar;
  end;

{ IXMLSelfType }

  IXMLSelfType = interface(IXMLNode)
    ['{0AAAD60B-FAD0-4B81-8155-B514E919BD30}']
    { Property Accessors }
    function Get_Href: UnicodeString;
    procedure Set_Href(Value: UnicodeString);
    { Methods & Properties }
    property Href: UnicodeString read Get_Href write Set_Href;
  end;

{ IXMLEditType }

  IXMLEditType = interface(IXMLNode)
    ['{56C7C9D5-C80B-4B08-8DFB-168BA03BC52B}']
    { Property Accessors }
    function Get_Href: UnicodeString;
    procedure Set_Href(Value: UnicodeString);
    { Methods & Properties }
    property Href: UnicodeString read Get_Href write Set_Href;
  end;

{ IXMLAvatarType }

  IXMLAvatarType = interface(IXMLNode)
    ['{976303D4-0316-49EE-BAC6-EB4B99EC6431}']
    { Property Accessors }
    function Get_Href: UnicodeString;
    procedure Set_Href(Value: UnicodeString);
    { Methods & Properties }
    property Href: UnicodeString read Get_Href write Set_Href;
  end;

{ Forward Decls }

  TXMLResponseType = class;
  TXML_metaType = class;
  TXMLRateLimitType = class;
  TXMLResultType = class;
  TXMLItemType = class;
  TXML_linksType = class;
  TXMLSelfType = class;
  TXMLEditType = class;
  TXMLAvatarType = class;

{ TXMLResponseType }

  TXMLResponseType = class(TXMLNode, IXMLResponseType)
  protected
    { IXMLResponseType }
    function Get__meta: IXML_metaType;
    function Get_Result: IXMLResultType;
  public
    procedure AfterConstruction; override;
  end;

{ TXML_metaType }

  TXML_metaType = class(TXMLNode, IXML_metaType)
  protected
    { IXML_metaType }
    function Get_Success: UnicodeString;
    function Get_Code: Integer;
    function Get_Message: UnicodeString;
    function Get_TotalCount: Integer;
    function Get_PageCount: Integer;
    function Get_CurrentPage: Integer;
    function Get_PerPage: Integer;
    function Get_RateLimit: IXMLRateLimitType;
    procedure Set_Success(Value: UnicodeString);
    procedure Set_Code(Value: Integer);
    procedure Set_Message(Value: UnicodeString);
    procedure Set_TotalCount(Value: Integer);
    procedure Set_PageCount(Value: Integer);
    procedure Set_CurrentPage(Value: Integer);
    procedure Set_PerPage(Value: Integer);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLRateLimitType }

  TXMLRateLimitType = class(TXMLNode, IXMLRateLimitType)
  protected
    { IXMLRateLimitType }
    function Get_Limit: Integer;
    function Get_Remaining: Integer;
    function Get_Reset: Integer;
    procedure Set_Limit(Value: Integer);
    procedure Set_Remaining(Value: Integer);
    procedure Set_Reset(Value: Integer);
  end;

{ TXMLResultType }

  TXMLResultType = class(TXMLNodeCollection, IXMLResultType)
  protected
    { IXMLResultType }
    function Get_Item(Index: Integer): IXMLItemType;
    function Add: IXMLItemType;
    function Insert(const Index: Integer): IXMLItemType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLItemType }

  TXMLItemType = class(TXMLNode, IXMLItemType)
  protected
    { IXMLItemType }
    function Get_Id: Integer;
    function Get_First_name: UnicodeString;
    function Get_Last_name: UnicodeString;
    function Get_Gender: UnicodeString;
    function Get_Dob: UnicodeString;
    function Get_Email: UnicodeString;
    function Get_Phone: UnicodeString;
    function Get_Website: UnicodeString;
    function Get_Address: UnicodeString;
    function Get_Status: UnicodeString;
    function Get__links: IXML_linksType;
    procedure Set_Id(Value: Integer);
    procedure Set_First_name(Value: UnicodeString);
    procedure Set_Last_name(Value: UnicodeString);
    procedure Set_Gender(Value: UnicodeString);
    procedure Set_Dob(Value: UnicodeString);
    procedure Set_Email(Value: UnicodeString);
    procedure Set_Phone(Value: UnicodeString);
    procedure Set_Website(Value: UnicodeString);
    procedure Set_Address(Value: UnicodeString);
    procedure Set_Status(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXML_linksType }

  TXML_linksType = class(TXMLNode, IXML_linksType)
  protected
    { IXML_linksType }
    function Get_Self: IXMLSelfType;
    function Get_Edit: IXMLEditType;
    function Get_Avatar: IXMLAvatarType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLSelfType }

  TXMLSelfType = class(TXMLNode, IXMLSelfType)
  protected
    { IXMLSelfType }
    function Get_Href: UnicodeString;
    procedure Set_Href(Value: UnicodeString);
  end;

{ TXMLEditType }

  TXMLEditType = class(TXMLNode, IXMLEditType)
  protected
    { IXMLEditType }
    function Get_Href: UnicodeString;
    procedure Set_Href(Value: UnicodeString);
  end;

{ TXMLAvatarType }

  TXMLAvatarType = class(TXMLNode, IXMLAvatarType)
  protected
    { IXMLAvatarType }
    function Get_Href: UnicodeString;
    procedure Set_Href(Value: UnicodeString);
  end;

{ Global Functions }

function Getresponse(Doc: IXMLDocument): IXMLResponseType;
function Loadresponse(const FileName: string): IXMLResponseType;
function Newresponse: IXMLResponseType;

const
  TargetNamespace = '';

implementation

uses Xml.xmlutil;

{ Global Functions }

function Getresponse(Doc: IXMLDocument): IXMLResponseType;
begin
  Result := Doc.GetDocBinding('response', TXMLResponseType, TargetNamespace) as IXMLResponseType;
end;

function Loadresponse(const FileName: string): IXMLResponseType;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('response', TXMLResponseType, TargetNamespace) as IXMLResponseType;
end;

function Newresponse: IXMLResponseType;
begin
  Result := NewXMLDocument.GetDocBinding('response', TXMLResponseType, TargetNamespace) as IXMLResponseType;
end;

{ TXMLResponseType }

procedure TXMLResponseType.AfterConstruction;
begin
  RegisterChildNode('_meta', TXML_metaType);
  RegisterChildNode('result', TXMLResultType);
  inherited;
end;

function TXMLResponseType.Get__meta: IXML_metaType;
begin
  Result := ChildNodes['_meta'] as IXML_metaType;
end;

function TXMLResponseType.Get_Result: IXMLResultType;
begin
  Result := ChildNodes['result'] as IXMLResultType;
end;

{ TXML_metaType }

procedure TXML_metaType.AfterConstruction;
begin
  RegisterChildNode('rateLimit', TXMLRateLimitType);
  inherited;
end;

function TXML_metaType.Get_Success: UnicodeString;
begin
  Result := ChildNodes['success'].Text;
end;

procedure TXML_metaType.Set_Success(Value: UnicodeString);
begin
  ChildNodes['success'].NodeValue := Value;
end;

function TXML_metaType.Get_Code: Integer;
begin
  Result := ChildNodes['code'].NodeValue;
end;

procedure TXML_metaType.Set_Code(Value: Integer);
begin
  ChildNodes['code'].NodeValue := Value;
end;

function TXML_metaType.Get_Message: UnicodeString;
begin
  Result := ChildNodes['message'].Text;
end;

procedure TXML_metaType.Set_Message(Value: UnicodeString);
begin
  ChildNodes['message'].NodeValue := Value;
end;

function TXML_metaType.Get_TotalCount: Integer;
begin
  Result := ChildNodes['totalCount'].NodeValue;
end;

procedure TXML_metaType.Set_TotalCount(Value: Integer);
begin
  ChildNodes['totalCount'].NodeValue := Value;
end;

function TXML_metaType.Get_PageCount: Integer;
begin
  Result := ChildNodes['pageCount'].NodeValue;
end;

procedure TXML_metaType.Set_PageCount(Value: Integer);
begin
  ChildNodes['pageCount'].NodeValue := Value;
end;

function TXML_metaType.Get_CurrentPage: Integer;
begin
  Result := ChildNodes['currentPage'].NodeValue;
end;

procedure TXML_metaType.Set_CurrentPage(Value: Integer);
begin
  ChildNodes['currentPage'].NodeValue := Value;
end;

function TXML_metaType.Get_PerPage: Integer;
begin
  Result := ChildNodes['perPage'].NodeValue;
end;

procedure TXML_metaType.Set_PerPage(Value: Integer);
begin
  ChildNodes['perPage'].NodeValue := Value;
end;

function TXML_metaType.Get_RateLimit: IXMLRateLimitType;
begin
  Result := ChildNodes['rateLimit'] as IXMLRateLimitType;
end;

{ TXMLRateLimitType }

function TXMLRateLimitType.Get_Limit: Integer;
begin
  Result := ChildNodes['limit'].NodeValue;
end;

procedure TXMLRateLimitType.Set_Limit(Value: Integer);
begin
  ChildNodes['limit'].NodeValue := Value;
end;

function TXMLRateLimitType.Get_Remaining: Integer;
begin
  Result := ChildNodes['remaining'].NodeValue;
end;

procedure TXMLRateLimitType.Set_Remaining(Value: Integer);
begin
  ChildNodes['remaining'].NodeValue := Value;
end;

function TXMLRateLimitType.Get_Reset: Integer;
begin
  Result := ChildNodes['reset'].NodeValue;
end;

procedure TXMLRateLimitType.Set_Reset(Value: Integer);
begin
  ChildNodes['reset'].NodeValue := Value;
end;

{ TXMLResultType }

procedure TXMLResultType.AfterConstruction;
begin
  RegisterChildNode('item', TXMLItemType);
  ItemTag := 'item';
  ItemInterface := IXMLItemType;
  inherited;
end;

function TXMLResultType.Get_Item(Index: Integer): IXMLItemType;
begin
  Result := List[Index] as IXMLItemType;
end;

function TXMLResultType.Add: IXMLItemType;
begin
  Result := AddItem(-1) as IXMLItemType;
end;

function TXMLResultType.Insert(const Index: Integer): IXMLItemType;
begin
  Result := AddItem(Index) as IXMLItemType;
end;

{ TXMLItemType }

procedure TXMLItemType.AfterConstruction;
begin
  RegisterChildNode('_links', TXML_linksType);
  inherited;
end;

function TXMLItemType.Get_Id: Integer;
begin
  Result := ChildNodes['id'].NodeValue;
end;

procedure TXMLItemType.Set_Id(Value: Integer);
begin
  ChildNodes['id'].NodeValue := Value;
end;

function TXMLItemType.Get_First_name: UnicodeString;
begin
  Result := ChildNodes['first_name'].Text;
end;

procedure TXMLItemType.Set_First_name(Value: UnicodeString);
begin
  ChildNodes['first_name'].NodeValue := Value;
end;

function TXMLItemType.Get_Last_name: UnicodeString;
begin
  Result := ChildNodes['last_name'].Text;
end;

procedure TXMLItemType.Set_Last_name(Value: UnicodeString);
begin
  ChildNodes['last_name'].NodeValue := Value;
end;

function TXMLItemType.Get_Gender: UnicodeString;
begin
  Result := ChildNodes['gender'].Text;
end;

procedure TXMLItemType.Set_Gender(Value: UnicodeString);
begin
  ChildNodes['gender'].NodeValue := Value;
end;

function TXMLItemType.Get_Dob: UnicodeString;
begin
  Result := ChildNodes['dob'].Text;
end;

procedure TXMLItemType.Set_Dob(Value: UnicodeString);
begin
  ChildNodes['dob'].NodeValue := Value;
end;

function TXMLItemType.Get_Email: UnicodeString;
begin
  Result := ChildNodes['email'].Text;
end;

procedure TXMLItemType.Set_Email(Value: UnicodeString);
begin
  ChildNodes['email'].NodeValue := Value;
end;

function TXMLItemType.Get_Phone: UnicodeString;
begin
  Result := ChildNodes['phone'].Text;
end;

procedure TXMLItemType.Set_Phone(Value: UnicodeString);
begin
  ChildNodes['phone'].NodeValue := Value;
end;

function TXMLItemType.Get_Website: UnicodeString;
begin
  Result := ChildNodes['website'].Text;
end;

procedure TXMLItemType.Set_Website(Value: UnicodeString);
begin
  ChildNodes['website'].NodeValue := Value;
end;

function TXMLItemType.Get_Address: UnicodeString;
begin
  Result := ChildNodes['address'].Text;
end;

procedure TXMLItemType.Set_Address(Value: UnicodeString);
begin
  ChildNodes['address'].NodeValue := Value;
end;

function TXMLItemType.Get_Status: UnicodeString;
begin
  Result := ChildNodes['status'].Text;
end;

procedure TXMLItemType.Set_Status(Value: UnicodeString);
begin
  ChildNodes['status'].NodeValue := Value;
end;

function TXMLItemType.Get__links: IXML_linksType;
begin
  Result := ChildNodes['_links'] as IXML_linksType;
end;

{ TXML_linksType }

procedure TXML_linksType.AfterConstruction;
begin
  RegisterChildNode('self', TXMLSelfType);
  RegisterChildNode('edit', TXMLEditType);
  RegisterChildNode('avatar', TXMLAvatarType);
  inherited;
end;

function TXML_linksType.Get_Self: IXMLSelfType;
begin
  Result := ChildNodes['self'] as IXMLSelfType;
end;

function TXML_linksType.Get_Edit: IXMLEditType;
begin
  Result := ChildNodes['edit'] as IXMLEditType;
end;

function TXML_linksType.Get_Avatar: IXMLAvatarType;
begin
  Result := ChildNodes['avatar'] as IXMLAvatarType;
end;

{ TXMLSelfType }

function TXMLSelfType.Get_Href: UnicodeString;
begin
  Result := ChildNodes['href'].Text;
end;

procedure TXMLSelfType.Set_Href(Value: UnicodeString);
begin
  ChildNodes['href'].NodeValue := Value;
end;

{ TXMLEditType }

function TXMLEditType.Get_Href: UnicodeString;
begin
  Result := ChildNodes['href'].Text;
end;

procedure TXMLEditType.Set_Href(Value: UnicodeString);
begin
  ChildNodes['href'].NodeValue := Value;
end;

{ TXMLAvatarType }

function TXMLAvatarType.Get_Href: UnicodeString;
begin
  Result := ChildNodes['href'].Text;
end;

procedure TXMLAvatarType.Set_Href(Value: UnicodeString);
begin
  ChildNodes['href'].NodeValue := Value;
end;

end.