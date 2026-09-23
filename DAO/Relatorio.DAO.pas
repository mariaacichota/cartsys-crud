unit Relatorio.DAO;

interface

uses
  System.SysUtils,
  FireDAC.Comp.Client,
  Conexao.DAO;

type
  TTipoFiltroRelatorio = (
    tfTodos,
    tfFaixaID,
    tfCidadeEstado
  );

type
  TRelatorioDAO = class
  public
    function GerarSQLRelatorio(mIdInicial, mIdFinal: Integer;
                               mCidades, mUFs: String; mTipoFiltro: TTipoFiltroRelatorio): String;
  end;

implementation

function TRelatorioDAO.GerarSQLRelatorio(mIdInicial, mIdFinal: Integer;
  mCidades, mUFs: String; mTipoFiltro: TTipoFiltroRelatorio): String;
begin
  Result :=
    'SELECT ' +
    '  C.ID, ' +
    '  C.NOME, ' +
    '  C.CPF_CNPJ, ' +
    '  TRIM( ' +
    '    COALESCE(C.ENDERECO, '''') || ' +

    '    IIF(C.NUMERO IS NOT NULL AND C.NUMERO <> '''', ' +
    '      '', '' || C.NUMERO, ' +
    '      '''' ' +
    '    ) || ' +

    '    IIF(C.BAIRRO IS NOT NULL AND C.BAIRRO <> '''', ' +
    '      '' - '' || C.BAIRRO, ' +
    '      '''' ' +
    '    ) ' +
    '  ) AS ENDERECO_COMPLETO, ' +
    '  CID.NOME AS CIDADE, ' +
    '  EST.UF ' +
    'FROM CLIENTE C ' +
    'LEFT JOIN CIDADE CID ON CID.ID = C.CIDADE ' +
    'LEFT JOIN ESTADO EST ON EST.ID = CID.ESTADOID ' +
    'WHERE 1=1 ';

  case mTipoFiltro of
    tfTodos:
      begin
        // Sem filtros
      end;

    tfFaixaID:
      begin
        if mIdInicial > 0 then
          Result := Result +
            'AND C.ID >= ' + IntToStr(mIdInicial) + ' ';

        if mIdFinal > 0 then
          Result := Result +
            'AND C.ID <= ' + IntToStr(mIdFinal) + ' ';
      end;

    tfCidadeEstado:
      begin
        if Trim(mUFs) <> '' then
          Result := Result +
            'AND EST.UF IN (' + mUFs + ') ';

        if Trim(mCidades) <> '' then
          Result := Result +
            'AND CID.NOME IN (' + mCidades + ') ';
      end;
  end;

  Result := Result + 'ORDER BY C.NOME';
end;

end.
