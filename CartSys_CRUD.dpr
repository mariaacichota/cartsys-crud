program CartSys_CRUD;

uses
  Vcl.Forms,
  Cliente.Controller in 'Controller\Cliente.Controller.pas',
  Cidade.Model in 'Model\Cidade.Model.pas',
  Cliente.Model in 'Model\Cliente.Model.pas',
  Estado.Model in 'Model\Estado.Model.pas',
  Cliente.View in 'View\Cliente.View.pas' {frmCliente},
  Principal.View in 'View\Principal.View.pas' {frmPrincipal},
  Relatorio.View in 'View\Relatorio.View.pas' {frmRelatorio},
  Relatorio.DAO in 'DAO\Relatorio.DAO.pas',
  Cidade.DAO in 'DAO\Cidade.DAO.pas',
  Cliente.DAO in 'DAO\Cliente.DAO.pas',
  Conexao.DAO in 'DAO\Conexao.DAO.pas',
  Estado.DAO in 'DAO\Estado.DAO.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
