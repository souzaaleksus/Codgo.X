object ServerMethods: TServerMethods
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 381
  Width = 1188
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=Teste'
      'User_Name=postgres'
      'Password=123'
      'Server=localhost'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 80
    Top = 8
  end
  object FDPhysPgDriverLink: TFDPhysPgDriverLink
    Left = 184
    Top = 8
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 304
    Top = 8
  end
  object FDStanStorageJSONLink: TFDStanStorageJSONLink
    Left = 432
    Top = 8
  end
  object FDQueryPessoa: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      
        'SELECT idpessoa, flnatureza, dsdocumento, nmprimeiro, nmsegundo,' +
        ' dtregistro'
      '  FROM public.pessoa;'
      '')
    Left = 80
    Top = 64
    object FDQueryPessoaidpessoa: TLargeintField
      FieldName = 'idpessoa'
      Origin = 'idpessoa'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQueryPessoaflnatureza: TSmallintField
      FieldName = 'flnatureza'
      Origin = 'flnatureza'
    end
    object FDQueryPessoadsdocumento: TWideStringField
      FieldName = 'dsdocumento'
      Origin = 'dsdocumento'
    end
    object FDQueryPessoanmprimeiro: TWideStringField
      FieldName = 'nmprimeiro'
      Origin = 'nmprimeiro'
      Size = 100
    end
    object FDQueryPessoanmsegundo: TWideStringField
      FieldName = 'nmsegundo'
      Origin = 'nmsegundo'
      Size = 100
    end
    object FDQueryPessoadtregistro: TDateField
      FieldName = 'dtregistro'
      Origin = 'dtregistro'
    end
  end
  object FDQueryEndereco: TFDQuery
    Connection = FDConnection
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = True
    SQL.Strings = (
      'SELECT idendereco, idpessoa, dscep'
      '  FROM public.endereco'
      'WHERE idpessoa = :idpessoa'
      '')
    Left = 80
    Top = 120
    ParamData = <
      item
        Name = 'IDPESSOA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQueryEnderecoidendereco: TLargeintField
      FieldName = 'idendereco'
      Origin = 'idendereco'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQueryEnderecoidpessoa: TLargeintField
      FieldName = 'idpessoa'
      Origin = 'idpessoa'
    end
    object FDQueryEnderecodscep: TWideStringField
      FieldName = 'dscep'
      Origin = 'dscep'
      Size = 15
    end
  end
  object FDQueryEnderecoIntegracao: TFDQuery
    Connection = FDConnection
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = True
    SQL.Strings = (
      
        'SELECT idendereco, dsuf, nmcidade, nmbairro, nmlogradouro, dscom' +
        'plemento'
      '  FROM public.endereco_integracao'
      'WHERE idendereco = :idendereco  '
      '')
    Left = 80
    Top = 176
    ParamData = <
      item
        Name = 'IDENDERECO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQueryEnderecoIntegracaoidendereco: TLargeintField
      FieldName = 'idendereco'
      Origin = 'idendereco'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQueryEnderecoIntegracaodsuf: TWideStringField
      FieldName = 'dsuf'
      Origin = 'dsuf'
      Size = 50
    end
    object FDQueryEnderecoIntegracaonmcidade: TWideStringField
      FieldName = 'nmcidade'
      Origin = 'nmcidade'
      Size = 100
    end
    object FDQueryEnderecoIntegracaonmbairro: TWideStringField
      FieldName = 'nmbairro'
      Origin = 'nmbairro'
      Size = 50
    end
    object FDQueryEnderecoIntegracaonmlogradouro: TWideStringField
      FieldName = 'nmlogradouro'
      Origin = 'nmlogradouro'
      Size = 100
    end
    object FDQueryEnderecoIntegracaodscomplemento: TWideStringField
      FieldName = 'dscomplemento'
      Origin = 'dscomplemento'
      Size = 100
    end
  end
  object RESTClient: TRESTClient
    BaseURL = 'https://viacep.com.br/ws'
    Params = <>
    SynchronizedEvents = False
    Left = 568
    Top = 8
  end
  object RESTRequest: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient
    Params = <>
    Response = RESTResponse
    SynchronizedEvents = False
    Left = 568
    Top = 64
  end
  object RESTResponse: TRESTResponse
    Left = 568
    Top = 120
  end
  object FDQueryCEP: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT idpessoa, idendereco, dscep'
      'FROM public.endereco'
      'WHERE idpessoa = :idpessoa '
      'AND dscep = :dscep  ')
    Left = 1072
    Top = 8
    ParamData = <
      item
        Name = 'IDPESSOA'
        DataType = ftLargeint
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DSCEP'
        DataType = ftString
        ParamType = ptInput
        Size = 15
        Value = Null
      end>
    object FDQueryCEPidpessoa: TLargeintField
      FieldName = 'idpessoa'
      Origin = 'idpessoa'
    end
    object FDQueryCEPidendereco: TLargeintField
      FieldName = 'idendereco'
      Origin = 'idendereco'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQueryCEPdscep: TWideStringField
      FieldName = 'dscep'
      Origin = 'dscep'
      Size = 15
    end
  end
  object FDQueryCEPEndereco: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      
        'SELECT idendereco, dsuf, nmcidade, nmbairro, nmlogradouro, dscom' +
        'plemento'
      'FROM public.endereco_integracao'
      'WHERE idendereco = :idendereco  ')
    Left = 1072
    Top = 64
    ParamData = <
      item
        Name = 'IDENDERECO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQueryCEPEnderecoidendereco: TLargeintField
      FieldName = 'idendereco'
      Origin = 'idendereco'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQueryCEPEnderecodsuf: TWideStringField
      FieldName = 'dsuf'
      Origin = 'dsuf'
      Size = 50
    end
    object FDQueryCEPEndereconmcidade: TWideStringField
      FieldName = 'nmcidade'
      Origin = 'nmcidade'
      Size = 100
    end
    object FDQueryCEPEndereconmbairro: TWideStringField
      FieldName = 'nmbairro'
      Origin = 'nmbairro'
      Size = 50
    end
    object FDQueryCEPEndereconmlogradouro: TWideStringField
      FieldName = 'nmlogradouro'
      Origin = 'nmlogradouro'
      Size = 100
    end
    object FDQueryCEPEnderecodscomplemento: TWideStringField
      FieldName = 'dscomplemento'
      Origin = 'dscomplemento'
      Size = 100
    end
  end
  object FDQueryInsert50000: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'INSERT INTO public.pessoa('
      
        '            flnatureza, dsdocumento, nmprimeiro, nmsegundo, dtre' +
        'gistro)'
      
        '    VALUES (:flnatureza, :dsdocumento, :nmprimeiro, :nmsegundo, ' +
        ':dtregistro);'
      '')
    Left = 80
    Top = 288
    ParamData = <
      item
        Name = 'FLNATUREZA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DSDOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NMPRIMEIRO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NMSEGUNDO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DTREGISTRO'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end>
  end
  object FDQueryDelete50000: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'DELETE FROM public.pessoa'
      ' WHERE flnatureza = :flnatureza;'
      '')
    Left = 80
    Top = 233
    ParamData = <
      item
        Name = 'FLNATUREZA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object RESTClient2: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://cep.awesomeapi.com.br'
    Params = <>
    SynchronizedEvents = False
    Left = 880
    Top = 8
  end
  object RESTRequest2: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient2
    Params = <>
    Response = RESTResponse2
    SynchronizedEvents = False
    Left = 880
    Top = 64
  end
  object RESTResponse2: TRESTResponse
    ContentType = 'application/json'
    Left = 880
    Top = 120
  end
  object RESTResponseDataSetAdapter2: TRESTResponseDataSetAdapter
    Active = True
    Dataset = FDMemTable2
    FieldDefs = <>
    Response = RESTResponse2
    TypesMode = Rich
    Left = 880
    Top = 176
  end
  object FDMemTable2: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'cep'
        DataType = ftInteger
      end
      item
        Name = 'address_type'
        DataType = ftWideString
        Size = 3
      end
      item
        Name = 'address_name'
        DataType = ftWideString
        Size = 21
      end
      item
        Name = 'address'
        DataType = ftWideString
        Size = 25
      end
      item
        Name = 'state'
        DataType = ftWideString
        Size = 2
      end
      item
        Name = 'district'
        DataType = ftWideString
        Size = 9
      end
      item
        Name = 'lat'
        DataType = ftFloat
      end
      item
        Name = 'lng'
        DataType = ftFloat
      end
      item
        Name = 'city'
        DataType = ftWideString
        Size = 9
      end
      item
        Name = 'city_ibge'
        DataType = ftInteger
      end
      item
        Name = 'ddd'
        DataType = ftInteger
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 880
    Top = 232
    object FDMemTable2cep: TIntegerField
      FieldName = 'cep'
    end
    object FDMemTable2address_type: TWideStringField
      FieldName = 'address_type'
      Size = 3
    end
    object FDMemTable2address_name: TWideStringField
      FieldName = 'address_name'
      Size = 21
    end
    object FDMemTable2address: TWideStringField
      FieldName = 'address'
      Size = 25
    end
    object FDMemTable2state: TWideStringField
      FieldName = 'state'
      Size = 2
    end
    object FDMemTable2district: TWideStringField
      FieldName = 'district'
      Size = 9
    end
    object FDMemTable2lat: TFloatField
      FieldName = 'lat'
    end
    object FDMemTable2lng: TFloatField
      FieldName = 'lng'
    end
    object FDMemTable2city: TWideStringField
      FieldName = 'city'
      Size = 9
    end
    object FDMemTable2city_ibge: TIntegerField
      FieldName = 'city_ibge'
    end
    object FDMemTable2ddd: TIntegerField
      FieldName = 'ddd'
    end
  end
  object RESTClient1: TRESTClient
    BaseURL = 'https://cdn.apicep.com/file/apicep'
    Params = <>
    SecureProtocols = [SSL2, SSL3, TLS1, TLS11, TLS12, TLS13]
    SynchronizedEvents = False
    Left = 720
    Top = 8
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    ConnectTimeout = 0
    ReadTimeout = 0
    SynchronizedEvents = False
    Left = 720
    Top = 64
  end
  object RESTResponse1: TRESTResponse
    Left = 720
    Top = 120
  end
end