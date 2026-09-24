unit Relatorio.Controller;

interface

uses
  Relatorio.DAO, Estado.DAO, Cidade.DAO,
  System.Classes, System.SysUtils, Vcl.CheckLst, FireDAC.Comp.Client;

type
  TRelatorioController = class
  public
    procedure CarregarUFs(mLista: TStrings);
    procedure CarregarCidades(mUF: String; mLista: TStrings);
    procedure CarregarCidadesPorUFs(mUFs: TCheckListBox; mCidades: TStrings);
    procedure ValidarFiltros(mTipoFiltro: TTipoFiltroRelatorio;
                             mIdInicial, mIdFinal, mCidades, mUFs: String);

    function GerarSQLRelatorio(mTipoFiltro: TTipoFiltroRelatorio;
                            mIdInicial, mIdFinal: Integer; mCidades, mUFs: String): String;
  end;

implementation

procedure TRelatorioController.CarregarCidades(mUF: String; mLista: TStrings);
var
  mCidadeDAO: TCidadeDAO;
  mQry: TFDQuery;
begin
  mCidadeDAO := TCidadeDAO.Create;
  try
    mQry := mCidadeDAO.ListarPorEstado(mUF);
    try
      while not mQry.Eof do
      begin
        if mLista.IndexOf(mQry.FieldByName('NOME').AsString) = -1 then
          mLista.Add(mQry.FieldByName('NOME').AsString);

        mQry.Next;
      end;
    finally
      mQry.Free;
    end;
  finally
    mCidadeDAO.Free;
  end;
end;

procedure TRelatorioController.CarregarCidadesPorUFs(mUFs: TCheckListBox; mCidades: TStrings);
var
  I: Integer;
begin
  mCidades.Clear;

  for I := 0 to mUFs.Count - 1 do
  begin
    if mUFs.Checked[I] then
      CarregarCidades(
        mUFs.Items[I],
        mCidades
      );
  end;
end;

procedure TRelatorioController.CarregarUFs(mLista: TStrings);
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
