object FPrincipal: TFPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = mm1
  Position = poScreenCenter
  WindowState = wsMaximized
  TextHeight = 15
  object mm1: TMainMenu
    Left = 112
    Top = 328
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object Categorias1: TMenuItem
        Caption = 'Categorias'
        OnClick = Categorias1Click
      end
      object Pessoa1: TMenuItem
        Caption = 'Pessoa'
        OnClick = Pessoa1Click
      end
    end
    object ControlarProva1: TMenuItem
      Caption = 'Controlar Prova'
      OnClick = ControlarProva1Click
    end
  end
end
