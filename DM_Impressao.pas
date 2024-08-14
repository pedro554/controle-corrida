unit DM_Impressao;

interface

uses
  DM,
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass, frxDBSet,
  JvMemoryDataset;

type
  TDMD_Impressao = class(TDataModule)
    QRel: TFDQuery;
    QRelNR_NUMERO: TStringField;
    QRelDT_TEMPO: TTimeField;
    QRelDT_INICIO: TTimeField;
    QRelDT_FIM: TTimeField;
    QRelNR_POSICAOGERAL: TIntegerField;
    QRelST_FINALIZADA: TBooleanField;
    QRelCD_CATEGORIA: TIntegerField;
    Relatorio: TfrxReport;
    SRel: TfrxDBDataset;
    QRelDS_CATEGORIA: TStringField;
    QRelFANTASIA: TStringField;
    TRel: TJvMemoryData;
    TRelNR_NUMERO: TStringField;
    TRelDT_TEMPO: TTimeField;
    TRelDT_INICIO: TTimeField;
    TRelDT_FIM: TTimeField;
    TRelST_FINALIZADA: TBooleanField;
    TRelCD_CATEGORIA: TIntegerField;
    TRelDS_CATEGORIA: TStringField;
    TRelFANTASIA: TStringField;
    TRelNR_POSICAO: TIntegerField;
    TRelDT_PACE: TTimeField;
    QRelNR_KILOMETRAGEM: TCurrencyField;
  private
    procedure CarregaDados(ACategoria: Integer);
    { Private declarations }
  public
    procedure Imprime(ACategoria: Integer);
    { Public declarations }
  end;

var
  DMD_Impressao: TDMD_Impressao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMD_Impressao }

procedure TDMD_Impressao.CarregaDados(ACategoria: Integer);
var
  i: integer;
begin
  QRel.Close;
  QRel.SQL.Clear;
  QRel.SQL.Add('SELECT PROVA.*, PESSOA.CD_CATEGORIA, PESSOA.FANTASIA, CATEGORIA.DS_CATEGORIA, CATEGORIA.NR_KILOMETRAGEM FROM PROVA ');
  QRel.SQL.Add('LEFT JOIN PESSOA ON PESSOA.NR_CORRIDA = PROVA.NR_NUMERO LEFT JOIN CATEGORIA ON CATEGORIA.CD_CATEGORIA = PESSOA.CD_CATEGORIA ');
  if ACategoria <> 0 then
  begin
    QRel.SQL.Add('WHERE PESSOA.CD_CATEGORIA = :CD_CATEGORIA ');
    QRel.ParamByName('CD_CATEGORIA').AsInteger := ACategoria;
  end;
  QRel.Open;

  if QRel.IsEmpty then
    raise Exception.Create('Nenhum registro encontrado!');

  TRel.Close;
  TRel.Open;

  i := 1;
  while not QRel.Eof do
  begin
    TRel.Append;
    TRelNR_POSICAO.AsInteger := i;
    TRelNR_NUMERO.AsString := QRelNR_NUMERO.AsString;
    TRelDT_TEMPO.AsDateTime := QRelDT_TEMPO.AsDateTime;
    TRelDT_INICIO.AsDateTime := QRelDT_INICIO.AsDateTime;
    TRelDT_FIM.AsDateTime := QRelDT_FIM.AsDateTime;
    TRelST_FINALIZADA.AsBoolean := QRelST_FINALIZADA.AsBoolean;
    if ACategoria <> 0 then
    begin
      TRelCD_CATEGORIA.AsInteger := QRelCD_CATEGORIA.AsInteger;
      TRelDS_CATEGORIA.AsString := QRelDS_CATEGORIA.AsString;
    end
    else
    begin
      TRelCD_CATEGORIA.AsInteger := 0;
      TRelDS_CATEGORIA.AsString := 'Geral';
    end;
    TRelFANTASIA.AsString := QRelFANTASIA.AsString;
    TRelDT_PACE.AsDateTime := TRelDT_TEMPO.AsDateTime / QRelNR_KILOMETRAGEM.AsFloat;
    TRel.Post;
    QRel.Next;
    inc(i);
  end;
end;

procedure TDMD_Impressao.Imprime(ACategoria: Integer);
begin
  CarregaDados(ACategoria);
  Relatorio.ShowReport;
end;

end.
