object FFiltroImpressao: TFFiltroImpressao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Filtro Impressao'
  ClientHeight = 176
  ClientWidth = 626
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 112
    Top = 66
    Width = 51
    Height = 15
    Caption = 'Categoria'
  end
  object btnImprimir: TButton
    Left = 253
    Top = 92
    Width = 120
    Height = 21
    Caption = 'Imprimir'
    TabOrder = 1
    OnClick = btnImprimirClick
  end
  object cbCategoria: TJvDBComboBox
    Left = 169
    Top = 63
    Width = 289
    Height = 23
    DataField = 'CD_CATEGORIA'
    TabOrder = 0
    ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
    ListSettings.OutfilteredValueFont.Color = clRed
    ListSettings.OutfilteredValueFont.Height = -12
    ListSettings.OutfilteredValueFont.Name = 'Segoe UI'
    ListSettings.OutfilteredValueFont.Style = []
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
      'ORDER BY'
      'CD_CATEGORIA')
    Left = 400
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
  object SCategoria: TDataSource
    DataSet = QCategoria
    Left = 368
    Top = 16
  end
end
