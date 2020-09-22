object EditForm: TEditForm
  Left = 0
  Top = 0
  Caption = 'Edit line'
  ClientHeight = 141
  ClientWidth = 413
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
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
    Top = 98
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
    ExplicitTop = 101
    object Button1: TButton
      Left = 235
      Top = 8
      Width = 75
      Height = 25
      Action = MainForm.Action_OkButtonEdit
      TabOrder = 0
    end
    object Button2: TButton
      Left = 316
      Top = 8
      Width = 75
      Height = 25
      Action = MainForm.Action_CancelButtonEdit
      TabOrder = 1
    end
  end
  object JvCalcEdit2: TJvCalcEdit
    Left = 115
    Top = 68
    Width = 93
    Height = 21
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
    Height = 21
    DecimalPlaces = 3
    DisplayFormat = ',0.000'
    FormatOnEditing = True
    PopupAlign = epaLeft
    TabOrder = 1
    DecimalPlacesAlwaysShown = True
  end
end
