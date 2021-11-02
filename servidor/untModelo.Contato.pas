unit untModelo.Contato;

interface

uses
  System.Generics.Collections, System.Classes;

type

  TEmail = class
  private
    FEmail: String;
    FTipo: String;
    procedure SetEmail(const Value: String);
    procedure SetTipo(const Value: String);
  published
    property Email : String read FEmail write SetEmail;
    property Tipo : String read FTipo write SetTipo;
  end;

  TTelefone = class
  private
    FDDD: String;
    FNumero: String;
    FTipo: String;
    procedure SetDDD(const Value: String);
    procedure SetNumero(const Value: String);
    procedure SetTipo(const Value: String);
  published
    property DDD : String read FDDD write SetDDD;
    property Numero : String read FNumero write SetNumero;
    property Tipo : String read FTipo write SetTipo;
  end;

  TContatos = class
  private
    FID: String;
    FEmpresa: String;
    FNome: String;
    FTelefones: TList<TTelefone>;
    FEmails: TList<TEmail>;
    procedure SetID(const Value: String);
    procedure SetEmpresa(const Value: String);
    procedure SetNome(const Value: String);
  public
    constructor Create;
    destructor Destroy; override;
    property ID : String read FID write SetID;
    property Nome : String read FNome write SetNome;
    property Empresa : String read FEmpresa write SetEmpresa;
    property Emails : TList<TEmail> read FEmails;
    property Telefones : TList<TTelefone> read FTelefones;
    function Validar : String;
  end;

implementation

constructor TContatos.Create;
begin
  FEmails := TList<TEmail>.Create;
  FTelefones := TList<TTelefone>.Create;
end;

destructor TContatos.Destroy;
begin
  FEmails.Free;
  FTelefones.Free;
  inherited;
end;

{ TContatos }

procedure TContatos.SetEmpresa(const Value: String);
begin
  FEmpresa := Value;
end;

procedure TContatos.SetID(const Value: String);
begin
  FID := Value;
end;

procedure TContatos.SetNome(const Value: String);
begin
  FNome := Value;
end;

function TContatos.Validar: String;
begin
  Result := 'Funcionando!';
end;

{ TTelefone }

procedure TTelefone.SetDDD(const Value: String);
begin
  FDDD := Value;
end;

procedure TTelefone.SetNumero(const Value: String);
begin
  FNumero := Value;
end;

procedure TTelefone.SetTipo(const Value: String);
begin
  FTipo := Value;
end;

{ TEmail }

procedure TEmail.SetEmail(const Value: String);
begin
  FEmail := Value;
end;

procedure TEmail.SetTipo(const Value: String);
begin
  FTipo := Value;
end;

end.
