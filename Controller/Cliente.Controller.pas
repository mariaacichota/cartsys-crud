unit Cliente.Controller;

interface

uses
  System.SysUtils, System.JSON,
  REST.Client, REST.Types,
  Data.Bind.Components, Data.Bind.ObjectScope,
  FireDAC.Comp.Client,
  Cliente.DAO;

type
  TClienteController = class
  public
    function BuscarCEP(const mCEP: String; out mEndereco: TEnderecoDTO): Boolean;
    function ClienteExiste(mCPFCNPJ: String): Boolean;
    function ListarClientes(mQuery: TFDQuery; mFiltro: TFiltroCliente): TFDQuery;
    function ContarClientes: Integer;

    function ApenasNumeros(const mTexto: String): String;

    function ValidarCPFCNPJ(const mDocumento: String): Boolean;
    function ValidarCNPJAPI(const mCNPJ: String): Boolean;
    function ValidarCPF(const mCPF: String): Boolean;
  end;

implementation

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

function TClienteController.ListarClientes(mQuery: TFDQuery; mFiltro: TFiltroCliente): TFDQuery;
var
  mClienteDAO: TClienteDAO;
begin
  mClienteDAO := TClienteDAO.Create;
  try
    mClienteDAO.ListarClientes(
      mQuery,
      mFiltro
    );
  finally
    mClienteDAO.Free;
  end;
end;

end.
