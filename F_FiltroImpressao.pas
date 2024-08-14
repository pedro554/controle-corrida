unit F_FiltroImpressao;

interface

uses
  DM,
  DM_Impressao,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  JvExStdCtrls, JvCombobox, JvDBCombobox, JvMemoryDataset;

type
  TFFiltroImpressao = class(TForm)
    Label1: TLabel;
    btnImprimir: TButton;
    QCategoria: TFDQuery;
    QCategoriaCD_CATEGORIA: TIntegerField;
    QCategoriaDS_CATEGORIA: TStringField;
    cbCategoria: TJvDBComboBox;
    SCategoria: TDataSource;
    procedure btnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    DMDImpressao: TDMD_Impressao;
    procedure CarregaCategoria;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFiltroImpressao: TFFiltroImpressao;

implementation

{$R *.dfm}

{ TFFiltroImpressao }

procedure TFFiltroImpressao.btnImprimirClick(Sender: TObject);
begin
  DMDImpressao := TDMD_Impressao.Create(Self);
  try
    DMDImpressao.Imprime(cbCategoria.Values[cbCategoria.ItemIndex].ToInteger);
  finally
    DMDImpressao.Free;
  end;
end;

procedure TFFiltroImpressao.CarregaCategoria;
begin
QCategoria.Close;
QCategoria.Open;

cbCategoria.Items.Clear;
cbCategoria.Items.Add('Geral');
cbCategoria.Values.Add('0');

while not QCategoria.Eof do
begin
  cbCategoria.Items.Add(QCategoriaDS_CATEGORIA.AsString);
  cbCategoria.Values.Add(QCategoriaCD_CATEGORIA.AsString);
  QCategoria.Next;
end;

cbCategoria.ItemIndex := 0;
end;

procedure TFFiltroImpressao.FormCreate(Sender: TObject);
begin
CarregaCategoria;
end;

end.
