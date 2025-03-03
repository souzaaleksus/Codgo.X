unit UnitMain;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.ExtCtrls,
  Vcl.DBCtrls,
  Vcl.Buttons;

type
  TFormMain = class( TForm )
    PanelTop : TPanel;
    Panel_1 : TPanel;
    Panel_1_A : TPanel;
    Labelidpessoa : TLabel;
    DBEditidpessoa : TDBEdit;
    Panel_1_B : TPanel;
    Labeldsdocumento : TLabel;
    DBEditdsdocumento : TDBEdit;
    DBRadioGroupflnatureza : TDBRadioGroup;
    Panel_2 : TPanel;
    Panel_2_A : TPanel;
    Labelnmprimeiro : TLabel;
    DBEditnmprimeiro : TDBEdit;
    Panel_2_B : TPanel;
    Labelnmsegundo : TLabel;
    DBEditnmsegundo : TDBEdit;
    Panel_2_C : TPanel;
    Labeldtregistro : TLabel;
    DBEditdtregistro : TDBEdit;
    BitBtnInsert : TBitBtn;
    BitBtnPost : TBitBtn;
    BitBtnEdit : TBitBtn;
    BitBtnCancel : TBitBtn;
    GroupBoxPessoa : TGroupBox;
    GroupBoxEndereco : TGroupBox;
    Panel1 : TPanel;
    Panel2 : TPanel;
    LabelCEP : TLabel;
    Panel3 : TPanel;
    Labeldsuf : TLabel;
    DBEditdsuf : TDBEdit;
    Panel4 : TPanel;
    Labelnmcidade : TLabel;
    DBEditnmcidade : TDBEdit;
    Panel6 : TPanel;
    Panel7 : TPanel;
    Labelnmlogradouro : TLabel;
    DBEditnmlogradouro : TDBEdit;
    Panel8 : TPanel;
    Labeldscomplemento : TLabel;
    DBEditdscomplemento : TDBEdit;
    BitBtnGetCEP : TBitBtn;
    GroupBoxListaPessoa : TGroupBox;
    DBGrid : TDBGrid;
    Editdscep : TEdit;
    Panel5 : TPanel;
    Labelnmbairro : TLabel;
    DBEditnmbairro : TDBEdit;
    Panel9 : TPanel;
    LabelCEP_ : TLabel;
    DBEditdscep : TDBEdit;
    Panel10 : TPanel;
    BitBtnPessoa50000 : TBitBtn;
    LabelElapsed : TLabel;
    RadioGroupEnvelope : TRadioGroup;
    procedure FormShow( Sender : TObject );
    procedure BitBtnInsertClick( Sender : TObject );
    procedure BitBtnPostClick( Sender : TObject );
    procedure BitBtnEditClick( Sender : TObject );
    procedure BitBtnCancelClick( Sender : TObject );
    procedure BitBtnGetCEPClick( Sender : TObject );
    procedure BitBtnPessoa50000Click( Sender : TObject );
    procedure RadioGroupEnvelopeClick( Sender : TObject );
    procedure DBGridCellClick( Column : TColumn );
    private
      FStreamJSON : Integer; // 0=Stream e 1=JSON
      procedure Start;
      procedure SetDataTableTCPIP;
      procedure SetDataTableHTTP;
      procedure Insert;
      procedure Edit;
      procedure Post;
      procedure Cancel;
      function CriticalDataEnterTCPIP : Boolean;
      function CriticalDataEnterHTTP : Boolean;
      procedure GetZipCodeTCPIP;
      procedure GetZipCodeHTTP;
      procedure SeekGridHTTP;
  end;

var
  FormMain : TFormMain;

implementation

{$R *.dfm}

uses
  DataServiceTCPIP_Impl,
  DataServiceHTTP_Impl;

procedure TFormMain.BitBtnCancelClick( Sender : TObject );
  begin
    Cancel;
  end;

procedure TFormMain.BitBtnEditClick( Sender : TObject );
  begin
    Edit;
  end;

procedure TFormMain.BitBtnGetCEPClick( Sender : TObject );
  begin
    case FStreamJSON of
      0 :
        GetZipCodeTCPIP;
      1 :
        GetZipCodeHTTP;
    end;
  end;

procedure TFormMain.BitBtnInsertClick( Sender : TObject );
  begin
    Insert;
  end;

procedure TFormMain.BitBtnPessoa50000Click( Sender : TObject );
  begin
    LabelElapsed.Caption := DataServiceTCPIP.Insert50000Pessoas;
    LabelElapsed.Update;
    FormShow( Sender );
  end;

procedure TFormMain.BitBtnPostClick( Sender : TObject );
  begin
    case FStreamJSON of
      0 :
        begin
          if CriticalDataEnterTCPIP
          then
          begin
            Post;
            DataServiceTCPIP.PostPessoa;
          end;
        end;
      1 :
        begin
          if CriticalDataEnterHTTP
          then
          begin
            Post;
            DataServiceHTTP.PostPessoa;
          end;
        end;
    end;
  end;

procedure TFormMain.Cancel;
  begin
    case FStreamJSON of
      0 :
        DataServiceTCPIP.FDMemTablePessoa.Cancel;
      1 :
        DataServiceHTTP.FDMemTablePessoa.Cancel;
    end;
    BitBtnInsert.Enabled := True;
    BitBtnEdit.Enabled := True;
    BitBtnPost.Enabled := False;
    BitBtnCancel.Enabled := False;
  end;

function TFormMain.CriticalDataEnterHTTP : Boolean;
  begin
    Result := True;
    if DataServiceHTTP.FDMemTablePessoaflnatureza.IsNull
    then
    begin
      ShowMessage( 'A natureza � obrigat�ria.' );
      DBRadioGroupflnatureza.SetFocus;
      Result := False;
      Exit;
    end;
    if DataServiceHTTP.FDMemTablePessoadsdocumento.IsNull
    then
    begin
      ShowMessage( 'O documento � obrigat�rio.' );
      DBEditdsdocumento.SetFocus;
      Result := False;
      Exit;
    end;
    if DataServiceHTTP.FDMemTablePessoanmprimeiro.IsNull
    then
    begin
      ShowMessage( 'O primeiro nome � obrigat�rio.' );
      DBEditnmprimeiro.SetFocus;
      Result := False;
      Exit;
    end;
    if DataServiceHTTP.FDMemTablePessoanmsegundo.IsNull
    then
    begin
      ShowMessage( 'O segundo nome � obrigat�rio.' );
      DBEditnmsegundo.SetFocus;
      Result := False;
      Exit;
    end;
    if DataServiceHTTP.FDMemTableEnderecodscep.IsNull
    then
    begin
      ShowMessage( 'O CEP � obrigat�rio.' );
      Editdscep.SetFocus;
      DataServiceHTTP.FDMemTableEndereco.Edit;
      Result := False;
      Exit;
    end;
  end;

function TFormMain.CriticalDataEnterTCPIP : Boolean;
  begin
    Result := True;
    if DataServiceTCPIP.FDMemTablePessoaflnatureza.IsNull
    then
    begin
      ShowMessage( 'A natureza � obrigat�ria.' );
      DBRadioGroupflnatureza.SetFocus;
      Result := False;
      Exit;
    end;
    if DataServiceTCPIP.FDMemTablePessoadsdocumento.IsNull
    then
    begin
      ShowMessage( 'O documento � obrigat�rio.' );
      DBEditdsdocumento.SetFocus;
      Result := False;
      Exit;
    end;
    if DataServiceTCPIP.FDMemTablePessoanmprimeiro.IsNull
    then
    begin
      ShowMessage( 'O primeiro nome � obrigat�rio.' );
      DBEditnmprimeiro.SetFocus;
      Result := False;
      Exit;
    end;
    if DataServiceTCPIP.FDMemTablePessoanmsegundo.IsNull
    then
    begin
      ShowMessage( 'O segundo nome � obrigat�rio.' );
      DBEditnmsegundo.SetFocus;
      Result := False;
      Exit;
    end;
    if DataServiceTCPIP.FDMemTableEnderecodscep.IsNull
    then
    begin
      ShowMessage( 'O CEP � obrigat�rio.' );
      Editdscep.SetFocus;
      DataServiceTCPIP.FDMemTableEndereco.Edit;
      Result := False;
      Exit;
    end;
  end;

procedure TFormMain.DBGridCellClick( Column : TColumn );
  begin
    SeekGridHTTP;
  end;

procedure TFormMain.Edit;
  begin
    case FStreamJSON of
      0 :
        begin
          DataServiceTCPIP.FDMemTablePessoa.Edit;
          DataServiceTCPIP.FDMemTableEndereco.Edit;
        end;
      1 :
        begin
          DataServiceHTTP.FDMemTablePessoa.Edit;
          // DataServiceTCPIP.FDMemTableEndereco.Edit;
        end;
    end;
    BitBtnInsert.Enabled := False;
    BitBtnEdit.Enabled := False;
    BitBtnPost.Enabled := True;
    BitBtnCancel.Enabled := True;
  end;

procedure TFormMain.FormShow( Sender : TObject );
  begin
    Start;
    case FStreamJSON of
      0 :
        SetDataTableTCPIP;
      1 :
        SetDataTableHTTP;
    end;
  end;

procedure TFormMain.GetZipCodeHTTP;
  var
    MessageOut : string;
    idpessoa : Int64;
  begin
    if DataServiceHTTP.FDMemTablePessoa.State = dsInsert
    then
    begin
      Post;
      DataServiceHTTP.PostPessoa;
      DataServiceHTTP.GetPessoa;
      DataServiceHTTP.FDMemTablePessoa.Last;
    end;
    idpessoa := DataServiceHTTP.FDMemTablePessoaidpessoa.AsLargeInt;
    DataServiceHTTP.GetZipCode( idpessoa, Editdscep.Text, MessageOut );
    if MessageOut <> EmptyStr
    then
    begin
      ShowMessage( MessageOut );
      Exit;
    end
    else
    begin
      DataServiceHTTP.GetPessoa;
      DataServiceHTTP.GetEndereco
        ( DataServiceHTTP.FDMemTablePessoaidpessoa.AsInteger );
      DataServiceHTTP.GetEnderecoIntegracao
        ( DataServiceHTTP.FDMemTableEnderecoidendereco.AsInteger );
      DataServiceHTTP.FDMemTablePessoa.Locate( 'idpessoa', idpessoa, [ ] );
      DataServiceHTTP.FDMemTablePessoa.Edit;
    end;
    Editdscep.Clear;
    Editdscep.SetFocus;
  end;

procedure TFormMain.GetZipCodeTCPIP;
  var
    MessageOut : string;
    idpessoa : Int64;
  begin
    if DataServiceTCPIP.FDMemTablePessoa.State = dsInsert
    then
    begin
      Post;
      DataServiceTCPIP.PostPessoa;
      DataServiceTCPIP.GetPessoa;
      DataServiceTCPIP.FDMemTablePessoa.Last;
    end;
    idpessoa := DataServiceTCPIP.FDMemTablePessoaidpessoa.AsLargeInt;
    DataServiceTCPIP.GetZipCode( idpessoa, Editdscep.Text, MessageOut );
    if MessageOut <> EmptyStr
    then
    begin
      ShowMessage( MessageOut );
      Exit;
    end
    else
    begin
      DataServiceTCPIP.GetPessoa;
      DataServiceTCPIP.FDMemTablePessoa.Locate( 'idpessoa', idpessoa, [ ] );
      DataServiceTCPIP.FDMemTablePessoa.Edit;
    end;
    Editdscep.Clear;
    Editdscep.SetFocus;
  end;

procedure TFormMain.Insert;
  begin
    case FStreamJSON of
      0 :
        DataServiceTCPIP.FDMemTablePessoa.Insert;
      1 :
        DataServiceHTTP.FDMemTablePessoa.Insert;
    end;
    DBRadioGroupflnatureza.SetFocus;
    BitBtnInsert.Enabled := False;
    BitBtnEdit.Enabled := False;
    BitBtnPost.Enabled := True;
    BitBtnCancel.Enabled := True;
  end;

procedure TFormMain.Post;
  begin
    case FStreamJSON of
      0 :
        DataServiceTCPIP.FDMemTablePessoa.Post;
      1 :
        DataServiceHTTP.FDMemTablePessoa.Post;
    end;
    BitBtnInsert.Enabled := True;
    BitBtnEdit.Enabled := True;
    BitBtnPost.Enabled := False;
    BitBtnCancel.Enabled := False;
  end;

procedure TFormMain.RadioGroupEnvelopeClick( Sender : TObject );
  begin
    FStreamJSON := RadioGroupEnvelope.ItemIndex;
    FormShow( Sender );
  end;

procedure TFormMain.SeekGridHTTP;
  begin
    if FStreamJSON = 1
    then
    begin
      DataServiceHTTP.GetEndereco
        ( DataServiceHTTP.FDMemTablePessoaidpessoa.AsInteger );
      DataServiceHTTP.GetEnderecoIntegracao
        ( DataServiceHTTP.FDMemTableEnderecoidendereco.AsInteger );
    end;
  end;

procedure TFormMain.SetDataTableHTTP;
  begin
    DataServiceHTTP.GetPessoa;
    DataServiceHTTP.FDMemTablePessoa.Open;
    DataServiceHTTP.GetEndereco
      ( DataServiceHTTP.FDMemTablePessoaidpessoa.AsInteger );
    DataServiceHTTP.GetEnderecoIntegracao
      ( DataServiceHTTP.FDMemTableEnderecoidendereco.AsInteger );
    // Grid ----------------------------------------------------------------------
    DBGrid.DataSource := DataServiceHTTP.DataSourcePessoa;
    // Set Control ---------------------------------------------------------------
    DBEditidpessoa.DataField := 'idpessoa';
    DBEditidpessoa.DataSource := DataServiceHTTP.DataSourcePessoa;
    // ---------------------------------------------------------------------------
    DBRadioGroupflnatureza.DataField := 'flnatureza';
    DBRadioGroupflnatureza.DataSource := DataServiceHTTP.DataSourcePessoa;
    // ---------------------------------------------------------------------------
    DBEditdsdocumento.DataField := 'dsdocumento';
    DBEditdsdocumento.DataSource := DataServiceHTTP.DataSourcePessoa;
    // ---------------------------------------------------------------------------
    DBEditnmprimeiro.DataField := 'nmprimeiro';
    DBEditnmprimeiro.DataSource := DataServiceHTTP.DataSourcePessoa;
    // ---------------------------------------------------------------------------
    DBEditnmsegundo.DataField := 'nmsegundo';
    DBEditnmsegundo.DataSource := DataServiceHTTP.DataSourcePessoa;
    // ---------------------------------------------------------------------------
    DBEditdtregistro.DataField := 'dtregistro';
    DBEditdtregistro.DataSource := DataServiceHTTP.DataSourcePessoa;
    // ---------------------------------------------------------------------------
    DBEditdscep.DataField := 'dscep';
    DBEditdscep.DataSource := DataServiceHTTP.DataSourceEndereco;
    // ---------------------------------------------------------------------------
    DBEditdsuf.DataField := 'dsuf';
    DBEditdsuf.DataSource := DataServiceHTTP.DataSourceEnderecoIntegracao;
    // ---------------------------------------------------------------------------
    DBEditnmcidade.DataField := 'nmcidade';
    DBEditnmcidade.DataSource := DataServiceHTTP.DataSourceEnderecoIntegracao;
    // ---------------------------------------------------------------------------
    DBEditnmbairro.DataField := 'nmbairro';
    DBEditnmbairro.DataSource := DataServiceHTTP.DataSourceEnderecoIntegracao;
    // ---------------------------------------------------------------------------
    DBEditnmlogradouro.DataField := 'nmlogradouro';
    DBEditnmlogradouro.DataSource :=
      DataServiceHTTP.DataSourceEnderecoIntegracao;
    // ---------------------------------------------------------------------------
    DBEditdscomplemento.DataField := 'dscomplemento';
    DBEditdscomplemento.DataSource :=
      DataServiceHTTP.DataSourceEnderecoIntegracao;
    // ---------------------------------------------------------------------------
  end;

procedure TFormMain.SetDataTableTCPIP;
  begin
    DataServiceTCPIP.GetPessoa;
    DataServiceTCPIP.FDMemTablePessoa.Open;
    // Grid ----------------------------------------------------------------------
    DBGrid.DataSource := DataServiceTCPIP.DataSourcePessoa;
    // Set Control ---------------------------------------------------------------
    DBEditidpessoa.DataField := 'idpessoa';
    DBEditidpessoa.DataSource := DataServiceTCPIP.DataSourcePessoa;
    // ---------------------------------------------------------------------------
    DBRadioGroupflnatureza.DataField := 'flnatureza';
    DBRadioGroupflnatureza.DataSource := DataServiceTCPIP.DataSourcePessoa;
    // ---------------------------------------------------------------------------
    DBEditdsdocumento.DataField := 'dsdocumento';
    DBEditdsdocumento.DataSource := DataServiceTCPIP.DataSourcePessoa;
    // ---------------------------------------------------------------------------
    DBEditnmprimeiro.DataField := 'nmprimeiro';
    DBEditnmprimeiro.DataSource := DataServiceTCPIP.DataSourcePessoa;
    // ---------------------------------------------------------------------------
    DBEditnmsegundo.DataField := 'nmsegundo';
    DBEditnmsegundo.DataSource := DataServiceTCPIP.DataSourcePessoa;
    // ---------------------------------------------------------------------------
    DBEditdtregistro.DataField := 'dtregistro';
    DBEditdtregistro.DataSource := DataServiceTCPIP.DataSourcePessoa;
    // ---------------------------------------------------------------------------
    DBEditdscep.DataField := 'dscep';
    DBEditdscep.DataSource := DataServiceTCPIP.DataSourceEndereco;
    // ---------------------------------------------------------------------------
    DBEditdsuf.DataField := 'dsuf';
    DBEditdsuf.DataSource := DataServiceTCPIP.DataSourceEnderecoIntegracao;
    // ---------------------------------------------------------------------------
    DBEditnmcidade.DataField := 'nmcidade';
    DBEditnmcidade.DataSource := DataServiceTCPIP.DataSourceEnderecoIntegracao;
    // ---------------------------------------------------------------------------
    DBEditnmbairro.DataField := 'nmbairro';
    DBEditnmbairro.DataSource := DataServiceTCPIP.DataSourceEnderecoIntegracao;
    // ---------------------------------------------------------------------------
    DBEditnmlogradouro.DataField := 'nmlogradouro';
    DBEditnmlogradouro.DataSource :=
      DataServiceTCPIP.DataSourceEnderecoIntegracao;
    // ---------------------------------------------------------------------------
    DBEditdscomplemento.DataField := 'dscomplemento';
    DBEditdscomplemento.DataSource :=
      DataServiceTCPIP.DataSourceEnderecoIntegracao;
    // ---------------------------------------------------------------------------
  end;

procedure TFormMain.Start;
  begin
    DBRadioGroupflnatureza.SetFocus;
    BitBtnInsert.Enabled := True;
    BitBtnEdit.Enabled := True;
    BitBtnPost.Enabled := False;
    BitBtnCancel.Enabled := False;
  end;

end.
