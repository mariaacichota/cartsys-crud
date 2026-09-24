unit Cidade.Controller.Test;

interface

uses
  DUnitX.TestFramework,
  System.Classes,
  uTestBase,
  Cidade.Controller;

type

  [TestFixture]
  TCidadeControllerTest = class(TTestBase)
  private
    FCidadeController: TCidadeController;
  public

    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure DeveBuscarCidadeExistente;

    [Test]
    procedure DeveInserirCidadeInexistente;

    [Test]
    procedure DeveCarregarCidadesPorUF;

    [Test]
    procedure DeveContarCidades;
  end;

implementation

{ TCidadeControllerTest }

procedure TCidadeControllerTest.DeveBuscarCidadeExistente;
var
  CidadeId: Integer;
begin
  CidadeId :=
    FCidadeController.BuscarCidade(
      'Erechim',
      'RS'
    );

  Assert.AreEqual(1, CidadeId);
end;

procedure TCidadeControllerTest.DeveCarregarCidadesPorUF;
var
  Lista: TStringList;
begin
  Lista := TStringList.Create;
  try

    FCidadeController.CarregarCidades(
      'RS',
      Lista
    );

    Assert.AreEqual(1, Lista.Count);
    Assert.AreEqual('Erechim', Lista[0]);

  finally
    Lista.Free;
  end;
end;

procedure TCidadeControllerTest.DeveContarCidades;
begin
  Assert.AreEqual(
    1,
    FCidadeController.ContarCidades
  );
end;

procedure TCidadeControllerTest.DeveInserirCidadeInexistente;
var
  CidadeId: Integer;
begin
  CidadeId :=
    FCidadeController.BuscarCidade(
      'Getulio Vargas',
      'RS'
    );

  Assert.IsTrue(CidadeId > 0);
end;

procedure TCidadeControllerTest.Setup;
begin
  SetupDatabase;

  FCidadeController := TCidadeController.Create;
end;

procedure TCidadeControllerTest.TearDown;
begin
  FCidadeController.Free;
end;

initialization
  TDUnitX.RegisterTestFixture(TCidadeControllerTest);

end.
