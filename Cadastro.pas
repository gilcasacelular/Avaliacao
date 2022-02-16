unit Cadastro;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
   Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls,
   System.Actions, Vcl.ActnList, Xml.xmldom, Xml.XMLIntf, Xml.Win.msxmldom, Xml.XMLDoc, IdBaseComponent, IdComponent,
   IdIOHandler, idHTTP, IdIOHandlerSocket, IdIOHandlerStack, REST.Client, IdSSL, IdSSLOpenSSL, JSON,
   IPPeerClient, Vcl.Buttons, midaslib, IdSMTP, IdMessage, IdText, IdAttachmentFile, IdExplicitTLSClientServerBase,
   IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTPBase;
type
  TTipoConsulta = (tcCep, tcEndereco);

type
  TChars = set of Char;

  TEnderecoCompleto = record
    CEP,
    logradouro,
    complemento,
    bairro,
    localidade,
    uf,
    unidade,
    IBGE : string
  end;

type
  TformCadastro = class(TForm)
    cdsCadastro: TClientDataSet;
    dsCadastro: TDataSource;
    cdsCadastronome: TStringField;
    cdsCadastroidentidade: TStringField;
    cdsCadastrocpf: TStringField;
    cdsCadastrotelefone: TStringField;
    cdsCadastroemail: TStringField;
    cdsCadastrocep: TStringField;
    cdsCadastrologradouro: TStringField;
    cdsCadastronumero: TStringField;
    cdsCadastrocomplemento: TStringField;
    cdsCadastrobairro: TStringField;
    cdsCadastrocidade: TStringField;
    cdsCadastroestado: TStringField;
    cdsCadastropais: TStringField;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    acCadastro: TActionList;
    aEnter: TAction;
    sbEnviarEmail: TSpeedButton;
    IdSMTP: TIdSMTP;
    sbGerarXml: TSpeedButton;
    gbCadastro: TGroupBox;
    dbeEmail: TDBEdit;
    dbeTelefone: TDBEdit;
    dbeCpf: TDBEdit;
    dbeIdentidade: TDBEdit;
    dbeNome: TDBEdit;
    lbEmail: TLabel;
    lbTelefone: TLabel;
    lbCpf: TLabel;
    lbIdentidade: TLabel;
    lbNome: TLabel;
    gbEnedereco: TGroupBox;
    lbCep: TLabel;
    lbLogradouro: TLabel;
    lbNumero: TLabel;
    lbComplemento: TLabel;
    lbBairro: TLabel;
    lbCidade: TLabel;
    lbEstado: TLabel;
    lbPais: TLabel;
    dbeCep: TDBEdit;
    dbeLogradouro: TDBEdit;
    dbeNumero: TDBEdit;
    dbeComplemento: TDBEdit;
    dbeBairro: TDBEdit;
    dbeCidade: TDBEdit;
    dbeEstado: TDBEdit;
    dbePais: TDBEdit;
    aTab: TAction;
    procedure aEnterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbEnviarEmailClick(Sender: TObject);
    procedure sbGerarXmlClick(Sender: TObject);
    procedure aTabExecute(Sender: TObject);
  private
    { Private declarations }
      function BuscaCepViaCep(CEP: string): Boolean;
      function EnviarEmail: Boolean;
      function FiltraNumeros(const S: string; const ValidChars: TChars): string;
  public
    { Public declarations }
  end;

var
  formCadastro: TformCadastro;

implementation

{$R *.dfm}

function TformCadastro.FiltraNumeros(const S: string; const ValidChars: TChars): string;
Var
  I: integer;
begin
  Result := '';
  for I := 1 to Length(S) do
  if S[I] in ValidChars then
  Result := Result + S[I];
end;


procedure TformCadastro.aTabExecute(Sender: TObject);
begin
   aEnter.Execute;
end;

function TformCadastro.BuscaCepViaCep(CEP: string): Boolean;
var
  nCEP: String;
  data: TJSONObject;
  RESTClient1: TRESTClient;
  RESTRequest1: TRESTRequest;
  RESTResponse1: TRESTResponse;
  Endereco: TStringList;
begin

   nCep := FiltraNumeros(CEP, ['0'..'9']);
   if (nCEP.Length >= 1) and (nCEP.Length < 8) then
      begin
         ShowMessage('Número de CEP inválido!');
         exit;
      end
   else if (nCEP = '') then
      begin
         Result := true;
         exit;
      end;

   try
      RESTClient1 := TRESTClient.Create(nil);
      RESTRequest1 := TRESTRequest.Create(nil);
      RESTResponse1 := TRESTResponse.Create(nil);
      RESTRequest1.Client := RESTClient1;
      RESTRequest1.Response := RESTResponse1;
      RESTClient1.BaseURL := 'https://viacep.com.br/ws/' + CEP + '/json';
      RESTRequest1.Execute;
      data := RESTResponse1.JSONValue as TJSONObject;
      if Assigned(data) then
      begin
         cdsCadastro.Edit;
         cdsCadastroLOGRADOURO.Value   := data.Values['logradouro'].Value;
         cdsCadastroBAIRRO.Value       := data.Values['bairro'].Value;
         cdsCadastroCIDADE.Value       := data.Values['localidade'].Value;
         cdsCadastroCOMPLEMENTO.Value  := data.Values['complemento'].Value;
         cdsCadastroESTADO.Value       := data.Values['uf'].Value;
         cdsCadastro.Post;
      end;
      result := True;
   except
      on E: Exception do
         begin
            MessageDlg(Concat('CEP não encontrado!'), mtWarning, [mbOk], 0 );
            Result := False;
         end;
   end;
end;

procedure TformCadastro.FormCreate(Sender: TObject);
begin
   cdsCadastro.CreateDataSet;

   cdsCadastro.Edit;
   cdsCadastroNOME.Text          := 'JOSE DA SILVA';
   cdsCadastroIDENTIDADE.Text    := '4092398-5';
   cdsCadastroCPF.Text           := '555.529.979-77';
   cdsCadastroTELEFONE.Text      := '(44)99852-9569';
   cdsCadastroEMAIL.Text         := 'josedasilva@gmail.com';

   cdsCadastroCEP.Text           := '87508129';
   cdsCadastroLOGRADOURO.Text    := 'RUA LONDRES';
   cdsCadastroNUMERO.Text        := '7457';
   cdsCadastroCOMPLEMENTO.Text   := 'CASA';
   cdsCadastroBAIRRO.Text        := 'CENTRO';
   cdsCadastroCIDADE.Text        := 'JARDIM ALEGRE';
   cdsCadastroESTADO.Text        := 'PR';
   cdsCadastroPAIS.Text          := 'BRASIL';
   cdsCadastro.Post;

end;

procedure TformCadastro.sbEnviarEmailClick(Sender: TObject);
begin
   //
   EnviarEmail();
   //
end;

procedure TformCadastro.sbGerarXmlClick(Sender: TObject);
var
  XMLDocument: TXMLDocument;
  NodeTabela, NodeRegistro, NodeEndereco: IXMLNode;
  I: Integer;
begin
  XMLDocument := TXMLDocument.Create(Self);
  try
      XMLDocument.Active := True;

      // Gera os dados pessoais.
      NodeTabela := XMLDocument.AddChild('Cadastro');
      NodeRegistro := NodeTabela.AddChild('Registro');
      NodeRegistro.ChildValues['Nome']       := cdsCadastroNOME.Text;
      NodeRegistro.ChildValues['Identidade'] := cdsCadastroIDENTIDADE.Text;
      NodeRegistro.ChildValues['CPF']        := cdsCadastroCPF.Text;
      NodeRegistro.ChildValues['Telefone']   := cdsCadastroTELEFONE.Text;
      NodeRegistro.ChildValues['Email']      := cdsCadastroEMAIL.Text;

      // Gera os dados do endereço.
      NodeEndereco   := NodeRegistro.AddChild('Endereco');
      NodeEndereco.ChildValues['CEP']           := cdsCadastroCEP.Text;
      NodeEndereco.ChildValues['Logradouro']    := cdsCadastroLOGRADOURO.Text;
      NodeEndereco.ChildValues['Numero']        := cdsCadastroNUMERO.Text;
      NodeEndereco.ChildValues['Complemento']   := cdsCadastroCOMPLEMENTO.Text;
      NodeEndereco.ChildValues['Bairro']        := cdsCadastroBAIRRO.Text;
      NodeEndereco.ChildValues['Cidade']        := cdsCadastroCIDADE.Text;
      NodeEndereco.ChildValues['Estado']        := cdsCadastroESTADO.Text;
      NodeEndereco.ChildValues['Pais']          := cdsCadastroPAIS.Text;

      XMLDocument.SaveToFile('cadastro.xml');
  finally
      XMLDocument.Free;
  end;
end;

procedure TformCadastro.aEnterExecute(Sender: TObject);
begin
   if dbeCep.Focused then
   begin
      if (not BuscaCepViaCep(dbeCep.Text)) then
      begin
         dbeCep.SetFocus;
         dbeCep.SelectAll;
         exit;
      end;
   end;

   Perform(WM_NEXTDLGCTL, 0, 0);
end;

function TformCadastro.EnviarEmail(): Boolean;
var
  // variáveis e objetos necessários para o envio
  IdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
  IdSMTP: TIdSMTP;
  IdMessage: TIdMessage;
  IdText: TIdText;
  sAnexo: string;
begin
  // instanciação dos objetos
  IdSSLIOHandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create(Self);
  IdSMTP := TIdSMTP.Create(Self);
  IdMessage := TIdMessage.Create(Self);

  try
    // Configuração do protocolo SSL
    IdSSLIOHandlerSocket.SSLOptions.Method   := sslvSSLv23;
    IdSSLIOHandlerSocket.SSLOptions.Mode     := sslmClient;

    // Configuração do servidor SMTP (TIdSMTP)
    IdSMTP.IOHandler    := IdSSLIOHandlerSocket;
    IdSMTP.UseTLS       := utUseImplicitTLS;
    IdSMTP.AuthType     := satDefault;
    IdSMTP.Port         := 465;
    IdSMTP.Host         := 'smtp.gmail.com';
    IdSMTP.Username     := 'gilbertofernandesrezende@gmail.com';
    IdSMTP.Password     := 'gilcasa976431';

    // Configuração da mensagem (TIdMessage)
    IdMessage.From.Address             := 'gilbertofernandesrezende@gmail.com';
    IdMessage.From.Name                := 'Gilberto F. Rezende';
    IdMessage.ReplyTo.EMailAddresses   := IdMessage.From.Address;
    IdMessage.Recipients.Add.Text      := 'destinatario@email.com';
    IdMessage.Subject                  := 'Cadastro';
    IdMessage.Encoding                 := meMIME;

    // Configuração do corpo do email (TIdText)
    IdText                 := TIdText.Create(IdMessage.MessageParts);
    IdText.Body.Add('Cadastro');
    IdText.ContentType     := 'text/plain; charset=iso-8859-1';

    // Opcional - Anexo da mensagem (TIdAttachmentFile)
    sAnexo := 'Cadastro.xml';
    if FileExists(sAnexo) then
    begin
      TIdAttachmentFile.Create(IdMessage.MessageParts, sAnexo);
    end;

    // Conexão e autenticação
    try
      IdSMTP.Connect;
      IdSMTP.Authenticate;
    except
      on E:Exception do
      begin
        MessageDlg('Erro na conexão ou autenticação: ' +
          E.Message, mtWarning, [mbOK], 0);
        Exit;
      end;
    end;

    // Envio da mensagem
    try
      IdSMTP.Send(IdMessage);
      MessageDlg('Mensagem enviada com sucesso!', mtInformation, [mbOK], 0);
    except
      On E:Exception do
      begin
        MessageDlg('Erro ao enviar a mensagem: ' +
          E.Message, mtWarning, [mbOK], 0);
      end;
    end;
  finally
    // desconecta do servidor
    IdSMTP.Disconnect;
    // liberação da DLL
    UnLoadOpenSSLLibrary;
    // liberação dos objetos da memória
    FreeAndNil(IdMessage);
    FreeAndNil(IdSSLIOHandlerSocket);
    FreeAndNil(IdSMTP);
  end;
end;

end.
