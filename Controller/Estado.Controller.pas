unit Estado.Controller;

interface

uses
  Estado.DAO,
  System.Classes, FireDAC.Comp.Client;

type
  TEstadoController = class
  public
    procedure CarregarUFs(mLista: TStrings);

    function ContarEstados: Integer;
  end;

implementation

{ TEstadoController }

procedure TEstadoController.CarregarUFs(mLista: TStrings);
var
  mRelatorioDAO: TEstadoDAO;
  mQry: TFDQuery;
begin
  mLista.Clear;

  mRelatorioDAO := TEstadoDAO.Create;
  try
    mQry := mRelatorioDAO.ListarEstados;
    try
      while not mQry.Eof do
      begin
        mLista.Add(mQry.FieldByName('UF').AsString);
        mQry.Next;
      end;

    finally
      mQry.Free;
    end;
  finally
    mRelatorioDAO.Free;
  end;
end;

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

