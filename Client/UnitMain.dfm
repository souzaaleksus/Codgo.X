object FormMain: TFormMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'AppClient - Pessoa'
  ClientHeight = 611
  ClientWidth = 734
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object PanelTop: TPanel
    AlignWithMargins = True
    Left = 5
    Top = 0
    Width = 724
    Height = 60
    Margins.Left = 5
    Margins.Top = 0
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitWidth = 720
    object BitBtnInsert: TBitBtn
      AlignWithMargins = True
      Left = 220
      Top = 5
      Width = 100
      Height = 50
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 10
      Margins.Bottom = 5
      Align = alLeft
      Caption = 'Novo'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000051543
        30BC1D5D42FF1D5D42FF15422FBD000000050000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000061E65
        48FF63DBB3FF2FCB95FF1B5F43FF000000070000000000000000000000010000
        00050000000A0000000D0000000F00000011000000130000001300000015216E
        4FFF6EDEBAFF36D09CFF1E6649FF0000000D00000007000000050000000B1122
        386522416DB3284F86D53060A1FA6A8CBCFF387D72FE237556FF237152FF2475
        56FF41D5A4FF40D2A4FF216E50FF1F6448FF1E6246FF154531BC274A76B86295
        C5FF9CC0DFFFC7DCEEFFA1E3F8FF9BDFF2FF298663FF88E8CBFF4EDAADFF4CDA
        ACFF4BD9ACFF48D9AAFF47D7ABFF46D6AAFF45D6A6FF216F50FF3C72B1FFB9EA
        F9FFD3F0FBFFEBF9FFFFA4E6FAFF9BDFF2FF2C8E6BFF90EBD0FF8EEACFFF8DEA
        CFFF8BE9CDFF52DEB3FF51DCB2FF86E7C9FF83E7C9FF247757FF3F75B3FFB9EA
        F9FFD3F0FBFFEBF9FFFFA4E6FAFF97DFF3FF47A28FFF2E926EFF2E906DFF2D8E
        6BFF92EBD3FF59E0B8FF2A8764FF298362FF288260FF1D5E46C0437AB6FFB9EA
        F9FFD3F0FBFFEBF9FFFFA4E6FAFF79D8F2FF83CBEBFF7EAEDDFF7AA8D9FF2F95
        71FF9BEED7FF5FE4BEFF2D8F6CFF000000080000000400000003467EB9FFB9EA
        F9FFD3F0FBFFEBF9FFFFA4E6FAFF6ED5F1FF5ABCE7FF438BD2FF7CAADBFF329B
        77FF9EF0DAFF9DEFDAFF2F9572FF0000000400000000000000004883BCFFB9EA
        F9FFD3F0FBFFEBF9FFFFA4E6FAFF6ED5F1FF5ABCE7FF438BD2FF77A7DCFF4BAA
        98FF34A07BFF339E78FF257358BF0000000200000000000000004C86C0FFB9EA
        F9FFD3F0FBFFEBF9FFFFA4E6FAFF6ED5F1FF5ABCE7FF438BD2FF4E8ED3FF82C0
        EBFF7A9EC8FF0000000B000000020000000000000000000000004F8BC2FFB9EA
        F9FFD3F0FBFFEBF9FFFFA4E6FAFF6ED5F1FF5ABCE7FF438BD2FF3F84CFFF58AC
        E6FF4077B4FF0000000800000000000000000000000000000000518EC4FFC8EF
        FBFFE9FAFFFFE5F9FFFFDDF7FFFFD6F4FEFFCBF0FCFFABD9F4FF8FC7EDFF76C0
        EDFF437BB7FF00000007000000000000000000000000000000005493C7FFE8FA
        FFFFE5F9FFFFDFF7FFFFD8F4FEFFCFF2FEFFC6EEFEFFBDEBFDFFB3E8FCFFABE5
        FBFF4780BAFF0000000600000000000000000000000000000000406E93BD82B3
        DAFFA2CAE6FFB0D6EDFFBAE1F3FFC8EFFEFFABDAF2FF95CBEAFF82BCE1FF67A2
        D1FF38638EC30000000400000000000000000000000000000000000000031B2F
        3E5330536F913C688CB44579A5D45491C6FF4377A2D4386388B52C4D6B92182A
        3B54000000040000000100000000000000000000000000000000}
      TabOrder = 0
      OnClick = BitBtnInsertClick
    end
    object BitBtnPost: TBitBtn
      AlignWithMargins = True
      Left = 440
      Top = 5
      Width = 100
      Height = 50
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 10
      Margins.Bottom = 5
      Align = alLeft
      Caption = 'Gravar'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000040000
        00130000001E0000002000000020000000200000002100000021000000210000
        002200000022000000220000002300000021000000160000000500000012281E
        16CB37291EFF463A31FFBD8150FFBC7E4DFFB97949FFB67646FFB37141FFB06D
        3DFFAD6839FFAB6535FF42362EFF3D3026FF241A13CE00000015000000193B2C
        21FF685C54FF483C34FFE8C28BFFE7C088FFE6BD85FFE5BB81FFE4B87CFFE3B5
        79FFE2B276FFE2B273FF443931FF51433AFF34261DFF0000001E000000183E2F
        24FF6C6057FF4A3F37FFD9B27DFFD8B07BFFD7AE77FFD7AB74FFD6A970FFD5A6
        6DFFD4A56AFFD4A268FF473B33FF5B4F47FF37291EFF0000001D000000164031
        26FF6F645CFF4C4038FFFFFFFFFFF7F1EBFFF7F0EBFFF7F0EBFFF7EFEBFFF6EF
        EAFFF6EFEAFFF6EFE9FF463B34FF5D5249FF3A2C21FF0000001B000000144434
        29FF73675FFF4F443CFFFFFFFFFFF8F2EDFFF8F1EDFFF7F1EDFFF7F0EDFFF8F1
        EBFFF7F0EBFFF7F0ECFF4A4037FF5F534BFF3D2E23FF00000019000000124637
        2CFF776B63FF50453DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF4E433BFF61544CFF403126FF0000001700000010493A
        2FFF796E66FF50453DFF61564EFF60564EFF60554DFF5F544CFF5E544CFF5E53
        4BFF5D524AFF5C5249FF5B5149FF61554DFF433429FF000000150000000E4C3D
        32FF7C706AFF674E44FF654B42FF634A41FF61473FFF5F473EFF5C443CFF5B43
        3AFF594139FF584038FF573F37FF63574FFF46362DFF000000130000000D4E3F
        35FF80746DFF6B5248FFF4ECE6FFE9DACEFFE9D8CDFFE9D8CCFFE9D8CBFFE8D7
        CAFFF3EAE2FFF3E9E2FF5A4139FF645850FF483A2FFF000000110000000B5142
        36FF827770FF70564DFFF9F5F2FFF4EAE4FFF1E6DEFFEBDCD2FFE9D9CCFF4E41
        3DFF60534CFFF3EAE3FF5D453CFF655951FF4C3D32FF0000000F000000095344
        39FF857A73FF755A50FFFAF6F3FFF5EDE7FFF4EDE6FFF4ECE6FFEFE2DAFF493D
        38FF5A4D46FFF4EBE4FF60483FFF655A52FF4F3F34FF0000000D000000075545
        3AFF887D76FF795E54FFFAF6F4FFF5EEE9FFF5EDE7FFF4EDE7FFF4ECE6FF473A
        36FF483D36FFE9D9CDFF644C43FF675A52FF514137FF0000000B000000065748
        3DFF898079FF7C6157FFFAF7F4FFFAF6F4FFFAF6F4FFFAF6F3FFFAF6F3FFFAF5
        F2FFF5EEE9FFF4ECE6FF695046FF82776FFF534439FF00000009000000034235
        2EC058493DFF7F645AFF998178FF967F75FF937A72FF8E786DFF8B7269FF866E
        64FF82695FFF7D645BFF6E544AFF56453BFF3F332BC200000005000000000000
        0002000000030000000400000004000000040000000400000005000000050000
        0005000000050000000500000006000000060000000400000001}
      TabOrder = 2
      OnClick = BitBtnPostClick
    end
    object BitBtnEdit: TBitBtn
      AlignWithMargins = True
      Left = 330
      Top = 5
      Width = 100
      Height = 50
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 10
      Margins.Bottom = 5
      Align = alLeft
      Caption = 'Editar'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000040000000F000000110000000B0000
        0004000000010000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000E431B10FF31130BE1190A05980304
        07420000000C0000000200000000000000000000000000000000000000000000
        0001000000050000000A0000000D0000001B673B2ADEB8C7D2FF7789A3FF2240
        84FF040F34980000001000000002000000000000000000000000000000020000
        000B1122386522416DB3284F86D593AAC9FD837175FF869AB3FFC7E3F6FF1B65
        B9FF286BABFF0412379A0000001000000002000000000000000000000008274A
        76B86295C5FF9CC0DFFFC7DCEEFFCEEEF9FF9BC4D2FF458BC6FFDDFEFDFF4DB4
        E6FF1B67BAFF2E73B1FF051439980000000D00000002000000000000000B3C72
        B1FFB9EAF9FFD3F0FBFFEBF9FFFFB9EBFAFFB1E3F0FF68A7CFFF439FD5FFDDFE
        FDFF55C0ECFF1D6ABCFF337BB6FF06163B920000000C000000020000000B3F75
        B3FFB9EAF9FFD3F0FBFFEBF9FFFFA4E6FAFF91DEF3FFA7D6EAFF649DCBFF48A5
        D8FFDDFEFDFF5DCBF2FF206EBFFF3883BCFF07193E900000000A0000000A437A
        B6FFB9EAF9FFD3F0FBFFEBF9FFFFA4E6FAFF6ED5F1FF82CCECFF9CBFE2FF649D
        CCFF4BABDAFFDDFEFDFF64D5F7FF2474C1FF3C8BC1FF071B418E00000009467E
        B9FFB9EAF9FFD3F0FBFFEBF9FFFFA4E6FAFF6ED5F1FF5ABCE7FF71A7DCFF9BBD
        E1FF6AA7D3FF4EAFDDFFDDFEFDFF6BDEFBFF287AC5FF15438DFF000000094883
        BCFFB9EAF9FFD3F0FBFFEBF9FFFFA4E6FAFF6ED5F1FF5ABCE7FF438BD2FF6EA1
        DAFFA8D1EDFF659AC8FF51B2DFFFDDFEFDFF4CA7D7FF0F2B4F88000000084C86
        C0FFB9EAF9FFD3F0FBFFEBF9FFFFA4E6FAFF6ED5F1FF5ABCE7FF438BD2FF3F84
        CFFF80C0EBFF9BB5D4FF1B456389327FBFFF163A5A8600000005000000074F8B
        C2FFB9EAF9FFD3F0FBFFEBF9FFFFA4E6FAFF6ED5F1FF5ABCE7FF438BD2FF3F84
        CFFF58ACE6FF6F98C6FF0000000A00000004000000030000000100000006518E
        C4FFC8EFFBFFE9FAFFFFE5F9FFFFDDF7FFFFD6F4FEFFCBF0FCFFABD9F4FF8FC7
        EDFF76C0EDFF437BB7FF00000007000000000000000000000000000000055493
        C7FFE8FAFFFFE5F9FFFFDFF7FFFFD8F4FEFFCFF2FEFFC6EEFEFFBDEBFDFFB3E8
        FCFFABE5FBFF4780BAFF0000000600000000000000000000000000000003406E
        93BD82B3DAFFA2CAE6FFB0D6EDFFBAE1F3FFC8EFFEFFABDAF2FF95CBEAFF82BC
        E1FF67A2D1FF38638EC300000004000000000000000000000000000000010000
        00031B2F3E5330536F913C688CB44579A5D45491C6FF4377A2D4386388B52C4D
        6B92182A3B540000000400000001000000000000000000000000}
      TabOrder = 1
      OnClick = BitBtnEditClick
    end
    object BitBtnCancel: TBitBtn
      AlignWithMargins = True
      Left = 550
      Top = 5
      Width = 100
      Height = 50
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 10
      Margins.Bottom = 5
      Align = alLeft
      Caption = 'Cancelar'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000020000000C05031A46110852AB190C76E31D0E89FF1C0E89FF190C
        76E4120852AD06031B4D0000000E000000030000000000000000000000000000
        000301010519130A55A9211593FF2225AEFF2430C2FF2535CBFF2535CCFF2430
        C3FF2225AFFF211594FF140B58B20101051E0000000400000000000000020101
        03151C1270CD2522A6FF2D3DCCFF394BD3FF3445D1FF2939CDFF2839CDFF3344
        D0FF394AD4FF2D3CCDFF2523A8FF1C1270D20101051D00000003000000091912
        5BA72A27AAFF2F41D0FF3541C7FF2726ABFF3137BCFF384AD3FF384BD3FF3137
        BCFF2726ABFF3540C7FF2E40D0FF2927ACFF1A115EB10000000D08061C3D3129
        A2FD2C3CCCFF3842C6FF5F5DBDFFEDEDF8FF8B89CEFF3337B9FF3437B9FF8B89
        CEFFEDEDF8FF5F5DBDFF3741C6FF2B3ACDFF3028A4FF0907204A1E185F9F373B
        BCFF3042D0FF2621A5FFECE7ECFFF5EBE4FFF8F2EEFF9491D1FF9491D1FFF8F1
        EDFFF3E9E2FFECE6EBFF2621A5FF2E3FCFFF343ABEFF201A66B0312A92E03542
        CBFF3446D1FF2C2FB5FF8070ADFFEBDBD3FFF4EAE4FFF7F2EDFFF8F1EDFFF4E9
        E2FFEADAD1FF7F6FACFF2B2EB5FF3144D0FF3040CBFF312A95E53E37AEFA3648
        D0FF374AD3FF3A4ED5FF3234B4FF8A7FB9FFF6ECE7FFF5ECE6FFF4EBE5FFF6EB
        E5FF897DB8FF3233B4FF384BD3FF3547D2FF3446D1FF3E37AEFA453FB4FA4557
        D7FF3B50D5FF4C5FDAFF4343B7FF9189C7FFF7EFE9FFF6EEE9FFF6EFE8FFF7ED
        E8FF9087C5FF4242B7FF495DD8FF394CD4FF3F52D4FF443FB3FA403DA1DC5967
        DAFF5B6EDDFF4F4DBAFF8F89CAFFFBF6F4FFF7F1ECFFEDE1D9FFEDE0D9FFF7F0
        EAFFFAF5F2FF8F89CAFF4E4DB9FF576ADCFF5765D9FF403EA4E12E2D70987C85
        DDFF8798E8FF291D9BFFE5DADEFFF6EEEBFFEDDFDAFF816EA9FF816EA9FFEDDF
        D8FFF4ECE7FFE5D9DCFF291D9BFF8494E7FF7A81DDFF33317BAC111125356768
        D0FC9EACEDFF686FCEFF5646A1FFCCB6BCFF7A68A8FF4C4AB6FF4D4BB7FF7A68
        A8FFCBB5BCFF5646A1FF666DCCFF9BAAEEFF696CD0FD1212273F000000043B3B
        79977D84DFFFA5B6F1FF6D74D0FF2D219BFF5151B9FF8EA2ECFF8EA1ECFF5252
        BBFF2D219BFF6B72D0FFA2B3F0FF8086E0FF404183A700000008000000010303
        050C4E509DBC8087E2FFAEBDF3FFA3B6F1FF9DAFF0FF95A9EEFF95A8EEFF9BAD
        EFFFA2B3F0FFACBCF3FF838AE3FF4F52A0C10303051100000002000000000000
        000100000005323464797378D9F8929CEAFFA1AEEFFFB0BFF3FFB0BFF4FFA2AE
        EFFF939DE9FF7479DAF83234647D000000080000000200000000000000000000
        000000000000000000031213232D40437D935D61B5D07378DFFC7378DFFC5D61
        B5D040437D951212223000000004000000010000000000000000}
      TabOrder = 3
      OnClick = BitBtnCancelClick
    end
    object RadioGroupEnvelope: TRadioGroup
      AlignWithMargins = True
      Left = 5
      Top = 3
      Width = 185
      Height = 54
      Margins.Left = 5
      Margins.Right = 30
      Align = alLeft
      Caption = 'Envelope'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Stream'
        'JSON')
      TabOrder = 4
      OnClick = RadioGroupEnvelopeClick
    end
  end
  object GroupBoxPessoa: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 218
    Width = 728
    Height = 160
    Margins.Top = 0
    Align = alTop
    Caption = 'Pessoa'
    TabOrder = 1
    ExplicitWidth = 724
    object Panel_1: TPanel
      AlignWithMargins = True
      Left = 12
      Top = 22
      Width = 709
      Height = 60
      Margins.Left = 10
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitWidth = 705
      object Panel_1_A: TPanel
        AlignWithMargins = True
        Left = 0
        Top = 0
        Width = 100
        Height = 60
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 10
        Margins.Bottom = 0
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object Labelidpessoa: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 94
          Height = 15
          Align = alTop
          Caption = 'C'#243'digo'
          ExplicitWidth = 39
        end
        object DBEditidpessoa: TDBEdit
          AlignWithMargins = True
          Left = 3
          Top = 24
          Width = 94
          Height = 23
          TabStop = False
          Align = alTop
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 0
        end
      end
      object Panel_1_B: TPanel
        AlignWithMargins = True
        Left = 273
        Top = 0
        Width = 150
        Height = 60
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 2
        object Labeldsdocumento: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 144
          Height = 15
          Align = alTop
          Caption = 'Documento'
          ExplicitWidth = 63
        end
        object DBEditdsdocumento: TDBEdit
          AlignWithMargins = True
          Left = 3
          Top = 24
          Width = 144
          Height = 23
          Align = alTop
          TabOrder = 0
        end
      end
      object DBRadioGroupflnatureza: TDBRadioGroup
        AlignWithMargins = True
        Left = 113
        Top = 3
        Width = 150
        Height = 54
        Margins.Right = 10
        Align = alLeft
        Caption = 'Natureza'
        Columns = 2
        Items.Strings = (
          'F'#237'sica'
          'Jur'#237'dica')
        TabOrder = 1
        Values.Strings = (
          '1'
          '2')
      end
    end
    object Panel_2: TPanel
      AlignWithMargins = True
      Left = 12
      Top = 87
      Width = 709
      Height = 60
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitWidth = 705
      object Panel_2_A: TPanel
        AlignWithMargins = True
        Left = 0
        Top = 0
        Width = 200
        Height = 60
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 10
        Margins.Bottom = 0
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object Labelnmprimeiro: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 194
          Height = 15
          Align = alTop
          Caption = 'Primeiro Nome'
          ExplicitWidth = 81
        end
        object DBEditnmprimeiro: TDBEdit
          AlignWithMargins = True
          Left = 3
          Top = 24
          Width = 194
          Height = 23
          Align = alTop
          CharCase = ecUpperCase
          TabOrder = 0
        end
      end
      object Panel_2_B: TPanel
        AlignWithMargins = True
        Left = 210
        Top = 0
        Width = 200
        Height = 60
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 10
        Margins.Bottom = 0
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object Labelnmsegundo: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 194
          Height = 15
          Align = alTop
          Caption = 'Segundo Nome'
          ExplicitWidth = 83
        end
        object DBEditnmsegundo: TDBEdit
          AlignWithMargins = True
          Left = 3
          Top = 24
          Width = 194
          Height = 23
          Align = alTop
          CharCase = ecUpperCase
          TabOrder = 0
        end
      end
      object Panel_2_C: TPanel
        AlignWithMargins = True
        Left = 420
        Top = 0
        Width = 150
        Height = 60
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 2
        object Labeldtregistro: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 144
          Height = 15
          Align = alTop
          Caption = 'Data do Registro'
          ExplicitWidth = 87
        end
        object DBEditdtregistro: TDBEdit
          AlignWithMargins = True
          Left = 3
          Top = 24
          Width = 144
          Height = 23
          TabStop = False
          Align = alTop
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
  end
  object GroupBoxEndereco: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 381
    Width = 728
    Height = 160
    Margins.Top = 0
    Align = alTop
    Caption = 'Endere'#231'o'
    TabOrder = 2
    ExplicitWidth = 724
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 12
      Top = 22
      Width = 709
      Height = 60
      Margins.Left = 10
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitWidth = 705
      object Panel2: TPanel
        AlignWithMargins = True
        Left = 0
        Top = 0
        Width = 100
        Height = 60
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 10
        Margins.Bottom = 0
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object LabelCEP: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 94
          Height = 15
          Align = alTop
          Caption = 'CEP'
          ExplicitWidth = 21
        end
        object Editdscep: TEdit
          AlignWithMargins = True
          Left = 3
          Top = 24
          Width = 94
          Height = 23
          Align = alTop
          TabOrder = 0
        end
      end
      object Panel3: TPanel
        AlignWithMargins = True
        Left = 342
        Top = 0
        Width = 50
        Height = 60
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 10
        Margins.Bottom = 0
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 3
        object Labeldsuf: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 44
          Height = 15
          Align = alTop
          Caption = 'UF'
          ExplicitWidth = 14
        end
        object DBEditdsuf: TDBEdit
          AlignWithMargins = True
          Left = 3
          Top = 24
          Width = 44
          Height = 23
          TabStop = False
          Align = alTop
          CharCase = ecUpperCase
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 0
        end
      end
      object Panel4: TPanel
        AlignWithMargins = True
        Left = 402
        Top = 0
        Width = 200
        Height = 60
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 10
        Margins.Bottom = 0
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 4
        object Labelnmcidade: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 194
          Height = 15
          Align = alTop
          Caption = 'Cidade'
          ExplicitWidth = 37
        end
        object DBEditnmcidade: TDBEdit
          AlignWithMargins = True
          Left = 3
          Top = 24
          Width = 194
          Height = 23
          TabStop = False
          Align = alTop
          CharCase = ecUpperCase
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 0
        end
      end
      object BitBtnGetCEP: TBitBtn
        AlignWithMargins = True
        Left = 110
        Top = 5
        Width = 112
        Height = 50
        Cursor = crHandPoint
        Margins.Left = 0
        Margins.Top = 5
        Margins.Right = 10
        Margins.Bottom = 5
        Align = alLeft
        Caption = 'Obter CEP'
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000004A220966AC5116F07B380FAB0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00004D230A69B85617FFBB5617FFAE4F16F30000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000004D24
          0A69BC5819FFBB5718FFB95318FC401D08570000000000000000000000000000
          000000000000281406368A4315B7B3571AF0B35818F0854012B466300E89BD59
          19FFBC5919FFBA5719FC401E0857000000000000000000000000000000000000
          00005A2D0F78C05F1FFFC06021FFCD8250FFCD824FFFBE5D1FFFBE5A1BFFBD5A
          19FFBB5819FC401E095700000000000000000000000000000000000000003018
          083FC0601FFCCD804CFFF7EAE2FFFFFFFFFFFFFFFFFFF7EAE2FFCA7A46FFBC5A
          1BFF622F0D84000000000000000000000000000000000000000000000000944B
          18C3C36929FFF6E9E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6E8DFFFC063
          23FF854012B4000000000000000000000000000000000000000000000000B75D
          20F0D18958FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF84
          54FFAD541AEA000000000000000000000000000000000000000000000000B85E
          20F0D18A59FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD085
          55FFAE541AEA000000000000000000000000000000000000000000000000964D
          1BC3C5692BFFF7EBE2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6E8DFFFC164
          26FF854214B40000000000000000000000000000000000000000000000003019
          093FC36525FFCF844FFFF7EBE2FFFFFFFFFFFFFFFFFFF7EBE2FFCD804CFFBF5E
          1FFF361B08480000000000000000000000000000000000000000000000000000
          00005E31127BC36625FFC46726FFCF8551FFCF8350FFC46523FFC16020FF5D2E
          0F7B000000000000000000000000000000000000000000000000000000000000
          0000000000003019093F874518B1AD591EE4AD591EE4864517B13018083F0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        TabOrder = 1
        OnClick = BitBtnGetCEPClick
      end
      object Panel9: TPanel
        AlignWithMargins = True
        Left = 232
        Top = 0
        Width = 100
        Height = 60
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 10
        Margins.Bottom = 0
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 2
        object LabelCEP_: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 94
          Height = 15
          Align = alTop
          Caption = 'CEP'
          ExplicitWidth = 21
        end
        object DBEditdscep: TDBEdit
          AlignWithMargins = True
          Left = 3
          Top = 24
          Width = 94
          Height = 23
          TabStop = False
          Align = alTop
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
    object Panel6: TPanel
      AlignWithMargins = True
      Left = 12
      Top = 87
      Width = 709
      Height = 60
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitWidth = 705
      object Panel7: TPanel
        AlignWithMargins = True
        Left = 210
        Top = 0
        Width = 200
        Height = 60
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 10
        Margins.Bottom = 0
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object Labelnmlogradouro: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 194
          Height = 15
          Align = alTop
          Caption = 'Logradouro'
          ExplicitWidth = 62
        end
        object DBEditnmlogradouro: TDBEdit
          AlignWithMargins = True
          Left = 3
          Top = 24
          Width = 194
          Height = 23
          TabStop = False
          Align = alTop
          CharCase = ecUpperCase
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 0
        end
      end
      object Panel8: TPanel
        AlignWithMargins = True
        Left = 420
        Top = 0
        Width = 200
        Height = 60
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 10
        Margins.Bottom = 0
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 2
        object Labeldscomplemento: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 194
          Height = 15
          Align = alTop
          Caption = 'Complemento'
          ExplicitWidth = 77
        end
        object DBEditdscomplemento: TDBEdit
          AlignWithMargins = True
          Left = 3
          Top = 24
          Width = 194
          Height = 23
          TabStop = False
          Align = alTop
          CharCase = ecUpperCase
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 0
        end
      end
      object Panel5: TPanel
        AlignWithMargins = True
        Left = 0
        Top = 0
        Width = 200
        Height = 60
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 10
        Margins.Bottom = 0
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object Labelnmbairro: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 194
          Height = 15
          Align = alTop
          Caption = 'Bairro'
          ExplicitWidth = 31
        end
        object DBEditnmbairro: TDBEdit
          AlignWithMargins = True
          Left = 3
          Top = 24
          Width = 194
          Height = 23
          TabStop = False
          Align = alTop
          CharCase = ecUpperCase
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
  end
  object GroupBoxListaPessoa: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 65
    Width = 728
    Height = 150
    Margins.Top = 0
    Align = alTop
    Caption = 'Lista de Pessoa'
    TabOrder = 0
    ExplicitWidth = 724
    object DBGrid: TDBGrid
      AlignWithMargins = True
      Left = 2
      Top = 17
      Width = 724
      Height = 131
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnCellClick = DBGridCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'idpessoa'
          Title.Caption = 'C'#243'digo'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dsdocumento'
          Title.Caption = 'Documento'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nmprimeiro'
          Title.Caption = 'Primeiro Nome'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nmsegundo'
          Title.Caption = 'Segundo Nome'
          Width = 200
          Visible = True
        end>
    end
  end
  object Panel10: TPanel
    AlignWithMargins = True
    Left = 5
    Top = 546
    Width = 724
    Height = 60
    Margins.Left = 5
    Margins.Top = 0
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    ExplicitTop = 545
    ExplicitWidth = 720
    object LabelElapsed: TLabel
      AlignWithMargins = True
      Left = 603
      Top = 3
      Width = 106
      Height = 54
      Margins.Right = 15
      Align = alRight
      Caption = 'Tempo Decorrido: 0;'
      Layout = tlCenter
      ExplicitHeight = 15
    end
    object BitBtnPessoa50000: TBitBtn
      AlignWithMargins = True
      Left = 440
      Top = 5
      Width = 150
      Height = 50
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 10
      Margins.Bottom = 5
      Align = alRight
      Caption = '50.000 Pessoas'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000F4C4C4CC7626262FF343B9EFF2D36
        97FF262D8DFF1F2681FF181E74FF121767FF414141FF303030BD000000000000
        00000000000000000000000000030D0D0D39787878FFDCDCDCFF3941A2FF5B65
        CEFF4E57C2FF3E47B1FF31389EFF171D72FFA1A1A1FF4C4C4CFF000000000000
        000000000000000000000000000514141450808080FFDEDEDEFF656BB2FF3840
        A2FF333B9EFF2C3595FF252D8AFF43488AFFA5A5A5FF525252FF5D4B3BBD7960
        4BFF7D543CFF7A5037FF754B31FF644331FF7B7B7BFFDFDFDFFFDCDCDCFF1F27
        7EFFCECECEFFC6C6C6FF171D6EFFB3B3B3FFAAAAAAFF434343D28D7563FFE0DC
        D8FF9B7965FFCC9F84FFC2967BFFA77F66FF736861FF959595FFD8D8D8FF242D
        85FFCCCCCCFFC3C3C3FF1C2275FFB2B2B2FF6D6D6DFF1C1C1C68947F6DFFE2DE
        DAFFB29989FF9A7864FF926E58FF86624CFF74523EFF695B52FF6D6F71FF253B
        80FF3A567AFE375478FE1E3275FF505254F21A1A1A5A00000000796657D2E3DF
        DBFFE0DDD8FF926953FFD3CFCAFFCBC7C1FF794D34FFA5A09AFF556272FF607A
        9AFF7BA5C6FF4F89B8FF2E5B88FF0F1E30780000000000000000372D2468A593
        84FFDDD8D3FF9B755FFFD2CCC7FFC9C5BEFF81563DFFA19C96FF2F4968FFB6C2
        D1FF7FBEE3FF6EB0DBFF4D86B2FF173152C20000000100000000000000002F26
        1F5A7B6758F25F5A63FF3C5678FE395476FE50494FFF465154F834739EFE65A1
        C5FF3B80ADFF316F9FFF346D9EFF1F4877FB060F1C4500000000000000000000
        000014223475607A9AFF7BA5C6FF4F89B8FF284E75FF4198C1FD5FCDE3FF61DF
        EFFF5AEBFAFF4EE0F9FF3DBFE5FF2B93C4FF15386EF800000002000000000000
        00001C3859BEB6C2D1FF7FBEE3FF6EB0DBFF43759BFF317094F574B0D1FF69A7
        C9FF3D86B2FF2F77A7FF2776ABFF1D65A1FF0D254CBB00000004000000001128
        323F34749FFB67A4C7FF3D84B1FF3375A4FF346A99FF214C71FD6392AEF3ADC9
        DDFFC5EBF3FF87DFF1FF3A9CCCFF1E5785E4050D1B5100000003000000004299
        C2F75FCFE4FF62E0EFFF5BEBFAFF4EE1F9FF3DBEE4FF2989B5FF1D466EFB204B
        67C628618DF0235483EE133252B807111F5B0000000900000001000000002E6B
        89B276B4D3FF6BAACCFF448CB7FF377DACFF2A7CAFFF216DA6FF123052B70000
        001B000000240000002000000014000000080000000100000000000000001127
        32406699B4DAB1D1E3FFE7F0F5FFBFE9F4FF61B1D6FF266896DA091522400000
        0000000000000000000000000000000000000000000000000000000000000000
        00001127324026597399347AA3E030729BE01D4764990B1B2740000000000000
        0000000000000000000000000000000000000000000000000000}
      TabOrder = 0
      OnClick = BitBtnPessoa50000Click
      ExplicitLeft = 436
    end
  end
end
