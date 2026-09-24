unit Principal.View;

interface

uses
  System.SysUtils, System.Variants, System.Classes,
  Winapi.Windows, Winapi.Messages,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.Imaging.pngimage, Vcl.StdCtrls,
  FireDAC.Phys.FBDef, FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.IBBase, FireDAC.Phys.FB,
  Cliente.View, Relatorio.View, Cliente.Controller, Estado.Controller, Cidade.Controller;

type
  TfrmPrincipal = class(TForm)
    mnPrincipal: TMainMenu;
    mnSistema: TMenuItem;
    subSair: TMenuItem;
    mnCadastros: TMenuItem;
    subCliente: TMenuItem;
    mnRelatorios: TMenuItem;
    subRelatorio: TMenuItem;
    Image1: TImage;
    lblTitulo: TLabel;
    lblSubTitulo: TLabel;
    lblCidadesTitulo: TLabel;
    lblCidadesValor: TLabel;
    lblEstadosTitulo: TLabel;
    lblEstadosValor: TLabel;
    lblClientesTitulo: TLabel;
    lblClientesValor: TLabel;
    pnlEstados: TPanel;
    pnlCidades: TPanel;
    pnlClientes: TPanel;

    procedure subSairClick(Sender: TObject);
    procedure subClienteClick(Sender: TObject);
    procedure subRelatorioClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    FCidadeController: TCidadeController;
    FClienteController: TClienteController;
    FEstadoController: TEstadoController;
  end;

var
  frmPrincipal: TfrmPrincipal;
  frmCliente: TfrmCliente;
  frmRelatorio: TfrmRelatorio;

implementation

{$R *.dfm}

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  FCidadeController.Free;
  FClienteController.Free;
  FEstadoController.Free;
end;

procedure TfrmPrincipal.FormResize(Sender: TObject);
var
  CentroLogo: Integer;
begin
  // Logo
  Image1.Left := (ClientWidth - Image1.Width) div 2;
  Image1.Top := 80;

  CentroLogo := Image1.Left + (Image1.Width div 2);

  // Título
  lblTitulo.AutoSize := True;
  lblTitulo.Left := CentroLogo - (lblTitulo.Width div 2);
  lblTitulo.Top := Image1.Top + Image1.Height + 20;

  // Subtítulo
  lblSubTitulo.AutoSize := True;
  lblSubTitulo.Left := CentroLogo - (lblSubTitulo.Width div 2);
  lblSubTitulo.Top := lblTitulo.Top + lblTitulo.Height + 10;

  // Painéis
  pnlClientes.Top := lblSubTitulo.Top + lblSubTitulo.Height + 40;
  pnlCidades.Top := pnlClientes.Top;
  pnlEstados.Top := pnlClientes.Top;

  pnlClientes.Left := CentroLogo - 290;
  pnlCidades.Left := CentroLogo - 90;
  pnlEstados.Left := CentroLogo + 110;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  lblClientesValor.Caption := IntToStr(FClienteController.ContarClientes);
  lblCidadesValor.Caption  := IntToStr(FCidadeController.ContarCidades);
  lblEstadosValor.Caption  := IntToStr(FEstadoController.ContarEstados);
end;

procedure TfrmPrincipal.subClienteClick(Sender: TObject);
begin
  frmCliente := TfrmCliente.Create(nil);

  try
    frmCliente.ShowModal;
  finally
    frmCliente.Free;
  end;
end;

procedure TfrmPrincipal.subRelatorioClick(Sender: TObject);
begin
  frmRelatorio := TfrmRelatorio.Create(nil);

  try
    frmRelatorio.ShowModal;
  finally
    frmRelatorio.Free;
  end;
end;

procedure TfrmPrincipal.subSairClick(Sender: TObject);
begin
  Close;
end;

end.
