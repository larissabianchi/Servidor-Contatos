object DsContatoController: TDsContatoController
  OldCreateOrder = False
  Height = 193
  Width = 495
  object DSMasterTelefone: TDataSource
    DataSet = FDMasterContato
    Left = 168
    Top = 120
  end
  object DSMasterEmail: TDataSource
    DataSet = FDMasterContato
    Left = 296
    Top = 120
  end
  object FDSAContato: TFDSchemaAdapter
    Left = 424
    Top = 24
  end
  object FDMasterContato: TFDQuery
    CachedUpdates = True
    Connection = frmDMServer.Bd_contatosConnection
    SchemaAdapter = FDSAContato
    FetchOptions.AssignedValues = [evDetailCascade, evLiveWindowFastFirst, evDetailServerCascade]
    FetchOptions.LiveWindowFastFirst = True
    FetchOptions.DetailCascade = True
    FetchOptions.DetailServerCascade = True
    SQL.Strings = (
      'SELECT * FROM contato')
    Left = 48
    Top = 24
    object FDMasterContatocont_id: TStringField
      FieldName = 'cont_id'
      Origin = 'cont_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 50
    end
    object FDMasterContatocont_nome: TStringField
      FieldName = 'cont_nome'
      Origin = 'cont_nome'
      Size = 100
    end
    object FDMasterContatocont_empresa: TStringField
      FieldName = 'cont_empresa'
      Origin = 'cont_empresa'
      Size = 100
    end
  end
  object FDDetailTelefone: TFDQuery
    CachedUpdates = True
    MasterSource = DSMasterTelefone
    MasterFields = 'cont_id'
    DetailFields = 'contt_cont_id'
    Connection = frmDMServer.Bd_contatosConnection
    SchemaAdapter = FDSAContato
    FetchOptions.AssignedValues = [evDetailCascade, evDetailServerCascade]
    FetchOptions.DetailServerCascade = True
    SQL.Strings = (
      
        'SELECT * FROM contato_telefone, contato WHERE contt_cont_id = co' +
        'nt_id ')
    Left = 168
    Top = 24
    object FDDetailTelefonecontt_id: TFDAutoIncField
      FieldName = 'contt_id'
      Origin = 'contt_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDDetailTelefonecontt_cont_id: TStringField
      FieldName = 'contt_cont_id'
      Origin = 'contt_cont_id'
      Size = 50
    end
    object FDDetailTelefonecontt_ddd: TStringField
      FieldName = 'contt_ddd'
      Origin = 'contt_ddd'
      Size = 3
    end
    object FDDetailTelefonecontt_numero: TStringField
      FieldName = 'contt_numero'
      Origin = 'contt_numero'
      Size = 10
    end
    object FDDetailTelefonecontt_tipo: TStringField
      FieldName = 'contt_tipo'
      Origin = 'contt_tipo'
    end
  end
  object FDDetailEmail: TFDQuery
    CachedUpdates = True
    MasterSource = DSMasterEmail
    MasterFields = 'cont_id'
    DetailFields = 'conte_cont_id'
    Connection = frmDMServer.Bd_contatosConnection
    SchemaAdapter = FDSAContato
    FetchOptions.AssignedValues = [evDetailCascade, evLiveWindowFastFirst, evDetailServerCascade]
    FetchOptions.LiveWindowFastFirst = True
    FetchOptions.DetailCascade = True
    FetchOptions.DetailServerCascade = True
    SQL.Strings = (
      
        'SELECT * FROM contato_email, contato WHERE conte_cont_id = cont_' +
        'id')
    Left = 296
    Top = 24
    object FDDetailEmailconte_id: TFDAutoIncField
      FieldName = 'conte_id'
      Origin = 'conte_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDDetailEmailconte_cont_id: TStringField
      FieldName = 'conte_cont_id'
      Origin = 'conte_cont_id'
      Size = 50
    end
    object FDDetailEmailconte_email: TStringField
      FieldName = 'conte_email'
      Origin = 'conte_email'
      Size = 100
    end
    object FDDetailEmailconte_tipo: TStringField
      FieldName = 'conte_tipo'
      Origin = 'conte_tipo'
    end
  end
end
