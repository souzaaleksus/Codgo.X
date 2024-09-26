unit FormUnit;

interface

uses
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.AppEvnts,
  Vcl.StdCtrls,
  IdHTTPWebBrokerBridge,
  IdGlobal,
  Web.HTTPApp;

type
  TFormMain = class( TForm )
    ButtonStart : TButton;
    ButtonStop : TButton;
    EditPort : TEdit;
    Label1 : TLabel;
    ApplicationEvents : TApplicationEvents;
    procedure FormCreate( Sender : TObject );
    procedure ApplicationEventsIdle(
      Sender   : TObject;
      var Done : Boolean );
    procedure ButtonStartClick( Sender : TObject );
    procedure ButtonStopClick( Sender : TObject );
    private
      FServer : TIdHTTPWebBrokerBridge;
      procedure StartServer;
      { Private declarations }
    public
      { Public declarations }
  end;

var
  FormMain : TFormMain;

implementation

{$R *.dfm}

uses
{$IFDEF MSWINDOWS}
  Winapi.Windows,
  Winapi.ShellApi,
{$ENDIF}
  Datasnap.DSSession,
  System.Generics.Collections;

procedure TFormMain.ApplicationEventsIdle(
  Sender   : TObject;
  var Done : Boolean );
  begin
    ButtonStart.Enabled := not FServer.Active;
    ButtonStop.Enabled := FServer.Active;
    EditPort.Enabled := not FServer.Active;
  end;

procedure TFormMain.ButtonStartClick( Sender : TObject );
  begin
    StartServer;
  end;

procedure TerminateThreads;
  begin
    if TDSSessionManager.Instance <> nil
    then
      TDSSessionManager.Instance.TerminateAllSessions;
  end;

procedure TFormMain.ButtonStopClick( Sender : TObject );
  begin
    TerminateThreads;
    FServer.Active := False;
    FServer.Bindings.Clear;
  end;

procedure TFormMain.FormCreate( Sender : TObject );
  begin
    FServer := TIdHTTPWebBrokerBridge.Create( Self );
  end;

procedure TFormMain.StartServer;
  begin
    if not FServer.Active
    then
    begin
      FServer.Bindings.Clear;
      FServer.DefaultPort := StrToInt( EditPort.Text );
      FServer.Active := True;
    end;
  end;

end.
