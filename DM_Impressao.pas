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
    TRelDS_CATEGORIACABECALHO: TStringField;
    TRelSEXO: TStringField;
    QTopGeral: TFDQuery;
    QTopGeralNR_NUMERO: TStringField;
    QTopGeralDT_TEMPO: TTimeField;
    QTopGeralDT_INICIO: TTimeField;
    QTopGeralDT_FIM: TTimeField;
    QTopGeralNR_POSICAOGERAL: TIntegerField;
    QTopGeralST_FINALIZADA: TBooleanField;
    QTopGeralCD_CATEGORIA: TIntegerField;
    QTopGeralFANTASIA: TStringField;
    QTopGeralDS_CATEGORIA: TStringField;
    QTopGeralNR_KILOMETRAGEM: TCurrencyField;
  private
    procedure CarregaDados(ACategoria: Integer; ASexo: String; AKm: String);
    procedure CarregaTopGeral(ASexo: String; AKm: String);
    { Private declarations }
  public
    procedure Imprime(ACategoria: Integer; ASexo: String; AKm: String);
    { Public declarations }
  end;

var
  DMD_Impressao: TDMD_Impressao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMD_Impressao }

procedure TDMD_Impressao.CarregaDados(ACategoria: Integer; ASexo: String; AKm: String);
var
  i: integer;
begin
  QRel.Close;
  QRel.SQL.Clear;
  QRel.SQL.Add('SELECT PROVA.*, PESSOA.CD_CATEGORIA, PESSOA.FANTASIA, CATEGORIA.DS_CATEGORIA, CATEGORIA.NR_KILOMETRAGEM FROM PROVA ');
  QRel.SQL.Add('LEFT JOIN PESSOA ON PESSOA.NR_CORRIDA = PROVA.NR_NUMERO LEFT JOIN CATEGORIA ON CATEGORIA.CD_CATEGORIA = PESSOA.CD_CATEGORIA ');
  QRel.SQL.Add('WHERE PESSOA.SEXO LIKE :SEXO ');
  if (ACategoria <> 0) then
  begin
    QRel.SQL.Add('AND PESSOA.CD_CATEGORIA = :CD_CATEGORIA ');
    QRel.ParamByName('CD_CATEGORIA').AsInteger := ACategoria;
  end;
  QRel.SQL.Add('AND CATEGORIA.NR_KILOMETRAGEM = :NR_KILOMETRAGEM ');
  QRel.ParamByName('NR_KILOMETRAGEM').AsString := AKm;
  QRel.ParamByName('SEXO').AsString := '%' + ASexo;
  QRel.Open;

  CarregaTopGeral(ASexo, AKm);

  if QRel.IsEmpty then
    raise Exception.Create('Nenhum registro encontrado!');

  TRel.Close;
  TRel.Open;

  i := 1;
  while not QRel.Eof do
  begin
    if ACategoria <> 0 then
    begin
      if QTopGeral.Locate('NR_NUMERO', QRelNR_NUMERO.AsString, []) then
      begin
        QRel.Next;
        Continue;
      end;
    end;

    TRel.Append;
    TRelNR_POSICAO.AsInteger := i;
    TRelNR_NUMERO.AsString := QRelNR_NUMERO.AsString;
    TRelDT_TEMPO.AsDateTime := QRelDT_TEMPO.AsDateTime;
    TRelDT_INICIO.AsDateTime := QRelDT_INICIO.AsDateTime;
    TRelDT_FIM.AsDateTime := QRelDT_FIM.AsDateTime;
    TRelST_FINALIZADA.AsBoolean := QRelST_FINALIZADA.AsBoolean;
    TRelCD_CATEGORIA.AsInteger := QRelCD_CATEGORIA.AsInteger;
    TRelDS_CATEGORIA.AsString := QRelDS_CATEGORIA.AsString;
    TRelFANTASIA.AsString := QRelFANTASIA.AsString;
    TRelDT_PACE.AsDateTime := TRelDT_TEMPO.AsDateTime / QRelNR_KILOMETRAGEM.AsFloat;
    if ACategoria <> 0 then
      TRelDS_CATEGORIACABECALHO.AsString := QRelDS_CATEGORIA.AsString
    else
      TRelDS_CATEGORIACABECALHO.AsString := TRelDS_CATEGORIACABECALHO.AsString + ' Geral';
    TRelSEXO.AsString := ASexo;
    TRel.Post;
    QRel.Next;
    inc(i);
  end;
  if TRel.IsEmpty then
    raise Exception.Create('Nenhum registro encontrado!');
end;

procedure TDMD_Impressao.CarregaTopGeral(ASexo, AKm: String);
begin
QTopGeral.Close;
QTopGeral.ParamByName('SEXO').AsString := ASexo;
QTopGeral.ParamByName('NR_KILOMETRAGEM').AsString := AKm;
QTopGeral.Open;
end;

procedure TDMD_Impressao.Imprime(ACategoria: Integer; ASexo: String; AKm: String);
begin
  CarregaDados(ACategoria, ASexo, AKm);
  Relatorio.ShowReport;
end;

end.
