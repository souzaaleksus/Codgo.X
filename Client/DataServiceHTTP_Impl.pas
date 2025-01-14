unit DataServiceHTTP_Impl;

interface

uses
  Vcl.Dialogs,
  System.IniFiles,
  System.IOUtils,
  System.SysUtils,
  System.Classes,
  Datasnap.DSClientRest,
  Data.FireDACJSONReflect,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  ClientClassesUnit,
  System.JSON,
  FireDAC.Stan.StorageJSON;

type
  TDataServiceHTTP = class( TDataModule )
    DSRestConnection : TDSRestConnection;
    FDMemTablePessoa : TFDMemTable;
    DataSourcePessoa : TDataSource;
    FDMemTablePessoaidpessoa : TLargeintField;
    FDMemTablePessoaflnatureza : TSmallintField;
    FDMemTablePessoadsdocumento : TWideStringField;
    FDMemTablePessoanmprimeiro : TWideStringField;
    FDMemTablePessoanmsegundo : TWideStringField;
    FDMemTablePessoadtregistro : TDateField;
    FDMemTableEndereco : TFDMemTable;
    FDMemTableEnderecoidendereco : TLargeintField;
    FDMemTableEnderecoidpessoa : TLargeintField;
    FDMemTableEnderecodscep : TWideStringField;
    DataSourceEndereco : TDataSource;
    FDMemTableEnderecoIntegracao : TFDMemTable;
    FDMemTableEnderecoIntegracaoidendereco : TLargeintField;
    FDMemTableEnderecoIntegracaodsuf : TWideStringField;
    FDMemTableEnderecoIntegracaonmcidade : TWideStringField;
    FDMemTableEnderecoIntegracaonmbairro : TWideStringField;
    FDMemTableEnderecoIntegracaonmlogradouro : TWideStringField;
    FDMemTableEnderecoIntegracaodscomplemento : TWideStringField;
    DataSourceEnderecoIntegracao : TDataSource;
    FDStanStorageJSONLink : TFDStanStorageJSONLink;
    procedure DataModuleCreate( Sender : TObject );
    procedure FDMemTablePessoaAfterInsert( DataSet : TDataSet );
    private
      FInstanceOwner : Boolean;
      FServerMethodsClient : TServerMethodsClient;
      procedure LoadIniFile;
      function GetServerMethodsClient : TServerMethodsClient;
    public
      constructor Create( AOwner : TComponent ); override;
      destructor Destroy; override;
      property InstanceOwner : Boolean
        read FInstanceOwner
        write FInstanceOwner;
      property ServerMethodsClient : TServerMethodsClient
        read GetServerMethodsClient
        write FServerMethodsClient;
      procedure GetPessoa;
      function GetDelta : TFDJSONDeltas;
      procedure PostPessoa;
      procedure GetEndereco( Aidpessoa : Integer );
      procedure GetEnderecoIntegracao( Aidendereco : Integer );
      procedure UpdatePessoa( const ADataSetList : TFDJSONDataSets );
      procedure UpdateEndereco( const ADataSetList : TFDJSONDataSets );
      procedure UpdateEnderecoIntegracao( const ADataSetList
        : TFDJSONDataSets );
      procedure GetZipCode(
        Aidpessoa    : Int64;
        AZipCode     : string;
        out AMessage : string );
      function Insert50000Pessoas : string;
  end;

var
  DataServiceHTTP : TDataServiceHTTP;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure HandleRESTException(
  const AConnection : TDSRestConnection;
  const APrefix     : string;
  const E           : TDSRestProtocolException );
  var
    LJSONValue : TJSONValue;
    LMessage : string;
    LPair : TJSONPair;
  begin
    LJSONValue := TJSONObject.ParseJSONValue( BytesOf( E.ResponseText ), 0 );
    try
      if LJSONValue is TJSONObject
      then
      begin
        LPair := TJSONObject( LJSONValue ).Get( 0 );
        if LPair.JsonString.Value = 'SessionExpired'
        then
          AConnection.SessionID := EmptyStr;
        LMessage := LPair.JSONValue.Value;
      end
      else
        LMessage := E.ResponseText;
    finally
      LJSONValue.Free;
    end;
    ShowMessageFmt( '%s: %s', [ APrefix, LMessage ] );
  end;

{ TDataServiceHTTP }

constructor TDataServiceHTTP.Create( AOwner : TComponent );
  begin
    inherited;
    FInstanceOwner := True;
  end;

procedure TDataServiceHTTP.DataModuleCreate( Sender : TObject );
  begin
    LoadIniFile;
  end;

destructor TDataServiceHTTP.Destroy;
  begin
    FServerMethodsClient.Free;
    inherited;
  end;

procedure TDataServiceHTTP.FDMemTablePessoaAfterInsert( DataSet : TDataSet );
  begin
    DataSet.FieldByName( 'dtregistro' ).AsDateTime := Now;
  end;

function TDataServiceHTTP.GetDelta : TFDJSONDeltas;
  begin
    if FDMemTablePessoa.State in dsEditModes
    then
    begin
      FDMemTablePessoa.Post;
    end;
    Result := TFDJSONDeltas.Create;
    TFDJSONDeltasWriter.ListAdd( Result, 'Pessoa', FDMemTablePessoa );
  end;

procedure TDataServiceHTTP.GetEndereco( Aidpessoa : Integer );
  var
    LDataSetList : TFDJSONDataSets;
  begin
    try
      LDataSetList := ServerMethodsClient.GetEndereco( Aidpessoa );
      UpdateEndereco( LDataSetList );
    except
      on E : TDSRestProtocolException do
        HandleRESTException( DSRestConnection, 'Erro ao obter Endereco', E )
      else
        raise;
    end;
  end;

procedure TDataServiceHTTP.GetEnderecoIntegracao( Aidendereco : Integer );
  var
    LDataSetList : TFDJSONDataSets;
  begin
    try
      LDataSetList := ServerMethodsClient.GetEnderecoIntegracao( Aidendereco );
      UpdateEnderecoIntegracao( LDataSetList );
    except
      on E : TDSRestProtocolException do
        HandleRESTException( DSRestConnection,
          'Erro ao obter Endereco Integracao', E )
      else
        raise;
    end;
  end;

procedure TDataServiceHTTP.GetPessoa;
  var
    LDataSetList : TFDJSONDataSets;
  begin
    try
      LDataSetList := ServerMethodsClient.GetPessoa( );
      UpdatePessoa( LDataSetList );
    except
      on E : TDSRestProtocolException do
        HandleRESTException( DSRestConnection, 'Erro ao obter Pessoa', E )
      else
        raise;
    end;
  end;

function TDataServiceHTTP.GetServerMethodsClient : TServerMethodsClient;
  begin
    if FServerMethodsClient = nil
    then
      FServerMethodsClient := TServerMethodsClient.Create( DSRestConnection,
        FInstanceOwner );
    Result := FServerMethodsClient;
  end;

procedure TDataServiceHTTP.GetZipCode(
  Aidpessoa    : Int64;
  AZipCode     : string;
  out AMessage : string );
  begin
    if AZipCode <> EmptyStr
    then
    begin
      ServerMethodsClient.GetZipCode( Aidpessoa, Trim( AZipCode ), AMessage );
    end;
  end;

function TDataServiceHTTP.Insert50000Pessoas : string;
  begin
    Result := ServerMethodsClient.Insert50000Pessoas( );
  end;

procedure TDataServiceHTTP.LoadIniFile;
  var
    Path : string;
  begin
    Path := 'C:\TesteDelphi\ALEXANDRE_DE_SOUZA\EXECUTE\AppClient.ini';
    with TIniFile.Create( Path ) do
    begin
      try
        with DSRestConnection do
        begin
          Host := ReadString( 'APPSERVER', 'Server', EmptyStr );
          Port := ReadString( 'APPSERVER', 'PortHTTP', EmptyStr ).toInteger;
        end;
      except
        raise;
      end;
    end;
  end;

procedure TDataServiceHTTP.PostPessoa;
  var
    LDeltaList : TFDJSONDeltas;
  begin
    LDeltaList := GetDelta;
    try
      ServerMethodsClient.PostPessoa( LDeltaList );
    except
      on E : TDSRestProtocolException do
        HandleRESTException( DSRestConnection,
          'Erro ao aplicar atualizações', E )
      else
        raise;
    end;
  end;

procedure TDataServiceHTTP.UpdateEndereco( const ADataSetList
  : TFDJSONDataSets );
  begin
    FDMemTableEndereco.Active := False;
    Assert( TFDJSONDataSetsReader.GetListCount( ADataSetList ) = 1 );
    FDMemTableEndereco.AppendData( TFDJSONDataSetsReader.GetListValue
      ( ADataSetList, 0 ) );
  end;

procedure TDataServiceHTTP.UpdateEnderecoIntegracao( const ADataSetList
  : TFDJSONDataSets );
  begin
    FDMemTableEnderecoIntegracao.Active := False;
    Assert( TFDJSONDataSetsReader.GetListCount( ADataSetList ) = 1 );
    FDMemTableEnderecoIntegracao.AppendData
      ( TFDJSONDataSetsReader.GetListValue( ADataSetList, 0 ) );
  end;

procedure TDataServiceHTTP.UpdatePessoa( const ADataSetList : TFDJSONDataSets );
  begin
    FDMemTablePessoa.Active := False;
    Assert( TFDJSONDataSetsReader.GetListCount( ADataSetList ) = 1 );
    FDMemTablePessoa.AppendData( TFDJSONDataSetsReader.GetListValue
      ( ADataSetList, 0 ) );
  end;

end.
