unit ServerMethodsUnit;

interface

uses
  System.Generics.Collections,
  System.IniFiles,
  System.IOUtils,
  System.SysUtils,
  System.Classes,
  System.Json,
  Datasnap.DSServer,
  Datasnap.DSAuth,
  Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.PG,
  FireDAC.Phys.PGDef,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client,
  FireDAC.Stan.StorageBin,
  FireDAC.Stan.StorageJSON,
  FireDAC.Comp.UI,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Stan.Param,
  FireDAC.Comp.DataSet,
  REST.Types,
  REST.Client,
  Data.Bind.Components,
  Data.Bind.ObjectScope,
  ListType,
  REST.Response.Adapter;

type
{$METHODINFO ON}
  TServerMethods = class( TDataModule )
    FDConnection : TFDConnection;
    FDPhysPgDriverLink : TFDPhysPgDriverLink;
    FDGUIxWaitCursor : TFDGUIxWaitCursor;
    FDStanStorageJSONLink : TFDStanStorageJSONLink;
    FDStanStorageBinLink : TFDStanStorageBinLink;
    FDSchemaAdapter : TFDSchemaAdapter;
    FDQueryPessoa : TFDQuery;
    FDQueryEndereco : TFDQuery;
    DataSourcePessoa : TDataSource;
    DataSourceEndereco : TDataSource;
    FDQueryPessoaidpessoa : TLargeintField;
    FDQueryPessoaflnatureza : TSmallintField;
    FDQueryPessoadsdocumento : TWideStringField;
    FDQueryPessoanmprimeiro : TWideStringField;
    FDQueryPessoanmsegundo : TWideStringField;
    FDQueryPessoadtregistro : TDateField;
    FDQueryEnderecoIntegracao : TFDQuery;
    FDQueryEnderecoidendereco : TLargeintField;
    FDQueryEnderecoidpessoa : TLargeintField;
    FDQueryEnderecodscep : TWideStringField;
    FDQueryEnderecoIntegracaoidendereco : TLargeintField;
    FDQueryEnderecoIntegracaodsuf : TWideStringField;
    FDQueryEnderecoIntegracaonmcidade : TWideStringField;
    FDQueryEnderecoIntegracaonmbairro : TWideStringField;
    FDQueryEnderecoIntegracaonmlogradouro : TWideStringField;
    FDQueryEnderecoIntegracaodscomplemento : TWideStringField;
    RESTClient : TRESTClient;
    RESTRequest : TRESTRequest;
    RESTResponse : TRESTResponse;
    FDQueryCEP : TFDQuery;
    FDQueryCEPidendereco : TLargeintField;
    FDQueryCEPdscep : TWideStringField;
    FDQueryCEPEndereco : TFDQuery;
    FDQueryCEPEnderecoidendereco : TLargeintField;
    FDQueryCEPEnderecodsuf : TWideStringField;
    FDQueryCEPEndereconmcidade : TWideStringField;
    FDQueryCEPEndereconmbairro : TWideStringField;
    FDQueryCEPEndereconmlogradouro : TWideStringField;
    FDQueryCEPEnderecodscomplemento : TWideStringField;
    FDQueryCEPidpessoa : TLargeintField;
    FDQueryInsert50000 : TFDQuery;
    FDQueryDelete50000 : TFDQuery;
    RESTClient2 : TRESTClient;
    RESTRequest2 : TRESTRequest;
    RESTResponse2 : TRESTResponse;
    RESTResponseDataSetAdapter2 : TRESTResponseDataSetAdapter;
    FDMemTable2 : TFDMemTable;
    FDMemTable2cep : TIntegerField;
    FDMemTable2address_type : TWideStringField;
    FDMemTable2address_name : TWideStringField;
    FDMemTable2address : TWideStringField;
    FDMemTable2state : TWideStringField;
    FDMemTable2district : TWideStringField;
    FDMemTable2lat : TFloatField;
    FDMemTable2lng : TFloatField;
    FDMemTable2city : TWideStringField;
    FDMemTable2city_ibge : TIntegerField;
    FDMemTable2ddd : TIntegerField;
    RESTClient1 : TRESTClient;
    RESTRequest1 : TRESTRequest;
    RESTResponse1 : TRESTResponse;
    procedure DataModuleCreate( Sender : TObject );
    procedure DataModuleDestroy( Sender : TObject );
    private
      FErrorsList : TList< TJSONObject >;
      FReturn : TReturn;
      function GenerateErrorMessage : string;
      procedure LoadIniFile;
      class function CopyStream( const AStream : TStream ) : TMemoryStream;
      procedure SaveLog( AText : string );
      procedure SaveLog50000( AText : string );
      procedure UpdatePersistence(
        AIDPessoa : Int64;
        AReturn   : TReturn );
      procedure GetAddressForCEP(
        AIDPessoa     : Int64;
        ACEP          : string;
        out AMensagem : string );
      function GetListPessoa : TObjectList< TPessoa >;
    public
      function GetPessoa : TStream;
      procedure PostPessoa( AStream : TStream );
      procedure GetZipCode(
        AIDPessoa     : Int64;
        AZipCode      : string;
        out AMensagem : string );
      function Insert50000Pessoas : string;
  end;
{$METHODINFO OFF}

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}
{$R *.dfm}

uses
  System.StrUtils;

const
  sErrorsOnApplyUpdates =
    'Erros inesperados ao aplicar atualiza��es:'#10#13'%s';

  { TServerMethods }

class function TServerMethods.CopyStream( const AStream : TStream )
  : TMemoryStream;
  var
    LBuffer : TBytes;
    LCount : Integer;
  begin
    Result := TMemoryStream.Create;
    try
      SetLength( LBuffer, 1024 * 32 );
      while True do
      begin
        LCount := AStream.Read( LBuffer, Length( LBuffer ) );
        Result.Write( LBuffer, LCount );
        if LCount < Length( LBuffer )
        then
          break;
      end;
    except
      Result.Free;
      raise;
    end;
  end;

procedure TServerMethods.DataModuleCreate( Sender : TObject );
  begin
    FErrorsList := TList< TJSONObject >.Create;
    FReturn := TReturn.Create;
    LoadIniFile;
  end;

procedure TServerMethods.DataModuleDestroy( Sender : TObject );
  begin
    FreeAndNil( FReturn );
    FreeAndNil( FErrorsList );
  end;

function TServerMethods.GenerateErrorMessage : string;
  var
    i : Integer;
    LJSONObject : TJSONObject;
    LJSONArray : TJSONArray;
  begin
    LJSONObject := TJSONObject.Create;
    try
      LJSONArray := TJSONArray.Create;
      try
        for i := FErrorsList.Count - 1 downto 0 do
          LJSONArray.Add( FErrorsList[ i ] );
        LJSONObject.AddPair( 'Errors', LJSONArray );
        Result := LJSONObject.ToJSON;
      except
        LJSONArray.Free;
      end;
    except
      LJSONObject.Free
    end;
    FErrorsList.Clear;
  end;

procedure TServerMethods.GetAddressForCEP(
  AIDPessoa     : Int64;
  ACEP          : string;
  out AMensagem : string );
  var
    BaseURL_, Sufixo : string;
    // JSON
    JSONValue : TJSONValue;
    // Geral
    logradouro : string;
    bairro : string;
    uf : string;
    cep : string;
    localidade : string;
    complemento : string;
    erro : string;
  begin
    AMensagem := EmptyStr;
    // https://viacep.com.br -----------------------------------------------------
    BaseURL_ := RESTClient.BaseURL;
    try
      Sufixo := 'json';
      RESTClient.BaseURL := ( BaseURL_ + '/' + ACEP + '/' + Sufixo );
      RESTRequest.Execute;
      if RESTResponse.StatusCode = 200
      then
      begin
        SaveLog( RESTResponse.Content );
        JSONValue := TJSONObject.ParseJSONValue( RESTResponse.Content );
        if JSONValue.TryGetValue< string >( 'erro', erro )
        then
        begin
          AMensagem := 'N�o encontrado no ViaCEP';
          Exit;
        end;
        if JSONValue.TryGetValue< string >( 'cep', cep )
        then
        begin
          FDQueryCEP.Close;
          FDQueryCEP.Params[ 0 ].AsLargeInt := AIDPessoa;
          FDQueryCEP.Params[ 1 ].AsString := cep;
          FDQueryCEP.Open;
          if FDQueryCEP.IsEmpty
          then
          begin
            FReturn.cep := cep;
            if JSONValue.TryGetValue< string >( 'logradouro', logradouro )
            then
              FReturn.logradouro := logradouro;
            if JSONValue.TryGetValue< string >( 'bairro', bairro )
            then
              FReturn.bairro := bairro;
            if JSONValue.TryGetValue< string >( 'uf', uf )
            then
              FReturn.uf := uf;
            if JSONValue.TryGetValue< string >( 'localidade', localidade )
            then
              FReturn.localidade := localidade;
            if JSONValue.TryGetValue< string >( 'complemento', complemento )
            then
              FReturn.complemento := complemento;
          end
          else
          begin
            if JSONValue.TryGetValue< string >( 'cep', cep )
            then
              FReturn.cep := cep;
            if JSONValue.TryGetValue< string >( 'logradouro', logradouro )
            then
              FReturn.logradouro := logradouro;
            if JSONValue.TryGetValue< string >( 'bairro', bairro )
            then
              FReturn.bairro := bairro;
            if JSONValue.TryGetValue< string >( 'uf', uf )
            then
              FReturn.uf := uf;
            if JSONValue.TryGetValue< string >( 'localidade', localidade )
            then
              FReturn.localidade := localidade;
            if JSONValue.TryGetValue< string >( 'complemento', complemento )
            then
              FReturn.complemento := complemento;
          end;
          UpdatePersistence( AIDPessoa, FReturn );
        end;
      end
      else
      begin
        // https://apicep.com ----------------------------------------------------
        BaseURL_ := RESTClient1.BaseURL;
        Sufixo := 'json';
        RESTClient1.BaseURL := ( BaseURL_ + '/' + ACEP + '.' + Sufixo );
        RESTRequest1.Execute;
        if RESTResponse1.StatusCode = 200
        then
        begin
          SaveLog( RESTResponse1.Content );
          JSONValue := TJSONObject.ParseJSONValue( RESTResponse1.Content );
          if JSONValue.TryGetValue< string >( 'code', cep )
          then
          begin
            FDQueryCEP.Close;
            FDQueryCEP.Params[ 0 ].AsLargeInt := AIDPessoa;
            FDQueryCEP.Params[ 1 ].AsString := cep;
            FDQueryCEP.Open;
            if FDQueryCEP.IsEmpty
            then
            begin
              FReturn.cep := cep;
              if JSONValue.TryGetValue< string >( 'address', logradouro )
              then
                FReturn.logradouro := logradouro;
              if JSONValue.TryGetValue< string >( 'district', bairro )
              then
                FReturn.bairro := bairro;
              if JSONValue.TryGetValue< string >( 'state', uf )
              then
                FReturn.uf := uf;
              if JSONValue.TryGetValue< string >( 'city', localidade )
              then
                FReturn.localidade := localidade;
            end
            else
            begin
              if JSONValue.TryGetValue< string >( 'code', cep )
              then
                FReturn.cep := cep;
              if JSONValue.TryGetValue< string >( 'address', logradouro )
              then
                FReturn.logradouro := logradouro;
              if JSONValue.TryGetValue< string >( 'district', bairro )
              then
                FReturn.bairro := bairro;
              if JSONValue.TryGetValue< string >( 'state', uf )
              then
                FReturn.uf := uf;
              if JSONValue.TryGetValue< string >( 'city', localidade )
              then
                FReturn.localidade := localidade;
            end;
            UpdatePersistence( AIDPessoa, FReturn );
          end;
        end
        else
        begin
          // https://cep.awesomeapi.com.br ---------------------------------------
          BaseURL_ := RESTClient2.BaseURL;
          Sufixo := 'json';
          RESTClient2.BaseURL := ( BaseURL_ + '/' + Sufixo + '/' + ACEP );
          RESTRequest2.Execute;
          if RESTResponse2.StatusCode = 200
          then
          begin
            SaveLog( RESTResponse2.Content );
            JSONValue := TJSONObject.ParseJSONValue( RESTResponse2.Content );
            if JSONValue.TryGetValue< string >( 'message', erro )
            then
            begin
              AMensagem := erro;
              Exit;
            end;
            if JSONValue.TryGetValue< string >( 'cep', cep )
            then
            begin
              FDQueryCEP.Close;
              FDQueryCEP.Params[ 0 ].AsLargeInt := AIDPessoa;
              FDQueryCEP.Params[ 1 ].AsString := cep;
              FDQueryCEP.Open;
              if FDQueryCEP.IsEmpty
              then
              begin
                FReturn.cep := cep;
                if JSONValue.TryGetValue< string >( 'address', logradouro )
                then
                  FReturn.logradouro := logradouro;
                if JSONValue.TryGetValue< string >( 'district', bairro )
                then
                  FReturn.bairro := bairro;
                if JSONValue.TryGetValue< string >( 'state', uf )
                then
                  FReturn.uf := uf;
                if JSONValue.TryGetValue< string >( 'city', localidade )
                then
                  FReturn.localidade := localidade;
                if JSONValue.TryGetValue< string >( 'city_ibge', complemento )
                then
                  FReturn.complemento := complemento;
              end
              else
              begin
                if JSONValue.TryGetValue< string >( 'cep', cep )
                then
                  FReturn.cep := cep;
                if JSONValue.TryGetValue< string >( 'address', logradouro )
                then
                  FReturn.logradouro := logradouro;
                if JSONValue.TryGetValue< string >( 'district', bairro )
                then
                  FReturn.bairro := bairro;
                if JSONValue.TryGetValue< string >( 'state', uf )
                then
                  FReturn.uf := uf;
                if JSONValue.TryGetValue< string >( 'city', localidade )
                then
                  FReturn.localidade := localidade;
                if JSONValue.TryGetValue< string >( 'city_ibge', complemento )
                then
                  FReturn.complemento := complemento;
              end;
              UpdatePersistence( AIDPessoa, FReturn );
            end;

          end;
        end;
      end;
    finally
      RESTClient.BaseURL := BaseURL_;
    end;
  end;

function TServerMethods.GetListPessoa : TObjectList< TPessoa >;
  var
    Pessoa : TPessoa;
    i : Integer;
  begin
    Result := TObjectList< TPessoa >.Create( );
    for i := 1 to 50000 do
    begin
      Result.Add( TPessoa.Create( ( 'JOHN' + i.ToString ),
        ( 'SMITH' + i.ToString ), 'DOC_' + i.ToString, 3 ) );
    end;
  end;

function TServerMethods.GetPessoa : TStream;
  begin
    Result := TMemoryStream.Create;
    try
      FDQueryPessoa.Close;
      FDQueryPessoa.Open;
      FDQueryEndereco.Close;
      FDQueryEndereco.Open;
      FDQueryEnderecoIntegracao.Close;
      FDQueryEnderecoIntegracao.Open;
      FDSchemaAdapter.SaveToStream( Result, TFDStorageFormat.sfBinary );
      Result.Position := 0;
    except
      raise;
    end;
  end;

procedure TServerMethods.GetZipCode(
  AIDPessoa     : Int64;
  AZipCode      : string;
  out AMensagem : string );
  begin
    GetAddressForCEP( AIDPessoa, AZipCode, AMensagem );
  end;

function TServerMethods.Insert50000Pessoas : string;
  var
    List : TObjectList< TPessoa >;
    i : Integer;
    Start_, End_ : TDateTime;
    Elapsed : string;
  begin
    Start_ := Now;
    List := GetListPessoa;
    try
      FDQueryDelete50000.Params[ 0 ].AsInteger := 3;
      FDQueryDelete50000.ExecSQL;
      FDQueryInsert50000.Params.ArraySize := List.Count;
      for i := 0 to List.Count - 1 do
      begin
        FDQueryInsert50000.Params[ 0 ].AsIntegers[ i ] :=
          List.Items[ i ].flnatureza;
        FDQueryInsert50000.Params[ 1 ].AsStrings[ i ] :=
          List.Items[ i ].dsdocumento;
        FDQueryInsert50000.Params[ 2 ].AsStrings[ i ] :=
          List.Items[ i ].nmprimeiro;
        FDQueryInsert50000.Params[ 3 ].AsStrings[ i ] :=
          List.Items[ i ].nmsegundo;
        FDQueryInsert50000.Params[ 4 ].AsDateTimes[ i ] := Now;
      end;
      FDQueryInsert50000.Execute( List.Count, 0 );
    finally
      FreeAndNil( List );
    end;
    End_ := Now;
    Elapsed := ( 'Tempo decorrido: ' + FormatDateTime( 'hh:nn:ss:zzz',
      End_ - Start_ ) );
    SaveLog50000( Elapsed );
    Result := Elapsed;
  end;

procedure TServerMethods.UpdatePersistence(
  AIDPessoa : Int64;
  AReturn   : TReturn );
  begin
    TThread.CreateAnonymousThread(
      procedure( )
        begin
          TThread.Synchronize( TThread.CurrentThread,
            procedure( )
              var
                idendereco : Int64;
              begin
                FDQueryCEP.Insert;
                FDQueryCEPidpessoa.AsLargeInt := AIDPessoa;
                FDQueryCEPdscep.AsString := AReturn.cep;
                FDQueryCEP.Post;
                FDQueryCEP.Close;
                FDQueryCEP.Params[ 0 ].AsLargeInt := AIDPessoa;
                FDQueryCEP.Params[ 1 ].AsString := AReturn.cep;
                FDQueryCEP.Open;
                idendereco := FDQueryCEPidendereco.AsLargeInt;
                FDQueryCEPEndereco.Close;
                FDQueryCEPEndereco.Params[ 0 ].AsLargeInt := idendereco;
                FDQueryCEPEndereco.Open;
                FDQueryCEPEndereco.Insert;
                FDQueryCEPEnderecoidendereco.AsLargeInt := idendereco;
                FDQueryCEPEndereconmlogradouro.AsString := AReturn.logradouro;
                FDQueryCEPEndereconmbairro.AsString := AReturn.bairro;
                FDQueryCEPEnderecodsuf.AsString := AReturn.uf;
                FDQueryCEPEndereconmcidade.AsString := AReturn.localidade;
                FDQueryCEPEnderecodscomplemento.AsString := AReturn.complemento;
                FDQueryCEPEndereco.Post;
              end );
        end ).Start;
  end;

procedure TServerMethods.LoadIniFile;
  var
    Path : string;
  begin
    Path := 'C:\TesteDelphi\ALEXANDRE_DE_SOUZA\EXECUTE\AppServer.ini';
    FDPhysPgDriverLink.VendorLib :=
      'C:\TesteDelphi\ALEXANDRE_DE_SOUZA\DLL\libpq.dll';
    with TIniFile.Create( Path ) do
    begin
      try
        with FDConnection do
        begin
          Params.Clear;
          Params.Values[ 'DriverID' ] := ReadString( 'DATA', 'DriverID',
            EmptyStr );
          Params.Values[ 'Server' ] := ReadString( 'DATA', 'Server', EmptyStr );
          Params.Values[ 'Database' ] := ReadString( 'DATA', 'Database',
            EmptyStr );
          Params.Values[ 'User_name' ] := ReadString( 'DATA', 'User_name',
            EmptyStr );
          Params.Values[ 'Password' ] := ReadString( 'DATA', 'Password',
            EmptyStr );
          Params.Values[ 'Port' ] := ReadString( 'DATA', 'Port', EmptyStr );
          Connected := True;
        end;
      except
        raise;
      end;
    end;
  end;

procedure TServerMethods.PostPessoa( AStream : TStream );
  var
    LMemStream : TMemoryStream;
    LErrors : Integer;
  begin
    LMemStream := TServerMethods.CopyStream( AStream );
    LMemStream.Position := 0;
    try
      FDSchemaAdapter.LoadFromStream( LMemStream, TFDStorageFormat.sfBinary );
      LErrors := FDSchemaAdapter.ApplyUpdates
    finally
      LMemStream.Free;
      if LErrors > 0
      then
        raise Exception.CreateFmt( sErrorsOnApplyUpdates,
          [ GenerateErrorMessage ] );
    end;
  end;

procedure TServerMethods.SaveLog( AText : string );
  var
    Strings : TStringList;
    Extension : string;
  begin
    Extension := '.json';
    Strings := TStringList.Create;
    try
      Strings.Text := AText;
      Strings.SaveToFile( 'C:\TesteDelphi\ALEXANDRE_DE_SOUZA\LOG\Return_' +
        FormatDateTime( 'ddmmyyyyhhnnss', Now ) + Extension );
    finally
      FreeAndNil( Strings );
    end;
  end;

procedure TServerMethods.SaveLog50000( AText : string );
  var
    Strings : TStringList;
    Extension : string;
  begin
    Extension := '.txt';
    Strings := TStringList.Create;
    try
      Strings.Text := AText;
      Strings.SaveToFile( 'C:\TesteDelphi\ALEXANDRE_DE_SOUZA\LOG\Pessoa50000_' +
        FormatDateTime( 'ddmmyyyyhhnnss', Now ) + Extension );
    finally
      FreeAndNil( Strings );
    end;
  end;

end.