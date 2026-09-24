unit uTestBase;

interface

uses
  System.SysUtils, FireDAC.Comp.Client,
  Conexao.DAO;

type
  TTestBase = class
  protected
    procedure SetupDatabase;
    procedure CreateDatabase;
    procedure CreateTables;
    procedure PopulateData;
  end;

implementation

{ TTestBase }

procedure TTestBase.CreateDatabase;
var
  Conn: TFDConnection;
begin
  Conn := TFDConnection.Create(nil);
  try
    Conn.Params.DriverID := 'FB';
    Conn.Params.Values['Database'] :=
      'D:\Repository\cartsys-crud\cartsys-crud\SQL\BASE_0.fdb';
    Conn.Params.Values['User_Name'] := 'SYSDBA';
    Conn.Params.Values['Password'] := 'admin';

    Conn.Params.Values['CreateDatabase'] := 'Yes';

    Conn.Connected := True;
  finally
    Conn.Free;
  end;
end;

procedure TTestBase.CreateTables;
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := TConexao.GetConnection;

    Qry.SQL.Text :=
      'CREATE TABLE ESTADO ( ' +
          'ID INTEGER NOT NULL, ' +
          'NOME VARCHAR(50) NOT NULL, ' +
          'UF CHAR(2) NOT NULL, ' +
          'CONSTRAINT PK_ESTADO PRIMARY KEY (ID) ' +
      '); ' +

      'CREATE TABLE CIDADE ( ' +
          'ID INTEGER NOT NULL, ' +
          'NOME VARCHAR(50) NOT NULL, ' +
          'ESTADOID INTEGER NOT NULL, ' +

          'CONSTRAINT PK_CIDADE PRIMARY KEY (ID), ' +

          'CONSTRAINT FK_CIDADE_ESTADO ' +
              'FOREIGN KEY (ESTADOID) ' +
              'REFERENCES ESTADO(ID) ' +
      '); ' +

      'CREATE TABLE CLIENTE ( ' +
          'ID INTEGER NOT NULL, ' +
          'NOME VARCHAR(80) NOT NULL, ' +
          'CEP CHAR(8), ' +
          'CPF_CNPJ VARCHAR(14) NOT NULL, ' +
          'ENDERECO VARCHAR(100) NOT NULL, ' +
          'NUMERO VARCHAR(20), ' +
          'COMPLEMENTO VARCHAR(60), ' +
          'BAIRRO VARCHAR(100) NOT NULL, ' +
          'CIDADE INTEGER NOT NULL, ' +
          'DATANASCIMENTO DATE NOT NULL, ' +

          'CONSTRAINT PK_CLIENTE PRIMARY KEY (ID), ' +

          'CONSTRAINT UK_CLIENTE_CPF_CNPJ ' +
              'UNIQUE (CPF_CNPJ), ' +

          'CONSTRAINT FK_CLIENTE_CIDADE ' +
             'FOREIGN KEY (CIDADE) ' +
              'REFERENCES CIDADE(ID) ' +
      '); ' +

      'CREATE SEQUENCE GEN_CLIENTE_ID;  ' +
      'CREATE SEQUENCE GEN_CIDADE_ID; ' +
      'CREATE SEQUENCE GEN_ESTADO_ID; ' +

      'COMMIT;';

    Qry.ExecSQL;

  finally
    Qry.Free;
  end;
end;

procedure TTestBase.PopulateData;
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := TConexao.GetConnection;

    Qry.SQL.Text :=
      'INSERT INTO ESTADO(ID,NOME,UF) VALUES (1,''Rio Grande do Sul'',''RS'')';

    Qry.ExecSQL;

    Qry.SQL.Text :=
      'INSERT INTO CIDADE(ID,NOME,ESTADOID) VALUES (1,''Erechim'',1)';

    Qry.ExecSQL;

  finally
    Qry.Free;
  end;
end;

procedure TTestBase.SetupDatabase;
const
  cBancoTeste =
    'D:\Repository\cartsys-crud\cartsys-crud\SQL\BASE_0.fdb';
begin

  if FileExists(cBancoTeste) then
    DeleteFile(cBancoTeste);

  TConexao.SetDatabasePath(cBancoTeste);

  CreateDatabase;
  CreateTables;
  PopulateData;
end;

end.
