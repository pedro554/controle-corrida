program Controle_Prova;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {FPrincipal},
  Cad_Categoria in 'Cad_Categoria.pas' {FCad_Categoria},
  DM in 'DM.pas' {DMD_Dados: TDataModule},
  Cad_Pessoa in 'Cad_Pessoa.pas' {FCad_Pessoa},
  Cad_ControleProva in 'Cad_ControleProva.pas' {FCad_ControleProva},
  Vcl.Themes,
  Vcl.Styles,
  DM_Impressao in 'DM_Impressao.pas' {DMD_Impressao: TDataModule},
  F_FiltroImpressao in 'F_FiltroImpressao.pas' {FFiltroImpressao};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Smokey Quartz Kamri');
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TDMD_Dados, DMD_Dados);
  Application.Run;
end.
