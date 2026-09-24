unit Cidade.Controller;

interface

uses
  Cidade.DAO;

type
  TCidadeController = class
  public
    function ContarCidades: Integer;
  end;

implementation

{ TCidadeController }

function TCidadeController.ContarCidades: Integer;
var
  mCidadeDAO: TCidadeDAO;
begin
  mCidadeDAO := TCidadeDAO.Create;
  try
    Result := mCidadeDAO.ContarCidades;
  finally
    mCidadeDAO.Free;
  end;
end;

end.
