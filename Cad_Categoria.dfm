object FCad_Categoria: TFCad_Categoria
  Left = 0
  Top = 0
  Caption = 'Cadastro de Categorias'
  ClientHeight = 396
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
    Left = 137
    Top = 309
    Width = 51
    Height = 15
    Caption = 'Descri'#231#227'o'
  end
  object lbl2: TLabel
    Left = 137
    Top = 11
    Width = 50
    Height = 15
    Caption = 'Pesquisar'
  end
  object edtDS_CATEGORIA: TDBEdit
    Left = 194
    Top = 306
    Width = 240
    Height = 23
    CharCase = ecUpperCase
    DataField = 'DS_CATEGORIA'
    DataSource = SCategoria
    TabOrder = 3
  end
  object JvDBGrid1: TJvDBGrid
    Left = 8
    Top = 37
    Width = 612
    Height = 249
    DataSource = SCategoria
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
        FieldName = 'DS_CATEGORIA'
        Title.Caption = 'Descri'#231#227'o'
        Width = 595
        Visible = True
      end>
  end
  object JvDBNavigator1: TJvDBNavigator
    Left = 194
    Top = 349
    Width = 240
    Height = 25
    Cursor = crHandPoint
    DataSource = SCategoria
    VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel]
    ConfirmDelete = False
    TabOrder = 4
  end
  object edtPsq: TEdit
    Left = 194
    Top = 8
    Width = 240
    Height = 23
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
  object QCategoria: TFDQuery
    BeforePost = QCategoriaBeforePost
    AfterPost = QCategoriaAfterPost
    Connection = DMD_Dados.con
    SQL.Strings = (
      'SELECT'
      ''
      '*'
      ''
      'FROM'
      'CATEGORIA'
      ''
      ''
      'WHERE '
      'DS_CATEGORIA LIKE :DS_CATEGORIA'
      ''
      'ORDER BY DS_CATEGORIA')
    Left = 352
    Top = 48
    ParamData = <
      item
        Name = 'DS_CATEGORIA'
        DataType = ftString
        ParamType = ptInput
        Size = 100
        Value = Null
      end>
    object QCategoriaDS_CATEGORIA: TStringField
      FieldName = 'DS_CATEGORIA'
      Origin = 'DS_CATEGORIA'
      Required = True
      Size = 100
    end
    object QCategoriaCD_CATEGORIA: TAutoIncField
      FieldName = 'CD_CATEGORIA'
    end
  end
  object SCategoria: TDataSource
    DataSet = QCategoria
    Left = 312
    Top = 48
  end
end
