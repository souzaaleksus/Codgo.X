object FormMain: TFormMain
  Left = 271
  Top = 114
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Web Server [REST JSON]'
  ClientHeight = 262
  ClientWidth = 288
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 13
  object Label1: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 282
    Height = 13
    Align = alTop
    Caption = 'Porta'
    ExplicitWidth = 26
  end
  object ButtonStart: TButton
    AlignWithMargins = True
    Left = 3
    Top = 49
    Width = 282
    Height = 50
    Cursor = crHandPoint
    Align = alTop
    Caption = 'Iniciar'
    TabOrder = 0
    OnClick = ButtonStartClick
    ExplicitWidth = 278
  end
  object ButtonStop: TButton
    AlignWithMargins = True
    Left = 3
    Top = 105
    Width = 282
    Height = 50
    Cursor = crHandPoint
    Align = alTop
    Caption = 'Parar'
    TabOrder = 1
    OnClick = ButtonStopClick
    ExplicitWidth = 278
  end
  object EditPort: TEdit
    AlignWithMargins = True
    Left = 3
    Top = 22
    Width = 282
    Height = 21
    Align = alTop
    TabOrder = 2
    Text = '8080'
    ExplicitWidth = 278
  end
  object ApplicationEvents: TApplicationEvents
    OnIdle = ApplicationEventsIdle
    Left = 40
    Top = 176
  end
end
