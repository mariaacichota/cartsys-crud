unit Estado.DAO;

interface

uses
  FireDAC.Comp.Client,
  Conexao.DAO;

type
  TEstadoDAO = class
  public
    function ListarEstados: TFDQuery;
    function ContarEstados: Integer;
  end;

implementation

function TEstadoDAO.ContarEstados: Integer;
var
  Qry: TFDQuery;
begin
  Result := 0;

  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := TConexao.GetConnection;

    Qry.SQL.Text :=
      'SELECT COUNT(*) TOTAL ' +
      'FROM ESTADO';

    Qry.Open;

    Result := Qry.FieldByName('TOTAL').AsInteger;
  finally
    Qry.Free;
  end;
end;

function TEstadoDAO.ListarEstados: TFDQuery;
begin
  Result := TFDQuery.Create(nil);

  Result.Connection := TConexao.GetConnection;

  Result.SQL.Text :=
    'SELECT ID, UF, NOME ' +
    'FROM ESTADO ' +
    'ORDER BY UF';

  Result.Open;
end;

end.
