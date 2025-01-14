unit WebModuleUnit;

interface

uses
  System.SysUtils,
  System.Classes,
  Web.HTTPApp,
  Datasnap.DSHTTPCommon,
  Datasnap.DSHTTPWebBroker,
  Datasnap.DSServer,
  Datasnap.DSAuth,
  IPPeerServer,
  Datasnap.DSCommonServer,
  Datasnap.DSHTTP;

type
  TWebModule_ = class( TWebModule )
    DSHTTPWebDispatcher : TDSHTTPWebDispatcher;
    DSServer : TDSServer;
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
    procedure WebModule1DefaultHandlerAction(
      Sender      : TObject;
      Request     : TWebRequest;
      Response    : TWebResponse;
      var Handled : Boolean );
  end;

var
  WebModuleClass : TComponentClass = TWebModule_;

implementation

{$R *.dfm}

uses
  ServerMethodsUnit,
  Web.WebReq;

procedure TWebModule_.WebModule1DefaultHandlerAction(
  Sender      : TObject;
  Request     : TWebRequest;
  Response    : TWebResponse;
  var Handled : Boolean );
  begin
    Response.Content := '<html>' + '<head><title>Web Server</title></head>' +
      '<body>REST JSON</body>' + '</html>';
  end;

procedure TWebModule_.DSServerClassGetClass(
  DSServerClass       : TDSServerClass;
  var PersistentClass : TPersistentClass );
  begin
    PersistentClass := ServerMethodsUnit.TServerMethods;
  end;

procedure TWebModule_.DSAuthenticationManagerUserAuthenticate(
  Sender                                  : TObject;
  const Protocol, Context, User, Password : string;
  var valid                               : Boolean;
  UserRoles                               : TStrings );
  begin
    valid := True;
  end;

procedure TWebModule_.DSAuthenticationManagerUserAuthorize(
  Sender      : TObject;
  EventObject : TDSAuthorizeEventObject;
  var valid   : Boolean );
  begin
    valid := True;
  end;

initialization

finalization

Web.WebReq.FreeWebModules;

end.
