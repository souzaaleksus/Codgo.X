unit ListType;

interface

type
  TReturn = class
    private
      Flogradouro : string;
      Fbairro : string;
      Fuf : string;
      Fcep : string;
      Flocalidade : string;
      Fcomplemento : string;
      procedure Setbairro( const Value : string );
      procedure Setcep( const Value : string );
      procedure Setcomplemento( const Value : string );
      procedure Setlocalidade( const Value : string );
      procedure Setlogradouro( const Value : string );
      procedure Setuf( const Value : string );
    public
      property cep : string
        read Fcep
        write Setcep;
      property logradouro : string
        read Flogradouro
        write Setlogradouro;
      property complemento : string
        read Fcomplemento
        write Setcomplemento;
      property bairro : string
        read Fbairro
        write Setbairro;
      property localidade : string
        read Flocalidade
        write Setlocalidade;
      property uf : string
        read Fuf
        write Setuf;
  end;

  TPessoa = class
    private
      Fnmprimeiro : string;
      Fnmsegundo : string;
      Fdsdocumento : string;
      Fflnatureza : Integer;
      procedure Setdsdocumento( const Value : string );
      procedure Setflnatureza( const Value : Integer );
      procedure Setnmprimeiro( const Value : string );
      procedure Setnmsegundo( const Value : string );
    public
      constructor Create(
        const Anmprimeiro, Anmsegundo, Adsdocumento : string;
        const Aflnatureza                           : Integer );
      destructor Destroy( ); override;
      property flnatureza : Integer
        read Fflnatureza
        write Setflnatureza;
      property dsdocumento : string
        read Fdsdocumento
        write Setdsdocumento;
      property nmprimeiro : string
        read Fnmprimeiro
        write Setnmprimeiro;
      property nmsegundo : string
        read Fnmsegundo
        write Setnmsegundo;
  end;

implementation

{ TReturn }

procedure TReturn.Setbairro( const Value : string );
  begin
    Fbairro := Value;
  end;

procedure TReturn.Setcep( const Value : string );
  begin
    Fcep := Value;
  end;

procedure TReturn.Setcomplemento( const Value : string );
  begin
    Fcomplemento := Value;
  end;

procedure TReturn.Setlocalidade( const Value : string );
  begin
    Flocalidade := Value;
  end;

procedure TReturn.Setlogradouro( const Value : string );
  begin
    Flogradouro := Value;
  end;

procedure TReturn.Setuf( const Value : string );
  begin
    Fuf := Value;
  end;

{ TPessoa }

constructor TPessoa.Create(
  const Anmprimeiro, Anmsegundo, Adsdocumento : string;
  const Aflnatureza                           : Integer );
  begin
    Fnmprimeiro := Anmprimeiro;
    Fnmsegundo := Anmsegundo;
    Fdsdocumento := Adsdocumento;
    Fflnatureza := Aflnatureza;
  end;

destructor TPessoa.Destroy;
  begin
    inherited;
  end;

procedure TPessoa.Setdsdocumento( const Value : string );
  begin
    Fdsdocumento := Value;
  end;

procedure TPessoa.Setflnatureza( const Value : Integer );
  begin
    Fflnatureza := Value;
  end;

procedure TPessoa.Setnmprimeiro( const Value : string );
  begin
    Fnmprimeiro := Value;
  end;

procedure TPessoa.Setnmsegundo( const Value : string );
  begin
    Fnmsegundo := Value;
  end;

end.
