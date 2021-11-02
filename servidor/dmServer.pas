unit dmServer;

interface

uses
  System.SysUtils, System.Classes, IPPeerServer, Datasnap.DSCommonServer,
  Datasnap.DSHTTP, Datasnap.DSServer, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client;

type
  TfrmDMServer = class(TDataModule)
    DsRestServer: TDSServer;
    DsHttpRestServer: TDSHTTPService;
    DsServerContato: TDSServerClass;
    Bd_contatosConnection: TFDConnection;
    procedure DsServerContatoGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDMServer: TfrmDMServer;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses untModelo.Contato, ContatoController;

{$R *.dfm}

procedure TfrmDMServer.DsServerContatoGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := ContatoController.TDsContatoController;
end;

end.
