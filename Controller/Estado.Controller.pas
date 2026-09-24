unit Estado.Controller;

interface

uses
  Estado.DAO;

type
  TEstadoController = class
  public
    function ContarEstados: Integer;
  end;

implementation

{ TEstadoController }

function TEstadoController.ContarEstados: Integer;
var
  mEstadoDAO: TEstadoDAO;
begin
  mEstadoDAO := TEstadoDAO.Create;
  try
    Result := mEstadoDAO.ContarEstados;
  finally
    mEstadoDAO.Free;
  end;
end;

end.

