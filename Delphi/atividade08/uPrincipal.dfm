object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Mestre dos C'#243'digos - Geometria'
  ClientHeight = 382
  ClientWidth = 684
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pgcFormas: TPageControl
    Left = 0
    Top = 0
    Width = 684
    Height = 89
    ActivePage = tsRetangulo
    Align = alTop
    TabOrder = 0
    object tsRetangulo: TTabSheet
      Caption = 'Ret'#226'ngulo'
      object Label2: TLabel
        Left = 3
        Top = 4
        Width = 33
        Height = 13
        Caption = 'Lado A'
      end
      object Label3: TLabel
        Left = 83
        Top = 23
        Width = 13
        Height = 13
        Caption = 'cm'
      end
      object Label4: TLabel
        Left = 115
        Top = 3
        Width = 32
        Height = 13
        Caption = 'Lado B'
      end
      object Label5: TLabel
        Left = 196
        Top = 23
        Width = 13
        Height = 13
        Caption = 'cm'
      end
      object btCalcularRetangulo: TButton
        Left = 126
        Top = 63
        Width = 75
        Height = 25
        Caption = 'Calcular'
        TabOrder = 2
      end
      object edtLadoA: TEdit
        Left = 3
        Top = 21
        Width = 75
        Height = 21
        TabOrder = 0
      end
      object edtLadoB: TEdit
        Left = 115
        Top = 20
        Width = 75
        Height = 21
        TabOrder = 1
      end
    end
    object tsTriangulo: TTabSheet
      Caption = 'Trinagulo'
      ImageIndex = 1
      ExplicitLeft = 5
      ExplicitTop = 22
      DesignSize = (
        676
        61)
      object FlowPanel1: TFlowPanel
        Left = 7
        Top = 14
        Width = 546
        Height = 39
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvNone
        TabOrder = 0
        object pnBaseTriangulo: TPanel
          Left = 0
          Top = 0
          Width = 95
          Height = 48
          BevelOuter = bvNone
          TabOrder = 0
          object Label7: TLabel
            Left = 0
            Top = -3
            Width = 23
            Height = 13
            Caption = 'Base'
          end
          object Label8: TLabel
            Left = 79
            Top = 16
            Width = 13
            Height = 12
            Caption = 'cm'
          end
          object edtBaseTriangulo: TEdit
            Left = -1
            Top = 13
            Width = 75
            Height = 21
            TabOrder = 0
          end
        end
        object pnAlturaTriangulo: TPanel
          Left = 95
          Top = 0
          Width = 112
          Height = 48
          BevelOuter = bvNone
          TabOrder = 1
          object Label12: TLabel
            Left = 15
            Top = -2
            Width = 29
            Height = 13
            Caption = 'Altura'
          end
          object Label13: TLabel
            Left = 95
            Top = 16
            Width = 13
            Height = 13
            Caption = 'cm'
          end
          object edtAlturaTriangulo: TEdit
            Left = 15
            Top = 13
            Width = 75
            Height = 21
            TabOrder = 0
          end
        end
        object pnLadoATriangulo: TPanel
          Left = 207
          Top = 0
          Width = 112
          Height = 48
          BevelOuter = bvNone
          TabOrder = 2
          Visible = False
          object Label14: TLabel
            Left = 15
            Top = -3
            Width = 33
            Height = 13
            Caption = 'Lado A'
          end
          object Label15: TLabel
            Left = 95
            Top = 17
            Width = 13
            Height = 13
            Caption = 'cm'
          end
          object edtLadoATriangulo: TEdit
            Left = 15
            Top = 12
            Width = 75
            Height = 21
            TabOrder = 0
          end
        end
        object pnLadoBTriangulo: TPanel
          Left = 319
          Top = 0
          Width = 112
          Height = 48
          BevelOuter = bvNone
          TabOrder = 3
          Visible = False
          object Label16: TLabel
            Left = 15
            Top = -3
            Width = 32
            Height = 13
            Caption = 'Lado B'
          end
          object Label17: TLabel
            Left = 95
            Top = 17
            Width = 13
            Height = 13
            Caption = 'cm'
          end
          object edtLadoBTriangulo: TEdit
            Left = 15
            Top = 13
            Width = 75
            Height = 21
            TabOrder = 0
          end
        end
        object pnLadoCTriangulo: TPanel
          Left = 431
          Top = 0
          Width = 112
          Height = 48
          BevelOuter = bvNone
          TabOrder = 4
          Visible = False
          object Label18: TLabel
            Left = 15
            Top = -3
            Width = 33
            Height = 13
            Caption = 'Lado C'
          end
          object Label19: TLabel
            Left = 95
            Top = 16
            Width = 13
            Height = 13
            Caption = 'cm'
          end
          object edtLadoCTriangulo: TEdit
            Left = 14
            Top = 13
            Width = 75
            Height = 21
            TabOrder = 0
          end
        end
      end
    end
    object tsCirculo: TTabSheet
      Caption = 'C'#237'rculo'
      ImageIndex = 2
      object Label10: TLabel
        Left = 7
        Top = 3
        Width = 21
        Height = 13
        Caption = 'Raio'
      end
      object Label11: TLabel
        Left = 87
        Top = 24
        Width = 13
        Height = 13
        Caption = 'cm'
      end
      object btCalcularCirculo: TButton
        Left = 126
        Top = 64
        Width = 75
        Height = 25
        Caption = 'Calcular'
        TabOrder = 0
      end
      object edtRaioCirculo: TEdit
        Left = 7
        Top = 22
        Width = 75
        Height = 21
        TabOrder = 1
      end
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 166
    Width = 684
    Height = 216
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object grp1: TGroupBox
      Left = 0
      Top = 48
      Width = 684
      Height = 168
      Align = alClient
      Caption = 'Extenso'
      TabOrder = 0
      ExplicitLeft = 1
      ExplicitTop = 49
      ExplicitWidth = 682
      ExplicitHeight = 166
      object mmResultadoPorExtenso: TMemo
        Left = 2
        Top = 15
        Width = 680
        Height = 151
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 0
        ExplicitWidth = 678
        ExplicitHeight = 149
      end
    end
    object pnl2: TPanel
      Left = 0
      Top = 0
      Width = 684
      Height = 48
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitLeft = 1
      ExplicitTop = -5
      ExplicitWidth = 682
      DesignSize = (
        684
        48)
      object lb1: TLabel
        Left = 5
        Top = 2
        Width = 48
        Height = 13
        Caption = 'Resultado'
      end
      object edtResultado: TEdit
        Left = 5
        Top = 21
        Width = 676
        Height = 21
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        ReadOnly = True
        TabOrder = 0
        ExplicitWidth = 674
      end
    end
  end
  object btnCalcular: TButton
    Left = 0
    Top = 141
    Width = 684
    Height = 25
    Align = alTop
    Caption = 'Calcular'
    TabOrder = 2
    OnClick = btnCalcularClick
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 89
    Width = 684
    Height = 52
    Align = alTop
    Caption = 'Calcular: '
    TabOrder = 3
    object rbArea: TRadioButton
      Left = 16
      Top = 24
      Width = 73
      Height = 17
      Caption = #193'rea'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = rbAreaClick
    end
    object rbPerimetro: TRadioButton
      Left = 90
      Top = 23
      Width = 73
      Height = 17
      Caption = 'Per'#237'metro'
      TabOrder = 1
      OnClick = rbPerimetroClick
    end
  end
end
