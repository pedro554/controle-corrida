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
    QValidaNumero: TFDQuery;
    QValidaNumeroCODIGO: TIntegerField;
    QPessoaCODIGO: TIntegerField;
    QPessoaTIPO: TStringField;
    QPessoaENDERECO: TStringField;
    QPessoaNUMERO: TStringField;
    QPessoaCODMUN: TIntegerField;
    QPessoaUF: TStringField;
    QPessoaEMPRESA: TSmallintField;
    QPessoaCNPJ: TStringField;
    QPessoaIE: TStringField;
    QPessoaCEP: TStringField;
    QPessoaRAZAO: TStringField;
    QPessoaMUNICIPIO: TStringField;
    QPessoaBAIRRO: TStringField;
    QPessoaFORN: TStringField;
    QPessoaFUN: TStringField;
    QPessoaCLI: TStringField;
    QPessoaFAB: TStringField;
    QPessoaTRAN: TStringField;
    QPessoaADM: TStringField;
    QPessoaATIVO: TStringField;
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
var
  q: TFDQuery;
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

q := tfdquery.Create(nil);
q.Connection := DMD_Dados.con;
try
  q.Open('SELECT GEN_ID(GEN_PESSOA, 1) FROM RDB$DATABASE;');
  QPessoaCODIGO.AsInteger := q.FieldByName('GEN_ID').AsInteger;
  QPessoaTIPO.AsString := 'FISICA';
  QPessoaENDERECO.AsString := 'NAO INFORMADO';
  QPessoaNUMERO.AsString := 'NAO INFORMADO';
  QPessoaCODMUN.AsInteger := 1;
  QPessoaUF.AsString := 'RS';
  QPessoaEMPRESA.AsInteger := 1;
  QPessoaCNPJ.AsString := 'NAO INFORMADO';
  QPessoaIE.AsString := 'NAO INFORMADO';
  QPessoaCEP.AsString := 'NAO INFORMADO';
  QPessoaRAZAO.AsString := 'NAO INFORMADO';
  QPessoaMUNICIPIO.AsString := 'NAO INFORMADO';
  QPessoaBAIRRO.AsString := 'NAO INFORMADO';
  QPessoaFORN.AsString := 'NAO INFORMADO';
  QPessoaFUN.AsString := 'NAO INFORMADO';
  QPessoaCLI.AsString := 'NAO INFORMADO';
  QPessoaFAB.AsString := 'NAO INFORMADO';
  QPessoaTRAN.AsString := 'NAO INFORMADO';
  QPessoaADM.AsString := 'NAO INFORMADO';
  QPessoaATIVO.AsString := 'S';
finally
  FreeAndNil(q);
end;
end;

function TFCad_Pessoa.ValidaNumero: Boolean;
begin
QValidaNumero.Close;
QValidaNumero.ParamByName('NR_CORRIDA').AsString := QPessoaNR_CORRIDA.AsString;
QValidaNumero.Open;

Result := QValidaNumero.IsEmpty;
end;

end.
