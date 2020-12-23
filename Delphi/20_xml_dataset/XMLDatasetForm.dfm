object XMLDatasetF: TXMLDatasetF
  Left = 0
  Top = 0
  Caption = 'XML Dataset'
  ClientHeight = 481
  ClientWidth = 1008
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 649
    Top = 0
    Width = 5
    Height = 481
    Align = alRight
    ExplicitLeft = 481
    ExplicitHeight = 561
  end
  object Panel1: TPanel
    Left = 654
    Top = 0
    Width = 354
    Height = 481
    Align = alRight
    TabOrder = 0
    ExplicitLeft = 384
    ExplicitHeight = 561
    DesignSize = (
      354
      481)
    object Label1: TLabel
      Left = 16
      Top = 32
      Width = 10
      Height = 13
      Caption = 'Id'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 16
      Top = 72
      Width = 27
      Height = 13
      Caption = 'Nome'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 16
      Top = 112
      Width = 54
      Height = 13
      Caption = 'Sobrenome'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 16
      Top = 152
      Width = 35
      Height = 13
      Caption = 'G'#234'nero'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 103
      Top = 152
      Width = 80
      Height = 13
      Caption = 'Data nascimento'
      FocusControl = DBEdit5
    end
    object Label6: TLabel
      Left = 16
      Top = 192
      Width = 28
      Height = 13
      Caption = 'E-mail'
      FocusControl = DBEdit6
    end
    object Label7: TLabel
      Left = 190
      Top = 152
      Width = 42
      Height = 13
      Caption = 'Telefone'
      FocusControl = DBEdit7
    end
    object Label8: TLabel
      Left = 16
      Top = 232
      Width = 39
      Height = 13
      Caption = 'Website'
      FocusControl = DBEdit8
    end
    object Label9: TLabel
      Left = 16
      Top = 272
      Width = 45
      Height = 13
      Caption = 'Endere'#231'o'
      FocusControl = DBEdit9
    end
    object Label10: TLabel
      Left = 16
      Top = 312
      Width = 30
      Height = 13
      Caption = 'status'
      FocusControl = DBEdit10
    end
    object Label11: TLabel
      Left = 16
      Top = 352
      Width = 39
      Height = 13
      Caption = 'Recurso'
      FocusControl = DBEdit11
    end
    object Label12: TLabel
      Left = 16
      Top = 392
      Width = 28
      Height = 13
      Caption = 'Editar'
      FocusControl = DBEdit12
    end
    object Label13: TLabel
      Left = 16
      Top = 432
      Width = 33
      Height = 13
      Caption = 'Avatar'
      FocusControl = DBEdit13
    end
    object DBNavigator1: TDBNavigator
      Left = 1
      Top = 1
      Width = 352
      Height = 25
      DataSource = dsUsers
      Align = alTop
      TabOrder = 0
      ExplicitLeft = -135
      ExplicitTop = 0
      ExplicitWidth = 320
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 48
      Width = 49
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'id'
      DataSource = dsUsers
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 16
      Top = 85
      Width = 330
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'first_name'
      DataSource = dsUsers
      TabOrder = 2
    end
    object DBEdit3: TDBEdit
      Left = 16
      Top = 128
      Width = 330
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'last_name'
      DataSource = dsUsers
      TabOrder = 3
      ExplicitWidth = 230
    end
    object DBEdit4: TDBEdit
      Left = 16
      Top = 168
      Width = 81
      Height = 21
      DataField = 'gender'
      DataSource = dsUsers
      TabOrder = 4
    end
    object DBEdit5: TDBEdit
      Left = 103
      Top = 168
      Width = 81
      Height = 21
      DataField = 'dob'
      DataSource = dsUsers
      TabOrder = 5
    end
    object DBEdit6: TDBEdit
      Left = 16
      Top = 208
      Width = 330
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'email'
      DataSource = dsUsers
      TabOrder = 7
    end
    object DBEdit7: TDBEdit
      Left = 190
      Top = 168
      Width = 105
      Height = 21
      DataField = 'phone'
      DataSource = dsUsers
      TabOrder = 6
    end
    object DBEdit8: TDBEdit
      Left = 16
      Top = 248
      Width = 330
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'website'
      DataSource = dsUsers
      TabOrder = 8
    end
    object DBEdit9: TDBEdit
      Left = 16
      Top = 288
      Width = 330
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'address'
      DataSource = dsUsers
      TabOrder = 9
    end
    object DBEdit10: TDBEdit
      Left = 16
      Top = 328
      Width = 330
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'status'
      DataSource = dsUsers
      TabOrder = 10
    end
    object DBEdit11: TDBEdit
      Left = 16
      Top = 368
      Width = 330
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'link_self'
      DataSource = dsUsers
      TabOrder = 11
    end
    object DBEdit12: TDBEdit
      Left = 16
      Top = 408
      Width = 330
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'link_edit'
      DataSource = dsUsers
      TabOrder = 12
    end
    object DBEdit13: TDBEdit
      Left = 16
      Top = 448
      Width = 330
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'link_avatar'
      DataSource = dsUsers
      TabOrder = 13
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 649
    Height = 481
    Align = alClient
    DataSource = dsUsers
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Width = 24
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'first_name'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'last_name'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'gender'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dob'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'email'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'phone'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'website'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'address'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'status'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'link_self'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'link_edit'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'link_avatar'
        Width = 120
        Visible = True
      end>
  end
  object cdsUsers: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterPost = cdsUsersAfterPost
    Left = 168
    Top = 56
    object cdsUsersid: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'id'
    end
    object cdsUsersfirst_name: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'first_name'
      Size = 100
    end
    object cdsUserslast_name: TStringField
      DisplayLabel = 'Sobrenome'
      FieldName = 'last_name'
      Size = 100
    end
    object cdsUsersgender: TStringField
      DisplayLabel = 'G'#234'nero'
      FieldName = 'gender'
    end
    object cdsUsersdob: TDateField
      DisplayLabel = 'Data nascimento'
      FieldName = 'dob'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;0;_'
    end
    object cdsUsersemail: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'email'
      Size = 100
    end
    object cdsUsersphone: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'phone'
    end
    object cdsUserswebsite: TStringField
      DisplayLabel = 'Website'
      FieldName = 'website'
      Size = 255
    end
    object cdsUsersaddress: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'address'
      Size = 255
    end
    object cdsUsersstatus: TStringField
      DisplayLabel = 'Status'
      FieldName = 'status'
    end
    object cdsUserslink_self: TStringField
      DisplayLabel = 'Recurso'
      FieldName = 'link_self'
      Size = 255
    end
    object cdsUserslink_edit: TStringField
      DisplayLabel = 'Editar'
      FieldName = 'link_edit'
      Size = 255
    end
    object cdsUserslink_avatar: TStringField
      DisplayLabel = 'Avatar'
      FieldName = 'link_avatar'
      Size = 255
    end
  end
  object dsUsers: TDataSource
    DataSet = cdsUsers
    Left = 168
    Top = 104
  end
end
