object RttiPropertiesAndMethodsF: TRttiPropertiesAndMethodsF
  Left = 0
  Top = 0
  Caption = 'RTTI Properties and Methods'
  ClientHeight = 282
  ClientWidth = 481
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 13
    Width = 76
    Height = 13
    Caption = 'Nome da Classe'
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 107
    Height = 13
    Caption = 'Informa'#231#245'es da classe'
  end
  object mmClassInfomation: TMemo
    Left = 8
    Top = 73
    Width = 465
    Height = 201
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object edQualifiedClassName: TEdit
    Left = 8
    Top = 29
    Width = 401
    Height = 21
    TabOrder = 1
    Text = 'System.Classes.TStringList'
  end
  object Button1: TButton
    Left = 415
    Top = 27
    Width = 58
    Height = 25
    Caption = 'Atualizar'
    TabOrder = 2
    OnClick = Button1Click
  end
end
