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
  Conexao.DAO, Cliente.DAO, Cliente.Model, Cliente.Controller, Cidade.Controller, Estado.Controller;

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
    procedure edtCEPConsultaChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtCEPConsultaExit(Sender: TObject);
    procedure edtCPFCNPJConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure edtCEPConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure edtCEPCadastroKeyPress(Sender: TObject; var Key: Char);
    procedure edtCPFCNPJCadastroKeyPress(Sender: TObject; var Key: Char);
    procedure edtCEPCadastroExit(Sender: TObject);
    procedure edtCPFCNPJCadastroExit(Sender: TObject);
    procedure edtCPFCNPJConsultaExit(Sender: TObject);
  private
    FIdCliente: Integer;
    FUltimoCEPConsultadoConsulta: String;
    FUltimoCEPConsultadoCadastro: String;

    FClienteController: TClienteController;
    FEstadoController: TEstadoController;
    FCidadeController: TCidadeController;

    procedure LimparCamposConsulta;
    procedure LimparCamposCadastro;
    procedure PopularGrid;
    procedure EditarClienteSelecionado;
    procedure PreencherEnderecoViaCEP(mCEP: TEdit; mCidade: TComboBox; mUF: TComboBox;
                                      var mUltimoCEP: String; mEndereco: TEdit = nil; mBairro: TEdit = nil);

    function MontarCliente: TCliente;
    function LocalizarItemCombo(mCombo: TComboBox; const mTexto: String): Integer;
  end;

implementation

{$R *.dfm}

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
  PopularGrid;
  pgcGeral.ActivePage := tabConsulta;
end;

procedure TfrmCliente.btnEditarSelecionadoConsultaClick(Sender: TObject);
begin
  EditarClienteSelecionado;
end;

procedure TfrmCliente.btnExcluirCadastroClick(Sender: TObject);
begin
  if MessageDlg(
       Format(
         'Deseja realmente excluir o cliente "%s"?',
         [lblNomeCadastroEditado.Caption]
       ),
       mtConfirmation,
       [mbYes, mbNo],
       0
     ) = mrNo then
    Exit;

  try
    FClienteController.ExcluirCliente(FIdCliente);

    MessageDlg(
      'Cliente excluído com sucesso.',
      mtInformation,
      [mbOK],
      0
    );

    lblStatusValorCadastro.Caption :=
      'cadastro de cliente excluído com sucesso!';

    LimparCamposCadastro;
    PopularGrid;
    pgcGeral.ActivePage := tabConsulta;

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
  mCliente: TCliente;
  DAO: TClienteDAO;
begin

  if (cbUFCadastro.ItemIndex = -1) and (Trim(cbUFCadastro.Text).IsEmpty) then
    begin
      MessageDlg(
        'Selecione a UF.',
        mtWarning,
        [mbOK],
        0);

      cbUFCadastro.SetFocus;
      Exit;
    end;

  if (not ckSemNumeroCadastro.Checked) and
     (Trim(edtNumeroCadastro.Text) = '') then
    begin
      MessageDlg(
        'Informe o número do endereço.',
        mtWarning,
        [mbOK],
        0);

      edtNumeroCadastro.SetFocus;
      Exit;
    end;

  mCliente := TCliente.Create;
  try
    mCliente := MontarCliente;
    mCliente.Cidade := FCidadeController.BuscarCidade(cbCidadeConsulta.Text, cbUFCadastro.Text);
    FClienteController.SalvarCliente(mCliente);
    MessageDlg(
      'Cadastro salvo com sucesso.',
      mtInformation,
      [mbOK],
      0);

    LimparCamposCadastro;
    pgcGeral.ActivePage := tabConsulta;
    PopularGrid;
    mCliente.Free;
  except
    on E: Exception do
      begin
        mCliente.Free;

        MessageDlg(
          E.Message,
          mtWarning,
          [mbOK],
          0
        );
      end;
  end;
end;

procedure TfrmCliente.FormCreate(Sender: TObject);
begin
  FClienteController := TClienteController.Create;
  FCidadeController := TCidadeController.Create;
  FEstadoController := TEstadoController.Create;

  tabConsulta.TabVisible := False;
  tabCadastro.TabVisible := False;
  pgcGeral.ActivePage := tabConsulta;

  LimparCamposConsulta;

  FEstadoController.CarregarUFs(cbUFConsulta.Items);
  FEstadoController.CarregarUFs(cbUFCadastro.Items);

  qryConsulta.Connection := TConexao.GetConnection;
  PopularGrid;
end;

procedure TfrmCliente.FormDestroy(Sender: TObject);
begin
  FClienteController.Free;
  FEstadoController.Free;
  FCidadeController.Free;
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
begin
  Result := TCliente.Create;
  Result.ID := FIdCliente;
  Result.Nome := edtNomeCadastro.Text;
  Result.CEP     := FClienteController.ApenasNumeros(edtCEPCadastro.Text);
  Result.CPFCNPJ := FClienteController.ApenasNumeros(edtCPFCNPJCadastro.Text);
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
  mFiltro: TFiltroCliente;
begin
  mFiltro.ID := StrToIntDef(edtIDConsulta.Text, 0);
  mFiltro.Nome := Trim(edtNomeConsulta.Text);
  mFiltro.CPFCNPJ := FClienteController.ApenasNumeros(edtCPFCNPJConsulta.Text);
  mFiltro.CEP := FClienteController.ApenasNumeros(edtCEPConsulta.Text);

  if edtDataNascimentoConsulta.Checked then
    mFiltro.DataNascimento := edtDataNascimentoConsulta.Date
  else
    mFiltro.DataNascimento := 0;

  if cbUFConsulta.ItemIndex >= 0 then
    mFiltro.UF := cbUFConsulta.Text
  else
    mFiltro.UF := '';

  if cbCidadeConsulta.ItemIndex >= 0 then
    mFiltro.Cidade := cbCidadeConsulta.Text
  else
    mFiltro.Cidade := '';

  qryConsulta.Close;

  FClienteController.BuscarClientes(qryConsulta, mFiltro);

  if qryConsulta.IsEmpty then
    btnEditarSelecionadoConsulta.Enabled := False
  else
    btnEditarSelecionadoConsulta.Enabled := True;
end;

procedure TfrmCliente.PreencherEnderecoViaCEP(mCEP: TEdit; mCidade,
  mUF: TComboBox; var mUltimoCEP: String; mEndereco: TEdit = nil; mBairro: TEdit = nil);
var
  mTexto: String;
  Endereco: TEnderecoDTO;
  mIndexUF: Integer;
  mIndexCidade: Integer;
begin
  mTexto := FClienteController.ApenasNumeros(mCEP.Text);

  if Length(mTexto) <> 8 then
    Exit;

  if mTexto = mUltimoCEP then
    Exit;

  if not FClienteController.BuscarCEP(mCEP.Text, Endereco) then
    Exit;

  mUltimoCEP := mTexto;

  if Assigned(mEndereco) then
    mEndereco.Text := Endereco.Logradouro;

  if Assigned(mBairro) then
    mBairro.Text := Endereco.Bairro;

  mIndexUF := LocalizarItemCombo(mUF, Endereco.UF);
  if mIndexUF >= 0 then
    mUF.ItemIndex := mIndexUF;

  mIndexCidade := LocalizarItemCombo(mCidade, Endereco.Cidade);
  if mIndexCidade >= 0 then
    mCidade.ItemIndex := mIndexCidade
  else
    mCidade.Text := Endereco.Cidade;
end;

procedure TfrmCliente.cbUFCadastroChange(Sender: TObject);
begin
  if cbUFCadastro.ItemIndex >= 0 then
    FCidadeController.CarregarCidades(cbUFCadastro.Items[cbUFCadastro.ItemIndex], cbCidadeCadastro.Items);
end;

procedure TfrmCliente.cbUFConsultaChange(Sender: TObject);
begin
  if cbUFConsulta.ItemIndex >= 0 then
    FCidadeController.CarregarCidades(cbUFConsulta.Items[cbUFConsulta.ItemIndex], cbCidadeConsulta.Items);
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

  FCidadeController.CarregarCidades(qryConsulta.FieldByName('UF').AsString, cbCidadeCadastro.Items);

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

procedure TfrmCliente.edtCEPCadastroExit(Sender: TObject);
begin
  edtCEPCadastro.Text :=
    FormatMaskText(
      '00000\-000;0',
      FClienteController.ApenasNumeros(
        edtCEPCadastro.Text
      )
    );
end;

procedure TfrmCliente.edtCEPCadastroKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
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

procedure TfrmCliente.edtCEPConsultaExit(Sender: TObject);
begin
  edtCEPConsulta.Text :=
    FormatMaskText(
      '00000\-000;0',
      FClienteController.ApenasNumeros(
        edtCEPConsulta.Text
      )
    );
end;

procedure TfrmCliente.edtCEPConsultaKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

procedure TfrmCliente.edtCPFCNPJCadastroExit(Sender: TObject);
begin
  if Length(FClienteController.ApenasNumeros(edtCPFCNPJCadastro.Text)) <= 11 then
    edtCPFCNPJCadastro.Text :=
      FormatMaskText(
        '000\.000\.000\-00;0',
        edtCPFCNPJCadastro.Text
      )
  else
    edtCPFCNPJCadastro.Text :=
      FormatMaskText(
        '00\.000\.000\/0000\-00;0',
        edtCPFCNPJCadastro.Text
      );
end;

procedure TfrmCliente.edtCPFCNPJCadastroKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

procedure TfrmCliente.edtCPFCNPJConsultaExit(Sender: TObject);
begin
if Length(FClienteController.ApenasNumeros(edtCPFCNPJConsulta.Text)) <= 11 then
    edtCPFCNPJConsulta.Text :=
      FormatMaskText(
        '000\.000\.000\-00;0',
        edtCPFCNPJConsulta.Text
      )
  else
    edtCPFCNPJConsulta.Text :=
      FormatMaskText(
        '00\.000\.000\/0000\-00;0',
        edtCPFCNPJConsulta.Text
      );
end;

procedure TfrmCliente.edtCPFCNPJConsultaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

procedure TfrmCliente.edtNumeroCadastroChange(Sender: TObject);
begin
  ckSemNumeroCadastro.Checked := Trim(edtNumeroCadastro.Text).IsEmpty;
end;

end.
