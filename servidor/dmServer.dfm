object frmDMServer: TfrmDMServer
  OldCreateOrder = False
  Height = 200
  Width = 312
  object DsRestServer: TDSServer
    Left = 40
    Top = 40
  end
  object DsHttpRestServer: TDSHTTPService
    HttpPort = 9090
    Server = DsRestServer
    Filters = <>
    Left = 128
    Top = 40
  end
  object DsServerContato: TDSServerClass
    OnGetClass = DsServerContatoGetClass
    Server = DsRestServer
    Left = 232
    Top = 40
  end
  object Bd_contatosConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=bd_contatos')
    LoginPrompt = False
    Left = 87
    Top = 122
  end
end
