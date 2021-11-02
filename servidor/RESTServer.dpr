program RESTServer;

uses
  Vcl.Forms,
  frmPrincipal in 'frmPrincipal.pas' {frmServidorContatos},
  untModelo.Contato in 'untModelo.Contato.pas',
  dmServer in 'dmServer.pas' {frmDMServer: TDataModule},
  ContatoController in 'ContatoController.pas' {DsContatoController: TDSServerModule},
  Gerar.GUID in 'Gerar.GUID.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmServidorContatos, frmServidorContatos);
  Application.CreateForm(TfrmDMServer, frmDMServer);
  Application.Run;
end.
