unit Cliente.Controller;

interface

uses
  System.SysUtils, System.JSON,
  REST.Client, REST.Types,
  Data.Bind.Components, Data.Bind.ObjectScope,
  FireDAC.Comp.Client,
  Cliente.DAO, Cliente.Model, Conexao.DAO;

type
  TClienteController = class
  public
    function BuscarCEP(const mCEP: String; out mEndereco: TEnderecoDTO): Boolean;
    function BuscarClientes(mQuery: TFDQuery; mFiltro: TFiltroCliente): TFDQuery;
    function ClienteExiste(mCPFCNPJ: String): Boolean;
    function ContarClientes: Integer;

    function ApenasNumeros(const mTexto: String): String;

    function ValidarCPFCNPJ(const mDocumento: String): Boolean;
    function ValidarCNPJAPI(const mCNPJ: String): Boolean;
    function ValidarCPF(const mCPF: String): Boolean;
    function ValidarCadastro(mCliente: TCliente): Boolean;
    function ValidarExclusao(mId: Integer): Boolean;

    procedure SalvarCliente(mCliente: TCliente);   
    procedure ExcluirCliente(mId: Integer);
  end;

implementation

function TClienteController.ValidarCadastro(mCliente: TCliente): Boolean;
begin      
  Result := False;
  
  if Trim(mCliente.Nome) = '' then
    raise Exception.Create(
      'Informe o nome do cliente.'
    );

  if Trim(mCliente.CPFCNPJ) = '' then
    raise Exception.Create(
      'Informe o CPF/CNPJ.'
    );

  if mCliente.DataNascimento > Date then
    raise Exception.Create(
      'A data de nascimento não pode ser maior que a data atual.'
    );

  if Trim(mCliente.Endereco) = '' then
    raise Exception.Create(
      'Informe o endereço.'
    );

  if Trim(mCliente.Bairro) = '' then
    raise Exception.Create(
      'Informe o bairro.'
    );

  if (mCliente.Cidade = 0) then
    raise Exception.Create(
      'Selecione a cidade.'
    );

  if ClienteExiste(mCliente.CPFCNPJ) and (mCliente.ID = 0) then
    raise Exception.Create(
      'Já existe um cliente cadastrado com este CPF/CNPJ.'
    );

  Result := True;
end;

function TClienteController.ValidarCNPJAPI(const mCNPJ: String): Boolean;
var
  RESTClient: TRESTClient;
  RESTRequest: TRESTRequest;
  RESTResponse: TRESTResponse;
  JSON: TJSONObject;
  CNPJ: String;
begin
  Result := False;

  CNPJ := ApenasNumeros(mCNPJ);
  if Length(CNPJ) <> 14 then
    Exit;

  RESTClient := TRESTClient.Create(nil);
  RESTRequest := TRESTRequest.Create(nil);
  RESTResponse := TRESTResponse.Create(nil);

  try
    RESTClient.BaseURL :=
      'https://brasilapi.com.br/api/cnpj/v1/' +
      CNPJ;

    RESTRequest.Client := RESTClient;
    RESTRequest.Response := RESTResponse;

    RESTRequest.Method := rmGET;

    try
      RESTRequest.Execute;

      if RESTResponse.StatusCode = 200 then
        begin
          JSON := TJSONObject.ParseJSONValue(
            RESTResponse.Content
          ) as TJSONObject;

          try
            Result := Assigned(JSON);
          finally
            JSON.Free;
          end;
        end
      else
        Result := False;

    except
      Result := False;
    end;

  finally
    RESTClient.Free;
    RESTRequest.Free;
    RESTResponse.Free;
  end;
end;

function TClienteController.ValidarCPF(const mCPF: String): Boolean;
var
  mSoma: Integer;
  mResto: Integer;
  I: Integer;
  mDig1: Integer;
  mDig2: Integer;
begin
  Result := False;

  if Length(mCPF) <> 11 then
    Exit;

  if mCPF = StringOfChar(mCPF[1], 11) then
    Exit;

  mSoma := 0;

  for I := 1 to 9 do
    mSoma := mSoma +
      StrToInt(mCPF[I]) * (11 - I);

  mResto := (mSoma * 10) mod 11;

  if mResto = 10 then
    mResto := 0;

  mDig1 := mResto;

  mSoma := 0;

  for I := 1 to 10 do
    mSoma := mSoma +
      StrToInt(mCPF[I]) * (12 - I);

  mResto := (mSoma * 10) mod 11;

  if mResto = 10 then
    mResto := 0;

  mDig2 := mResto;

  Result :=
    (mDig1 = StrToInt(mCPF[10])) and
    (mDig2 = StrToInt(mCPF[11]));
end;

function TClienteController.ValidarCPFCNPJ(const mDocumento: String): Boolean;
var
  mDoc: String;
begin
  mDoc := ApenasNumeros(mDocumento);

  if Length(mDoc) = 11 then
    Result := ValidarCPF(mDoc)
  else if Length(mDoc) = 14 then
    Result := ValidarCNPJAPI(mDoc)
  else
    Result := False;
end;

function TClienteController.ValidarExclusao(mId: Integer): Boolean;
begin            
  Result := False;
  
  if mId = 0 then
    raise Exception.Create(
      'Nenhum cliente selecionado para exclusão.'
    );

  if mId in [1, 5, 8, 10, 15] then
    raise Exception.Create(
      'Este cliente não pode ser excluído.'
    );

  Result := True;
end;

function TClienteController.ApenasNumeros(const mTexto: String): String;
var
  I: Integer;
begin
  Result := '';

  for I := 1 to Length(mTexto) do
    begin
      if mTexto[I] in ['0'..'9'] then
        Result := Result + mTexto[I];
    end;
end;

function TClienteController.BuscarCEP(const mCEP: String; out mEndereco: TEnderecoDTO): Boolean;
var
  RESTClient: TRESTClient;
  RESTRequest: TRESTRequest;
  RESTResponse: TRESTResponse;
  JSON: TJSONObject;
  CEP: String;
begin
  Result := False;

  CEP := ApenasNumeros(mCEP);
  if Length(CEP) <> 8 then
    Exit;

  RESTClient := TRESTClient.Create(nil);
  RESTRequest := TRESTRequest.Create(nil);
  RESTResponse := TRESTResponse.Create(nil);

  try
    RESTClient.BaseURL :=
      'https://viacep.com.br/ws/' +
      CEP +
      '/json/';

    RESTRequest.Client := RESTClient;
    RESTRequest.Response := RESTResponse;

    RESTRequest.Method := rmGET;

    RESTRequest.Execute;

    JSON := TJSONObject.ParseJSONValue(RESTResponse.Content) as TJSONObject;
    try
      if Assigned(JSON) then
        begin
          if JSON.GetValue('erro') <> nil then
            Exit;

          mEndereco.CEP := JSON.GetValue<String>('cep');
          mEndereco.Logradouro := JSON.GetValue<String>('logradouro');
          mEndereco.Bairro := JSON.GetValue<String>('bairro');
          mEndereco.Cidade := JSON.GetValue<String>('localidade');
          mEndereco.UF := JSON.GetValue<String>('uf');

          Result := True;
        end;

    finally
      JSON.Free;
    end;

  finally
    RESTClient.Free;
    RESTRequest.Free;
    RESTResponse.Free;
  end;
end;

function TClienteController.ClienteExiste(mCPFCNPJ: String): Boolean;
var
  mClienteDAO: TClienteDAO;
begin
  mClienteDAO := TClienteDAO.Create;
  try
    Result := mClienteDAO.ClienteExiste(ApenasNumeros(mCPFCNPJ));
  finally
    mClienteDAO.Free;
  end;
end;

function TClienteController.ContarClientes: Integer;
var
  mClienteDAO: TClienteDAO;
begin
  mClienteDAO := TClienteDAO.Create;
  try
    Result := mClienteDAO.ContarClientes;
  finally
    mClienteDAO.Free;
  end;
end;

procedure TClienteController.ExcluirCliente(mId: Integer);
var
  mClienteDAO: TClienteDAO;
begin
  if not ValidarExclusao(mId) then
    Exit;

  mClienteDAO := TClienteDAO.Create;
  try
    mClienteDAO.Excluir(mId);
  finally
    mClienteDAO.Free;
  end;
end;

procedure TClienteController.SalvarCliente(mCliente: TCliente);
var
  mClienteDAO: TClienteDAO;
begin
  if not ValidarCadastro(mCliente) then
    Exit;

  mClienteDAO := TClienteDAO.Create;
  try
    if mCliente.ID = 0 then
    begin
      mCliente.ID := TConexao.GetNextID('GEN_CLIENTE_ID');
      mClienteDAO.Inserir(mCliente);
    end
    else
    begin
      mClienteDAO.Alterar(mCliente);
    end;
  finally
    mClienteDAO.Free;
  end;
end;

function TClienteController.BuscarClientes(mQuery: TFDQuery; mFiltro: TFiltroCliente): TFDQuery;
var
  mClienteDAO: TClienteDAO;
begin
  mClienteDAO := TClienteDAO.Create;
  try
    mClienteDAO.BuscarClientes(
      mQuery,
      mFiltro
    );
  finally
    mClienteDAO.Free;
  end;
end;

end.
