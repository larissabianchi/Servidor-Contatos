unit Gerar.GUID;

interface
  //GUID - Globally Unique Identifier
  //� uma string gerada pelo computador que dificilmente ser� gerada novamente
  //servindo como identifica��o para registros
  function GUID():string;

implementation
uses
  ComObj,
  ActiveX,
  SysUtils;

function GUID():string;
var
  ID: TGUID;
begin

  Result := '';

  if CoCreateGuid(ID) = S_OK then
     Result := GUIDToString(ID).Replace('{','').Replace('}','');
end;

end.
