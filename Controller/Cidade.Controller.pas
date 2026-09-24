unit Cidade.Controller;

interface

uses
  Cidade.DAO,
  System.Classes, Vcl.CheckLst, FireDAC.Comp.Client, System.SysUtils;

type
  TCidadeController = class
  public
    procedure CarregarCidades(mUF: String; mLista: TStrings);
    procedure CarregarCidadesPorUFs(mUFs: TCheckListBox; mCidades: TStrings);

    function BuscarCidade(mCidade, mUF: String): Integer;
    function ContarCidades: Integer;
  end;

implementation

uses
  Vcl.Dialogs;

{ TCidadeController }

function TCidadeController.BuscarCidade(mCidade, mUF: String): Integer;
var
  mCidadeDAO: TCidadeDAO;
  mCidadeId: Integer;
begin
  mCidadeDAO := TCidadeDAO.Create;
  try
    mCidadeId := mCidadeDAO.BuscarCidade(mCidade, mUF);
    if (mCidadeId = 0) then
      mCidadeId := mCidadeDAO.InserirCidade(mCidade, mUF);

    Result := mCidadeId;
  finally
    mCidadeDAO.Free;
  end;
end;

procedure TCidadeController.CarregarCidades(mUF: String; mLista: TStrings);
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

procedure TCidadeController.CarregarCidadesPorUFs(mUFs: TCheckListBox;
  mCidades: TStrings);
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
