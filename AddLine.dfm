object AddForm: TAddForm
  Left = 0
  Top = 0
  Caption = 'AddForm'
  ClientHeight = 146
  ClientWidth = 413
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object JvLabel1: TJvLabel
    Left = 15
    Top = 42
    Width = 60
    Height = 16
    Caption = 'Back to X:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object JvLabel2: TJvLabel
    Left = 15
    Top = 72
    Width = 59
    Height = 16
    Caption = 'Back to Y:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object JvFilenameEdit1: TJvFilenameEdit
    Left = 8
    Top = 8
    Width = 397
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = ''
  end
  object JvEdit1: TJvEdit
    Left = 81
    Top = 38
    Width = 57
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = '0'
    NumbersOnly = True
  end
  object JvEdit2: TJvEdit
    Left = 81
    Top = 68
    Width = 57
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = '0'
    NumbersOnly = True
  end
  object JvPanel1: TJvPanel
    Left = 0
    Top = 103
    Width = 413
    Height = 43
    Margins.Left = 22
    Margins.Top = 22
    Margins.Right = 22
    Margins.Bottom = 22
    ShowCaption = False
    Align = alBottom
    BorderStyle = bsSingle
    TabOrder = 3
    object Button1: TButton
      Left = 235
      Top = 8
      Width = 75
      Height = 25
      Action = MainForm.Action_OkButtonAddLine
      TabOrder = 0
    end
    object Button2: TButton
      Left = 316
      Top = 8
      Width = 75
      Height = 25
      Action = MainForm.Action_CancelButtonAddLine
      TabOrder = 1
    end
  end
end
