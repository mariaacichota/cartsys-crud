unit Cliente.DAO;

interface

uses
  System.SysUtils,
  FireDAC.Comp.Client,
  Cliente.Model, Conexao.DAO;


type
  TEnderecoDTO = record
    CEP: String;
    Logradouro: String;
    Bairro: String;
    Cidade: String;
    UF: String;
  end;

type
  TFiltroCliente = record
    ID: Integer;
    Nome: String;
    CPFCNPJ: String;
    CEP: String;
    DataNascimento: TDate;
    UF: String;
    Cidade: String;
  end;

type
  TClienteDAO = class
  public
    procedure Inserir(mCliente: TCliente);
    procedure Alterar(mCliente: TCliente);
    procedure Excluir(mId: Integer);
    procedure ListarClientes(mQuery: TFDQuery; mFiltro: TFiltroCliente);
    function ContarClientes: Integer;
    function ClienteExiste(mCPFCNPJ: String): Boolean;
  end;

implementation

uses
  Vcl.Dialogs;

procedure TClienteDAO.Inserir(mCliente: TCliente);
var
  Qry: TFDQuery;
  Conn: TFDConnection;
begin
  Conn := TConexao.GetConnection;
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := Conn;
    Conn.StartTransaction;
    try
      Qry.SQL.Text :=
        'INSERT INTO CLIENTE (' +
        'ID, NOME, CEP, CPF_CNPJ, ENDERECO, ' +
        'NUMERO, COMPLEMENTO, BAIRRO, CIDADE, DATANASCIMENTO' +
        ') VALUES (' +
        ':ID, :NOME, :CEP, :CPF_CNPJ, :ENDERECO, ' +
        ':NUMERO, :COMPLEMENTO, :BAIRRO, :CIDADE, :DATANASCIMENTO' +
        ')';

      Qry.ParamByName('ID').AsInteger := mCliente.ID;
      Qry.ParamByName('NOME').AsString := mCliente.Nome;
      Qry.ParamByName('CEP').AsString := mCliente.CEP;
      Qry.ParamByName('CPF_CNPJ').AsString := mCliente.CPFCNPJ;
      Qry.ParamByName('ENDERECO').AsString := mCliente.Endereco;
      Qry.ParamByName('NUMERO').AsString := mCliente.Numero;
      Qry.ParamByName('COMPLEMENTO').AsString := mCliente.Complemento;
      Qry.ParamByName('BAIRRO').AsString := mCliente.Bairro;
      Qry.ParamByName('CIDADE').AsInteger := mCliente.Cidade;
      Qry.ParamByName('DATANASCIMENTO').AsDate := mCliente.DataNascimento;
      Qry.ExecSQL;

      Conn.Commit;

    except
      on E: Exception do
      begin
        Conn.Rollback;

        raise Exception.Create(
          'Erro ao inserir cliente: ' +
          E.Message
        );
      end;
    end;

  finally
    Qry.Free;
  end;
end;

procedure TClienteDAO.Alterar(mCliente: TCliente);
var
  Qry: TFDQuery;
  Conn: TFDConnection;
begin
  Conn := TConexao.GetConnection;

  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := Conn;

    Conn.StartTransaction;

    try
      Qry.SQL.Text :=
        'UPDATE CLIENTE SET ' +
        'NOME = :NOME, ' +
        'CEP = :CEP, ' +
        'CPF_CNPJ = :CPF_CNPJ, ' +
        'ENDERECO = :ENDERECO, ' +
        'NUMERO = :NUMERO, ' +
        'COMPLEMENTO = :COMPLEMENTO, ' +
        'BAIRRO = :BAIRRO, ' +
        'CIDADE = :CIDADE, ' +
        'DATANASCIMENTO = :DATANASCIMENTO ' +
        'WHERE ID = :ID';

      Qry.ParamByName('ID').AsInteger          := mCliente.ID;
      Qry.ParamByName('NOME').AsString         := mCliente.Nome;
      Qry.ParamByName('CEP').AsString          := mCliente.CEP;
      Qry.ParamByName('CPF_CNPJ').AsString     := mCliente.CPFCNPJ;
      Qry.ParamByName('ENDERECO').AsString     := mCliente.Endereco;
      Qry.ParamByName('NUMERO').AsString       := mCliente.Numero;
      Qry.ParamByName('COMPLEMENTO').AsString  := mCliente.Complemento;
      Qry.ParamByName('BAIRRO').AsString       := mCliente.Bairro;
      Qry.ParamByName('CIDADE').AsInteger      := mCliente.Cidade;
      Qry.ParamByName('DATANASCIMENTO').AsDate := mCliente.DataNascimento;

      Qry.ExecSQL;

      Conn.Commit;

    except
      on E: Exception do
      begin
        Conn.Rollback;

        raise Exception.Create(
          'Erro ao alterar cliente: ' +
          E.Message
        );
      end;
    end;

  finally
    Qry.Free;
  end;
end;

procedure TClienteDAO.Excluir(mId: Integer);
var
  Qry: TFDQuery;
  Conn: TFDConnection;
begin
  Conn := TConexao.GetConnection;

  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := Conn;

    Conn.StartTransaction;
    try
      Qry.SQL.Text :=
        'DELETE FROM CLIENTE ' +
        'WHERE ID = :ID';

      Qry.ParamByName('ID').AsInteger := mId;

      Qry.ExecSQL;

      Conn.Commit;

    except
      on E: Exception do
      begin
        Conn.Rollback;

        raise Exception.Create(
          'Erro ao excluir cliente: ' +
          E.Message
        );
      end;
    end;

  finally
    Qry.Free;
  end;
end;

procedure TClienteDAO.ListarClientes(mQuery: TFDQuery; mFiltro: TFiltroCliente);
begin
  mQuery.Close;
  mQuery.SQL.Clear;

  mQuery.SQL.Add(
    'SELECT ' +
    '  C.ID, ' +
    '  C.NOME, ' +
    '  C.CPF_CNPJ, ' +
    '  C.DATANASCIMENTO, ' +
    '  C.CEP, ' +
    '  C.ENDERECO, ' +
    '  C.NUMERO, ' +
    '  C.COMPLEMENTO, ' +
    '  C.BAIRRO, ' +
    '  CID.NOME AS CIDADE, ' +
    '  EST.UF ' +
    'FROM CLIENTE C ' +
    'LEFT JOIN CIDADE CID ON CID.ID = C.CIDADE ' +
    'LEFT JOIN ESTADO EST ON EST.ID = CID.ESTADOID ' +
    'WHERE 1=1 ');

  if mFiltro.ID > 0 then
    mQuery.SQL.Add(
      'AND C.ID = ' + IntToStr(mFiltro.ID)
    );

  if Trim(mFiltro.Nome) <> '' then
    mQuery.SQL.Add(
      'AND UPPER(C.NOME) LIKE ' +
      QuotedStr('%' + UpperCase(mFiltro.Nome) + '%')
    );

  if Trim(mFiltro.CPFCNPJ) <> '' then
    mQuery.SQL.Add(
      'AND C.CPF_CNPJ = ' +
      QuotedStr(mFiltro.CPFCNPJ)
    );

  if Trim(mFiltro.CEP) <> '' then
    mQuery.SQL.Add(
      'AND C.CEP = ' +
      QuotedStr(mFiltro.CEP)
    );

  if Trim(mFiltro.UF) <> '' then
    mQuery.SQL.Add(
      'AND EST.UF = ' +
      QuotedStr(mFiltro.UF)
    );

  if Trim(mFiltro.Cidade) <> '' then
    mQuery.SQL.Add(
      'AND CID.NOME = ' +
      QuotedStr(mFiltro.Cidade)
    );

  if mFiltro.DataNascimento > 0 then
    mQuery.SQL.Add(
      'AND C.DATANASCIMENTO = ' +
      QuotedStr(
        FormatDateTime('yyyy-mm-dd', mFiltro.DataNascimento)
      )
    );

  mQuery.SQL.Add('ORDER BY C.NOME');

  mQuery.Open;
end;

function TClienteDAO.ClienteExiste(mCPFCNPJ: String): Boolean;
var
  Qry: TFDQuery;
begin
  Result := False;

  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := TConexao.GetConnection;

    Qry.SQL.Text :=
      'SELECT ID ' +
      'FROM CLIENTE ' +
      'WHERE CPF_CNPJ = ' +
      QuotedStr(mCPFCNPJ);

    Qry.Open;

    Result := not Qry.IsEmpty;
  finally
    Qry.Free;
  end;
end;

function TClienteDAO.ContarClientes: Integer;
var
  Qry: TFDQuery;
begin
  Result := 0;

  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := TConexao.GetConnection;

    Qry.SQL.Text :=
      'SELECT COUNT(*) TOTAL ' +
      'FROM CLIENTE';

    Qry.Open;

    Result := Qry.FieldByName('TOTAL').AsInteger;
  finally
    Qry.Free;
  end;
end;

end.
