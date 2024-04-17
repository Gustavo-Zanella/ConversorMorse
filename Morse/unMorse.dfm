object frmMorse: TfrmMorse
  Left = 994
  Top = 243
  Caption = 'Morse'
  ClientHeight = 263
  ClientWidth = 596
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  TextHeight = 13
  object mmoEntrada: TMemo
    Left = 8
    Top = 8
    Width = 208
    Height = 248
    TabOrder = 0
  end
  object mmoSaida: TMemo
    Left = 368
    Top = 8
    Width = 216
    Height = 248
    Color = clHighlightText
    TabOrder = 1
  end
  object btnConvMorse: TButton
    Left = 232
    Top = 88
    Width = 113
    Height = 40
    Caption = 'Conv p/Morse'
    TabOrder = 2
    OnClick = btnConvMorseClick
  end
  object btnConvHexa: TButton
    Left = 232
    Top = 144
    Width = 113
    Height = 40
    Caption = 'Conv p/ Hexa'
    TabOrder = 3
    OnClick = btnConvHexaClick
  end
  object btnLimpaEntrada: TBitBtn
    Left = 189
    Top = 230
    Width = 25
    Height = 25
    TabOrder = 4
    OnClick = btnLimpaEntradaClick
  end
  object btnLimpaSaida: TBitBtn
    Left = 557
    Top = 230
    Width = 25
    Height = 25
    TabOrder = 5
    OnClick = btnLimpaSaidaClick
  end
end
