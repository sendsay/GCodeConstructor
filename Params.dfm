object ParamsForm: TParamsForm
  Left = 0
  Top = 0
  Caption = 'Parameters'
  ClientHeight = 375
  ClientWidth = 401
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object JvLabel1: TJvLabel
    Left = 8
    Top = 8
    Width = 69
    Height = 16
    Caption = 'Header file:'
  end
  object JvLabel2: TJvLabel
    Left = 208
    Top = 8
    Width = 65
    Height = 16
    Caption = 'Footer file:'
  end
  object JvPanel1: TJvPanel
    Left = 0
    Top = 332
    Width = 401
    Height = 43
    Margins.Left = 22
    Margins.Top = 22
    Margins.Right = 22
    Margins.Bottom = 22
    ShowCaption = False
    Align = alBottom
    BorderStyle = bsSingle
    TabOrder = 0
    ExplicitTop = 328
    object Button1: TButton
      Left = 219
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
    end
    object Button2: TButton
      Left = 300
      Top = 8
      Width = 75
      Height = 25
      Action = MainForm.ActionCancelButtonOptions
      TabOrder = 1
    end
  end
  object JvEditor1: TJvEditor
    Left = 8
    Top = 30
    Width = 185
    Height = 171
    Cursor = crIBeam
    Completion.ItemHeight = 13
    Completion.CRLF = '/n'
    Completion.Separator = '='
    TabStops = '3 5'
    BracketHighlighting.StringEscape = #39#39
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
  end
  object JvEditor2: TJvEditor
    Left = 208
    Top = 30
    Width = 185
    Height = 171
    Cursor = crIBeam
    Completion.ItemHeight = 13
    Completion.CRLF = '/n'
    Completion.Separator = '='
    TabStops = '3 5'
    BracketHighlighting.StringEscape = #39#39
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
  end
  object JvFormStorage1: TJvFormStorage
    AppStorage = MainForm.JvAppIniFileStorage1
    AppStoragePath = '%FORM_NAME%\'
    StoredProps.Strings = (
      'JvEditor1.Lines'
      'JvEditor2.Lines')
    StoredValues = <>
    Left = 336
    Top = 224
  end
end
