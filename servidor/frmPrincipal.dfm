object frmServidorContatos: TfrmServidorContatos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Servidor de Contato'
  ClientHeight = 256
  ClientWidth = 421
  Color = 14795201
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWhite
  Font.Height = -11
  Font.Name = 'Segoe UI Semibold'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 70
    Width = 51
    Height = 17
    Caption = 'Usu'#225'rio:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 91
    Width = 41
    Height = 17
    Caption = 'Senha:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 71
    Top = 70
    Width = 37
    Height = 17
    Caption = 'larissa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI Semibold'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 71
    Top = 91
    Width = 19
    Height = 17
    Caption = '123'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI Semibold'
    Font.Style = []
    ParentFont = False
  end
  object btnLigarServidor: TBitBtn
    Left = 16
    Top = 16
    Width = 145
    Height = 41
    Caption = 'Ligar Servidor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI Semibold'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnLigarServidorClick
  end
  object Memo: TMemo
    Left = 180
    Top = 16
    Width = 225
    Height = 225
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -11
    Font.Name = 'Segoe UI Semibold'
    Font.Style = []
    Lines.Strings = (
      'Memo')
    ParentFont = False
    TabOrder = 1
  end
end
