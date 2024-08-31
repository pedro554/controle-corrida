object DMD_Impressao: TDMD_Impressao
  Height = 480
  Width = 640
  object QRel: TFDQuery
    Connection = DMD_Dados.con
    SQL.Strings = (
      'SELECT'
      'PROVA.*,'
      'PESSOA.CD_CATEGORIA,'
      'PESSOA.FANTASIA,'
      'CATEGORIA.DS_CATEGORIA,'
      'CATEGORIA.NR_KILOMETRAGEM'
      ''
      'FROM'
      'PROVA'
      ''
      'LEFT JOIN PESSOA ON'
      'PESSOA.NR_CORRIDA = PROVA.NR_NUMERO'
      ''
      'LEFT JOIN CATEGORIA ON'
      'CATEGORIA.CD_CATEGORIA = PESSOA.CD_CATEGORIA')
    Left = 304
    Top = 224
    object QRelNR_NUMERO: TStringField
      FieldName = 'NR_NUMERO'
      Origin = 'NR_NUMERO'
      Required = True
      Size = 100
    end
    object QRelDT_TEMPO: TTimeField
      FieldName = 'DT_TEMPO'
      Origin = 'DT_TEMPO'
    end
    object QRelDT_INICIO: TTimeField
      FieldName = 'DT_INICIO'
      Origin = 'DT_INICIO'
    end
    object QRelDT_FIM: TTimeField
      FieldName = 'DT_FIM'
      Origin = 'DT_FIM'
    end
    object QRelNR_POSICAOGERAL: TIntegerField
      FieldName = 'NR_POSICAOGERAL'
      Origin = 'NR_POSICAOGERAL'
      Required = True
    end
    object QRelST_FINALIZADA: TBooleanField
      FieldName = 'ST_FINALIZADA'
      Origin = 'ST_FINALIZADA'
    end
    object QRelCD_CATEGORIA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CD_CATEGORIA'
      Origin = 'CD_CATEGORIA'
      ProviderFlags = []
      ReadOnly = True
    end
    object QRelDS_CATEGORIA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_CATEGORIA'
      Origin = 'DS_CATEGORIA'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object QRelFANTASIA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FANTASIA'
      Origin = 'FANTASIA'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object QRelNR_KILOMETRAGEM: TCurrencyField
      AutoGenerateValue = arDefault
      FieldName = 'NR_KILOMETRAGEM'
      Origin = 'NR_KILOMETRAGEM'
      ProviderFlags = []
      ReadOnly = True
      currency = False
    end
  end
  object Relatorio: TfrxReport
    Version = '2022.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45516.559475544000000000
    ReportOptions.LastChange = 45534.876405057870000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 480
    Top = 296
    Datasets = <
      item
        DataSet = SRel
        DataSetName = 'Dados'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 3.000000000000000000
      RightMargin = 3.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object Header1: TfrxHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 75.590600000000000000
        Top = 18.897650000000000000
        Width = 771.024120000000000000
        object DadosDS_CATEGORIA: TfrxMemoView
          IndexTag = 1
          Align = baWidth
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 771.024120000000000000
          Height = 37.795300000000000000
          DataSet = SRel
          DataSetName = 'Dados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -29
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Dados."DS_CATEGORIACABECALHO"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 68.031540000000000000
          Top = 56.692950000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataSet = SRel
          DataSetName = 'Dados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'N'#250'mero')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 139.842610000000000000
          Top = 56.692950000000000000
          Width = 272.126160000000000000
          Height = 18.897650000000000000
          DataSet = SRel
          DataSetName = 'Dados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Nome')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 589.606680000000000000
          Top = 56.692950000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataSet = SRel
          DataSetName = 'Dados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Tempo')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Top = 56.692950000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DataSet = SRel
          DataSetName = 'Dados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Posi'#231#227'o')
          ParentFont = False
        end
        object DadosDT_INICIO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Width = 725.669760000000000000
          Height = 15.118120000000000000
          DataSet = SRel
          DataSetName = 'Dados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'In'#237'cio: [Dados."DT_INICIO"]      Fim: [Dados."DT_FIM"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 676.535870000000000000
          Top = 56.692950000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataSet = SRel
          DataSetName = 'Dados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Pace')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 411.968770000000000000
          Top = 56.692950000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          DataSet = SRel
          DataSetName = 'Dados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Categoria')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 15.118120000000000000
        Top = 117.165430000000000000
        Width = 771.024120000000000000
        DataSet = SRel
        DataSetName = 'Dados'
        RowCount = 0
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Dados."NR_POSICAO"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 68.031540000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Dados."NR_NUMERO"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 139.842610000000000000
          Width = 272.126160000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[Dados."FANTASIA"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 589.606680000000000000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Dados."DT_TEMPO"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 676.535870000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DataField = 'DT_PACE'
          DataSet = SRel
          DataSetName = 'Dados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Dados."DT_PACE"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 411.968770000000000000
          Width = 177.637910000000000000
          Height = 15.118120000000000000
          DataField = 'DS_CATEGORIA'
          DataSet = SRel
          DataSetName = 'Dados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Dados."DS_CATEGORIA"]')
          ParentFont = False
        end
      end
    end
  end
  object SRel: TfrxDBDataset
    UserName = 'Dados'
    CloseDataSource = False
    FieldAliases.Strings = (
      'NR_NUMERO=NR_NUMERO'
      'DT_TEMPO=DT_TEMPO'
      'DT_INICIO=DT_INICIO'
      'DT_FIM=DT_FIM'
      'ST_FINALIZADA=ST_FINALIZADA'
      'CD_CATEGORIA=CD_CATEGORIA'
      'DS_CATEGORIA=DS_CATEGORIA'
      'FANTASIA=FANTASIA'
      'NR_POSICAO=NR_POSICAO'
      'DT_PACE=DT_PACE'
      'DS_CATEGORIACABECALHO=DS_CATEGORIACABECALHO')
    DataSet = TRel
    BCDToCurrency = False
    DataSetOptions = []
    Left = 304
    Top = 280
  end
  object TRel: TJvMemoryData
    FieldDefs = <
      item
        Name = 'NR_NUMERO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DT_TEMPO'
        DataType = ftTime
      end
      item
        Name = 'DT_INICIO'
        DataType = ftTime
      end
      item
        Name = 'DT_FIM'
        DataType = ftTime
      end
      item
        Name = 'ST_FINALIZADA'
        DataType = ftBoolean
      end
      item
        Name = 'CD_CATEGORIA'
        DataType = ftInteger
      end
      item
        Name = 'DS_CATEGORIA'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'FANTASIA'
        DataType = ftString
        Size = 50
      end>
    Left = 408
    Top = 224
    object TRelNR_NUMERO: TStringField
      FieldName = 'NR_NUMERO'
      Origin = 'NR_NUMERO'
      Size = 100
    end
    object TRelDT_TEMPO: TTimeField
      FieldName = 'DT_TEMPO'
      Origin = 'DT_TEMPO'
    end
    object TRelDT_INICIO: TTimeField
      FieldName = 'DT_INICIO'
      Origin = 'DT_INICIO'
    end
    object TRelDT_FIM: TTimeField
      FieldName = 'DT_FIM'
      Origin = 'DT_FIM'
    end
    object TRelST_FINALIZADA: TBooleanField
      FieldName = 'ST_FINALIZADA'
      Origin = 'ST_FINALIZADA'
    end
    object TRelCD_CATEGORIA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CD_CATEGORIA'
      Origin = 'CD_CATEGORIA'
      ProviderFlags = []
    end
    object TRelDS_CATEGORIA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_CATEGORIA'
      Origin = 'DS_CATEGORIA'
      ProviderFlags = []
      Size = 100
    end
    object TRelFANTASIA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FANTASIA'
      Origin = 'FANTASIA'
      ProviderFlags = []
      Size = 50
    end
    object TRelNR_POSICAO: TIntegerField
      FieldName = 'NR_POSICAO'
    end
    object TRelDT_PACE: TTimeField
      FieldName = 'DT_PACE'
    end
    object TRelDS_CATEGORIACABECALHO: TStringField
      FieldName = 'DS_CATEGORIACABECALHO'
      Size = 255
    end
  end
end
