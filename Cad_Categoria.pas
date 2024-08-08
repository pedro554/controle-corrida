unit Cad_Categoria;

interface

uses
  DM,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid,
  JvDBControls;

type
  TFCad_Categoria = class(TForm)
    lbl1: TLabel;
    edtDS_CATEGORIA: TDBEdit;
    QCategoria: TFDQuery;
    SCategoria: TDataSource;
    QCategoriaDS_CATEGORIA: TStringField;
    JvDBGrid1: TJvDBGrid;
    JvDBNavigator1: TJvDBNavigator;
    QCategoriaCD_CATEGORIA: TAutoIncField;
    edtPsq: TEdit;
    lbl2: TLabel;
    btnPesquisar: TButton;
    procedure FormShow(Sender: TObject);
    procedure QCategoriaBeforePost(DataSet: TDataSet);
    procedure QCategoriaAfterPost(DataSet: TDataSet);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCad_Categoria: TFCad_Categoria;

implementation

{$R *.dfm}

procedure TFCad_Categoria.btnPesquisarClick(Sender: TObject);
begin
QCategoria.Close;
QCategoria.ParamByName('DS_CATEGORIA').AsString := '%' + edtPsq.Text + '%';
QCategoria.Open;
end;

procedure TFCad_Categoria.FormShow(Sender: TObject);
begin
btnPesquisarClick(nil);
end;

procedure TFCad_Categoria.QCategoriaAfterPost(DataSet: TDataSet);
begin
QCategoria.Close;
QCategoria.Open;
end;

procedure TFCad_Categoria.QCategoriaBeforePost(DataSet: TDataSet);
begin
if QCategoriaDS_CATEGORIA.AsString = EmptyStr then
  raise Exception.Create('Informe a descrição da categoria!');
end;

end.
