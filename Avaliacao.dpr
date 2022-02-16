program Avaliacao;

uses
  Vcl.Forms,
  Cadastro in 'Cadastro.pas' {formCadastro};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformCadastro, formCadastro);
  Application.Run;
end.
