unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TFPrincipal = class(TForm)
    mm1: TMainMenu;
    Cadastro1: TMenuItem;
    Categorias1: TMenuItem;
    Pessoa1: TMenuItem;
    ControlarProva1: TMenuItem;
    procedure Categorias1Click(Sender: TObject);
    procedure Pessoa1Click(Sender: TObject);
    procedure ControlarProva1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation
uses Cad_Categoria, Cad_Pessoa, Cad_ControleProva;

{$R *.dfm}

procedure TFPrincipal.Categorias1Click(Sender: TObject);
var
  FCad_Categoria: TFCad_Categoria;
begin
FCad_Categoria := TFCad_Categoria.Create(nil);
try
  FCad_Categoria.ShowModal;
finally
  FreeAndNil(FCad_Categoria);
end;
end;

procedure TFPrincipal.ControlarProva1Click(Sender: TObject);
var
  FCad_ControleProva: TFCad_ControleProva;
begin
FCad_ControleProva := TFCad_ControleProva.Create(nil);
try
  FCad_ControleProva.ShowModal;
finally
  FreeAndNil(FCad_ControleProva);
end;
end;

procedure TFPrincipal.Pessoa1Click(Sender: TObject);
var
  FCad_Pessoa: TFCad_Pessoa;
begin
FCad_Pessoa := TFCad_Pessoa.Create(nil);
try
  FCad_Pessoa.ShowModal;
finally
  FreeAndNil(FCad_Pessoa);
end;
end;

end.
