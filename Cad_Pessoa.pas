unit Cad_Pessoa;

interface

uses
  DM,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls,
  JvExStdCtrls, JvCombobox, JvDBCombobox, JvDBControls;

type
  TFCad_Pessoa = class(TForm)
    JvDBGrid1: TJvDBGrid;
    QPessoa: TFDQuery;
    SPessoa: TDataSource;
    QPessoaFANTASIA: TStringField;
    QPessoaSEXO: TStringField;
    QPessoaCD_CATEGORIA: TIntegerField;
    QPessoaDS_CATEGORIA: TStringField;
    lbl1: TLabel;
    edtFANTASIA: TDBEdit;
    lbl2: TLabel;
    dbcbbSEXO: TDBComboBox;
    lbl3: TLabel;
    CD_CATEGORIA: TJvDBComboBox;
    JvDBNavigator1: TJvDBNavigator;
    QCategoria: TFDQuery;
    QCategoriaCD_CATEGORIA: TIntegerField;
    QCategoriaDS_CATEGORIA: TStringField;
    edtPsq: TEdit;
    lbl4: TLabel;
    btnPesquisar: TButton;
    lbl5: TLabel;
    edtNR_CORRIDA: TDBEdit;
    QPessoaNR_CORRIDA: TStringField;
    QPessoaCODIGO: TIntegerField;
    QValidaNumero: TFDQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    procedure FormShow(Sender: TObject);
    procedure QPessoaAfterPost(DataSet: TDataSet);
    procedure QPessoaBeforePost(DataSet: TDataSet);
    procedure btnPesquisarClick(Sender: TObject);
  private
    procedure CarregaCategoria;
    function ValidaNumero: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCad_Pessoa: TFCad_Pessoa;

implementation

{$R *.dfm}

procedure TFCad_Pessoa.btnPesquisarClick(Sender: TObject);
begin
QPessoa.Close;
QPessoa.ParamByName('FANTASIA').AsString := '%' + edtPsq.Text + '%';
QPessoa.Open;
end;

procedure TFCad_Pessoa.CarregaCategoria;
begin
QCategoria.Close;
QCategoria.Open;

CD_CATEGORIA.Items.Clear;
CD_CATEGORIA.Values.Clear;

while not QCategoria.Eof do
begin
  CD_CATEGORIA.Values.Add(QCategoriaCD_CATEGORIA.AsString);
  CD_CATEGORIA.Items.Add(QCategoriaDS_CATEGORIA.AsString);
  QCategoria.Next;
end;
end;

procedure TFCad_Pessoa.FormShow(Sender: TObject);
begin
CarregaCategoria;
btnPesquisarClick(nil);
end;

procedure TFCad_Pessoa.QPessoaAfterPost(DataSet: TDataSet);
begin
QPessoa.Close;
QPessoa.Open;
end;

procedure TFCad_Pessoa.QPessoaBeforePost(DataSet: TDataSet);
begin
if QPessoaFANTASIA.AsString = EmptyStr then
  raise Exception.Create('Informe o nome da pessoa!');
if QPessoaSEXO.AsString = EmptyStr then
  raise Exception.Create('Informe o sexo da pessoa');
if QPessoaCD_CATEGORIA.AsInteger = 0 then
  raise Exception.Create('Informe a categoria da pessoa!');
if QPessoaNR_CORRIDA.AsString = EmptyStr then
  raise Exception.Create('Informe um número!');
if not ValidaNumero then
  raise Exception.Create('Número ja cadastrado!');
end;

function TFCad_Pessoa.ValidaNumero: Boolean;
begin
QValidaNumero.Close;
QValidaNumero.ParamByName('NR_CORRIDA').AsString := QPessoaNR_CORRIDA.AsString;
QValidaNumero.Open;

Result := QValidaNumero.IsEmpty;
end;

end.
