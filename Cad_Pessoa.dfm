object FCad_Pessoa: TFCad_Pessoa
  Left = 0
  Top = 0
  Caption = 'Cadastro Pessoa'
  ClientHeight = 472
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object lbl1: TLabel
    Left = 126
    Top = 292
    Width = 33
    Height = 15
    Alignment = taRightJustify
    Caption = 'Nome'
  end
  object lbl2: TLabel
    Left = 134
    Top = 321
    Width = 25
    Height = 15
    Alignment = taRightJustify
    Caption = 'Sexo'
  end
  object lbl3: TLabel
    Left = 108
    Top = 350
    Width = 51
    Height = 15
    Alignment = taRightJustify
    Caption = 'Categoria'
  end
  object lbl4: TLabel
    Left = 137
    Top = 11
    Width = 50
    Height = 15
    Caption = 'Pesquisar'
  end
  object lbl5: TLabel
    Left = 115
    Top = 379
    Width = 44
    Height = 15
    Alignment = taRightJustify
    Caption = 'N'#250'mero'
  end
  object JvDBGrid1: TJvDBGrid
    Left = -4
    Top = 37
    Width = 624
    Height = 246
    DataSource = SPessoa
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
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
    EditControls = <>
    RowsHeight = 19
    TitleRowHeight = 19
    Columns = <
      item
        Expanded = False
        FieldName = 'FANTASIA'
        Title.Caption = 'Nome'
        Width = 212
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SEXO'
        Title.Caption = 'Sexo'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_CATEGORIA'
        Title.Caption = 'Categoria'
        Width = 241
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_CORRIDA'
        Title.Caption = 'N'#186
        Width = 66
        Visible = True
      end>
  end
  object edtFANTASIA: TDBEdit
    Left = 165
    Top = 289
    Width = 313
    Height = 23
    CharCase = ecUpperCase
    DataField = 'FANTASIA'
    DataSource = SPessoa
    TabOrder = 3
  end
  object dbcbbSEXO: TDBComboBox
    Left = 165
    Top = 318
    Width = 145
    Height = 23
    Style = csDropDownList
    DataField = 'SEXO'
    DataSource = SPessoa
    Items.Strings = (
      'MASCULINO'
      'FEMININO')
    TabOrder = 4
  end
  object CD_CATEGORIA: TJvDBComboBox
    Left = 165
    Top = 347
    Width = 313
    Height = 23
    DataField = 'CD_CATEGORIA'
    DataSource = SPessoa
    TabOrder = 5
    ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
    ListSettings.OutfilteredValueFont.Color = clRed
    ListSettings.OutfilteredValueFont.Height = -12
    ListSettings.OutfilteredValueFont.Name = 'Segoe UI'
    ListSettings.OutfilteredValueFont.Style = []
  end
  object JvDBNavigator1: TJvDBNavigator
    Left = 210
    Top = 439
    Width = 224
    Height = 25
    DataSource = SPessoa
    VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel]
    TabOrder = 7
  end
  object edtPsq: TEdit
    Left = 194
    Top = 8
    Width = 240
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object btnPesquisar: TButton
    Left = 440
    Top = 8
    Width = 120
    Height = 21
    Caption = 'Pesquisar'
    TabOrder = 1
    OnClick = btnPesquisarClick
  end
  object edtNR_CORRIDA: TDBEdit
    Left = 165
    Top = 376
    Width = 145
    Height = 23
    CharCase = ecUpperCase
    DataField = 'NR_CORRIDA'
    DataSource = SPessoa
    TabOrder = 6
  end
  object QPessoa: TFDQuery
    BeforePost = QPessoaBeforePost
    AfterPost = QPessoaAfterPost
    Connection = DMD_Dados.con
    SQL.Strings = (
      'SELECT '
      'PESSOA.CODIGO,'
      'PESSOA.FANTASIA,'
      'PESSOA.SEXO,'
      'PESSOA.CD_CATEGORIA, '
      'PESSOA.NR_CORRIDA,'
      'PESSOA.TIPO,'
      'PESSOA.ENDERECO,'
      'PESSOA.NUMERO,'
      'PESSOA.CODMUN,'
      'PESSOA.UF,'
      'PESSOA.EMPRESA,'
      'PESSOA.CNPJ,'
      'PESSOA.IE,'
      'PESSOA.CEP,'
      'PESSOA.RAZAO,'
      'PESSOA.MUNICIPIO,'
      'PESSOA.BAIRRO,'
      'PESSOA.FORN,'
      'PESSOA.FUN,'
      'PESSOA.CLI,'
      'PESSOA.FAB,'
      'PESSOA.TRAN,    '
      'PESSOA.ADM,'
      'PESSOA.ATIVO,'
      'CATEGORIA.DS_CATEGORIA'
      ''
      'FROM'
      'PESSOA'
      ''
      'LEFT JOIN CATEGORIA ON'
      'CATEGORIA.CD_CATEGORIA = PESSOA.CD_CATEGORIA'
      ''
      'WHERE'
      'PESSOA.FANTASIA LIKE :FANTASIA'
      ''
      'ORDER BY PESSOA.FANTASIA')
    Left = 328
    Top = 144
    ParamData = <
      item
        Name = 'FANTASIA'
        DataType = ftString
        ParamType = ptInput
        Size = 50
        Value = Null
      end>
    object QPessoaFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Origin = 'FANTASIA'
      Required = True
      Size = 50
    end
    object QPessoaSEXO: TStringField
      FieldName = 'SEXO'
      Origin = 'SEXO'
      Size = 10
    end
    object QPessoaCD_CATEGORIA: TIntegerField
      FieldName = 'CD_CATEGORIA'
      Origin = 'CD_CATEGORIA'
    end
    object QPessoaDS_CATEGORIA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_CATEGORIA'
      Origin = 'DS_CATEGORIA'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object QPessoaNR_CORRIDA: TStringField
      FieldName = 'NR_CORRIDA'
      Origin = 'NR_CORRIDA'
      Size = 100
    end
    object QPessoaCODIGO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QPessoaTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
      Size = 10
    end
    object QPessoaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Required = True
      Size = 50
    end
    object QPessoaNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Required = True
      Size = 10
    end
    object QPessoaCODMUN: TIntegerField
      FieldName = 'CODMUN'
      Origin = 'CODMUN'
      Required = True
    end
    object QPessoaUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Required = True
      Size = 2
    end
    object QPessoaEMPRESA: TSmallintField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      Required = True
    end
    object QPessoaCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Required = True
    end
    object QPessoaIE: TStringField
      FieldName = 'IE'
      Origin = 'IE'
      Required = True
    end
    object QPessoaCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Required = True
      Size = 8
    end
    object QPessoaRAZAO: TStringField
      FieldName = 'RAZAO'
      Origin = 'RAZAO'
      Required = True
      Size = 100
    end
    object QPessoaMUNICIPIO: TStringField
      FieldName = 'MUNICIPIO'
      Origin = 'MUNICIPIO'
      Required = True
      Size = 35
    end
    object QPessoaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Required = True
      Size = 35
    end
    object QPessoaFORN: TStringField
      FieldName = 'FORN'
      Origin = 'FORN'
      Required = True
      Size = 1
    end
    object QPessoaFUN: TStringField
      FieldName = 'FUN'
      Origin = 'FUN'
      Required = True
      Size = 1
    end
    object QPessoaCLI: TStringField
      FieldName = 'CLI'
      Origin = 'CLI'
      Required = True
      Size = 1
    end
    object QPessoaFAB: TStringField
      FieldName = 'FAB'
      Origin = 'FAB'
      Required = True
      Size = 1
    end
    object QPessoaTRAN: TStringField
      FieldName = 'TRAN'
      Origin = 'TRAN'
      Required = True
      Size = 1
    end
    object QPessoaADM: TStringField
      FieldName = 'ADM'
      Origin = 'ADM'
      Required = True
      Size = 1
    end
    object QPessoaATIVO: TStringField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Required = True
      Size = 1
    end
  end
  object SPessoa: TDataSource
    DataSet = QPessoa
    Left = 296
    Top = 144
  end
  object QCategoria: TFDQuery
    Connection = DMD_Dados.con
    SQL.Strings = (
      'SELECT'
      '*'
      ''
      'FROM'
      'CATEGORIA'
      ''
      'ORDER BY CATEGORIA.DS_CATEGORIA')
    Left = 392
    Top = 144
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
  object QValidaNumero: TFDQuery
    Connection = DMD_Dados.con
    SQL.Strings = (
      'SELECT'
      'PESSOA.CODIGO'
      ''
      'FROM'
      'PESSOA'
      ''
      'WHERE'
      'PESSOA.NR_CORRIDA = :NR_CORRIDA')
    Left = 432
    Top = 144
    ParamData = <
      item
        Name = 'NR_CORRIDA'
        DataType = ftString
        ParamType = ptInput
        Size = 100
        Value = Null
      end>
    object QValidaNumeroCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
end
