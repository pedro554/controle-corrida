unit DM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef;

type
  TDMD_Dados = class(TDataModule)
    con: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure ConectarBanco;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMD_Dados: TDMD_Dados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMD_Dados }

procedure TDMD_Dados.ConectarBanco;
begin
try
  con.Connected := False;
  con.Params.Database := GetCurrentDir + '\DADOS.FDB';
  con.Connected;
except
  on e: exception do
    raise Exception.Create('Falha ao conectar no banco de dados: ' + e.Message);
end;
end;

procedure TDMD_Dados.DataModuleCreate(Sender: TObject);
begin
ConectarBanco;
end;

end.
