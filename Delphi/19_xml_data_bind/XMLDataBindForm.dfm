object XMLDataBindF: TXMLDataBindF
  Left = 0
  Top = 0
  Caption = 'XML Data Bind'
  ClientHeight = 382
  ClientWidth = 641
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Carregar XML'
    TabOrder = 0
    OnClick = Button1Click
  end
  object mmXml: TMemo
    Left = 8
    Top = 39
    Width = 625
    Height = 335
    ScrollBars = ssVertical
    TabOrder = 1
  end
end
