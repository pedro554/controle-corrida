object DMD_Dados: TDMD_Dados
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object con: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Database=F:\git\controle-corrida\Win32\Debug\DADOS.FDB'
      'DriverID=fB')
    LoginPrompt = False
    Left = 64
    Top = 64
  end
end
