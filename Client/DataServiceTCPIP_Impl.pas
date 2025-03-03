unit DataServiceTCPIP_Impl;

interface

uses
  System.IniFiles,
  System.IOUtils,
  System.SysUtils,
  System.Classes,
  Data.DB,
  Datasnap.DBClient,
  Datasnap.DSConnect,
  Data.FMTBcd,
  REST.Backend.EMSServices,
  REST.Backend.EMSFireDAC,
  Data.SqlExpr,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  Data.DbxDatasnap,
  IPPeerClient,
  Data.DBXCommon,
  FireDAC.Comp.Client,
  FireDAC.Phys.DSDef,
  FireDAC.Phys.TDBXBase,
  FireDAC.Phys.DS,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  Datasnap.DSClientRest,
  FireDAC.FMXUI.Wait,
  System.Generics.Collections,
  FireDAC.Stan.StorageBin,
  FireDAC.Comp.UI;

type
  TDataServiceTCPIP = class( TDataModule )
    FDConnection : TFDConnection;
    FDPhysDSDriverLink : TFDPhysDSDriverLink;
    FDStoredProcGetPessoa : TFDStoredProc;
    FDStoredProcPostPessoa : TFDStoredProc;
    FDGUIxWaitCursor : TFDGUIxWaitCursor;
    FDStanStorageBinLink : TFDStanStorageBinLink;
    FDTableAdapterPessoa : TFDTableAdapter;
    FDMemTablePessoa : TFDMemTable;
    FDSchemaAdapter : TFDSchemaAdapter;
    DataSourcePessoa : TDataSource;
    FDMemTablePessoaidpessoa : TLargeintField;
    FDMemTablePessoaflnatureza : TSmallintField;
    FDMemTablePessoadsdocumento : TWideStringField;
    FDMemTablePessoanmprimeiro : TWideStringField;
    FDMemTablePessoanmsegundo : TWideStringField;
    FDMemTablePessoadtregistro : TDateField;
    FDTableAdapterEndereco : TFDTableAdapter;
    FDMemTableEndereco : TFDMemTable;
    DataSourceEndereco : TDataSource;
    FDMemTableEnderecoidendereco : TLargeintField;
    FDMemTableEnderecoidpessoa : TLargeintField;
    FDMemTableEnderecodscep : TWideStringField;
    FDTableAdapterEnderecoIntegracao : TFDTableAdapter;
    FDMemTableEnderecoIntegracao : TFDMemTable;
    DataSourceEnderecoIntegracao : TDataSource;
    FDMemTableEnderecoIntegracaoidendereco : TLargeintField;
    FDMemTableEnderecoIntegracaodsuf : TWideStringField;
    FDMemTableEnderecoIntegracaonmcidade : TWideStringField;
    FDMemTableEnderecoIntegracaonmbairro : TWideStringField;
    FDMemTableEnderecoIntegracaonmlogradouro : TWideStringField;
    FDMemTableEnderecoIntegracaodscomplemento : TWideStringField;
    FDStoredProcGetZipCode : TFDStoredProc;
    FDStoredProcInsert50000Pessoas : TFDStoredProc;
    procedure DataModuleCreate( Sender : TObject );
    procedure DataModuleDestroy( Sender : TObject );
    procedure FDMemTablePessoaAfterInsert( DataSet : TDataSet );
    private
      procedure LoadIniFile;
    public
      procedure GetPessoa;
      procedure PostPessoa;
      procedure GetZipCode(
        AIDPessoa    : Int64;
        AZipCode     : string;
        out AMessage : string );
      function Insert50000Pessoas : string;
  end;

var
  DataServiceTCPIP : TDataServiceTCPIP;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TDataServiceTCPIP.DataModuleCreate( Sender : TObject );
  begin
    LoadIniFile;
    FDConnection.Connected := True;
  end;

procedure TDataServiceTCPIP.DataModuleDestroy( Sender : TObject );
  begin
    FDConnection.Connected := False;
  end;

procedure TDataServiceTCPIP.FDMemTablePessoaAfterInsert( DataSet : TDataSet );
  begin
    DataSet.FieldByName( 'dtregistro' ).AsDateTime := Now;
  end;

procedure TDataServiceTCPIP.GetPessoa;
  var
    StringStream : TStringStream;
  begin
    FDStoredProcGetPessoa.ExecProc;
    StringStream := TStringStream.Create( FDStoredProcGetPessoa.Params
      [ 0 ].asBlob );
    try
      if StringStream <> nil
      then
      begin
        StringStream.Position := 0;
        FDSchemaAdapter.LoadFromStream( StringStream,
          TFDStorageFormat.sfBinary );
      end;
    finally
      StringStream.Free;
    end;
  end;

procedure TDataServiceTCPIP.GetZipCode(
  AIDPessoa    : Int64;
  AZipCode     : string;
  out AMessage : string );
  begin
    if AZipCode <> EmptyStr
    then
    begin
      FDStoredProcGetZipCode.Params[ 0 ].AsLargeInt := AIDPessoa;
      FDStoredProcGetZipCode.Params[ 1 ].AsString := Trim( AZipCode );
      FDStoredProcGetZipCode.Params[ 2 ].AsString := Trim( AMessage );
      FDStoredProcGetZipCode.ExecProc;
    end;
  end;

function TDataServiceTCPIP.Insert50000Pessoas : string;
  begin
    FDStoredProcInsert50000Pessoas.ExecProc;
    Result := FDStoredProcInsert50000Pessoas.Params[ 0 ].AsString;
  end;

procedure TDataServiceTCPIP.LoadIniFile;
  var
    Path : string;
  begin
    Path := 'C:\TesteDelphi\ALEXANDRE_DE_SOUZA\EXECUTE\AppClient.ini';
    with TIniFile.Create( Path ) do
    begin
      try
        with FDConnection do
        begin
          Params.Clear;
          Params.Values[ 'DriverID' ] := ReadString( 'APPSERVER', 'DriverID',
            EmptyStr );
          Params.Values[ 'Server' ] := ReadString( 'APPSERVER', 'Server',
            EmptyStr );
          Params.Values[ 'Port' ] := ReadString( 'APPSERVER', 'PortTCP',
            EmptyStr );
          Connected := True;
        end;
      except
        raise;
      end;
    end;
  end;

procedure TDataServiceTCPIP.PostPessoa;
  var
    MemoryStream : TMemoryStream;
    i : Integer;
    DataSet : TDataSet;
  begin
    for i := 0 to FDSchemaAdapter.Count - 1 do
    begin
      DataSet := FDSchemaAdapter.DataSets[ i ];
      if DataSet <> nil
      then
        if DataSet.State in dsEditModes
        then
          DataSet.Post;
    end;
    MemoryStream := TMemoryStream.Create;
    try
      FDSchemaAdapter.ResourceOptions.StoreItems := [ siDelta, siMeta ];
      FDSchemaAdapter.SaveToStream( MemoryStream, TFDStorageFormat.sfBinary );
      MemoryStream.Position := 0;
      FDStoredProcPostPessoa.Params[ 0 ].asStream := MemoryStream;
      FDStoredProcPostPessoa.ExecProc;
    except
      On E : Exception do
        raise Exception.Create( E.Message );
    end;
  end;

end.
