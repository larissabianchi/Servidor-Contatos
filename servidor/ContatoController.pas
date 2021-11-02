unit ContatoController;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer,
  Datasnap.DSAuth, Datasnap.DSProviderDataModuleAdapter, untModelo.Contato,
  System.JSON, REST.JSON, dmServer, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Gerar.GUID;

type
  TDsContatoController = class(TDSServerModule)
    DSMasterTelefone: TDataSource;
    DSMasterEmail: TDataSource;
    FDSAContato: TFDSchemaAdapter;
    FDMasterContato: TFDQuery;
    FDDetailTelefone: TFDQuery;
    FDDetailTelefonecontt_id: TFDAutoIncField;
    FDDetailTelefonecontt_cont_id: TStringField;
    FDDetailTelefonecontt_ddd: TStringField;
    FDDetailTelefonecontt_numero: TStringField;
    FDDetailTelefonecontt_tipo: TStringField;
    FDMasterContatocont_id: TStringField;
    FDMasterContatocont_nome: TStringField;
    FDMasterContatocont_empresa: TStringField;
    FDDetailEmail: TFDQuery;
    FDDetailEmailconte_id: TFDAutoIncField;
    FDDetailEmailconte_cont_id: TStringField;
    FDDetailEmailconte_email: TStringField;
    FDDetailEmailconte_tipo: TStringField;
  private
    { Private declarations }
    function GetContatosInternos(ID: String = ''): TJSONValue;
    procedure UpdateContatosInternos(Contato: TJSONObject; Action: String; var Result: TJSONValue);
  public
    { Public declarations }
    function Contato(ID : String): TJSONValue;
    function UpdateContato(Contato: TJSONObject): TJSONValue; //POST
    function AcceptContato(Contato: TJSONObject): TJSONValue; //PUT
    function CancelContato(ContatoID: String): TJSONValue;    //DELETE
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDsContatoController }

function TDsContatoController.AcceptContato(Contato: TJSONObject): TJSONValue;
begin
  UpdateContatosInternos(Contato, 'Insert', Result);
end;

function TDsContatoController.CancelContato(ContatoID: String): TJSONValue;
begin
  FDMasterContato.Filter := 'cont_id = '+QuotedStr(ContatoID)+'';
  FDMasterContato.Filtered := True;

  FDMasterContato.Open;
  FDMasterContato.Delete;

  FDMasterContato.ApplyUpdates();
  FDMasterContato.CommitUpdates;

  Result := TJSONString.Create('Objeto excluído com sucesso!');
end;

function TDsContatoController.Contato(ID: String): TJSONValue;
begin
  Result := GetContatosInternos(ID);
end;

function TDsContatoController.UpdateContato(Contato: TJSONObject): TJSONValue;
begin
  UpdateContatosInternos(Contato, 'Update', Result);
end;

procedure TDsContatoController.UpdateContatosInternos(Contato: TJSONObject;
  Action : String; var Result: TJSONValue);
var
  _contato  : TContatos;
  _telefone : TTelefone;
  _email    : TEmail;
  _guid     : String;
  _filter   : String;
begin
  _contato := TJson.JsonToObject<TContatos>(Contato);

  if Action = 'Update' then
  begin
    _filter := 'cont_id = '+QuotedStr(_contato.ID);
    FDMasterContato.Filter := _filter;
    FDMasterContato.Filtered := True;

    _filter := 'contt_cont_id = '+QuotedStr(_contato.ID);
    FDDetailTelefone.Filter := _filter;
    FDDetailTelefone.Filtered := True;

    _filter := 'conte_cont_id = '+QuotedStr(_contato.ID);
    FDDetailEmail.Filter := _filter;
    FDDetailEmail.Filtered := True;
  end
  else
    _guid := Gerar.GUID.GUID();

  {Abrindo Tabelas}
  FDMasterContato.Open;
  FDDetailTelefone.Open;
  FDDetailEmail.Open;

  {Incluindo ou editando contato}
  if Action = 'Update' then
    FDMasterContato.Edit
  else
  begin
    FDMasterContato.Append;
    FDMasterContatocont_id.Value := _guid;
  end;

  FDMasterContatocont_nome.Value := _contato.Nome;
  FDMasterContatocont_empresa.Value := _contato.Empresa;
  FDMasterContato.Post;

  {Incluindo ou editando telefones}
  for _telefone in _contato.Telefones do
  begin
    if Action = 'Update' then
      FDDetailTelefone.Edit
    else
    begin
      FDDetailTelefone.Append;
      FDDetailTelefonecontt_cont_id.Value := _guid;
    end;

    FDDetailTelefonecontt_ddd.Value := _telefone.DDD;
    FDDetailTelefonecontt_numero.Value := _telefone.Numero;
    FDDetailTelefonecontt_tipo.Value := _telefone.Tipo;
    FDDetailTelefone.Post;

    FDDetailTelefone.Next;
  end;

  {Incluindo emails}
  for _email in _contato.Emails do
  begin
    if Action = 'Update' then
      FDDetailEmail.Edit
    else
    begin
      FDDetailEmail.Append;
      FDDetailEmailconte_cont_id.Value := _guid;
    end;

    FDDetailEmailconte_email.Value := _email.Email;
    FDDetailEmailconte_tipo.Value := _email.Tipo;
    FDDetailEmail.Post;

    FDDetailEmail.Next;
  end;

  {Atualizando tabelas}
  FDSAContato.ApplyUpdates(0);
  FDSAContato.CommitUpdates;

  FDMasterContato.Close;
  FDDetailTelefone.Close;
  FDDetailEmail.Close;

  if Action = 'Update' then
    Result := TJSONString.Create('Objeto atualizado com sucesso!')
  else
    Result := TJSONString.Create('Objeto incluído com sucesso!');
end;

function TDsContatoController.GetContatosInternos(ID: String): TJSONValue;
var
  _arr      : TJSONArray;
  _obj      : TJSONObject;
  _contato  : TContatos;
  _telefone : TTelefone;
  _email    : TEmail;
begin
  _arr := TJSONArray.Create;

  FDMasterContato.Close;
  if ID <> EmptyStr then
  begin
    FDMasterContato.Filter := 'cont_id = '+QuotedStr(ID)+'';
    FDMasterContato.Filtered := True;
  end;

  FDMasterContato.Open;
  FDMasterContato.First;

  while not FDMasterContato.Eof do
  begin
    {Criando contato}
    _contato := TContatos.Create;
    _contato.ID := FDMasterContatocont_id.AsString;
    _contato.Nome := FDMasterContatocont_nome.AsString;
    _contato.Empresa := FDMasterContatocont_empresa.AsString;

    {Selecionando Telefones desse contato}
    FDDetailTelefone.Close;
    FDDetailTelefone.Filter := 'contt_cont_id = '+QuotedStr(FDMasterContatocont_id.Value)+'';
    FDDetailTelefone.Filtered := True;
    FDDetailTelefone.Open;

    while not FDDetailTelefone.Eof do
    begin
      _telefone := TTelefone.Create;
      _telefone.DDD := FDDetailTelefonecontt_ddd.AsString;
      _telefone.Numero := FDDetailTelefonecontt_numero.AsString;
      _telefone.Tipo := FDDetailTelefonecontt_tipo.AsString;
      _contato.Telefones.Add(_telefone);
      FDDetailTelefone.Next;
    end;

    {Selecionando Emails desse contato}
    FDDetailEmail.Close;
    FDDetailEmail.Filter := 'conte_cont_id = '+QuotedStr(FDMasterContatocont_id.Value)+'';
    FDDetailEmail.Filtered := True;
    FDDetailEmail.Open;

    while not FDDetailEmail.Eof do
    begin
      _email := TEmail.Create;
      _email.Email := FDDetailEmailconte_email.AsString;
      _email.Tipo := FDDetailEmailconte_tipo.AsString;
      _contato.Emails.Add(_email);
      FDDetailEmail.Next;
    end;

    {Exibindo informações do contato como Array}
    _obj := TJson.ObjectToJsonObject(_contato);
    _arr.AddElement(_obj);
    FDMasterContato.Next;
  end;
  Result := _arr;
end;

end.

