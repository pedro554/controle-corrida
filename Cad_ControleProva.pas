unit Cad_ControleProva;

interface

uses
  DM,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  IdBaseComponent, IdAntiFreezeBase, IdAntiFreeze, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Mask, Vcl.DBCtrls,
  JvMemoryDataset, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid,
  JvComponentBase, JvEnterTab, JvExStdCtrls, JvCombobox;

type
  TFCad_ControleProva = class(TForm)
    Timer: TTimer;
    IdAntiFreeze1: TIdAntiFreeze;
    QProva: TFDQuery;
    QProvaNR_NUMERO: TStringField;
    QProvaDT_TEMPO: TTimeField;
    QProvaDT_INICIO: TTimeField;
    QProvaDT_FIM: TTimeField;
    QProvaNR_POSICAOGERAL: TIntegerField;
    SProva: TDataSource;
    Panel1: TPanel;
    lblTempo: TLabel;
    JvDBGrid1: TJvDBGrid;
    QProvaFANTASIA: TStringField;
    QProvaCD_CATEGORIA: TIntegerField;
    QProvaDS_CATEGORIA: TStringField;
    QValidaNumero: TFDQuery;
    Transacao: TFDTransaction;
    QValidaNumeroInserido: TFDQuery;
    QValidaNumeroNR_CORRIDA: TStringField;
    QValidaNumeroInseridoNR_NUMERO: TStringField;
    JvEnterAsTab1: TJvEnterAsTab;
    QCategoria: TFDQuery;
    QCategoriaCD_CATEGORIA: TIntegerField;
    QCategoriaDS_CATEGORIA: TStringField;
    QProvaST_FINALIZADA: TBooleanField;
    Panel2: TPanel;
    btnIniciar: TButton;
    btnParar: TButton;
    btnSair: TButton;
    btnRemover: TButton;
    btnAjustaPosGeral: TButton;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btnSalvar: TButton;
    NR_NUMERO: TEdit;
    cbFiltro: TJvComboBox;
    procedure btnIniciarClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure btnPararClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRemoverClick(Sender: TObject);
    procedure btnAjustaPosGeralClick(Sender: TObject);
    procedure cbFiltroChange(Sender: TObject);
  private
    HoraInicio: TDateTime;
    PosicaoGeral: Integer;
    function RetornaTempo: TDateTime;
    procedure AjustaPosicaoGeral(AFinalizada: Boolean);
    function RetornaPesquisa(ACampo, ATabela, ACampoWhere, AValor: String): String;
    function NumeroCadastrado: Boolean;
    function NumeroInserido: Boolean;
    procedure CarregaFiltro;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCad_ControleProva: TFCad_ControleProva;

implementation

{$R *.dfm}

procedure TFCad_ControleProva.AjustaPosicaoGeral(AFinalizada: Boolean);
begin
QProva.DisableControls;
QProva.First;
PosicaoGeral := 1;
try
  while not QProva.Eof do
  begin
    QProva.Edit;
    QProvaNR_POSICAOGERAL.AsInteger := PosicaoGeral;
    QProvaST_FINALIZADA.AsBoolean := AFinalizada;
    QProva.Post;
    Inc(PosicaoGeral);

    QProva.Next;
  end;
finally
  QProva.EnableControls;
end;
end;

procedure TFCad_ControleProva.btnAjustaPosGeralClick(Sender: TObject);
begin
AjustaPosicaoGeral(Timer.Enabled);
end;

procedure TFCad_ControleProva.btnIniciarClick(Sender: TObject);
begin
if Timer.Enabled then
  raise Exception.Create('Prova em andamento!');
HoraInicio    := Now;
Timer.Enabled := True;
end;

procedure TFCad_ControleProva.btnPararClick(Sender: TObject);
begin
if not Timer.Enabled then
  Exit;

if Application.MessageBox('Deseja realmente finalizar a prova?', 'Controle Prova', MB_YESNO) = mrNo then
  Exit;

Timer.Enabled := False;
lblTempo.Caption := '00:00:00';
AjustaPosicaoGeral(True);
end;

procedure TFCad_ControleProva.btnRemoverClick(Sender: TObject);
begin
if QProva.IsEmpty then
  Exit;

if Application.MessageBox('Deseja remover registro?', 'Controle Prova', MB_YESNO) = mrYes then
  QProva.Delete;
end;

procedure TFCad_ControleProva.btnSairClick(Sender: TObject);
begin
if Application.MessageBox('Deseja realmente sair?', 'Controle Prova', MB_YESNO) = mrYes then
  Self.Close;
end;

procedure TFCad_ControleProva.btnSalvarClick(Sender: TObject);
begin
if not Timer.Enabled then
  raise Exception.Create('Prova não iniciada!');

NR_NUMERO.SetFocus;

if Trim(NR_NUMERO.Text) = EmptyStr then
  raise Exception.Create('Informe um número!');

if (not NumeroCadastrado) or NumeroInserido then
  raise Exception.Create('Número não cadastrado ou já inserido nos registros abaixo!');

Transacao.StartTransaction;
try
  QProva.Append;
  QProvaNR_NUMERO.AsString        := NR_NUMERO.Text;
  QProvaDT_TEMPO.AsDateTime       := RetornaTempo;
  QProvaDT_INICIO.AsDateTime      := HoraInicio;
  QProvaDT_FIM.AsDateTime         := Now;
  QProvaNR_POSICAOGERAL.AsInteger := PosicaoGeral;
  QProvaFANTASIA.AsString         := RetornaPesquisa('FANTASIA', 'PESSOA', 'NR_CORRIDA', QProvaNR_NUMERO.AsString);
  QProvaCD_CATEGORIA.AsString     := RetornaPesquisa('CD_CATEGORIA', 'PESSOA', 'NR_CORRIDA', QProvaNR_NUMERO.AsString);
  QProvaDS_CATEGORIA.AsString     := RetornaPesquisa('DS_CATEGORIA', 'CATEGORIA', 'CD_CATEGORIA', QProvaCD_CATEGORIA.AsString);
  QProvaST_FINALIZADA.AsBoolean   := False;
  QProva.Post;
  Inc(PosicaoGeral);
  Transacao.Commit;
  NR_NUMERO.Clear;
except
  on e: exception do
  begin
    Transacao.Rollback;
    raise Exception.Create('Falha ao gravar registro!' + sLineBreak + e.Message);
  end;
end;
end;

procedure TFCad_ControleProva.CarregaFiltro;
begin
QCategoria.Close;
QCategoria.Open;

cbFiltro.Items.Clear;
cbFiltro.Items.Add('Geral');
while not QCategoria.Eof do
begin
  cbFiltro.Items.Add(QCategoriaDS_CATEGORIA.AsString);
  QCategoria.Next;
end;

cbFiltro.ItemIndex := 0;
end;

procedure TFCad_ControleProva.cbFiltroChange(Sender: TObject);
begin
QProva.Filtered := False;

if cbFiltro.ItemIndex = 0 then
begin
  QProva.Filter   := '';
  Exit;
end;

QProva.Filter := 'DS_CATEGORIA = ' + QuotedStr(cbFiltro.Text);
QProva.Filtered := True;
end;

procedure TFCad_ControleProva.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
QProva.Close;
end;

procedure TFCad_ControleProva.FormShow(Sender: TObject);
begin
QProva.Open;
PosicaoGeral := 1;
CarregaFiltro;

if (not QProva.IsEmpty) and (not QProvaST_FINALIZADA.AsBoolean) then
begin
  HoraInicio    := QProvaDT_INICIO.AsDateTime;
  Timer.Enabled := True;
end;
end;

function TFCad_ControleProva.NumeroCadastrado: Boolean;
begin
QValidaNumero.Close;
QValidaNumero.ParamByName('NR_CORRIDA').AsString := NR_NUMERO.Text;
QValidaNumero.Open;
Result := not QValidaNumero.IsEmpty;
end;

function TFCad_ControleProva.NumeroInserido: Boolean;
begin
QValidaNumeroInserido.Close;
QValidaNumeroInserido.ParamByName('NR_NUMERO').AsString := NR_NUMERO.Text;
QValidaNumeroInserido.Open;
Result := not QValidaNumeroInserido.IsEmpty;
end;

function TFCad_ControleProva.RetornaPesquisa(ACampo, ATabela, ACampoWhere, AValor: String): String;
var
  Q: TFDQuery;
begin
Q := TFDQuery.Create(nil);
try
  Q.Connection := DMD_Dados.con;
  Q.Open('SELECT ' + ACampo + ' FROM ' + ATabela + ' WHERE ' + ACampoWhere + '=' + AValor);
  Result := Q.FieldByName(ACampo).AsString;
finally
  Q.Free;
end;
end;

function TFCad_ControleProva.RetornaTempo: TDateTime;
begin
Result := Now - HoraInicio;
end;

procedure TFCad_ControleProva.TimerTimer(Sender: TObject);
begin
lblTempo.Caption := FormatDateTime('HH:mm:ss', RetornaTempo);
end;

end.
