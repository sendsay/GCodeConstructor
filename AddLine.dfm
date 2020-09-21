object AddForm: TAddForm
  Left = 0
  Top = 0
  Caption = 'Add line'
  ClientHeight = 144
  ClientWidth = 413
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object JvLabel1: TJvLabel
    Left = 15
    Top = 42
    Width = 94
    Height = 16
    Caption = 'Start point at X:'
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
    Width = 93
    Height = 16
    Caption = 'Start point at Y:'
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
  object JvPanel1: TJvPanel
    Left = 0
    Top = 101
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
  object JvCalcEdit2: TJvCalcEdit
    Left = 114
    Top = 68
    Width = 93
    Height = 24
    DecimalPlaces = 3
    DisplayFormat = ',0.000'
    FormatOnEditing = True
    PopupAlign = epaLeft
    TabOrder = 2
    DecimalPlacesAlwaysShown = True
  end
  object JvCalcEdit1: TJvCalcEdit
    Left = 115
    Top = 38
    Width = 93
    Height = 24
    DecimalPlaces = 3
    DisplayFormat = ',0.000'
    FormatOnEditing = True
    PopupAlign = epaLeft
    TabOrder = 1
    DecimalPlacesAlwaysShown = True
  end
end
