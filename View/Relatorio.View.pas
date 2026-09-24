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
  AdvGlassButton, AdvGlowButton, CurvyControls, AdvSmoothButton, Vcl.Imaging.pngimage,
  AdvSmoothPanel, ppViewr,
  Conexao.DAO, Relatorio.DAO, Relatorio.Controller, Estado.Controller, Cidade.Controller;

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
    procedure FormDestroy(Sender: TObject);

  private
    FRelatorioController: TRelatorioController;
    FEstadoController: TEstadoController;
    FCidadeController: TCidadeController;

    procedure CarregarRelatorio;
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

procedure TfrmRelatorio.CarregarRelatorio;
begin
  FRelatorioController.ValidarFiltros(
    ObterTipoFiltro,
    edtIdInicial.Text,
    edtIdFinal.Text,
    ItensMarcados(ckcbCidade),
    ItensMarcados(ckcbUF)
  );

  qryRelatorioClientes.Close;

  qryRelatorioClientes.SQL.Text :=
    FRelatorioController.GerarSQLRelatorio(
      ObterTipoFiltro,
      StrToIntDef(edtIdInicial.Text, 0),
      StrToIntDef(edtIdFinal.Text, 0),
      ItensMarcados(ckcbCidade),
      ItensMarcados(ckcbUF)
    );

  qryRelatorioClientes.Open;

  if qryRelatorioClientes.IsEmpty then
    raise Exception.Create(
      'Nenhum registro encontrado para os filtros informados.'
    );
end;

procedure TfrmRelatorio.ckcbUFClickCheck(Sender: TObject);
begin
  FCidadeController.CarregarCidadesPorUFs(
    ckcbUF,
    ckcbCidade.Items
  );
end;

procedure TfrmRelatorio.FormCreate(Sender: TObject);
begin
  FRelatorioController := TRelatorioController.Create;
  FCidadeController := TCidadeController.Create;
  FEstadoController := TEstadoController.Create;

  qryRelatorioClientes.Connection := TConexao.GetConnection;

  viewRelatorioClientes.Report := ppRelatorioClientes;

  FEstadoController.CarregarUFs(ckcbUF.Items);

  rdgFiltrosRelatorio.ItemIndex := 0;
  rdgFiltrosRelatorioClick(nil);
end;

procedure TfrmRelatorio.FormDestroy(Sender: TObject);
begin
  FRelatorioController.Free;
  FCidadeController.Free;
  FEstadoController.Free;
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
