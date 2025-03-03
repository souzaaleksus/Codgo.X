unit ServerContainerUnit;

interface

uses
  System.SysUtils,
  System.Classes,
  Datasnap.DSTCPServerTransport,
  Datasnap.DSHTTPCommon,
  Datasnap.DSHTTP,
  Datasnap.DSServer,
  Datasnap.DSCommonServer,
  IPPeerServer,
  IPPeerAPI,
  Datasnap.DSAuth;

type
  TServerContainer = class( TDataModule )
    DSServer : TDSServer;
    DSTCPServerTransport : TDSTCPServerTransport;
    DSAuthenticationManager : TDSAuthenticationManager;
    DSServerClass : TDSServerClass;
    procedure DSServerClassGetClass(
      DSServerClass       : TDSServerClass;
      var PersistentClass : TPersistentClass );
    procedure DSAuthenticationManagerUserAuthorize(
      Sender      : TObject;
      EventObject : TDSAuthorizeEventObject;
      var valid   : Boolean );
    procedure DSAuthenticationManagerUserAuthenticate(
      Sender                                  : TObject;
      const Protocol, Context, User, Password : string;
      var valid                               : Boolean;
      UserRoles                               : TStrings );
  end;

var
  ServerContainer : TServerContainer;

implementation

{$R *.dfm}

uses
  ServerMethodsUnit;

procedure TServerContainer.DSServerClassGetClass(
  DSServerClass       : TDSServerClass;
  var PersistentClass : TPersistentClass );
  begin
    PersistentClass := ServerMethodsUnit.TServerMethods;
  end;

procedure TServerContainer.DSAuthenticationManagerUserAuthenticate(
  Sender                                  : TObject;
  const Protocol, Context, User, Password : string;
  var valid                               : Boolean;
  UserRoles                               : TStrings );
  begin
    valid := True;
  end;

procedure TServerContainer.DSAuthenticationManagerUserAuthorize(
  Sender      : TObject;
  EventObject : TDSAuthorizeEventObject;
  var valid   : Boolean );
  begin
    valid := True;
  end;

end.
