unit Relatorio.Controller;

interface

uses
  Relatorio.DAO, Estado.DAO, Cidade.DAO,
  System.Classes, System.SysUtils, Vcl.CheckLst, FireDAC.Comp.Client;

type
  TRelatorioController = class
  public
    procedure ValidarFiltros(mTipoFiltro: TTipoFiltroRelatorio;
                             mIdInicial, mIdFinal, mCidades, mUFs: String);

    function GerarSQLRelatorio(mTipoFiltro: TTipoFiltroRelatorio;
                            mIdInicial, mIdFinal: Integer; mCidades, mUFs: String): String;
  end;

implementation

function TRelatorioController.GerarSQLRelatorio(mTipoFiltro: TTipoFiltroRelatorio;
  mIdInicial, mIdFinal: Integer; mCidades, mUFs: String): String;
var
  mRelatorioDAO: TRelatorioDAO;
begin
  mRelatorioDAO := TRelatorioDAO.Create;
  try
    Result := mRelatorioDAO.GerarSQLRelatorio(mIdInicial, mIdFinal, mCidades, mUFs, mTipoFiltro);
  finally
    mRelatorioDAO.Free;
  end;
end;

procedure TRelatorioController.ValidarFiltros(mTipoFiltro: TTipoFiltroRelatorio;
  mIdInicial, mIdFinal, mCidades, mUFs: String);
begin
  case mTipoFiltro of
    tfFaixaID:
      begin
        if (Trim(mIdInicial) = '') and
           (Trim(mIdFinal) = '') then
          raise Exception.Create(
            'Informe o ID Inicial e/ou ID Final.'
          );
      end;

    tfCidadeEstado:
      begin
        if (Trim(mCidades) = '') and
           (Trim(mUFs) = '') then
          raise Exception.Create(
            'Selecione ao menos uma cidade ou UF.'
          );
      end;
  end;
end;

end.
