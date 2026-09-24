object frmCliente: TfrmCliente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Clientes'
  ClientHeight = 573
  ClientWidth = 1221
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  TextHeight = 15
  object pgcGeral: TPageControl
    Left = 0
    Top = 0
    Width = 1221
    Height = 573
    ActivePage = tabCadastro
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    ExplicitWidth = 1000
    ExplicitHeight = 565
    object tabConsulta: TTabSheet
      Caption = 'Consulta'
      object pnlTopConsulta: TPanel
        Left = 0
        Top = 0
        Width = 1213
        Height = 145
        Align = alTop
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 994
        object lblNameConsulta: TLabel
          Left = 18
          Top = 42
          Width = 51
          Height = 21
          Caption = 'Nome:'
          Color = 2627074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 2429698
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lblCPFCNPJConsulta: TLabel
          Left = 502
          Top = 44
          Width = 69
          Height = 19
          Caption = 'CPF/CNPJ:'
          Color = 2495490
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 2429698
          Font.Height = -14
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lblIDConsulta: TLabel
          Left = 48
          Top = 15
          Width = 21
          Height = 21
          Caption = 'ID:'
          Color = 2627074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 2429698
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lblCEPConsulta: TLabel
          Left = 36
          Top = 75
          Width = 33
          Height = 21
          Caption = 'CEP:'
          Color = 2495490
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 2429698
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lblCidadeConsulta: TLabel
          Left = 246
          Top = 77
          Width = 57
          Height = 21
          Caption = 'Cidade:'
          Color = 2495490
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 2429698
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lblUFConsulta: TLabel
          Left = 615
          Top = 77
          Width = 24
          Height = 21
          Caption = 'UF:'
          Color = 2495490
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 2429698
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lblDataNascimentoConsulta: TLabel
          Left = 158
          Top = 15
          Width = 159
          Height = 21
          Caption = 'Data de Nascimento:'
          Color = 2495490
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 2429698
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object edtNomeConsulta: TEdit
          Left = 75
          Top = 44
          Width = 414
          Height = 27
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object edtCPFCNPJConsulta: TEdit
          Left = 577
          Top = 44
          Width = 150
          Height = 27
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Segoe UI'
          Font.Style = []
          MaxLength = 18
          ParentFont = False
          TabOrder = 3
          OnChange = edtCPFCNPJConsultaChange
        end
        object btnPesquisarConsulta: TAdvSmoothButton
          Left = 481
          Top = 9
          Width = 120
          Height = 27
          Appearance.Font.Charset = DEFAULT_CHARSET
          Appearance.Font.Color = clWhite
          Appearance.Font.Height = -12
          Appearance.Font.Name = 'Segoe UI'
          Appearance.Font.Style = [fsBold]
          Appearance.SimpleLayout = True
          Appearance.Rounding = 0
          BevelColor = clGray
          Caption = 'Pesquisar'
          ParentFont = False
          Status.Caption = '0'
          Status.Appearance.Fill.Color = clRed
          Status.Appearance.Fill.ColorMirror = clNone
          Status.Appearance.Fill.ColorMirrorTo = clNone
          Status.Appearance.Fill.GradientType = gtSolid
          Status.Appearance.Fill.GradientMirrorType = gtSolid
          Status.Appearance.Fill.BorderColor = clGray
          Status.Appearance.Fill.Rounding = 0
          Status.Appearance.Fill.ShadowOffset = 0
          Status.Appearance.Fill.Glow = gmNone
          Status.Appearance.Font.Charset = DEFAULT_CHARSET
          Status.Appearance.Font.Color = clWhite
          Status.Appearance.Font.Height = -11
          Status.Appearance.Font.Name = 'Segoe UI'
          Status.Appearance.Font.Style = []
          TabOrder = 7
          Version = '2.2.4.0'
          OnClick = btnPesquisarConsultaClick
          TMSStyle = 8
        end
        object btnLimparConsulta: TAdvSmoothButton
          Left = 607
          Top = 9
          Width = 120
          Height = 27
          Appearance.Font.Charset = DEFAULT_CHARSET
          Appearance.Font.Color = clWhite
          Appearance.Font.Height = -12
          Appearance.Font.Name = 'Segoe UI'
          Appearance.Font.Style = [fsBold]
          Appearance.SimpleLayout = True
          Appearance.Rounding = 0
          Caption = 'Limpar'
          Color = clSilver
          ParentFont = False
          Status.Caption = '0'
          Status.Appearance.Fill.Color = clRed
          Status.Appearance.Fill.ColorMirror = clNone
          Status.Appearance.Fill.ColorMirrorTo = clNone
          Status.Appearance.Fill.GradientType = gtSolid
          Status.Appearance.Fill.GradientMirrorType = gtSolid
          Status.Appearance.Fill.BorderColor = clGray
          Status.Appearance.Fill.Rounding = 0
          Status.Appearance.Fill.ShadowOffset = 0
          Status.Appearance.Fill.Glow = gmNone
          Status.Appearance.Font.Charset = DEFAULT_CHARSET
          Status.Appearance.Font.Color = clWhite
          Status.Appearance.Font.Height = -11
          Status.Appearance.Font.Name = 'Segoe UI'
          Status.Appearance.Font.Style = []
          TabOrder = 8
          Version = '2.2.4.0'
          OnClick = btnLimparConsultaClick
          TMSStyle = 8
        end
        object edtIDConsulta: TEdit
          Left = 75
          Top = 9
          Width = 67
          Height = 27
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object edtCEPConsulta: TEdit
          Left = 75
          Top = 77
          Width = 150
          Height = 27
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnChange = edtCEPConsultaChange
        end
        object cbCidadeConsulta: TComboBox
          Left = 309
          Top = 77
          Width = 292
          Height = 27
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object cbUFConsulta: TComboBox
          Left = 645
          Top = 77
          Width = 82
          Height = 27
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnChange = cbUFConsultaChange
        end
        object edtDataNascimentoConsulta: TDateTimePicker
          Left = 323
          Top = 9
          Width = 145
          Height = 27
          Date = 46151.000000000000000000
          Time = 0.144554016202164300
          ShowCheckbox = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
      object pnlGridConsulta: TPanel
        Left = 0
        Top = 145
        Width = 1213
        Height = 309
        Align = alClient
        TabOrder = 1
        ExplicitWidth = 994
        object gridDadosConsulta: TDBAdvGrid
          Left = 1
          Top = 1
          Width = 1211
          Height = 307
          Align = alClient
          ColCount = 12
          DefaultRowHeight = 28
          DrawingStyle = gdsClassic
          FixedColor = 2429698
          RowCount = 2
          FixedRows = 1
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect, goFixedRowDefAlign]
          TabOrder = 0
          OnDblClick = gridDadosConsultaDblClick
          GridLineColor = 15066597
          GridFixedLineColor = 11250603
          HoverRowColor = 15135994
          ActiveCellFont.Charset = DEFAULT_CHARSET
          ActiveCellFont.Color = clWhite
          ActiveCellFont.Height = -15
          ActiveCellFont.Name = 'Segoe UI'
          ActiveCellFont.Style = [fsBold]
          ActiveCellColor = 12490277
          ActiveCellColorTo = 12490277
          Bands.PrimaryColor = clWhite
          Bands.SecondaryColor = 16120573
          BackGround.Color = clWhite
          BorderColor = 14278117
          ControlLook.FixedGradientFrom = 2429698
          ControlLook.FixedGradientTo = 2429698
          ControlLook.FixedGradientHoverFrom = 2429698
          ControlLook.FixedGradientHoverTo = 2429698
          ControlLook.FixedGradientHoverMirrorFrom = clWhite
          ControlLook.FixedGradientHoverMirrorTo = clWhite
          ControlLook.FixedGradientHoverBorder = 11645361
          ControlLook.FixedGradientDownFrom = 2429698
          ControlLook.FixedGradientDownTo = 2429698
          ControlLook.FixedGradientDownMirrorFrom = clWhite
          ControlLook.FixedGradientDownMirrorTo = clWhite
          ControlLook.FixedGradientDownBorder = 11250603
          ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
          ControlLook.DropDownHeader.Font.Color = clWindowText
          ControlLook.DropDownHeader.Font.Height = -11
          ControlLook.DropDownHeader.Font.Name = 'Segoe UI'
          ControlLook.DropDownHeader.Font.Style = []
          ControlLook.DropDownHeader.Visible = True
          ControlLook.DropDownHeader.Buttons = <>
          ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
          ControlLook.DropDownFooter.Font.Color = clWindowText
          ControlLook.DropDownFooter.Font.Height = -11
          ControlLook.DropDownFooter.Font.Name = 'Segoe UI'
          ControlLook.DropDownFooter.Font.Style = []
          ControlLook.DropDownFooter.Visible = True
          ControlLook.DropDownFooter.Buttons = <>
          ControlLook.ToggleSwitch.BackgroundBorderWidth = 1.000000000000000000
          ControlLook.ToggleSwitch.ButtonBorderWidth = 1.000000000000000000
          ControlLook.ToggleSwitch.CaptionFont.Charset = DEFAULT_CHARSET
          ControlLook.ToggleSwitch.CaptionFont.Color = clWindowText
          ControlLook.ToggleSwitch.CaptionFont.Height = -15
          ControlLook.ToggleSwitch.CaptionFont.Name = 'Segoe UI'
          ControlLook.ToggleSwitch.CaptionFont.Style = []
          ControlLook.ToggleSwitch.Shadow = False
          Filter = <>
          FilterDropDown.Font.Charset = DEFAULT_CHARSET
          FilterDropDown.Font.Color = clWindowText
          FilterDropDown.Font.Height = -15
          FilterDropDown.Font.Name = 'Segoe UI'
          FilterDropDown.Font.Style = []
          FilterDropDown.TextChecked = 'Checked'
          FilterDropDown.TextUnChecked = 'Unchecked'
          FilterDropDownClear = '(All)'
          FilterEdit.TypeNames.Strings = (
            'Starts with'
            'Ends with'
            'Contains'
            'Not contains'
            'Equal'
            'Not equal'
            'Larger than'
            'Smaller than'
            'Clear')
          FixedFooters = 1
          FixedColWidth = 20
          FixedRowHeight = 28
          FixedFont.Charset = DEFAULT_CHARSET
          FixedFont.Color = clWhite
          FixedFont.Height = -11
          FixedFont.Name = 'Segoe UI'
          FixedFont.Style = [fsBold]
          FloatFormat = '%.2f'
          FloatingFooter.Visible = True
          HoverButtons.Buttons = <>
          HTMLSettings.ImageFolder = 'images'
          HTMLSettings.ImageBaseName = 'img'
          Look = glCustom
          PrintSettings.DateFormat = 'dd/mm/yyyy'
          PrintSettings.Font.Charset = DEFAULT_CHARSET
          PrintSettings.Font.Color = clWindowText
          PrintSettings.Font.Height = -15
          PrintSettings.Font.Name = 'Segoe UI'
          PrintSettings.Font.Style = []
          PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
          PrintSettings.FixedFont.Color = clWindowText
          PrintSettings.FixedFont.Height = -15
          PrintSettings.FixedFont.Name = 'Segoe UI'
          PrintSettings.FixedFont.Style = []
          PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
          PrintSettings.HeaderFont.Color = clWindowText
          PrintSettings.HeaderFont.Height = -15
          PrintSettings.HeaderFont.Name = 'Segoe UI'
          PrintSettings.HeaderFont.Style = []
          PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
          PrintSettings.FooterFont.Color = clWindowText
          PrintSettings.FooterFont.Height = -15
          PrintSettings.FooterFont.Name = 'Segoe UI'
          PrintSettings.FooterFont.Style = []
          PrintSettings.PageNumSep = '/'
          ScrollWidth = 21
          SearchFooter.ColorTo = clNone
          SearchFooter.FindNextCaption = 'Find &next'
          SearchFooter.FindPrevCaption = 'Find &previous'
          SearchFooter.Font.Charset = DEFAULT_CHARSET
          SearchFooter.Font.Color = clWindowText
          SearchFooter.Font.Height = -15
          SearchFooter.Font.Name = 'Segoe UI'
          SearchFooter.Font.Style = []
          SearchFooter.HighLightCaption = 'Highlight'
          SearchFooter.HintClose = 'Close'
          SearchFooter.HintFindNext = 'Find next occurrence'
          SearchFooter.HintFindPrev = 'Find previous occurrence'
          SearchFooter.HintHighlight = 'Highlight occurrences'
          SearchFooter.MatchCaseCaption = 'Match case'
          SearchFooter.ResultFormat = '(%d of %d)'
          SelectionColor = 12490277
          SortSettings.HeaderColor = clWhite
          SortSettings.HeaderColorTo = clWhite
          SortSettings.HeaderMirrorColor = clWhite
          SortSettings.HeaderMirrorColorTo = clWhite
          Version = '2.8.3.13'
          WordWrap = False
          AutoCreateColumns = True
          AutoRemoveColumns = False
          Columns = <
            item
              Borders = []
              BorderPen.Color = clSilver
              ButtonHeight = 18
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 2429698
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Header = 'C'#243'digo'
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWhite
              HeaderFont.Height = -15
              HeaderFont.Name = 'Segoe UI'
              HeaderFont.Style = [fsBold]
              PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
              PrintFont.Charset = DEFAULT_CHARSET
              PrintFont.Color = clWindowText
              PrintFont.Height = -15
              PrintFont.Name = 'Segoe UI'
              PrintFont.Style = []
              Width = 20
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              ButtonHeight = 18
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 2429698
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Header = 'ID'
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWhite
              HeaderFont.Height = -15
              HeaderFont.Name = 'Segoe UI'
              HeaderFont.Style = [fsBold]
              PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
              PrintFont.Charset = DEFAULT_CHARSET
              PrintFont.Color = clWindowText
              PrintFont.Height = -12
              PrintFont.Name = 'Segoe UI'
              PrintFont.Style = []
              Width = 60
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              ButtonHeight = 18
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 2429698
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Header = 'Nome'
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWhite
              HeaderFont.Height = -15
              HeaderFont.Name = 'Segoe UI'
              HeaderFont.Style = [fsBold]
              PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
              PrintFont.Charset = DEFAULT_CHARSET
              PrintFont.Color = clWindowText
              PrintFont.Height = -15
              PrintFont.Name = 'Segoe UI'
              PrintFont.Style = []
              Width = 216
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              ButtonHeight = 18
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 2429698
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Header = 'CPF/CNPJ'
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWhite
              HeaderFont.Height = -15
              HeaderFont.Name = 'Segoe UI'
              HeaderFont.Style = [fsBold]
              PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
              PrintFont.Charset = DEFAULT_CHARSET
              PrintFont.Color = clWindowText
              PrintFont.Height = -12
              PrintFont.Name = 'Segoe UI'
              PrintFont.Style = []
              Width = 110
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              ButtonHeight = 18
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 2429698
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Header = 'Data de Nascimento'
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWhite
              HeaderFont.Height = -15
              HeaderFont.Name = 'Segoe UI'
              HeaderFont.Style = [fsBold]
              PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
              PrintFont.Charset = DEFAULT_CHARSET
              PrintFont.Color = clWindowText
              PrintFont.Height = -12
              PrintFont.Name = 'Segoe UI'
              PrintFont.Style = []
              Width = 161
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              ButtonHeight = 18
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 2429698
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Header = 'CEP'
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWhite
              HeaderFont.Height = -15
              HeaderFont.Name = 'Segoe UI'
              HeaderFont.Style = [fsBold]
              PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
              PrintFont.Charset = DEFAULT_CHARSET
              PrintFont.Color = clWindowText
              PrintFont.Height = -12
              PrintFont.Name = 'Segoe UI'
              PrintFont.Style = []
              Width = 90
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              ButtonHeight = 18
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 2429698
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Header = 'Endere'#231'o'
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWhite
              HeaderFont.Height = -15
              HeaderFont.Name = 'Segoe UI'
              HeaderFont.Style = [fsBold]
              PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
              PrintFont.Charset = DEFAULT_CHARSET
              PrintFont.Color = clWindowText
              PrintFont.Height = -12
              PrintFont.Name = 'Segoe UI'
              PrintFont.Style = []
              Width = 79
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              ButtonHeight = 18
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 2429698
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Header = 'N'#186
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWhite
              HeaderFont.Height = -15
              HeaderFont.Name = 'Segoe UI'
              HeaderFont.Style = [fsBold]
              PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
              PrintFont.Charset = DEFAULT_CHARSET
              PrintFont.Color = clWindowText
              PrintFont.Height = -12
              PrintFont.Name = 'Segoe UI'
              PrintFont.Style = []
              Width = 55
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              ButtonHeight = 18
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 2429698
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Header = 'Complemento'
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWhite
              HeaderFont.Height = -15
              HeaderFont.Name = 'Segoe UI'
              HeaderFont.Style = [fsBold]
              PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
              PrintFont.Charset = DEFAULT_CHARSET
              PrintFont.Color = clWindowText
              PrintFont.Height = -12
              PrintFont.Name = 'Segoe UI'
              PrintFont.Style = []
              Width = 111
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              ButtonHeight = 18
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 2429698
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Header = 'Bairro'
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWhite
              HeaderFont.Height = -15
              HeaderFont.Name = 'Segoe UI'
              HeaderFont.Style = [fsBold]
              PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
              PrintFont.Charset = DEFAULT_CHARSET
              PrintFont.Color = clWindowText
              PrintFont.Height = -12
              PrintFont.Name = 'Segoe UI'
              PrintFont.Style = []
              Width = 110
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              ButtonHeight = 18
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 2429698
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Header = 'Cidade'
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWhite
              HeaderFont.Height = -15
              HeaderFont.Name = 'Segoe UI'
              HeaderFont.Style = [fsBold]
              PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
              PrintFont.Charset = DEFAULT_CHARSET
              PrintFont.Color = clWindowText
              PrintFont.Height = -12
              PrintFont.Name = 'Segoe UI'
              PrintFont.Style = []
              Width = 170
            end
            item
              Borders = []
              BorderPen.Color = clSilver
              ButtonHeight = 18
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 2429698
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Header = 'UF'
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWhite
              HeaderFont.Height = -15
              HeaderFont.Name = 'Segoe UI'
              HeaderFont.Style = [fsBold]
              PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
              PrintFont.Charset = DEFAULT_CHARSET
              PrintFont.Color = clWindowText
              PrintFont.Height = -12
              PrintFont.Name = 'Segoe UI'
              PrintFont.Style = []
              Width = 64
            end>
          DataSource = dsConsulta
          InvalidPicture.Data = {
            055449636F6E0000010001002828200000000000681A00001600000028000000
            2800000050000000010020000000000000190000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000020000000400000007000000090000000B0000000C0000000B00000009
            0000000700000004000000010000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000001000000060000000C
            000000140000001C00000022000000270000002B0000002C0000002A00000027
            000000210000001B000000130000000B00000005000000010000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000001000000070B0B0B161F1F1F3525252552
            2929296B2F2F2F802F2F2F8B2E2E2F902E2E2F942F2F2F922D2D2D8825252577
            1D1D1E651111114D00000037000000290000001B0000000F0000000500000001
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000323232318383839524C4C4E8E69696AB389898CD2
            A8A8A9E9BCBCBCF7C4C4C5FCC7C7C7FEC7C7C7FEC2C2C3FBB4B4B4F39D9D9EE6
            74747ED454545ABF363637951E1E1E67050505420000002B000000190000000B
            0000000300000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000001B1B1B0A4949494A666666B2848485CDBDBDBFEBD6D6DDF8D6D6E4FC
            C7C7E0FEACADD4FE9B9ACBFE9393C7FE9697CAFEA1A1CFFEB2B1DAFEC7C7E4FE
            CDCDE4FCD4D4DBF99090A4EB656671D5444446A31313135F0000003B00000023
            0000001000000004000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            29292A1E69696A8A828283D2D5D5D7F7EBEBF3FDC5C5E1FE8889C2FE313193FE
            0D0D88FE0D0D95FE0E0EA5FE0D0DAFFE0D0DB3FE0E0EADFE100FA0FE121296FE
            4040ACFE9595DBFED0D0F0FEDBDBEAFB9999AAF167676DD42D2D2F7F01010146
            0000002A00000012000000040000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000002B2B2B2F
            7B7B7BA2B0B0B1E5D8D8E6FAA6A6D0FE6363B0FE232393FE0E0D93FE0B0B9CFE
            0B0BA0FE0A0AA5FE0A0AAAFE0909AFFE0909B6FE0909BAFE0A0AC1FE0D0DC7FE
            1010C7FE1313B4FE1B1BAAFE6363CCFEBBBBEAFEBCBCD3F788888FEE3F3F429A
            0A0A0A530000002C000000130000000300000000000000000000000000000000
            00000000000000000000000000000000000000000000000031313131888889AA
            C4C4C9EDB0B0D2FB5555A8FE0C0C86FE0C0C8FFE0B0B97FE0B0B99FE0A0A9CFE
            0A0A9FFE0909A4FE0909A9FE0808AEFE0808B5FE0707B9FE0707BFFE0A09C7FE
            0C0DCBFE0D0DD0FE1010D0FE1313BEFE3434BDFE8686D8FECACAE9FC9F9FA6E9
            454549A30D0D0D550000002A0000000F00000003000000000000000000000000
            00000000000000000000000000000000000000003A3A3A37868687ADD5D5D9F1
            9D9DCBFD313198FE0E0E8DFE0C0C90FE0B0B93FE0B0B96FE0B0B98FE0A0A9CFE
            0A0A9FFE0909A4FE0909A9FE0808ADFE0707B3FE0707B9FE0706BDFE0808C4FE
            0A0BC9FE0B0BCEFE0D0DD5FE0E0ED6FE1111CFFE2121BEFE5C5CC7FECBCBEDFC
            A9A9ADE7454547A00909094D000000220000000A000000010000000000000000
            000000000000000000000000000000003B3B3B2B7C7C7CA8E7E7E8F4A5A5CEFE
            1A1A8EFE0A0A8EFE0B0B91FE0B0B92FE0B0B93FE0B0B96FE0B0B98FE0A0A9CFE
            0A0A9FFE0909A4FE0909A9FE0808ABFE0707B0FE0707B7FE0707BAFE0707C0FE
            0909C6FE090ACCFE0A0AD1FE0C0CD6FE0E0EDAFE0F0FD7FE1616BDFE4C4CC1FE
            CDCDECFC9E9EA2E73E3E3E910000003A00000017000000050000000000000000
            000000000000000001010100323232157777789AD2D2D2EDC9C9DFFE12138AFE
            090A91FE0A0A95FE0B0B93FE0B0B94FE0B0B93FE0B0B96FE0A0A98FE0A0A9BFE
            0A0A9EFE0909A3FE0909A6FE0909ABFE0808AEFE0707B2FE0707B8FE0606BCFE
            0606C2FE0909C7FE0909CCFE0B0BD0FE0C0CD5FE0D0DD8FE0E0ED8FE1616BAFE
            6161CCFECBCBE5FB848489EB2929296D0000002A0000000D0000000200000000
            00000000000000001717170474747659B1B1B1D3D2D2E2FA2D2D97FE090992FE
            0B0B98FE0B0B96FE0B0B95FE0B0B93FE131395FE1A1A8BFE0A0A83FE090996FE
            0A0A9EFE0909A2FE0909A5FE0909A9FE0808ADFE0808B0FE0707B6FE0606BBFE
            0606BEFE1717C1FE1616BBFE0808B7FE0A0ACFFE0B0BD3FE0D0DD6FE0F0FD1FE
            2323BBFE9393DDFEB6B6C5F4616162C50F0F0F46000000190000000500000000
            0000000000000000404041218A8A8BA8D5D5D9EF6565B1FE080891FE09099BFE
            0A0A9AFE0A0A99FE0B0B96FE171796FE6868ADFE8383ADFE2E2E84FE0A0A84FE
            090997FE0909A1FE0909A5FE0909A7FE0909ABFE0808AFFE0707B3FE0707B6FE
            2626BDFE9595D8FE9090D1FE2727ABFE0707B6FE0A0ACBFE0B0BD1FE0D0DD2FE
            1010C5FE4040BFFEC7C7EBFD8C8C92ED3D3D3E87030303280000000B00000000
            000000000000000075757659AFAFAFDCB1B2D4FA1F1E97FE09099DFE09099EFE
            0A0A9EFE0A0A9BFE14149CFE7B7DB5FEBBBBBBFECDCDCAFEA5A5C0FE26267EFE
            090986FE090999FE0909A3FE0909A7FE0909ABFE0808ADFE0808B0FE2727B6FE
            9C9CD0FEF2F2EEFEF7F7F6FEA5A5D6FE2828A8FE0808B2FE090ACBFE0B0ACDFE
            0C0DCAFE1616B4FE9696DCFED4D4DDF9606061C4191919460000001200000001
            0000000000000000818182A4CBCBD1EA6364B1FD0A099AFE0808A0FE0909A2FE
            0A0A9FFE1111A1FE7F7FBEFEC8C8C2FEBDBDBBFEBBBBBBFED4D4D2FEB4B4C9FE
            191977FE090989FE08089BFE0909A6FE0909A8FE0808ABFE1F1FAFFE9090C5FE
            DDDDDCFEE7E7E7FEF0F0EFFEF7F7F5FE9C9CD3FE1B1BB8FE0507C5FE0708C7FE
            0A0AC7FE0E0EBDFE5C5CC8FEDDDDF0FD808085DC313131700000001B00000004
            000000007373742A919192E3CFCFE4FC4E4EADFE1314A3FE0808A5FE0909A4FE
            0909A1FE2323ABFEB4B4C9FECCCCC4FEBFBFC0FEBCBCBCFEB7B7B7FEDBDBD8FE
            BCBCCEFE25257FFE09098BFE08089DFE0808A6FE1717A7FE8686BBFED1D1C9FE
            D3D3D1FEDBDBDBFEE5E5E6FEF0F0F0FECCCBECFE2E2EC1FE0606C0FE0606C2FE
            0606C2FE0909BFFE2E2FB6FEB3B3E4FEB4B5BCF34A4A4BA10A0A0A2800000007
            0000000073737469ACACAEDBA7A7D5FE3636A9FE2829B1FE1010ACFE0808A8FE
            0909A6FE0909A4FE4444B7FEB9B9CAFEC9C9C5FEC1C1C1FEBDBDBDFEB9B9B7FE
            D6D6D4FEABABC3FE31318AFE0B0B8BFE1C1CA4FE8080B2FEC0C0BAFEC2C2C2FE
            C8C8C9FED0D0D0FEDFDFDDFED2D3E5FE5C5CC9FE0C0CB9FE0606BBFE0606BBFE
            0606BCFE0808BCFE1313B0FE7474CEFED3D3D8F8676768BC1A1A1B3F0000000A
            000000007373749AC2C2C8E68F8FCDFE3434AEFE3030B4FE2B2BB4FE1212AEFE
            0909A9FE0909A7FE0909A4FE4343B6FEB2B2CAFECBCBC5FEC0C0C0FEBDBDBDFE
            BABABAFECFCFD0FEA2A2BFFE4A4A9BFE7D7DAFFEBABAB3FEB6B6B6FEBABABAFE
            BFBFBFFED0D0CAFED1D1DCFE5F60C6FE0F0FB1FE0707B3FE0707B5FE0707B6FE
            0707B8FE0808B8FE0B0BB2FE4344B4FED3D3E1FB8A8A8CD5272727560000000D
            00000000737374C7D1D1DCF37879C6FE3737B3FE3232B9FE3232BAFE2A2BB7FE
            1211AFFE0909AAFE0909A8FE0A0AA6FE4646B8FEB3B3CBFECACAC6FEC1C1C2FE
            BEBEBEFEBDBDBDFECDCDD0FEB6B6C0FEB4B4B3FEB3B3B2FEB2B2B3FEB3B3B4FE
            C2C2BCFECDCDD5FE5757C0FE1010ADFE0808AEFE0808AFFE0707B0FE0707B1FE
            0707B2FE0808B2FE0B0BB1FE2121A0FECACBE4FDAAAAABEB313131690000000D
            00000000737374EBDADAE9FC5F60BDFE3B3BB8FE3434BBFE3232BCFE3232BBFE
            2B2BB8FE1111B0FE0808ABFE0808AAFE0B0BA8FE4949BAFEBCBCCCFECACAC5FE
            C0C0C1FEBEBEBEFEBCBCBCFEBABAB6FEB4B4B3FEB2B2B3FEB1B1B1FEBABAB6FE
            C7C7CFFE4949BCFE0C0CA6FE0808AAFE0808ABFE0808ABFE0808ACFE0808ACFE
            0808AEFE0808AEFE0B0BADFE101099FEC2C3E3FEB6B5B5F12E2E2E6E0000000D
            00000000737374FED8D8EDFE4A4AB6FE3E3EBCFE3636BEFE3434BFFE3333BDFE
            3333BDFE3030BAFE1515B2FE0909ACFE0808AAFE0808A8FE4E4EBEFEC1C1CDFE
            CACAC6FEC2C2C3FEBEBEBEFEBBBBBBFEB8B8B8FEB4B4B4FEB9B9B7FEBEBECAFE
            5656BCFE0D0DA2FE0909A6FE0909A7FE0909A7FE0909A9FE0909A9FE0909A9FE
            0909A9FE0909AAFE0B0BA8FE0D0D9AFEB7B5DEFEB8B8BAF32E2E2F6E0000000C
            00000000737374FED5D5ECFE4646B8FE4242C0FE3737C3FE3636C3FE3434C1FE
            3233BFFE3233BDFE3333BCFE2222B6FE0F0FB0FE0909AAFE0909A7FE6262C3FE
            D3D3CFFEC9C9C7FEC4C4C4FEBFBFBFFEBBBBBBFEBABAB9FECBCBCDFE7373B1FE
            11118CFE08089EFE0909A5FE0909A5FE0909A5FE0909A5FE0909A5FE0909A5FE
            0909A5FE0909A5FE0B0BA5FE0D0D99FEB3B3DBFEB8B9BAF32E2E2F6C0000000A
            00000000737374F7DADAEEFD5B5BC1FE4747C3FE3A3AC6FE3939C7FE3738C5FE
            3537C3FE3434C1FE3434BFFE3434BEFE2B2BBAFE1818B2FE3534B7FE9D9CD0FE
            D8D8D3FECECECDFEC9C9C9FEC4C4C4FEBFBFBFFEBDBDBDFED1D1D2FEA4A4C1FE
            30308AFE0A0A8AFE08089BFE0909A3FE0909A3FE0909A3FE0909A2FE0909A1FE
            0909A1FE0A0AA1FE0B0BA1FE100F94FEB9B9DCFEB5B4B6EF2E2E2E6600000006
            00000000737374DED9D9E8F97979CDFE4D4DC4FE3D3EC7FE3B3AC9FE3A3AC9FE
            3839C7FE3636C4FE3737C3FE3535C1FE3030BEFE4D4CC2FEB6B5DDFEE6E6E3FE
            DBDBD9FED4D4D4FECDCDCDFEC9C9C9FEC4C4C4FEBFBFBFFEBFBFBFFED2D2D2FE
            ADADC5FE252580FE090989FE09099AFE0909A2FE0909A2FE0A0AA0FE0A0A9FFE
            0A0A9FFE0A0A9FFE0B0B9FFE1C1A98FEC3C3DEFDAAA9ABE42C2C2C5800000002
            00000000737374B4CECED7ED9696D9FE5555C5FE4342C9FE3D3CCCFE3B3BCCFE
            3B3ACAFE3939C7FE3939C7FE3332C3FE4141C3FEBDBDE7FEF1F1F0FEEAEAE9FE
            E3E3E3FEDEDEDEFED9D9D7FEDBDBD3FECBCBC8FEC3C3C3FEBFBFBFFEBCBCBCFE
            DADAD7FEBDBDCEFE191979FE09098AFE09099AFE0A0A9FFE0A0A9FFE0A0A9FFE
            0A0A9DFE0A0A9DFE0B0B9CFE2E2D9DFEC9CBDCFA969798D12B2B2B4800000001
            0000000073737482B9B9BCE0A9A9E0FE5E5ECAFE4948CBFE4040D0FE4040D0FE
            3D3DCEFE3C3CCBFE3636C8FE4040C7FEBEBEF0FEFDFDFCFEF5F5F4FEEFEFEFFE
            EAEAEAFEE8E8E6FEDAD9E7FEA2A2DBFEC7C7D5FED2D2CDFEC8C8C8FEC2C2C2FE
            BDBDBDFEE0E0DDFEB7B7CBFE282882FE0A0A89FE090999FE0A0A9EFE0A0A9EFE
            0A0A9DFE0A0A9CFE0B0B99FE5452AEFED9DADDF7838383B62A2A2A3100000000
            000000007373744C9F9FA0DCC1C1E9FD7171D0FE5757CFFE4242D0FE4040D2FE
            4040D2FE3B3BD0FE4D4DD2FEBFBFF1FEFEFEFEFEFDFDFDFEFAFAFAFEF4F4F4FE
            F2F2F0FEE3E3EEFE8483D7FE3030BBFE6C6CCCFECCCCD8FED6D6D2FECCCCCBFE
            C7C7C7FEC2C2C3FEDBDBDAFEAAAAC5FE34338BFE10108BFE1212A0FE11119FFE
            11119FFE10109EFE19199AFE9392C8FED6D6D7F56F6F719E2727271600000000
            00000000353535138A8A8BC8D6D6E5F38989D8FE6D6DD4FE4747D0FE4445D5FE
            403FD4FE4C4BD8FEBDBDF3FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFBFBFBFE
            EEEEF9FE8786DEFE3838C2FE3232BEFE2D2DBDFE6868CBFEC5C5D8FED7D7D3FE
            CECECEFEC9C9CAFEC7C7C6FED7D8D7FEA7A6C4FE35359DFE2525A7FE2525A6FE
            2423A4FE2121A3FE4646AAFECECEDFFDB3B3B3DF535355711010100400000000
            00000000000000007B7B7C82C1C1C4E3B0B0E5FC7D7ED6FE5F5FD4FE4747D5FE
            4343D7FE5252DDFED4D6F9FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEEFEFFEFE
            7C7CE0FE3939C7FE3737C5FE3939C4FE3737C2FE3232C0FE6767CBFEC6C6D9FE
            D7D7D3FECDCDCEFEC9C9CAFED1D1CCFEB9B9D8FE4040B4FE2828ACFE2929AAFE
            2727A9FE2727A5FE7D7DBFFEF0EFF2FC858586C3434343360000000000000000
            00000000000000007373743AA0A0A1D4DEDEEAF67676D4FE8F8FDFFE5252D4FE
            4949D9FE4141DAFE6262E5FEEBEBFEFEFEFEFEFEFEFEFEFEF0F0FEFE7A78E1FE
            3232C8FE3F40CCFE3C3DC9FE3C3CC8FE3A3BC5FE3838C4FE3333C1FE6766CDFE
            CCCCDAFED8D8D3FED5D5D0FECCCCDDFE6060C7FE2C2CB2FE2E2EB2FE2B2BAEFE
            2929ABFE2A2AA0FEB3B3D6FECFCFD0E97272739E414142090000000000000000
            0000000000000000171717107C7C7D80CCCCCCE5C1C1EAFD7A7AD6FE7474DBFE
            4E4DD7FE4A4ADBFE3C3CD8FE6262E5FED9D9FBFEE2E2FBFE8181E7FE3839CEFE
            4343D2FE4141D0FE4140CFFE3D3ECCFE3C3CC8FE3D3DC8FE3A3AC5FE3332C1FE
            6C6CD1FECECEDCFED0D0E2FE6B6AD1FE2D2DB7FE3131B7FE3232B6FE2F30B2FE
            3031ACFE7F80C2FEE4E4ECF9858586CC5D5D5E36000000000000000000000000
            00000000000000000E0E0E015A5A5B3A979797B7E2E2E6F29E9EE1FE7E7ED9FE
            6D6DDAFE5050D9FE4C4CDEFE4444DBFE6060E5FE6C6CE7FE4747DAFE4546D9FE
            4545D7FE4443D4FE4343D3FE4141D1FE4040CDFE403FCCFE3E3ECAFE3C3CC8FE
            3838C5FE5F5ED1FE5B5BCFFE3434BEFE3636BEFE3636BBFE3232B8FE3132B2FE
            6262B8FECBCBE1FBB6B6B7E07474757D3C3C3C03000000000000000000000000
            000000000000000000000000141414095B5B5C60A9A9AACCEAEAF6FC9C9CE1FE
            7C7CD9FE6D6DDCFE5050DAFE4C4CDDFE4847DEFE4645DDFE4A49DDFE4949DCFE
            4847DBFE4746D8FE4646D7FE4444D4FE4343D2FE4242D1FE4041CEFE4141CCFE
            3E3ECBFE3A39C7FE3737C5FE3B3BC3FE3939C1FE3637BDFE3131B3FE5354B5FE
            BBBBDCFDCBCBCDEA8282839E3333331700000000000000000000000000000000
            000000000000000000000000000000001010100C67676872B4B4B5D6E8E8F7FE
            9C9CE1FE8181DCFE7B7BDEFE5555D9FE4D4DDDFE4D4CDFFE4B4CDFFE4B4CDDFE
            4A4ADEFE4949DCFE4848DBFE4647D9FE4546D5FE4646D4FE4545D2FE4343D1FE
            4242CFFE4141CCFE3E3EC9FE3B3BC5FE3A3AC1FE3333B5FE4647B1FEBEBEE1FE
            DBDBDEEF909091A82F2F2F2D0000000000000000000000000000000000000000
            00000000000000000000000000000000000000000202020275757677B3B3B4D7
            EFEFF7FDA3A3E2FE8080DAFE9B9BE6FE6869DCFE5050DAFE4C4DDDFE4C4DDEFE
            4C4BDFFE4A4BDDFE4B4BDCFE494ADBFE4949D8FE4848D8FE4747D4FE4545D2FE
            4343D0FE4141CCFE3D3DC7FE3A3AC0FE3636B4FE5455B6FED3D3EAFEEAEAEBF4
            8F8F8FAC34343434000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000101010167676771
            AAAAAACEE4E4E9F3C3C3ECFC7D7DD9FE8C8CDFFE8080DEFE6969DAFE5757D9FE
            5151D9FE4D4DD9FE4B4BD9FE4A4AD8FE4948D6FE4747D3FE4646D0FE4344CDFE
            4041C7FE4040C2FE3D3DBBFE4949B8FE8383CCFDDBDBEAF9D5D5D5EB818182A8
            3B3B3C3B00000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000001010100C
            5B5B5C60979798B8CCCCCDE5DFDFEDF6B2B2E8FD9494DFFE8585DCFE7676D9FE
            6C6CD6FE6464D5FE5D5DD3FE5656D1FE5252CEFE4D4DCBFE4949C7FE4444C3FE
            4545C0FE6262C6FE8181CEFEBFBFE1FAD8D8DEEFB4B4B4D279797A993B3B3C2F
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            141414095A5A5B397C7C7D81A0A0A1D7C3C3C5E3D7D7E6F3C4C4ECFDB0B0E6FE
            A1A1E1FE8888DBFE6D6DD2FE5858CBFE5A5ACAFE6B6BCFFE8181D5FE9797DBFE
            ACACE1FED1D1EBFCD0D0D6EBB2B2B2DD8D8D8EAD7676775C3232321900000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000E0E0F01171717107272733B7B7B7C8189898AC99F9FA0DCBABABEDF
            D2D2DAEEDBDBEAFADCDCF1FDD8D8F1FED9D9F1FEDCDCEFFCD6D6E2F5C6C6CDE6
            ACACAFDB929293E1828283AB7676775E41414124171717060101010000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000353535137272734B72727384
            727273B7727273DF727273F7727273FD727273FD727273EF727273CC7272739F
            727273697272732D000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000FFFC001FFF000000FFF0000FFF000000FF800000FF000000FF000000
            7F000000FE0000007F000000FE0000003F000000FC0000001F000000F0000000
            07000000F000000007000000E000000003000000C000000003000000C0000000
            0300000080000000030000008000000001000000800000000100000000000000
            0100000000000000010000000000000001000000000000000100000000000000
            0100000000000000010000000000000001000000000000000100000000000000
            0100000000000000030000000000000003000000000000000300000000000000
            0300000080000000070000008000000007000000C00000000F000000C0000000
            0F000000C00000001F000000F00000007F000000F80000007F000000FC000000
            FF000000FE000001FF000000FE000003FF000000FFC0000FFF000000FFF0007F
            FF000000}
          ShowUnicode = False
          ColWidths = (
            20
            60
            216
            110
            161
            90
            79
            55
            111
            110
            170
            64)
          RowHeights = (
            28
            28)
        end
      end
      object pnlBottomConsulta: TPanel
        Left = 0
        Top = 454
        Width = 1213
        Height = 86
        Align = alBottom
        Color = clWhite
        ParentBackground = False
        TabOrder = 2
        ExplicitWidth = 994
        object btnNovoClienteConsulta: TAdvSmoothButton
          Left = 16
          Top = 29
          Width = 193
          Height = 44
          Appearance.Font.Charset = DEFAULT_CHARSET
          Appearance.Font.Color = clWhite
          Appearance.Font.Height = -15
          Appearance.Font.Name = 'Segoe UI'
          Appearance.Font.Style = [fsBold]
          Appearance.SimpleLayout = True
          Appearance.Rounding = 0
          Caption = 'Novo Cliente'
          Color = 12490277
          ParentFont = False
          Status.Caption = '0'
          Status.Appearance.Fill.Color = clRed
          Status.Appearance.Fill.ColorMirror = clNone
          Status.Appearance.Fill.ColorMirrorTo = clNone
          Status.Appearance.Fill.GradientType = gtSolid
          Status.Appearance.Fill.GradientMirrorType = gtSolid
          Status.Appearance.Fill.BorderColor = clGray
          Status.Appearance.Fill.Rounding = 0
          Status.Appearance.Fill.ShadowOffset = 0
          Status.Appearance.Fill.Glow = gmNone
          Status.Appearance.Font.Charset = DEFAULT_CHARSET
          Status.Appearance.Font.Color = clWhite
          Status.Appearance.Font.Height = -11
          Status.Appearance.Font.Name = 'Segoe UI'
          Status.Appearance.Font.Style = []
          TabOrder = 0
          Version = '2.2.4.0'
          OnClick = btnNovoClienteConsultaClick
          TMSStyle = 8
        end
        object btnEditarSelecionadoConsulta: TAdvSmoothButton
          Left = 231
          Top = 29
          Width = 193
          Height = 44
          Appearance.Font.Charset = DEFAULT_CHARSET
          Appearance.Font.Color = clWhite
          Appearance.Font.Height = -15
          Appearance.Font.Name = 'Segoe UI'
          Appearance.Font.Style = [fsBold]
          Appearance.SimpleLayout = True
          Appearance.Rounding = 0
          Caption = 'Editar Selecionado'
          Color = 2429698
          ParentFont = False
          Status.Caption = '0'
          Status.Appearance.Fill.Color = clRed
          Status.Appearance.Fill.ColorMirror = clNone
          Status.Appearance.Fill.ColorMirrorTo = clNone
          Status.Appearance.Fill.GradientType = gtSolid
          Status.Appearance.Fill.GradientMirrorType = gtSolid
          Status.Appearance.Fill.BorderColor = clGray
          Status.Appearance.Fill.Rounding = 0
          Status.Appearance.Fill.ShadowOffset = 0
          Status.Appearance.Fill.Glow = gmNone
          Status.Appearance.Font.Charset = DEFAULT_CHARSET
          Status.Appearance.Font.Color = clWhite
          Status.Appearance.Font.Height = -11
          Status.Appearance.Font.Name = 'Segoe UI'
          Status.Appearance.Font.Style = []
          TabOrder = 1
          Version = '2.2.4.0'
          OnClick = btnEditarSelecionadoConsultaClick
          TMSStyle = 8
        end
      end
    end
    object tabCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      object pnlTopCadastro: TPanel
        Left = 0
        Top = 0
        Width = 1213
        Height = 73
        Align = alTop
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 992
        object lblIDTituloCadastro: TLabel
          Left = 14
          Top = 37
          Width = 21
          Height = 21
          Caption = 'ID:'
          Color = 2627074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 2429698
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lblStatusTituloCadastro: TLabel
          Left = 16
          Top = 10
          Width = 51
          Height = 21
          Caption = 'Status:'
          Color = 2627074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 2429698
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lblStatusValorCadastro: TLabel
          Left = 73
          Top = 10
          Width = 201
          Height = 21
          Caption = 'cadastrando novo cliente..'
          Color = 2627074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 2429698
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lblIDValorCadastro: TLabel
          Left = 41
          Top = 37
          Width = 54
          Height = 21
          Caption = '000000'
          Color = 2627074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 2429698
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lblNomeCadastroEditado: TLabel
          Left = 101
          Top = 37
          Width = 416
          Height = 21
          Caption = '- Fulano de tal (vis'#237'vel apenas se o status '#233' "editando")'
          Color = 2627074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 2429698
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
      end
      object pnlDadosGeraisCadastro: TPanel
        Left = 0
        Top = 73
        Width = 1213
        Height = 389
        Align = alClient
        TabOrder = 1
        ExplicitWidth = 992
        ExplicitHeight = 381
        object pnlDadosPessoaisCadastro: TAdvSmoothPanel
          Left = 1
          Top = 1
          Width = 1211
          Height = 160
          Cursor = crDefault
          Caption.Text = 'Dados Pessoais'
          Caption.HTMLFont.Charset = DEFAULT_CHARSET
          Caption.HTMLFont.Color = clWindowText
          Caption.HTMLFont.Height = -15
          Caption.HTMLFont.Name = 'Tahoma'
          Caption.HTMLFont.Style = []
          Caption.Font.Charset = DEFAULT_CHARSET
          Caption.Font.Color = clWindowText
          Caption.Font.Height = -16
          Caption.Font.Name = 'Tahoma'
          Caption.Font.Style = []
          Caption.ColorStart = 4474440
          Caption.ColorEnd = 4474440
          Caption.LineColor = 12895944
          Fill.Color = clWhite
          Fill.ColorTo = clWhite
          Fill.ColorMirror = clNone
          Fill.ColorMirrorTo = clNone
          Fill.GradientType = gtVertical
          Fill.GradientMirrorType = gtSolid
          Fill.BorderColor = 12490277
          Fill.Rounding = 0
          Fill.ShadowOffset = 0
          Fill.Glow = gmNone
          Version = '1.7.1.9'
          Align = alTop
          TabOrder = 0
          ExplicitWidth = 990
          TMSStyle = 0
          object lblCPFCNPJCadastro: TLabel
            Left = 192
            Top = 89
            Width = 74
            Height = 21
            Caption = 'CPF/CNPJ'
            Color = 2495490
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 2429698
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object lblDataNascimentoCadastro: TLabel
            Left = 16
            Top = 89
            Width = 155
            Height = 21
            Caption = 'Data de Nascimento'
            Color = 2495490
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 2429698
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object lblNomeCadastro: TLabel
            Left = 16
            Top = 29
            Width = 47
            Height = 21
            Caption = 'Nome'
            Color = 2495490
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 2429698
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object edtCPFCNPJCadastro: TEdit
            Left = 192
            Top = 110
            Width = 150
            Height = 27
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxLength = 18
            ParentFont = False
            TabOrder = 2
            OnChange = edtCPFCNPJCadastroChange
          end
          object edtDataNascimentoCadastro: TDateTimePicker
            Left = 16
            Top = 110
            Width = 155
            Height = 27
            Date = 46151.000000000000000000
            Time = 0.144554016202164300
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object edtNomeCadastro: TEdit
            Left = 16
            Top = 50
            Width = 414
            Height = 27
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
        end
        object pnlEnderecoCadastro: TAdvSmoothPanel
          Left = 1
          Top = 161
          Width = 1211
          Height = 227
          Cursor = crDefault
          Caption.Text = 'Endere'#231'o'
          Caption.HTMLFont.Charset = DEFAULT_CHARSET
          Caption.HTMLFont.Color = clWindowText
          Caption.HTMLFont.Height = -15
          Caption.HTMLFont.Name = 'Tahoma'
          Caption.HTMLFont.Style = []
          Caption.Font.Charset = DEFAULT_CHARSET
          Caption.Font.Color = clWindowText
          Caption.Font.Height = -16
          Caption.Font.Name = 'Tahoma'
          Caption.Font.Style = []
          Caption.ColorStart = 4474440
          Caption.ColorEnd = 4474440
          Caption.LineColor = 12895944
          Fill.Color = clWhite
          Fill.ColorTo = clWhite
          Fill.ColorMirror = clNone
          Fill.ColorMirrorTo = clNone
          Fill.GradientType = gtVertical
          Fill.GradientMirrorType = gtSolid
          Fill.BorderColor = 12490277
          Fill.Rounding = 0
          Fill.ShadowOffset = 0
          Fill.Glow = gmNone
          Version = '1.7.1.9'
          Align = alClient
          TabOrder = 1
          ExplicitWidth = 990
          ExplicitHeight = 219
          TMSStyle = 0
          object lblBairroCadastro: TLabel
            Left = 18
            Top = 159
            Width = 46
            Height = 21
            Caption = 'Bairro'
            Color = 2495490
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 2429698
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object lblCEPCadastro: TLabel
            Left = 16
            Top = 100
            Width = 29
            Height = 21
            Caption = 'CEP'
            Color = 2495490
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 2429698
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object lblCidadeCadastro: TLabel
            Left = 182
            Top = 100
            Width = 53
            Height = 21
            Caption = 'Cidade'
            Color = 2495490
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 2429698
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object lblEnderecoCadastro: TLabel
            Left = 16
            Top = 46
            Width = 71
            Height = 21
            Caption = 'Endere'#231'o'
            Color = 2495490
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 2429698
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object lblNumeroCadastro: TLabel
            Left = 445
            Top = 46
            Width = 63
            Height = 21
            Caption = 'N'#250'mero'
            Color = 2495490
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 2429698
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object lblUFCadastro: TLabel
            Left = 491
            Top = 100
            Width = 20
            Height = 21
            Caption = 'UF'
            Color = 2495490
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 2429698
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object lblComplementoCadastro: TLabel
            Left = 248
            Top = 159
            Width = 109
            Height = 21
            Caption = 'Complemento'
            Color = 2627074
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 2429698
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object cbCidadeCadastro: TComboBox
            Left = 182
            Top = 119
            Width = 292
            Height = 28
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object cbUFCadastro: TComboBox
            Left = 491
            Top = 119
            Width = 82
            Height = 28
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            OnChange = cbUFCadastroChange
          end
          object ckSemNumeroCadastro: TCheckBox
            Left = 532
            Top = 71
            Width = 97
            Height = 17
            Caption = 'S/N'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 2429698
            Font.Height = -15
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 7
          end
          object edtBairroCadastro: TEdit
            Left = 18
            Top = 179
            Width = 217
            Height = 27
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
          end
          object edtCEPCadastro: TEdit
            Left = 16
            Top = 120
            Width = 150
            Height = 27
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxLength = 9
            ParentFont = False
            TabOrder = 2
            OnChange = edtCEPCadastroChange
          end
          object edtEnderecoCadastro: TEdit
            Left = 16
            Top = 66
            Width = 414
            Height = 27
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object edtNumeroCadastro: TEdit
            Left = 445
            Top = 66
            Width = 81
            Height = 27
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnChange = edtNumeroCadastroChange
          end
          object edtComplementoCadastro: TEdit
            Left = 248
            Top = 179
            Width = 337
            Height = 27
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
          end
        end
      end
      object pnlBottomCadastro: TPanel
        Left = 0
        Top = 462
        Width = 1213
        Height = 78
        Align = alBottom
        Color = clWhite
        ParentBackground = False
        TabOrder = 2
        ExplicitTop = 454
        ExplicitWidth = 992
        object btnNovoCadastro: TAdvSmoothButton
          Left = 14
          Top = 18
          Width = 123
          Height = 44
          Appearance.Font.Charset = DEFAULT_CHARSET
          Appearance.Font.Color = clWhite
          Appearance.Font.Height = -15
          Appearance.Font.Name = 'Segoe UI'
          Appearance.Font.Style = [fsBold]
          Appearance.SimpleLayout = True
          Appearance.Rounding = 0
          Caption = 'Novo'
          Color = 12490277
          ParentFont = False
          Status.Caption = '0'
          Status.Appearance.Fill.Color = clRed
          Status.Appearance.Fill.ColorMirror = clNone
          Status.Appearance.Fill.ColorMirrorTo = clNone
          Status.Appearance.Fill.GradientType = gtSolid
          Status.Appearance.Fill.GradientMirrorType = gtSolid
          Status.Appearance.Fill.BorderColor = clGray
          Status.Appearance.Fill.Rounding = 0
          Status.Appearance.Fill.ShadowOffset = 0
          Status.Appearance.Fill.Glow = gmNone
          Status.Appearance.Font.Charset = DEFAULT_CHARSET
          Status.Appearance.Font.Color = clWhite
          Status.Appearance.Font.Height = -11
          Status.Appearance.Font.Name = 'Segoe UI'
          Status.Appearance.Font.Style = []
          TabOrder = 0
          Version = '2.2.4.0'
          OnClick = btnNovoCadastroClick
          TMSStyle = 8
        end
        object btnSalvarCadastro: TAdvSmoothButton
          Left = 151
          Top = 18
          Width = 123
          Height = 44
          Appearance.Font.Charset = DEFAULT_CHARSET
          Appearance.Font.Color = clWhite
          Appearance.Font.Height = -15
          Appearance.Font.Name = 'Segoe UI'
          Appearance.Font.Style = [fsBold]
          Appearance.SimpleLayout = True
          Appearance.Rounding = 0
          Caption = 'Salvar'
          Color = 4564776
          ParentFont = False
          Status.Caption = '0'
          Status.Appearance.Fill.Color = clRed
          Status.Appearance.Fill.ColorMirror = clNone
          Status.Appearance.Fill.ColorMirrorTo = clNone
          Status.Appearance.Fill.GradientType = gtSolid
          Status.Appearance.Fill.GradientMirrorType = gtSolid
          Status.Appearance.Fill.BorderColor = clGray
          Status.Appearance.Fill.Rounding = 0
          Status.Appearance.Fill.ShadowOffset = 0
          Status.Appearance.Fill.Glow = gmNone
          Status.Appearance.Font.Charset = DEFAULT_CHARSET
          Status.Appearance.Font.Color = clWhite
          Status.Appearance.Font.Height = -11
          Status.Appearance.Font.Name = 'Segoe UI'
          Status.Appearance.Font.Style = []
          TabOrder = 1
          Version = '2.2.4.0'
          OnClick = btnSalvarCadastroClick
          TMSStyle = 8
        end
        object btnExcluirCadastro: TAdvSmoothButton
          Left = 290
          Top = 18
          Width = 123
          Height = 44
          Appearance.Font.Charset = DEFAULT_CHARSET
          Appearance.Font.Color = clWhite
          Appearance.Font.Height = -15
          Appearance.Font.Name = 'Segoe UI'
          Appearance.Font.Style = [fsBold]
          Appearance.SimpleLayout = True
          Appearance.Rounding = 0
          Caption = 'Excluir'
          Color = 4535772
          ParentFont = False
          Status.Caption = '0'
          Status.Appearance.Fill.Color = clRed
          Status.Appearance.Fill.ColorMirror = clNone
          Status.Appearance.Fill.ColorMirrorTo = clNone
          Status.Appearance.Fill.GradientType = gtSolid
          Status.Appearance.Fill.GradientMirrorType = gtSolid
          Status.Appearance.Fill.BorderColor = clGray
          Status.Appearance.Fill.Rounding = 0
          Status.Appearance.Fill.ShadowOffset = 0
          Status.Appearance.Fill.Glow = gmNone
          Status.Appearance.Font.Charset = DEFAULT_CHARSET
          Status.Appearance.Font.Color = clWhite
          Status.Appearance.Font.Height = -11
          Status.Appearance.Font.Name = 'Segoe UI'
          Status.Appearance.Font.Style = []
          TabOrder = 2
          Version = '2.2.4.0'
          OnClick = btnExcluirCadastroClick
          TMSStyle = 8
        end
        object btnCancelarCadastro: TAdvSmoothButton
          Left = 431
          Top = 18
          Width = 123
          Height = 44
          Appearance.Font.Charset = DEFAULT_CHARSET
          Appearance.Font.Color = clWhite
          Appearance.Font.Height = -15
          Appearance.Font.Name = 'Segoe UI'
          Appearance.Font.Style = [fsBold]
          Appearance.SimpleLayout = True
          Appearance.Rounding = 0
          Caption = 'Cancelar'
          Color = 8222060
          ParentFont = False
          Status.Caption = '0'
          Status.Appearance.Fill.Color = clRed
          Status.Appearance.Fill.ColorMirror = clNone
          Status.Appearance.Fill.ColorMirrorTo = clNone
          Status.Appearance.Fill.GradientType = gtSolid
          Status.Appearance.Fill.GradientMirrorType = gtSolid
          Status.Appearance.Fill.BorderColor = clGray
          Status.Appearance.Fill.Rounding = 0
          Status.Appearance.Fill.ShadowOffset = 0
          Status.Appearance.Fill.Glow = gmNone
          Status.Appearance.Font.Charset = DEFAULT_CHARSET
          Status.Appearance.Font.Color = clWhite
          Status.Appearance.Font.Height = -11
          Status.Appearance.Font.Name = 'Segoe UI'
          Status.Appearance.Font.Style = []
          TabOrder = 3
          Version = '2.2.4.0'
          OnClick = btnCancelarCadastroClick
          TMSStyle = 8
        end
      end
    end
  end
  object qryConsulta: TFDQuery
    Left = 677
    Top = 220
  end
  object dsConsulta: TDataSource
    DataSet = qryConsulta
    Left = 757
    Top = 220
  end
end
