unit ClientClassesUnit;

interface

uses
  System.JSON,
  Datasnap.DSProxyRest,
  Datasnap.DSClientRest,
  Data.DBXCommon,
  Data.DBXClient,
  Data.DBXDataSnap,
  Data.DBXJSON,
  Datasnap.DSProxy,
  System.Classes,
  System.SysUtils,
  Data.DB,
  Data.SqlExpr,
  Data.DBXDBReaders,
  Data.DBXCDSReaders,
  Data.FireDACJSONReflect,
  Data.DBXJSONReflect;

type
  IDSRestCachedTFDJSONDataSets = interface;

  TServerMethodsClient = class( TDSAdminRestClient )
    private
      FDataModuleCreateCommand : TDSRestCommand;
      FDataModuleDestroyCommand : TDSRestCommand;
      FGetPessoaCommand : TDSRestCommand;
      FGetPessoaCommand_Cache : TDSRestCommand;
      FGetEnderecoCommand : TDSRestCommand;
      FGetEnderecoCommand_Cache : TDSRestCommand;
      FGetEnderecoIntegracaoCommand : TDSRestCommand;
      FGetEnderecoIntegracaoCommand_Cache : TDSRestCommand;
      FGetGetPessoaJSONCommand : TDSRestCommand;
      FGetGetPessoaJSONCommand_Cache : TDSRestCommand;
      FGetEnderecoJSONCommand : TDSRestCommand;
      FGetEnderecoJSONCommand_Cache : TDSRestCommand;
      FGetEnderecoIntegracaoJSONCommand : TDSRestCommand;
      FGetEnderecoIntegracaoJSONCommand_Cache : TDSRestCommand;
      FPostPessoaCommand : TDSRestCommand;
      FGetZipCodeCommand : TDSRestCommand;
      FInsert50000PessoasCommand : TDSRestCommand;
    public
      constructor Create( ARestConnection : TDSRestConnection ); overload;
      constructor Create(
        ARestConnection : TDSRestConnection;
        AInstanceOwner  : Boolean ); overload;
      destructor Destroy; override;
      procedure DataModuleCreate( Sender : TObject );
      procedure DataModuleDestroy( Sender : TObject );
      function GetPessoa( const ARequestFilter : string = '' )
        : TFDJSONDataSets;
      function GetPessoa_Cache( const ARequestFilter : string = '' )
        : IDSRestCachedTFDJSONDataSets;
      function GetEndereco(
        Aidpessoa            : Integer;
        const ARequestFilter : string = '' ) : TFDJSONDataSets;
      function GetEndereco_Cache(
        Aidpessoa            : Integer;
        const ARequestFilter : string = '' ) : IDSRestCachedTFDJSONDataSets;
      function GetEnderecoIntegracao(
        Aidendereco          : Integer;
        const ARequestFilter : string = '' ) : TFDJSONDataSets;
      function GetEnderecoIntegracao_Cache(
        Aidendereco          : Integer;
        const ARequestFilter : string = '' ) : IDSRestCachedTFDJSONDataSets;
      function GetGetPessoaJSON( const ARequestFilter : string = '' )
        : TJSONObject;
      function GetGetPessoaJSON_Cache( const ARequestFilter : string = '' )
        : IDSRestCachedJSONObject;
      function GetEnderecoJSON(
        Aidpessoa            : Integer;
        const ARequestFilter : string = '' ) : TJSONObject;
      function GetEnderecoJSON_Cache(
        Aidpessoa            : Integer;
        const ARequestFilter : string = '' ) : IDSRestCachedJSONObject;
      function GetEnderecoIntegracaoJSON(
        Aidendereco          : Integer;
        const ARequestFilter : string = '' ) : TJSONObject;
      function GetEnderecoIntegracaoJSON_Cache(
        Aidendereco          : Integer;
        const ARequestFilter : string = '' ) : IDSRestCachedJSONObject;
      procedure PostPessoa( ADeltaList : TFDJSONDeltas );
      procedure GetZipCode(
        Aidpessoa            : Int64;
        AZipCode             : string;
        out AMensagem        : string;
        const ARequestFilter : string = '' );
      function Insert50000Pessoas( const ARequestFilter : string = '' )
        : string;
  end;

  IDSRestCachedTFDJSONDataSets = interface
    ( IDSRestCachedObject< TFDJSONDataSets > )
  end;

  TDSRestCachedTFDJSONDataSets = class( TDSRestCachedObject< TFDJSONDataSets >,
    IDSRestCachedTFDJSONDataSets, IDSRestCachedCommand )
  end;

const
  TServerMethods_DataModuleCreate : array [ 0 .. 0 ]
    of TDSRestParameterMetaData = ( ( Name : 'Sender'; Direction : 1;
    DBXType : 37; TypeName : 'TObject' ) );

  TServerMethods_DataModuleDestroy : array [ 0 .. 0 ]
    of TDSRestParameterMetaData = ( ( Name : 'Sender'; Direction : 1;
    DBXType : 37; TypeName : 'TObject' ) );

  TServerMethods_GetPessoa : array [ 0 .. 0 ] of TDSRestParameterMetaData =
    ( ( Name : ''; Direction : 4; DBXType : 37;
    TypeName : 'TFDJSONDataSets' ) );

  TServerMethods_GetPessoa_Cache : array [ 0 .. 0 ]
    of TDSRestParameterMetaData = ( ( Name : ''; Direction : 4; DBXType : 26;
    TypeName : 'String' ) );

  TServerMethods_GetEndereco : array [ 0 .. 1 ] of TDSRestParameterMetaData =
    ( ( Name : 'Aidpessoa'; Direction : 1; DBXType : 6; TypeName : 'Integer' ),
    ( Name : ''; Direction : 4; DBXType : 37; TypeName : 'TFDJSONDataSets' ) );

  TServerMethods_GetEndereco_Cache : array [ 0 .. 1 ]
    of TDSRestParameterMetaData = ( ( Name : 'Aidpessoa'; Direction : 1;
    DBXType : 6; TypeName : 'Integer' ), ( Name : ''; Direction : 4;
    DBXType : 26; TypeName : 'String' ) );

  TServerMethods_GetEnderecoIntegracao : array [ 0 .. 1 ]
    of TDSRestParameterMetaData = ( ( Name : 'Aidendereco'; Direction : 1;
    DBXType : 6; TypeName : 'Integer' ), ( Name : ''; Direction : 4;
    DBXType : 37; TypeName : 'TFDJSONDataSets' ) );

  TServerMethods_GetEnderecoIntegracao_Cache : array [ 0 .. 1 ]
    of TDSRestParameterMetaData = ( ( Name : 'Aidendereco'; Direction : 1;
    DBXType : 6; TypeName : 'Integer' ), ( Name : ''; Direction : 4;
    DBXType : 26; TypeName : 'String' ) );

  TServerMethods_GetGetPessoaJSON : array [ 0 .. 0 ]
    of TDSRestParameterMetaData = ( ( Name : ''; Direction : 4; DBXType : 37;
    TypeName : 'TJSONObject' ) );

  TServerMethods_GetGetPessoaJSON_Cache : array [ 0 .. 0 ]
    of TDSRestParameterMetaData = ( ( Name : ''; Direction : 4; DBXType : 26;
    TypeName : 'String' ) );

  TServerMethods_GetEnderecoJSON : array [ 0 .. 1 ]
    of TDSRestParameterMetaData = ( ( Name : 'Aidpessoa'; Direction : 1;
    DBXType : 6; TypeName : 'Integer' ), ( Name : ''; Direction : 4;
    DBXType : 37; TypeName : 'TJSONObject' ) );

  TServerMethods_GetEnderecoJSON_Cache : array [ 0 .. 1 ]
    of TDSRestParameterMetaData = ( ( Name : 'Aidpessoa'; Direction : 1;
    DBXType : 6; TypeName : 'Integer' ), ( Name : ''; Direction : 4;
    DBXType : 26; TypeName : 'String' ) );

  TServerMethods_GetEnderecoIntegracaoJSON : array [ 0 .. 1 ]
    of TDSRestParameterMetaData = ( ( Name : 'Aidendereco'; Direction : 1;
    DBXType : 6; TypeName : 'Integer' ), ( Name : ''; Direction : 4;
    DBXType : 37; TypeName : 'TJSONObject' ) );

  TServerMethods_GetEnderecoIntegracaoJSON_Cache : array [ 0 .. 1 ]
    of TDSRestParameterMetaData = ( ( Name : 'Aidendereco'; Direction : 1;
    DBXType : 6; TypeName : 'Integer' ), ( Name : ''; Direction : 4;
    DBXType : 26; TypeName : 'String' ) );

  TServerMethods_PostPessoa : array [ 0 .. 0 ] of TDSRestParameterMetaData =
    ( ( Name : 'ADeltaList'; Direction : 1; DBXType : 37;
    TypeName : 'TFDJSONDeltas' ) );

  TServerMethods_GetZipCode : array [ 0 .. 2 ] of TDSRestParameterMetaData =
    ( ( Name : 'AIDPessoa'; Direction : 1; DBXType : 18; TypeName : 'Int64' ),
    ( Name : 'AZipCode'; Direction : 1; DBXType : 26; TypeName : 'string' ),
    ( Name : 'AMensagem'; Direction : 2; DBXType : 26; TypeName : 'string' ) );

  TServerMethods_Insert50000Pessoas : array [ 0 .. 0 ]
    of TDSRestParameterMetaData = ( ( Name : ''; Direction : 4; DBXType : 26;
    TypeName : 'string' ) );

implementation

procedure TServerMethodsClient.DataModuleCreate( Sender : TObject );
  begin
    if FDataModuleCreateCommand = nil
    then
    begin
      FDataModuleCreateCommand := FConnection.CreateCommand;
      FDataModuleCreateCommand.RequestType := 'POST';
      FDataModuleCreateCommand.Text := 'TServerMethods."DataModuleCreate"';
      FDataModuleCreateCommand.Prepare( TServerMethods_DataModuleCreate );
    end;
    if not Assigned( Sender )
    then
      FDataModuleCreateCommand.Parameters[ 0 ].Value.SetNull
    else
    begin
      FMarshal := TDSRestCommand( FDataModuleCreateCommand.Parameters[ 0 ]
        .ConnectionHandler ).GetJSONMarshaler;
      try
        FDataModuleCreateCommand.Parameters[ 0 ].Value.SetJSONValue
          ( FMarshal.Marshal( Sender ), True );
        if FInstanceOwner
        then
          Sender.Free
      finally
        FreeAndNil( FMarshal )
      end
    end;
    FDataModuleCreateCommand.Execute;
  end;

procedure TServerMethodsClient.DataModuleDestroy( Sender : TObject );
  begin
    if FDataModuleDestroyCommand = nil
    then
    begin
      FDataModuleDestroyCommand := FConnection.CreateCommand;
      FDataModuleDestroyCommand.RequestType := 'POST';
      FDataModuleDestroyCommand.Text := 'TServerMethods."DataModuleDestroy"';
      FDataModuleDestroyCommand.Prepare( TServerMethods_DataModuleDestroy );
    end;
    if not Assigned( Sender )
    then
      FDataModuleDestroyCommand.Parameters[ 0 ].Value.SetNull
    else
    begin
      FMarshal := TDSRestCommand( FDataModuleDestroyCommand.Parameters[ 0 ]
        .ConnectionHandler ).GetJSONMarshaler;
      try
        FDataModuleDestroyCommand.Parameters[ 0 ].Value.SetJSONValue
          ( FMarshal.Marshal( Sender ), True );
        if FInstanceOwner
        then
          Sender.Free
      finally
        FreeAndNil( FMarshal )
      end
    end;
    FDataModuleDestroyCommand.Execute;
  end;

function TServerMethodsClient.GetPessoa( const ARequestFilter : string )
  : TFDJSONDataSets;
  begin
    if FGetPessoaCommand = nil
    then
    begin
      FGetPessoaCommand := FConnection.CreateCommand;
      FGetPessoaCommand.RequestType := 'GET';
      FGetPessoaCommand.Text := 'TServerMethods.GetPessoa';
      FGetPessoaCommand.Prepare( TServerMethods_GetPessoa );
    end;
    FGetPessoaCommand.Execute( ARequestFilter );
    if not FGetPessoaCommand.Parameters[ 0 ].Value.IsNull
    then
    begin
      FUnMarshal := TDSRestCommand( FGetPessoaCommand.Parameters[ 0 ]
        .ConnectionHandler ).GetJSONUnMarshaler;
      try
        Result := TFDJSONDataSets
          ( FUnMarshal.UnMarshal( FGetPessoaCommand.Parameters[ 0 ]
          .Value.GetJSONValue( True ) ) );
        if FInstanceOwner
        then
          FGetPessoaCommand.FreeOnExecute( Result );
      finally
        FreeAndNil( FUnMarshal )
      end
    end
    else
      Result := nil;
  end;

function TServerMethodsClient.GetPessoa_Cache( const ARequestFilter : string )
  : IDSRestCachedTFDJSONDataSets;
  begin
    if FGetPessoaCommand_Cache = nil
    then
    begin
      FGetPessoaCommand_Cache := FConnection.CreateCommand;
      FGetPessoaCommand_Cache.RequestType := 'GET';
      FGetPessoaCommand_Cache.Text := 'TServerMethods.GetPessoa';
      FGetPessoaCommand_Cache.Prepare( TServerMethods_GetPessoa_Cache );
    end;
    FGetPessoaCommand_Cache.ExecuteCache( ARequestFilter );
    Result := TDSRestCachedTFDJSONDataSets.Create
      ( FGetPessoaCommand_Cache.Parameters[ 0 ].Value.GetString );
  end;

function TServerMethodsClient.GetEndereco(
  Aidpessoa            : Integer;
  const ARequestFilter : string ) : TFDJSONDataSets;
  begin
    if FGetEnderecoCommand = nil
    then
    begin
      FGetEnderecoCommand := FConnection.CreateCommand;
      FGetEnderecoCommand.RequestType := 'GET';
      FGetEnderecoCommand.Text := 'TServerMethods.GetEndereco';
      FGetEnderecoCommand.Prepare( TServerMethods_GetEndereco );
    end;
    FGetEnderecoCommand.Parameters[ 0 ].Value.SetInt32( Aidpessoa );
    FGetEnderecoCommand.Execute( ARequestFilter );
    if not FGetEnderecoCommand.Parameters[ 1 ].Value.IsNull
    then
    begin
      FUnMarshal := TDSRestCommand( FGetEnderecoCommand.Parameters[ 1 ]
        .ConnectionHandler ).GetJSONUnMarshaler;
      try
        Result := TFDJSONDataSets
          ( FUnMarshal.UnMarshal( FGetEnderecoCommand.Parameters[ 1 ]
          .Value.GetJSONValue( True ) ) );
        if FInstanceOwner
        then
          FGetEnderecoCommand.FreeOnExecute( Result );
      finally
        FreeAndNil( FUnMarshal )
      end
    end
    else
      Result := nil;
  end;

function TServerMethodsClient.GetEndereco_Cache(
  Aidpessoa            : Integer;
  const ARequestFilter : string ) : IDSRestCachedTFDJSONDataSets;
  begin
    if FGetEnderecoCommand_Cache = nil
    then
    begin
      FGetEnderecoCommand_Cache := FConnection.CreateCommand;
      FGetEnderecoCommand_Cache.RequestType := 'GET';
      FGetEnderecoCommand_Cache.Text := 'TServerMethods.GetEndereco';
      FGetEnderecoCommand_Cache.Prepare( TServerMethods_GetEndereco_Cache );
    end;
    FGetEnderecoCommand_Cache.Parameters[ 0 ].Value.SetInt32( Aidpessoa );
    FGetEnderecoCommand_Cache.ExecuteCache( ARequestFilter );
    Result := TDSRestCachedTFDJSONDataSets.Create
      ( FGetEnderecoCommand_Cache.Parameters[ 1 ].Value.GetString );
  end;

function TServerMethodsClient.GetEnderecoIntegracao(
  Aidendereco          : Integer;
  const ARequestFilter : string ) : TFDJSONDataSets;
  begin
    if FGetEnderecoIntegracaoCommand = nil
    then
    begin
      FGetEnderecoIntegracaoCommand := FConnection.CreateCommand;
      FGetEnderecoIntegracaoCommand.RequestType := 'GET';
      FGetEnderecoIntegracaoCommand.Text :=
        'TServerMethods.GetEnderecoIntegracao';
      FGetEnderecoIntegracaoCommand.Prepare
        ( TServerMethods_GetEnderecoIntegracao );
    end;
    FGetEnderecoIntegracaoCommand.Parameters[ 0 ].Value.SetInt32( Aidendereco );
    FGetEnderecoIntegracaoCommand.Execute( ARequestFilter );
    if not FGetEnderecoIntegracaoCommand.Parameters[ 1 ].Value.IsNull
    then
    begin
      FUnMarshal := TDSRestCommand( FGetEnderecoIntegracaoCommand.Parameters
        [ 1 ].ConnectionHandler ).GetJSONUnMarshaler;
      try
        Result := TFDJSONDataSets
          ( FUnMarshal.UnMarshal( FGetEnderecoIntegracaoCommand.Parameters[ 1 ]
          .Value.GetJSONValue( True ) ) );
        if FInstanceOwner
        then
          FGetEnderecoIntegracaoCommand.FreeOnExecute( Result );
      finally
        FreeAndNil( FUnMarshal )
      end
    end
    else
      Result := nil;
  end;

function TServerMethodsClient.GetEnderecoIntegracao_Cache(
  Aidendereco          : Integer;
  const ARequestFilter : string ) : IDSRestCachedTFDJSONDataSets;
  begin
    if FGetEnderecoIntegracaoCommand_Cache = nil
    then
    begin
      FGetEnderecoIntegracaoCommand_Cache := FConnection.CreateCommand;
      FGetEnderecoIntegracaoCommand_Cache.RequestType := 'GET';
      FGetEnderecoIntegracaoCommand_Cache.Text :=
        'TServerMethods.GetEnderecoIntegracao';
      FGetEnderecoIntegracaoCommand_Cache.Prepare
        ( TServerMethods_GetEnderecoIntegracao_Cache );
    end;
    FGetEnderecoIntegracaoCommand_Cache.Parameters[ 0 ].Value.SetInt32
      ( Aidendereco );
    FGetEnderecoIntegracaoCommand_Cache.ExecuteCache( ARequestFilter );
    Result := TDSRestCachedTFDJSONDataSets.Create
      ( FGetEnderecoIntegracaoCommand_Cache.Parameters[ 1 ].Value.GetString );
  end;

function TServerMethodsClient.GetGetPessoaJSON( const ARequestFilter : string )
  : TJSONObject;
  begin
    if FGetGetPessoaJSONCommand = nil
    then
    begin
      FGetGetPessoaJSONCommand := FConnection.CreateCommand;
      FGetGetPessoaJSONCommand.RequestType := 'GET';
      FGetGetPessoaJSONCommand.Text := 'TServerMethods.GetGetPessoaJSON';
      FGetGetPessoaJSONCommand.Prepare( TServerMethods_GetGetPessoaJSON );
    end;
    FGetGetPessoaJSONCommand.Execute( ARequestFilter );
    Result := TJSONObject( FGetGetPessoaJSONCommand.Parameters[ 0 ]
      .Value.GetJSONValue( FInstanceOwner ) );
  end;

function TServerMethodsClient.GetGetPessoaJSON_Cache( const ARequestFilter
  : string ) : IDSRestCachedJSONObject;
  begin
    if FGetGetPessoaJSONCommand_Cache = nil
    then
    begin
      FGetGetPessoaJSONCommand_Cache := FConnection.CreateCommand;
      FGetGetPessoaJSONCommand_Cache.RequestType := 'GET';
      FGetGetPessoaJSONCommand_Cache.Text := 'TServerMethods.GetGetPessoaJSON';
      FGetGetPessoaJSONCommand_Cache.Prepare
        ( TServerMethods_GetGetPessoaJSON_Cache );
    end;
    FGetGetPessoaJSONCommand_Cache.ExecuteCache( ARequestFilter );
    Result := TDSRestCachedJSONObject.Create
      ( FGetGetPessoaJSONCommand_Cache.Parameters[ 0 ].Value.GetString );
  end;

function TServerMethodsClient.GetEnderecoJSON(
  Aidpessoa            : Integer;
  const ARequestFilter : string ) : TJSONObject;
  begin
    if FGetEnderecoJSONCommand = nil
    then
    begin
      FGetEnderecoJSONCommand := FConnection.CreateCommand;
      FGetEnderecoJSONCommand.RequestType := 'GET';
      FGetEnderecoJSONCommand.Text := 'TServerMethods.GetEnderecoJSON';
      FGetEnderecoJSONCommand.Prepare( TServerMethods_GetEnderecoJSON );
    end;
    FGetEnderecoJSONCommand.Parameters[ 0 ].Value.SetInt32( Aidpessoa );
    FGetEnderecoJSONCommand.Execute( ARequestFilter );
    Result := TJSONObject( FGetEnderecoJSONCommand.Parameters[ 1 ]
      .Value.GetJSONValue( FInstanceOwner ) );
  end;

function TServerMethodsClient.GetEnderecoJSON_Cache(
  Aidpessoa            : Integer;
  const ARequestFilter : string ) : IDSRestCachedJSONObject;
  begin
    if FGetEnderecoJSONCommand_Cache = nil
    then
    begin
      FGetEnderecoJSONCommand_Cache := FConnection.CreateCommand;
      FGetEnderecoJSONCommand_Cache.RequestType := 'GET';
      FGetEnderecoJSONCommand_Cache.Text := 'TServerMethods.GetEnderecoJSON';
      FGetEnderecoJSONCommand_Cache.Prepare
        ( TServerMethods_GetEnderecoJSON_Cache );
    end;
    FGetEnderecoJSONCommand_Cache.Parameters[ 0 ].Value.SetInt32( Aidpessoa );
    FGetEnderecoJSONCommand_Cache.ExecuteCache( ARequestFilter );
    Result := TDSRestCachedJSONObject.Create
      ( FGetEnderecoJSONCommand_Cache.Parameters[ 1 ].Value.GetString );
  end;

function TServerMethodsClient.GetEnderecoIntegracaoJSON(
  Aidendereco          : Integer;
  const ARequestFilter : string ) : TJSONObject;
  begin
    if FGetEnderecoIntegracaoJSONCommand = nil
    then
    begin
      FGetEnderecoIntegracaoJSONCommand := FConnection.CreateCommand;
      FGetEnderecoIntegracaoJSONCommand.RequestType := 'GET';
      FGetEnderecoIntegracaoJSONCommand.Text :=
        'TServerMethods.GetEnderecoIntegracaoJSON';
      FGetEnderecoIntegracaoJSONCommand.Prepare
        ( TServerMethods_GetEnderecoIntegracaoJSON );
    end;
    FGetEnderecoIntegracaoJSONCommand.Parameters[ 0 ].Value.SetInt32
      ( Aidendereco );
    FGetEnderecoIntegracaoJSONCommand.Execute( ARequestFilter );
    Result := TJSONObject( FGetEnderecoIntegracaoJSONCommand.Parameters[ 1 ]
      .Value.GetJSONValue( FInstanceOwner ) );
  end;

function TServerMethodsClient.GetEnderecoIntegracaoJSON_Cache(
  Aidendereco          : Integer;
  const ARequestFilter : string ) : IDSRestCachedJSONObject;
  begin
    if FGetEnderecoIntegracaoJSONCommand_Cache = nil
    then
    begin
      FGetEnderecoIntegracaoJSONCommand_Cache := FConnection.CreateCommand;
      FGetEnderecoIntegracaoJSONCommand_Cache.RequestType := 'GET';
      FGetEnderecoIntegracaoJSONCommand_Cache.Text :=
        'TServerMethods.GetEnderecoIntegracaoJSON';
      FGetEnderecoIntegracaoJSONCommand_Cache.Prepare
        ( TServerMethods_GetEnderecoIntegracaoJSON_Cache );
    end;
    FGetEnderecoIntegracaoJSONCommand_Cache.Parameters[ 0 ].Value.SetInt32
      ( Aidendereco );
    FGetEnderecoIntegracaoJSONCommand_Cache.ExecuteCache( ARequestFilter );
    Result := TDSRestCachedJSONObject.Create
      ( FGetEnderecoIntegracaoJSONCommand_Cache.Parameters[ 1 ]
      .Value.GetString );
  end;

procedure TServerMethodsClient.PostPessoa( ADeltaList : TFDJSONDeltas );
  begin
    if FPostPessoaCommand = nil
    then
    begin
      FPostPessoaCommand := FConnection.CreateCommand;
      FPostPessoaCommand.RequestType := 'POST';
      FPostPessoaCommand.Text := 'TServerMethods."PostPessoa"';
      FPostPessoaCommand.Prepare( TServerMethods_PostPessoa );
    end;
    if not Assigned( ADeltaList )
    then
      FPostPessoaCommand.Parameters[ 0 ].Value.SetNull
    else
    begin
      FMarshal := TDSRestCommand( FPostPessoaCommand.Parameters[ 0 ]
        .ConnectionHandler ).GetJSONMarshaler;
      try
        FPostPessoaCommand.Parameters[ 0 ].Value.SetJSONValue
          ( FMarshal.Marshal( ADeltaList ), True );
        if FInstanceOwner
        then
          ADeltaList.Free
      finally
        FreeAndNil( FMarshal )
      end
    end;
    FPostPessoaCommand.Execute;
  end;

procedure TServerMethodsClient.GetZipCode(
  Aidpessoa            : Int64;
  AZipCode             : string;
  out AMensagem        : string;
  const ARequestFilter : string );
  begin
    if FGetZipCodeCommand = nil
    then
    begin
      FGetZipCodeCommand := FConnection.CreateCommand;
      FGetZipCodeCommand.RequestType := 'GET';
      FGetZipCodeCommand.Text := 'TServerMethods.GetZipCode';
      FGetZipCodeCommand.Prepare( TServerMethods_GetZipCode );
    end;
    FGetZipCodeCommand.Parameters[ 0 ].Value.SetInt64( Aidpessoa );
    FGetZipCodeCommand.Parameters[ 1 ].Value.SetWideString( AZipCode );
    FGetZipCodeCommand.Execute( ARequestFilter );
    AMensagem := FGetZipCodeCommand.Parameters[ 2 ].Value.GetWideString;
  end;

function TServerMethodsClient.Insert50000Pessoas( const ARequestFilter
  : string ) : string;
  begin
    if FInsert50000PessoasCommand = nil
    then
    begin
      FInsert50000PessoasCommand := FConnection.CreateCommand;
      FInsert50000PessoasCommand.RequestType := 'GET';
      FInsert50000PessoasCommand.Text := 'TServerMethods.Insert50000Pessoas';
      FInsert50000PessoasCommand.Prepare( TServerMethods_Insert50000Pessoas );
    end;
    FInsert50000PessoasCommand.Execute( ARequestFilter );
    Result := FInsert50000PessoasCommand.Parameters[ 0 ].Value.GetWideString;
  end;

constructor TServerMethodsClient.Create( ARestConnection : TDSRestConnection );
  begin
    inherited Create( ARestConnection );
  end;

constructor TServerMethodsClient.Create(
  ARestConnection : TDSRestConnection;
  AInstanceOwner  : Boolean );
  begin
    inherited Create( ARestConnection, AInstanceOwner );
  end;

destructor TServerMethodsClient.Destroy;
  begin
    FDataModuleCreateCommand.DisposeOf;
    FDataModuleDestroyCommand.DisposeOf;
    FGetPessoaCommand.DisposeOf;
    FGetPessoaCommand_Cache.DisposeOf;
    FGetEnderecoCommand.DisposeOf;
    FGetEnderecoCommand_Cache.DisposeOf;
    FGetEnderecoIntegracaoCommand.DisposeOf;
    FGetEnderecoIntegracaoCommand_Cache.DisposeOf;
    FGetGetPessoaJSONCommand.DisposeOf;
    FGetGetPessoaJSONCommand_Cache.DisposeOf;
    FGetEnderecoJSONCommand.DisposeOf;
    FGetEnderecoJSONCommand_Cache.DisposeOf;
    FGetEnderecoIntegracaoJSONCommand.DisposeOf;
    FGetEnderecoIntegracaoJSONCommand_Cache.DisposeOf;
    FPostPessoaCommand.DisposeOf;
    FGetZipCodeCommand.DisposeOf;
    FInsert50000PessoasCommand.DisposeOf;
    inherited;
  end;

end.
