program AppClient;

uses
  Vcl.Forms,
  UnitMain in 'UnitMain.pas' {FormMain},
  DataServiceTCPIP_Impl in 'DataServiceTCPIP_Impl.pas' {DataServiceTCPIP: TDataModule},
  DataServiceHTTP_Impl in 'DataServiceHTTP_Impl.pas' {DataServiceHTTP: TDataModule},
  ClientClassesUnit in 'ClientClassesUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataServiceTCPIP, DataServiceTCPIP);
  Application.CreateForm(TDataServiceHTTP, DataServiceHTTP);
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
