unit Relatorio.View;

interface

uses
  System.SysUtils, System.Variants, System.Classes,
  Winapi.Windows, Winapi.Messages,  Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.CheckLst, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppVar,
  ppCtrls, ppPrnabl, ppBands, ppCache, ppDesignLayer, ppParameter,
  Estado.DAO, Cidade.DAO, Relatorio.DAO, Conexao.DAO, AdvGlassButton,
  AdvGlowButton, CurvyControls, AdvSmoothButton, Vcl.Imaging.pngimage,
  AdvSmoothPanel, ppViewr;

type
  TfrmRelatorio = class(TForm)
    pnlGeral: TPanel;
    pnlFooter: TPanel;
    ppRelatorioClientes: TppReport;
    ppDBRelatorioClientes: TppDBPipeline;
    dsRelatorioClientes: TDataSource;
    qryRelatorioClientes: TFDQuery;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    bandDetail: TppDetailBand;
    bandFooter: TppFooterBand;
    lblCabecalhoUF: TppLabel;
    lblCabecalhoTitulo: TppLabel;
    lnDivCabecalho: TppLine;
    lblCabecalhoID: TppLabel;
    lblCabecalhoNome: TppLabel;
    lblCabecalhoCPFCNPJ: TppLabel;
    lblCabecalhoEndereco: TppLabel;
    lblCabecalhoCidade: TppLabel;
    txtID: TppDBText;
    txtUF: TppDBText;
    txtCidade: TppDBText;
    txtEnderecoCompleto: TppDBText;
    txtCPFCNPJ: TppDBText;
    txtNome: TppDBText;
    svData: TppSystemVariable;
    svPage: TppSystemVariable;
    imgLogo: TppImage;
    viewRelatorioClientes: TppViewer;
    pnlDadosFiltro: TAdvSmoothPanel;
    ckcbCidade: TCheckListBox;
    ckcbUF: TCheckListBox;
    edtIdFinal: TEdit;
    edtIdInicial: TEdit;
    lblCidade: TLabel;
    lblIDConsulta: TLabel;
    lblIdFinal: TLabel;
    lblUF: TLabel;
    rdgFiltrosRelatorio: TRadioGroup;
    btnVisualizarRelatorio: TAdvSmoothButton;
    btnImprimirRelatorio: TAdvSmoothButton;
    bandHeader: TppHeaderBand;
    procedure ckcbUFClickCheck(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure rdgFiltrosRelatorioClick(Sender: TObject);
    procedure btnVisualizarRelatorioClick(Sender: TObject);
    procedure btnImprimirRelatorioClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    procedure ValidarFiltros;
    procedure CarregarRelatorio;
    procedure CarregarUFs;
    procedure CarregarCidades(mUF: String);
    function ItensMarcados(mCheck: TCheckListBox): String;
    function ObterTipoFiltro: TTipoFiltroRelatorio;
  end;

var
  frmRelatorio: TfrmRelatorio;

implementation

{$R *.dfm}

procedure TfrmRelatorio.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelatorio.CarregarCidades(mUF: String);
var
  DAO: TCidadeDAO;
  Qry: TFDQuery;
begin
  DAO := TCidadeDAO.Create;
  try
    Qry := DAO.ListarPorEstado(mUF);
    try
      if ckcbUF.SelCount = 1 then
        ckcbCidade.Items.Clear;

      while not Qry.Eof do
        begin
          ckcbCidade.Items.AddObject(
            Qry.FieldByName('NOME').AsString,
            TObject(Qry.FieldByName('ID').AsInteger));

          Qry.Next;
        end;

    finally
      Qry.Free;
    end;

  finally
    DAO.Free;
  end;
end;

procedure TfrmRelatorio.CarregarRelatorio;
var
  DAO: TRelatorioDAO;
begin
  ValidarFiltros;

  DAO := TRelatorioDAO.Create;
  try
    qryRelatorioClientes.Close;

    qryRelatorioClientes.SQL.Text :=
      DAO.GerarSQLRelatorio(
        StrToIntDef(edtIdInicial.Text, 0),
        StrToIntDef(edtIdFinal.Text, 0),
        ItensMarcados(ckcbCidade),
        ItensMarcados(ckcbUF),
        ObterTipoFiltro
      );

    qryRelatorioClientes.Open;

    if qryRelatorioClientes.IsEmpty then
      raise Exception.Create(
        'Nenhum registro encontrado para os filtros informados.'
      );

  finally
    DAO.Free;
  end;
end;

procedure TfrmRelatorio.CarregarUFs;
var
  DAO: TEstadoDAO;
  Qry: TFDQuery;
begin
  DAO := TEstadoDAO.Create;

  try
    Qry := DAO.ListarEstados;
    try
      ckcbUF.Items.Clear;

      while not Qry.Eof do
        begin
          ckcbUF.Items.Add(Qry.FieldByName('UF').AsString);
          Qry.Next;
        end;

    finally
      Qry.Free;
    end;

  finally
    DAO.Free;
  end;
end;

procedure TfrmRelatorio.ckcbUFClickCheck(Sender: TObject);
var
  DAO: TCidadeDAO;
  Qry: TFDQuery;
  I: Integer;
begin
  if ckcbUF.SelCount = 1 then
    ckcbCidade.Items.Clear;

  DAO := TCidadeDAO.Create;
  try
    for I := 0 to ckcbUF.Count - 1 do
    begin
      if ckcbUF.Checked[I] then
      begin
        Qry := DAO.ListarPorEstado(ckcbUF.Items[I]);
        try
          while not Qry.Eof do
            begin
              if ckcbCidade.Items.IndexOf(Qry.FieldByName('NOME').AsString) = -1 then
                ckcbCidade.Items.Add(Qry.FieldByName('NOME').AsString);
              
              Qry.Next;
            end;

        finally
          Qry.Free;
        end;
      end;
    end;

  finally
    DAO.Free;
  end;
end;

procedure TfrmRelatorio.FormCreate(Sender: TObject);
begin
  qryRelatorioClientes.Connection := TConexao.GetConnection;
  viewRelatorioClientes.Report := ppRelatorioClientes;

  CarregarUFs;

  rdgFiltrosRelatorio.ItemIndex := 0;
  rdgFiltrosRelatorioClick(nil);
end;

procedure TfrmRelatorio.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  if (Key = VK_RETURN) and
     not (ActiveControl is TCustomButton) then
  begin
    Key := 0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

function TfrmRelatorio.ItensMarcados(mCheck: TCheckListBox): String;
var
  I: Integer;
begin
  Result := '';

  for I := 0 to mCheck.Count - 1 do
  begin
    if mCheck.Checked[I] then
    begin
      if Result <> '' then
        Result := Result + ',';

      Result :=
        Result +
        QuotedStr(
          mCheck.Items[I]
        );
    end;
  end;
end;

function TfrmRelatorio.ObterTipoFiltro: TTipoFiltroRelatorio;
begin
  case rdgFiltrosRelatorio.ItemIndex of
    0: Result := tfTodos;
    1: Result := tfFaixaID;
    2: Result := tfCidadeEstado;
  else
    Result := tfTodos;
  end;
end;

procedure TfrmRelatorio.rdgFiltrosRelatorioClick(Sender: TObject);
begin
  edtIdInicial.Enabled := rdgFiltrosRelatorio.ItemIndex = 1;
  edtIdFinal.Enabled := rdgFiltrosRelatorio.ItemIndex = 1;
  ckcbCidade.Enabled := rdgFiltrosRelatorio.ItemIndex = 2;
  ckcbUF.Enabled := rdgFiltrosRelatorio.ItemIndex = 2;
end;

procedure TfrmRelatorio.ValidarFiltros;
begin
  case ObterTipoFiltro of

    tfFaixaID:
      begin
        if (Trim(edtIdInicial.Text) = '') and
           (Trim(edtIdFinal.Text) = '') then
          raise Exception.Create(
            'Informe o ID Inicial e/ou ID Final.'
          );
      end;

    tfCidadeEstado:
      begin
        if (ItensMarcados(ckcbCidade) = '') and
           (ItensMarcados(ckcbUF) = '') then
          raise Exception.Create(
            'Selecione ao menos uma cidade ou UF.'
          );
      end;

  end;
end;

procedure TfrmRelatorio.btnImprimirRelatorioClick(Sender: TObject);
begin
  try
    if qryRelatorioClientes.IsEmpty then
      CarregarRelatorio;

    ppRelatorioClientes.DeviceType := 'Printer';
    ppRelatorioClientes.Print;

  except
    on E: Exception do
      MessageDlg(
        E.Message,
        mtWarning,
        [mbOK],
        0
      );
  end;
end;

procedure TfrmRelatorio.btnVisualizarRelatorioClick(Sender: TObject);
begin
  try
    CarregarRelatorio;

    ppRelatorioClientes.DeviceType := 'Screen';
    ppRelatorioClientes.Print;

  except
    on E: Exception do
      MessageDlg(
        E.Message,
        mtWarning,
        [mbOK],
        0
      );
  end;
end;

end.
