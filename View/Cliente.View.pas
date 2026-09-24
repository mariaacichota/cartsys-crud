unit Cliente.View;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.MaskUtils,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, AdvSmoothButton, AdvSmoothPanel, AdvUtil,
  AdvObj, BaseGrid, AdvGrid, DBAdvGrid,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Cliente.Controller, Cliente.DAO, Cidade.DAO, Estado.DAO, Cliente.Model;

type
  TfrmCliente = class(TForm)
    pgcGeral: TPageControl;
    tabConsulta: TTabSheet;
    tabCadastro: TTabSheet;
    pnlTopConsulta: TPanel;
    pnlGridConsulta: TPanel;
    pnlBottomConsulta: TPanel;
    edtNomeConsulta: TEdit;
    lblNameConsulta: TLabel;
    edtCPFCNPJConsulta: TEdit;
    lblCPFCNPJConsulta: TLabel;
    btnPesquisarConsulta: TAdvSmoothButton;
    btnLimparConsulta: TAdvSmoothButton;
    btnNovoClienteConsulta: TAdvSmoothButton;
    btnEditarSelecionadoConsulta: TAdvSmoothButton;
    pnlTopCadastro: TPanel;
    pnlDadosGeraisCadastro: TPanel;
    pnlBottomCadastro: TPanel;
    edtIDConsulta: TEdit;
    lblIDConsulta: TLabel;
    edtCEPConsulta: TEdit;
    lblCEPConsulta: TLabel;
    cbCidadeConsulta: TComboBox;
    lblCidadeConsulta: TLabel;
    cbUFConsulta: TComboBox;
    lblUFConsulta: TLabel;
    edtDataNascimentoConsulta: TDateTimePicker;
    lblDataNascimentoConsulta: TLabel;
    lblIDTituloCadastro: TLabel;
    lblStatusTituloCadastro: TLabel;
    lblStatusValorCadastro: TLabel;
    lblIDValorCadastro: TLabel;
    lblNomeCadastroEditado: TLabel;
    btnNovoCadastro: TAdvSmoothButton;
    btnSalvarCadastro: TAdvSmoothButton;
    btnExcluirCadastro: TAdvSmoothButton;
    btnCancelarCadastro: TAdvSmoothButton;
    pnlDadosPessoaisCadastro: TAdvSmoothPanel;
    pnlEnderecoCadastro: TAdvSmoothPanel;
    cbCidadeCadastro: TComboBox;
    cbUFCadastro: TComboBox;
    ckSemNumeroCadastro: TCheckBox;
    edtBairroCadastro: TEdit;
    edtCEPCadastro: TEdit;
    edtEnderecoCadastro: TEdit;
    edtNumeroCadastro: TEdit;
    lblBairroCadastro: TLabel;
    lblCEPCadastro: TLabel;
    lblCidadeCadastro: TLabel;
    lblEnderecoCadastro: TLabel;
    lblNumeroCadastro: TLabel;
    lblUFCadastro: TLabel;
    edtCPFCNPJCadastro: TEdit;
    edtDataNascimentoCadastro: TDateTimePicker;
    edtNomeCadastro: TEdit;
    lblCPFCNPJCadastro: TLabel;
    lblDataNascimentoCadastro: TLabel;
    lblNomeCadastro: TLabel;
    gridDadosConsulta: TDBAdvGrid;
    qryConsulta: TFDQuery;
    dsConsulta: TDataSource;
    edtComplementoCadastro: TEdit;
    lblComplementoCadastro: TLabel;
    procedure btnPesquisarConsultaClick(Sender: TObject);
    procedure btnLimparConsultaClick(Sender: TObject);
    procedure btnNovoClienteConsultaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbUFConsultaChange(Sender: TObject);
    procedure btnEditarSelecionadoConsultaClick(Sender: TObject);
    procedure btnCancelarCadastroClick(Sender: TObject);
    procedure btnNovoCadastroClick(Sender: TObject);
    procedure gridDadosConsultaDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbUFCadastroChange(Sender: TObject);
    procedure btnSalvarCadastroClick(Sender: TObject);
    procedure btnExcluirCadastroClick(Sender: TObject);
    procedure edtNumeroCadastroChange(Sender: TObject);
    procedure edtCEPCadastroChange(Sender: TObject);
    procedure edtCPFCNPJConsultaChange(Sender: TObject);
    procedure edtCPFCNPJCadastroChange(Sender: TObject);
    procedure edtCEPConsultaChange(Sender: TObject);
  private
    FIdCliente: Integer;
    FUltimoCEPConsultadoConsulta: String;
    FUltimoCEPConsultadoCadastro: String;

    procedure CarregarCidades(mUF: String; mCombo: TComboBox);
    procedure CarregarUFs(mCombo: TComboBox);
    procedure LimparCamposConsulta;
    procedure LimparCamposCadastro;
    procedure PopularGrid;
    procedure EditarClienteSelecionado;
    procedure VerificaESalvaCidade(mCliente: TCliente);
    procedure AplicarMascaraCPFCNPJ(mCampo: TEdit);
    procedure AplicarMascaraCEP(mCampo: TEdit; mTexto: String);
    procedure PreencherEnderecoViaCEP(mCEP: TEdit; mCidade: TComboBox; mUF: TComboBox;
                                      mUltimoCEP: String; mEndereco: TEdit = nil; mBairro: TEdit = nil);

    function ValidarCamposCadastro: Boolean;
    function ValidarExclusao: Boolean;
    function MontarCliente: TCliente;
    function LocalizarItemCombo(mCombo: TComboBox; const mTexto: String): Integer;
  public
    { Public declarations }
  end;

var
  frmCliente: TfrmCliente;

implementation

uses
  Conexao.DAO;

{$R *.dfm}

procedure TfrmCliente.AplicarMascaraCEP(mCampo: TEdit; mTexto: String);
begin
  var OldOnChange := mCampo.OnChange;
  mCampo.OnChange := nil;
  try
    mCampo.Text :=
      FormatMaskText(
        '00000\-000;0',
        mTexto
      );

    mCampo.SelStart := Length(mCampo.Text);
  finally
    mCampo.OnChange := OldOnChange;
  end;
end;

procedure TfrmCliente.AplicarMascaraCPFCNPJ(mCampo: TEdit);
var
  Texto: String;
  Controller: TClienteController;
begin

  Controller := TClienteController.Create;
  try
    Texto := Controller.ApenasNumeros(mCampo.Text);

    var OldOnChange := mCampo.OnChange;
    mCampo.OnChange := nil;
    try
      if Length(Texto) <= 11 then
        mCampo.Text := FormatMaskText('000\.000\.000\-00;0', Texto)
      else
        mCampo.Text := FormatMaskText('00\.000\.000\/0000\-00;0', Texto);

      mCampo.SelStart := Length(mCampo.Text);

    finally
      mCampo.OnChange := OldOnChange;
    end;
  finally
    Controller.Free;
  end;
end;

procedure TfrmCliente.btnCancelarCadastroClick(Sender: TObject);
begin
  if MessageDlg(
       'Deseja cancelar a edição? As alterações não salvas serão perdidas.',
       mtConfirmation,
       [mbYes, mbNo],
       0
     ) = mrNo then
    Exit;

  LimparCamposCadastro;
  pgcGeral.ActivePage := tabConsulta;
end;

procedure TfrmCliente.btnEditarSelecionadoConsultaClick(Sender: TObject);
begin
  EditarClienteSelecionado;
end;

procedure TfrmCliente.btnExcluirCadastroClick(Sender: TObject);
var
  DAO: TClienteDAO;
begin
  if not ValidarExclusao then
    Exit;

  if MessageDlg(
       Format(
         'Deseja realmente excluir o cliente "%s"?',
         [lblNomeCadastroEditado.Caption]
       ),
       mtConfirmation,
       [mbYes, mbNo],
       0
     ) <> mrYes then
    Exit;

  DAO := TClienteDAO.Create;
  try
    DAO.Excluir(FIdCliente);

    MessageDlg(
      'Cliente excluído com sucesso.',
      mtInformation,
      [mbOK],
      0
    );


    lblStatusValorCadastro.Caption := 'cadastro de cliente excluído com sucesso!';
    LimparCamposCadastro;
    PopularGrid;
    pgcGeral.ActivePage := tabConsulta;

  finally
    DAO.Free;
  end;
end;

procedure TfrmCliente.btnLimparConsultaClick(Sender: TObject);
begin
  LimparCamposConsulta;
end;

procedure TfrmCliente.btnNovoCadastroClick(Sender: TObject);
begin
  LimparCamposCadastro;

  lblStatusValorCadastro.Caption := 'cadastrando novo cliente..';
  lblIDTituloCadastro.Visible    := False;
  lblIDValorCadastro.Visible     := False;
  lblNomeCadastroEditado.Visible := False;
end;

procedure TfrmCliente.btnNovoClienteConsultaClick(Sender: TObject);
begin
  LimparCamposConsulta;

  pgcGeral.ActivePage := tabCadastro;

  LimparCamposCadastro;

  lblStatusValorCadastro.Caption := 'cadastrando novo cliente..';
end;

procedure TfrmCliente.btnPesquisarConsultaClick(Sender: TObject);
var
  Filtro: TFiltroCliente;
begin
  Filtro.ID := StrToIntDef(edtIDConsulta.Text, 0);
  Filtro.Nome := edtNomeConsulta.Text;
  Filtro.CPFCNPJ := edtCPFCNPJConsulta.Text;
  Filtro.CEP := edtCEPConsulta.Text;

  if edtDataNascimentoConsulta.Checked then
    Filtro.DataNascimento := edtDataNascimentoConsulta.Date
  else
    Filtro.DataNascimento := 0;

  if cbUFConsulta.ItemIndex >= 0 then
    Filtro.UF := cbUFConsulta.Text;

  if cbCidadeConsulta.ItemIndex >= 0 then
    Filtro.Cidade := cbCidadeConsulta.Text;

  PopularGrid;
end;

procedure TfrmCliente.btnSalvarCadastroClick(Sender: TObject);
var
  Cliente: TCliente;
  DAO: TClienteDAO;
begin
  if not ValidarCamposCadastro then
    Exit;

  Cliente := MontarCliente;
  DAO := TClienteDAO.Create;
  try
    VerificaESalvaCidade(Cliente);

    if Cliente.ID = 0 then
    begin
      Cliente.ID := TConexao.GetNextID('GEN_CLIENTE_ID');
      DAO.Inserir(Cliente);
      ShowMessage('Cliente cadastrado com sucesso.');
    end
    else
    begin
      DAO.Alterar(Cliente);
      ShowMessage('Cliente alterado com sucesso.');
    end;

    lblStatusValorCadastro.Caption := 'cadastro de cliente salvo com sucesso!';
    LimparCamposCadastro;
    PopularGrid;

    pgcGeral.ActivePage := tabConsulta;
  finally
    Cliente.Free;
    DAO.Free;
  end;
end;

procedure TfrmCliente.FormCreate(Sender: TObject);
begin
  tabConsulta.TabVisible := False;
  tabCadastro.TabVisible := False;
  pgcGeral.ActivePage := tabConsulta;

  LimparCamposConsulta;

  CarregarUFs(cbUFConsulta);
  CarregarUFs(cbUFCadastro);

  qryConsulta.Connection := TConexao.GetConnection;
  PopularGrid;
end;

procedure TfrmCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  if (Key = VK_RETURN) and
     not (ActiveControl is TCustomButton) and
     not (ActiveControl is TCustomDBGrid) then
  begin
    Key := 0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmCliente.gridDadosConsultaDblClick(Sender: TObject);
begin
  if qryConsulta.IsEmpty then
    Exit;

  EditarClienteSelecionado;
end;

procedure TfrmCliente.LimparCamposCadastro;
begin
  edtNomeCadastro.SetFocus;

  FIdCliente := 0;

  lblIDTituloCadastro.Visible    := False;
  lblIDValorCadastro.Visible     := False;
  lblNomeCadastroEditado.Visible := False;

  edtNomeCadastro.Clear;
  edtDataNascimentoCadastro.DateTime := now;
  edtCPFCNPJCadastro.Clear;
  edtEnderecoCadastro.Clear;
  edtCEPCadastro.Clear;
  edtBairroCadastro.Clear;
  edtNumeroCadastro.Clear;
  edtComplementoCadastro.Clear;
  cbCidadeCadastro.ItemIndex := -1;
  cbUFCadastro.ItemIndex := -1;
  ckSemNumeroCadastro.Checked := Trim(edtNumeroCadastro.Text).IsEmpty;

end;

procedure TfrmCliente.LimparCamposConsulta;
begin
  FIdCliente := 0;

  edtIDConsulta.Clear;
  edtNomeConsulta.Clear;
  edtCPFCNPJConsulta.Clear;
  edtCEPConsulta.Clear;
  edtDataNascimentoConsulta.Checked := False;
  cbUFConsulta.ItemIndex     := -1;
  cbCidadeConsulta.ItemIndex := -1;

  qryConsulta.Close;
end;

function TfrmCliente.LocalizarItemCombo(mCombo: TComboBox;
  const mTexto: String): Integer;
var
  I: Integer;
begin
  Result := -1;

  for I := 0 to mCombo.Items.Count - 1 do
  begin
    if SameText(mCombo.Items[I], mTexto) then
    begin
      Result := I;
      Exit;
    end;
  end;
end;

function TfrmCliente.MontarCliente: TCliente;
var
  Controller: TClienteController;
begin
  Result := TCliente.Create;
  Result.ID := FIdCliente;
  Result.Nome := edtNomeCadastro.Text;

  Controller := TClienteController.Create;
  try
    Result.CEP     := Controller.ApenasNumeros(edtCEPCadastro.Text);
    Result.CPFCNPJ := Controller.ApenasNumeros(edtCPFCNPJCadastro.Text);
  finally
    Controller.Free;
  end;

  Result.Endereco := edtEnderecoCadastro.Text;
  Result.Numero := edtNumeroCadastro.Text;
  Result.Complemento := edtComplementoCadastro.Text;
  Result.Bairro := edtBairroCadastro.Text;
  Result.DataNascimento := edtDataNascimentoCadastro.Date;

  if cbCidadeCadastro.ItemIndex >= 0 then
    Result.Cidade :=
      Integer(
        cbCidadeCadastro.Items.Objects[
          cbCidadeCadastro.ItemIndex
        ]
      );
end;

procedure TfrmCliente.PopularGrid;
var
  Controller: TClienteController;
  Filtro: TFiltroCliente;
begin
  Controller := TClienteController.Create;
  try
    Filtro.ID := StrToIntDef(edtIDConsulta.Text, 0);
    Filtro.Nome := Trim(edtNomeConsulta.Text);
    Filtro.CPFCNPJ := Controller.ApenasNumeros(edtCPFCNPJConsulta.Text);
    Filtro.CEP := Controller.ApenasNumeros(edtCEPConsulta.Text);

    if edtDataNascimentoConsulta.Checked then
      Filtro.DataNascimento := edtDataNascimentoConsulta.Date
    else
      Filtro.DataNascimento := 0;

    if cbUFConsulta.ItemIndex >= 0 then
      Filtro.UF := cbUFConsulta.Text
    else
      Filtro.UF := '';

    if cbCidadeConsulta.ItemIndex >= 0 then
      Filtro.Cidade := cbCidadeConsulta.Text
    else
      Filtro.Cidade := '';

    qryConsulta.Close;

    Controller.ListarClientes(qryConsulta, Filtro);

    if qryConsulta.IsEmpty then
      btnEditarSelecionadoConsulta.Enabled := False
    else
      btnEditarSelecionadoConsulta.Enabled := True;
  finally
    Controller.Free;
  end;
end;

procedure TfrmCliente.PreencherEnderecoViaCEP(mCEP: TEdit; mCidade,
  mUF: TComboBox; mUltimoCEP: String; mEndereco: TEdit = nil; mBairro: TEdit = nil);
var
  mTexto: String;
  Controller: TClienteController;
  Endereco: TEnderecoDTO;
  mIndexUF: Integer;
  mIndexCidade: Integer;
begin
  Controller := TClienteController.Create;
  try
    mTexto := Controller.ApenasNumeros(mCEP.Text);
    AplicarMascaraCEP(mCEP, mTexto);

    if Length(mTexto) <> 8 then
      Exit;

    if mTexto = mUltimoCEP then
      Exit;

    if not Controller.BuscarCEP(mCEP.Text, Endereco) then
      Exit;

    mUltimoCEP := mTexto;

    if Assigned(mEndereco) then
      mEndereco.Text := Endereco.Logradouro;

    if Assigned(mBairro) then
      mBairro.Text := Endereco.Bairro;

    mIndexUF := LocalizarItemCombo(mUF, Endereco.UF);

    if mIndexUF >= 0 then
    begin
      mUF.ItemIndex := mIndexUF;
      CarregarCidades(Endereco.UF, mCidade);
    end;

    mIndexCidade := LocalizarItemCombo(mCidade, Endereco.Cidade);
    if mIndexCidade >= 0 then
      mCidade.ItemIndex := mIndexCidade
    else
      mCidade.Text := Endereco.Cidade;
  finally
    Controller.Free;
  end;
end;
procedure TfrmCliente.CarregarCidades(mUF: String; mCombo: TComboBox);
var
  DAO: TCidadeDAO;
  Qry: TFDQuery;
begin
  DAO := TCidadeDAO.Create;
  try
    Qry := DAO.ListarPorEstado(mUF);
    try
      mCombo.Items.Clear;

      while not Qry.Eof do
        begin
          mCombo.Items.AddObject(
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

procedure TfrmCliente.CarregarUFs(mCombo: TComboBox);
var
  DAO: TEstadoDAO;
  Qry: TFDQuery;
begin
  DAO := TEstadoDAO.Create;
  try
    Qry := DAO.ListarEstados;
    try
      mCombo.Items.Clear;

      while not Qry.Eof do
      begin
        mCombo.Items.Add(
          Qry.FieldByName('UF').AsString
        );

        Qry.Next;
      end;

    finally
      Qry.Free;
    end;

  finally
    DAO.Free;
  end;
end;


procedure TfrmCliente.cbUFCadastroChange(Sender: TObject);
begin
  if cbUFCadastro.ItemIndex >= 0 then
    CarregarCidades(cbUFCadastro.Items[cbUFCadastro.ItemIndex], cbCidadeCadastro);
end;

procedure TfrmCliente.cbUFConsultaChange(Sender: TObject);
begin
  if cbUFConsulta.ItemIndex >= 0 then
    CarregarCidades(cbUFConsulta.Items[cbUFConsulta.ItemIndex], cbCidadeConsulta);
end;

procedure TfrmCliente.EditarClienteSelecionado;
begin
  if qryConsulta.IsEmpty then
    Exit;

  pgcGeral.ActivePage := tabCadastro;

  lblStatusValorCadastro.Caption := 'editando cliente...';

  lblIDTituloCadastro.Visible := True;
  lblIDValorCadastro.Visible  := True;
  FIdCliente                  := qryConsulta.FieldByName('ID').AsInteger;
  lblIDValorCadastro.Caption  := IntToStr(FIdCliente);

  lblNomeCadastroEditado.Visible := True;
  lblNomeCadastroEditado.Caption :=
    qryConsulta.FieldByName('NOME').AsString;

  edtNomeCadastro.Text :=
    qryConsulta.FieldByName('NOME').AsString;

  edtDataNascimentoCadastro.Date :=
    qryConsulta.FieldByName('DATANASCIMENTO').AsDateTime;

  edtCPFCNPJCadastro.Text :=
    qryConsulta.FieldByName('CPF_CNPJ').AsString;

  edtEnderecoCadastro.Text :=
    qryConsulta.FieldByName('ENDERECO').AsString;

  edtNumeroCadastro.Text :=
    qryConsulta.FieldByName('NUMERO').AsString;

  edtCEPCadastro.Text :=
    qryConsulta.FieldByName('CEP').AsString;

  edtBairroCadastro.Text :=
    qryConsulta.FieldByName('BAIRRO').AsString;

  edtComplementoCadastro.Text :=
    qryConsulta.FieldByName('COMPLEMENTO').AsString;

  cbUFCadastro.ItemIndex :=
    cbUFCadastro.Items.IndexOf(qryConsulta.FieldByName('UF').AsString);

  CarregarCidades(qryConsulta.FieldByName('UF').AsString, cbCidadeCadastro);

  cbCidadeCadastro.ItemIndex :=
    cbCidadeCadastro.Items.IndexOf(
      qryConsulta.FieldByName('CIDADE').AsString
    );

  ckSemNumeroCadastro.Checked :=
    Trim(qryConsulta.FieldByName('NUMERO').AsString) = '';

  if not ckSemNumeroCadastro.Checked then
    edtNumeroCadastro.Enabled := True
  else
    edtNumeroCadastro.Enabled := False;

  edtNomeCadastro.SetFocus;
end;

procedure TfrmCliente.edtCEPCadastroChange(Sender: TObject);
begin
  PreencherEnderecoViaCEP(
    edtCEPCadastro,
    cbCidadeCadastro,
    cbUFCadastro,
    FUltimoCEPConsultadoCadastro,
    edtEnderecoCadastro,
    edtBairroCadastro
  );
end;

procedure TfrmCliente.edtCEPConsultaChange(Sender: TObject);
begin
  PreencherEnderecoViaCEP(
    edtCEPConsulta,
    cbCidadeConsulta,
    cbUFConsulta,
    FUltimoCEPConsultadoConsulta
  );
end;

procedure TfrmCliente.edtCPFCNPJCadastroChange(Sender: TObject);
begin
  AplicarMascaraCPFCNPJ(edtCPFCNPJCadastro);
end;

procedure TfrmCliente.edtCPFCNPJConsultaChange(Sender: TObject);
begin
  AplicarMascaraCPFCNPJ(edtCPFCNPJConsulta);
end;

procedure TfrmCliente.edtNumeroCadastroChange(Sender: TObject);
begin
  ckSemNumeroCadastro.Checked := Trim(edtNumeroCadastro.Text).IsEmpty;
end;

function TfrmCliente.ValidarCamposCadastro: Boolean;
var
  Controller: TClienteController;
  ClienteExistente: Boolean;
begin
  Result := False;

  if Trim(edtNomeCadastro.Text) = '' then
  begin
    ShowMessage('Informe o nome do cliente.');
    edtNomeCadastro.SetFocus;
    Exit;
  end;

  if Trim(edtCPFCNPJCadastro.Text) = '' then
  begin
    ShowMessage('Informe o CPF/CNPJ.');
    edtCPFCNPJCadastro.SetFocus;
    Exit;
  end;

  if edtDataNascimentoCadastro.Date > Date then
  begin
    ShowMessage('A data de nascimento não pode ser maior que a data atual.');
    edtDataNascimentoCadastro.SetFocus;
    Exit;
  end;

  if Trim(edtEnderecoCadastro.Text) = '' then
  begin
    ShowMessage('Informe o endereço.');
    edtEnderecoCadastro.SetFocus;
    Exit;
  end;

  if (not ckSemNumeroCadastro.Checked) and
     (Trim(edtNumeroCadastro.Text) = '') then
  begin
    ShowMessage('Informe o número do endereço.');
    edtNumeroCadastro.SetFocus;
    Exit;
  end;

  if Trim(edtBairroCadastro.Text) = '' then
  begin
    ShowMessage('Informe o bairro.');
    edtBairroCadastro.SetFocus;
    Exit;
  end;

  if (cbUFCadastro.ItemIndex = -1) and (Trim(cbUFCadastro.Text).IsEmpty) then
  begin
    ShowMessage('Selecione a UF.');
    cbUFCadastro.SetFocus;
    Exit;
  end;

  if (cbCidadeCadastro.ItemIndex = -1) and (Trim(cbCidadeCadastro.Text).IsEmpty) then
  begin
    ShowMessage('Selecione a cidade.');
    cbCidadeCadastro.SetFocus;
    Exit;
  end;

  Controller := TClienteController.Create;
  try
    ClienteExistente := Controller.ClienteExiste(edtCPFCNPJCadastro.Text);

    if ClienteExistente and (FIdCliente = 0) then
    begin
      ShowMessage('Já existe um cliente cadastrado com este CPF/CNPJ.');
      edtCPFCNPJCadastro.SetFocus;
      Exit;
    end;

  finally
    Controller.Free;
  end;

  Result := True;
end;

function TfrmCliente.ValidarExclusao: Boolean;
begin
  Result := False;

  if FIdCliente = 0 then
  begin
    MessageDlg(
      'Nenhum cliente selecionado para exclusão.',
      mtWarning,
      [mbOK],
      0
    );
    Exit;
  end;

  if FIdCliente in [1, 5, 8, 10, 15] then
  begin
    MessageDlg(
      'Este cliente não pode ser excluído.',
      mtWarning,
      [mbOK],
      0
    );
    Exit;
  end;

  Result := True;
end;

procedure TfrmCliente.VerificaESalvaCidade(mCliente: TCliente);
var
  CidadeDAO: TCidadeDAO;
  CidadeID: Integer;
begin
  CidadeDAO := TCidadeDAO.Create;

  try
    CidadeID := CidadeDAO.BuscarCidade(cbCidadeCadastro.Text, cbUFCadastro.Text);

    if CidadeID = 0 then
      CidadeID := CidadeDAO.InserirCidade(cbCidadeCadastro.Text, cbUFCadastro.Text);

    mCliente.Cidade := CidadeID;

  finally
    CidadeDAO.Free;
  end;
end;

end.
