unit frmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmServidorContatos = class(TForm)
    btnLigarServidor: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Memo: TMemo;
    procedure btnLigarServidorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmServidorContatos: TfrmServidorContatos;

implementation

{$R *.dfm}

uses
  untModelo.Contato,
  DBXJsonReflect;

procedure TfrmServidorContatos.btnLigarServidorClick(Sender: TObject);
var
  C: TContatos;
  E: TEmail;
  T: TTelefone;
  M: TJSONMarshal;
begin
  try
    C := TContatos.Create;
    C.Nome := 'Larissa Bianchi';
    C.Empresa := 'Estil Systems Brasil';

    E := TEmail.Create;
    E.Email := 'larissa.b@estilbrasil.com.br';
    E.Tipo := 'Comercial';
    C.Emails.Add(E);

    E := TEmail.Create;
    E.Email := 'larissa.bianchi16@gmail.com';
    E.Tipo := 'Pessoal';
    C.Emails.Add(E);

    T := TTelefone.Create;
    T.DDD := '11';
    T.Numero := '9-5059-5550';
    T.Tipo := 'Celular';
    C.Telefones.Add(T);

    M := TJSONMarshal.Create;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao carregar memo!');
      Exit;
    end;
  end;
  ShowMessage('Servidor Ligado!');
  Memo.Lines.Add(M.Marshal(C).ToString);
end;

procedure TfrmServidorContatos.FormCreate(Sender: TObject);
begin
  Memo.Clear;
end;

end.
