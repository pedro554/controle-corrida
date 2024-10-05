object FCad_ControleProva: TFCad_ControleProva
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Controle de Prova'
  ClientHeight = 595
  ClientWidth = 1094
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1094
    Height = 89
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 1092
    object lblTempo: TLabel
      Left = 1
      Top = 1
      Width = 1092
      Height = 87
      Align = alClient
      Alignment = taCenter
      Caption = '00:00:00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -67
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 246
      ExplicitHeight = 89
    end
  end
  object JvDBGrid1: TJvDBGrid
    Left = 137
    Top = 130
    Width = 957
    Height = 465
    TabStop = False
    Align = alClient
    DataSource = SProva
    DrawingStyle = gdsClassic
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    AutoAppend = False
    AutoSizeColumns = True
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    CanDelete = False
    EditControls = <>
    RowsHeight = 19
    TitleRowHeight = 19
    Columns = <
      item
        Expanded = False
        FieldName = 'NR_POSICAOGERAL'
        Title.Caption = 'Pos. Geral'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_NUMERO'
        Title.Caption = 'N'#186
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FANTASIA'
        Title.Caption = 'Nome'
        Width = 226
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_CATEGORIA'
        Title.Caption = 'Categoria'
        Width = 177
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_TEMPO'
        Title.Caption = 'Tempo Total'
        Width = 144
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_INICIO'
        Title.Caption = 'Inicio'
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_FIM'
        Title.Caption = 'Fim'
        Width = 121
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 130
    Width = 137
    Height = 465
    Align = alLeft
    TabOrder = 2
    ExplicitHeight = 461
    object btnIniciar: TButton
      Left = 1
      Top = 1
      Width = 135
      Height = 25
      Align = alTop
      Caption = 'Iniciar Prova'
      TabOrder = 0
      TabStop = False
      OnClick = btnIniciarClick
    end
    object btnParar: TButton
      Left = 1
      Top = 389
      Width = 135
      Height = 25
      Align = alBottom
      Caption = 'Finalizar Prova'
      TabOrder = 2
      TabStop = False
      OnClick = btnPararClick
      ExplicitTop = 385
    end
    object btnSair: TButton
      Left = 1
      Top = 439
      Width = 135
      Height = 25
      Align = alBottom
      Caption = 'Sair'
      TabOrder = 4
      TabStop = False
      OnClick = btnSairClick
      ExplicitTop = 435
    end
    object btnRemover: TButton
      Left = 1
      Top = 414
      Width = 135
      Height = 25
      Align = alBottom
      Caption = 'Remover'
      TabOrder = 3
      TabStop = False
      OnClick = btnRemoverClick
      ExplicitTop = 410
    end
    object btnAjustaPosGeral: TButton
      Left = 1
      Top = 26
      Width = 135
      Height = 25
      Align = alTop
      Caption = 'Ajusta Posicao Geral'
      TabOrder = 1
      TabStop = False
      OnClick = btnAjustaPosGeralClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 89
    Width = 1094
    Height = 41
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 1092
    DesignSize = (
      1094
      41)
    object Label1: TLabel
      Left = 256
      Top = 11
      Width = 42
      Height = 15
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'N'#250'mero'
      ExplicitWidth = 44
    end
    object Label2: TLabel
      Left = 608
      Top = 11
      Width = 79
      Height = 15
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Filtro Categoria'
      ExplicitWidth = 81
    end
    object btnSalvar: TButton
      Left = 439
      Top = 7
      Width = 117
      Height = 25
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = btnSalvarClick
      ExplicitWidth = 115
    end
    object NR_NUMERO: TEdit
      Left = 312
      Top = 8
      Width = 118
      Height = 23
      Anchors = [akLeft, akTop, akRight, akBottom]
      CharCase = ecUpperCase
      TabOrder = 1
      ExplicitWidth = 116
    end
    object cbFiltro: TJvComboBox
      Left = 701
      Top = 8
      Width = 247
      Height = 23
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      TabStop = False
      Text = ''
      OnChange = cbFiltroChange
      ExplicitWidth = 245
    end
  end
  object Timer: TTimer
    Enabled = False
    OnTimer = TimerTimer
    Left = 272
    Top = 32
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 304
    Top = 32
  end
  object QProva: TFDQuery
    Connection = DMD_Dados.con
    Transaction = Transacao
    SQL.Strings = (
      'SELECT'
      'PROVA.*,'
      'PESSOA.FANTASIA,'
      'PESSOA.CD_CATEGORIA,'
      'CATEGORIA.DS_CATEGORIA'
      ''
      'FROM'
      'PROVA'
      ''
      'LEFT JOIN PESSOA ON'
      'PESSOA.NR_CORRIDA = PROVA.NR_NUMERO'
      ''
      'LEFT JOIN CATEGORIA ON'
      'CATEGORIA.CD_CATEGORIA = PESSOA.CD_CATEGORIA')
    Left = 808
    Top = 16
    object QProvaNR_NUMERO: TStringField
      FieldName = 'NR_NUMERO'
      Origin = 'NR_NUMERO'
      Required = True
      Size = 100
    end
    object QProvaDT_TEMPO: TTimeField
      FieldName = 'DT_TEMPO'
      Origin = 'DT_TEMPO'
    end
    object QProvaDT_INICIO: TTimeField
      FieldName = 'DT_INICIO'
      Origin = 'DT_INICIO'
    end
    object QProvaDT_FIM: TTimeField
      FieldName = 'DT_FIM'
      Origin = 'DT_FIM'
    end
    object QProvaNR_POSICAOGERAL: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'NR_POSICAOGERAL'
      Origin = 'NR_POSICAOGERAL'
      Required = True
    end
    object QProvaFANTASIA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FANTASIA'
      Origin = 'FANTASIA'
      ProviderFlags = []
      Size = 50
    end
    object QProvaCD_CATEGORIA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CD_CATEGORIA'
      Origin = 'CD_CATEGORIA'
      ProviderFlags = []
    end
    object QProvaDS_CATEGORIA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_CATEGORIA'
      Origin = 'DS_CATEGORIA'
      ProviderFlags = []
      Size = 100
    end
    object QProvaST_FINALIZADA: TBooleanField
      FieldName = 'ST_FINALIZADA'
      Origin = 'ST_FINALIZADA'
    end
  end
  object SProva: TDataSource
    DataSet = QProva
    Left = 808
    Top = 48
  end
  object QValidaNumero: TFDQuery
    Connection = DMD_Dados.con
    Transaction = Transacao
    SQL.Strings = (
      'SELECT'
      'PESSOA.NR_CORRIDA'
      ''
      'FROM'
      'PESSOA'
      ''
      'WHERE'
      'PESSOA.NR_CORRIDA = :NR_CORRIDA')
    Left = 840
    Top = 16
    ParamData = <
      item
        Name = 'NR_CORRIDA'
        DataType = ftString
        ParamType = ptInput
        Size = 100
        Value = Null
      end>
    object QValidaNumeroNR_CORRIDA: TStringField
      FieldName = 'NR_CORRIDA'
      Origin = 'NR_CORRIDA'
      Size = 100
    end
  end
  object Transacao: TFDTransaction
    Connection = DMD_Dados.con
    Left = 768
    Top = 16
  end
  object QValidaNumeroInserido: TFDQuery
    Connection = DMD_Dados.con
    Transaction = Transacao
    SQL.Strings = (
      'SELECT'
      'PROVA.NR_NUMERO'
      ''
      'FROM'
      'PROVA'
      ''
      'WHERE'
      'PROVA.NR_NUMERO = :NR_NUMERO')
    Left = 872
    Top = 16
    ParamData = <
      item
        Name = 'NR_NUMERO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
        Value = Null
      end>
    object QValidaNumeroInseridoNR_NUMERO: TStringField
      FieldName = 'NR_NUMERO'
      Origin = 'NR_NUMERO'
      Required = True
      Size = 100
    end
  end
  object JvEnterAsTab1: TJvEnterAsTab
    Left = 736
    Top = 48
  end
  object QCategoria: TFDQuery
    Connection = DMD_Dados.con
    Transaction = Transacao
    SQL.Strings = (
      'SELECT'
      '*'
      ''
      'FROM'
      'CATEGORIA')
    Left = 904
    Top = 16
    object QCategoriaCD_CATEGORIA: TIntegerField
      FieldName = 'CD_CATEGORIA'
      Origin = 'CD_CATEGORIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QCategoriaDS_CATEGORIA: TStringField
      FieldName = 'DS_CATEGORIA'
      Origin = 'DS_CATEGORIA'
      Required = True
      Size = 100
    end
  end
end
