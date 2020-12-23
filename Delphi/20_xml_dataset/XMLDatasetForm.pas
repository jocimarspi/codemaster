unit XMLDatasetForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids,
  Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Xml.xmldom, Xml.XmlTransform,
  Datasnap.Provider, Datasnap.Xmlxform;

type
  TXMLDatasetF = class(TForm)
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    cdsUsers: TClientDataSet;
    dsUsers: TDataSource;
    cdsUsersid: TIntegerField;
    cdsUsersfirst_name: TStringField;
    cdsUserslast_name: TStringField;
    cdsUsersgender: TStringField;
    cdsUsersdob: TDateField;
    cdsUsersemail: TStringField;
    cdsUsersphone: TStringField;
    cdsUserswebsite: TStringField;
    cdsUsersaddress: TStringField;
    cdsUsersstatus: TStringField;
    cdsUserslink_self: TStringField;
    cdsUserslink_edit: TStringField;
    cdsUserslink_avatar: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Splitter1: TSplitter;
    procedure FormCreate(Sender: TObject);
    procedure cdsUsersAfterPost(DataSet: TDataSet);
    procedure cdsUsersAfterDelete(DataSet: TDataSet);
  private
    procedure Save;
  public
    { Public declarations }
  end;

var
  XMLDatasetF: TXMLDatasetF;

implementation

uses
  ConvertUserXML;

{$R *.dfm}

procedure TXMLDatasetF.cdsUsersAfterDelete(DataSet: TDataSet);
begin
  Save;
end;

procedure TXMLDatasetF.cdsUsersAfterPost(DataSet: TDataSet);
begin
  Save;
end;

procedure TXMLDatasetF.FormCreate(Sender: TObject);
var
  convert: TConvertUserXML;
begin
  cdsUsers.CreateDataSet;

  convert := TConvertUserXML.Create;
  try
    convert.XMLToDataset(cdsUsers);
  finally
    FreeAndNil(convert);
  end;
end;

procedure TXMLDatasetF.Save;
var
  convert: TConvertUserXML;
begin
  if not Showing then
    Exit;

  convert := TConvertUserXML.Create;
  try
    convert.DatasetToXML(cdsUsers);
  finally
    FreeAndNil(convert);
  end;
end;

end.
