object formCadastro: TformCadastro
  Left = 0
  Top = 0
  Caption = 'Cadatro'
  ClientHeight = 487
  ClientWidth = 637
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Label7: TLabel
    Left = -810
    Top = -204
    Width = 38
    Height = 16
    Caption = 'Estado'
    FocusControl = DBEdit7
  end
  object sbEnviarEmail: TSpeedButton
    Left = 449
    Top = 432
    Width = 158
    Height = 30
    Caption = 'Enviar por Email'
    OnClick = sbEnviarEmailClick
  end
  object sbGerarXml: TSpeedButton
    Left = 285
    Top = 432
    Width = 158
    Height = 29
    Caption = 'Gerar XML'
    OnClick = sbGerarXmlClick
  end
  object DBEdit7: TDBEdit
    Left = -810
    Top = -186
    Width = 804
    Height = 24
    DataField = 'estado'
    DataSource = dsCadastro
    TabOrder = 1
  end
  object gbCadastro: TGroupBox
    Left = 24
    Top = 26
    Width = 583
    Height = 392
    Caption = 'Cadastro:'
    TabOrder = 0
    object lbEmail: TLabel
      Left = 20
      Top = 120
      Width = 35
      Height = 16
      Caption = 'e-Mail'
      FocusControl = dbeEmail
    end
    object lbTelefone: TLabel
      Left = 373
      Top = 70
      Width = 50
      Height = 16
      Caption = 'Telefone'
      FocusControl = dbeTelefone
    end
    object lbCpf: TLabel
      Left = 185
      Top = 70
      Width = 22
      Height = 16
      Caption = 'CPF'
      FocusControl = dbeCpf
    end
    object lbIdentidade: TLabel
      Left = 20
      Top = 70
      Width = 60
      Height = 16
      Caption = 'Identidade'
      FocusControl = dbeIdentidade
    end
    object lbNome: TLabel
      Left = 20
      Top = 21
      Width = 33
      Height = 16
      Caption = 'Nome'
      FocusControl = dbeNome
    end
    object dbeEmail: TDBEdit
      Left = 20
      Top = 138
      Width = 542
      Height = 24
      DataField = 'email'
      DataSource = dsCadastro
      TabOrder = 4
    end
    object dbeTelefone: TDBEdit
      Left = 373
      Top = 88
      Width = 188
      Height = 24
      DataField = 'telefone'
      DataSource = dsCadastro
      TabOrder = 3
    end
    object dbeCpf: TDBEdit
      Left = 185
      Top = 88
      Width = 180
      Height = 24
      DataField = 'cpf'
      DataSource = dsCadastro
      TabOrder = 2
    end
    object dbeIdentidade: TDBEdit
      Left = 20
      Top = 88
      Width = 157
      Height = 24
      DataField = 'identidade'
      DataSource = dsCadastro
      TabOrder = 1
    end
    object dbeNome: TDBEdit
      Left = 20
      Top = 39
      Width = 542
      Height = 24
      DataField = 'nome'
      DataSource = dsCadastro
      TabOrder = 0
    end
    object gbEnedereco: TGroupBox
      Left = 20
      Top = 177
      Width = 542
      Height = 196
      Caption = 'Endere'#231'o:'
      TabOrder = 5
      object lbCep: TLabel
        Left = 12
        Top = 28
        Width = 22
        Height = 16
        Caption = 'CEP'
        FocusControl = dbeCep
      end
      object lbLogradouro: TLabel
        Left = 106
        Top = 28
        Width = 65
        Height = 16
        Caption = 'Logradouro'
        FocusControl = dbeLogradouro
      end
      object lbNumero: TLabel
        Left = 441
        Top = 28
        Width = 45
        Height = 16
        Caption = 'N'#250'mero'
        FocusControl = dbeNumero
      end
      object lbComplemento: TLabel
        Left = 12
        Top = 81
        Width = 79
        Height = 16
        Caption = 'Complemento'
        FocusControl = dbeComplemento
      end
      object lbBairro: TLabel
        Left = 172
        Top = 81
        Width = 34
        Height = 16
        Caption = 'Bairro'
        FocusControl = dbeBairro
      end
      object lbCidade: TLabel
        Left = 341
        Top = 81
        Width = 39
        Height = 16
        Caption = 'Cidade'
        FocusControl = dbeCidade
      end
      object lbEstado: TLabel
        Left = 12
        Top = 136
        Width = 38
        Height = 16
        Caption = 'Estado'
        FocusControl = dbeEstado
      end
      object lbPais: TLabel
        Left = 113
        Top = 136
        Width = 23
        Height = 16
        Caption = 'Pais'
        FocusControl = dbePais
      end
      object dbeCep: TDBEdit
        Left = 12
        Top = 46
        Width = 86
        Height = 24
        DataField = 'cep'
        DataSource = dsCadastro
        TabOrder = 0
      end
      object dbeLogradouro: TDBEdit
        Left = 106
        Top = 46
        Width = 326
        Height = 24
        DataField = 'logradouro'
        DataSource = dsCadastro
        TabOrder = 1
      end
      object dbeNumero: TDBEdit
        Left = 441
        Top = 46
        Width = 82
        Height = 24
        DataField = 'numero'
        DataSource = dsCadastro
        TabOrder = 2
      end
      object dbeComplemento: TDBEdit
        Left = 12
        Top = 99
        Width = 151
        Height = 24
        DataField = 'complemento'
        DataSource = dsCadastro
        TabOrder = 3
      end
      object dbeBairro: TDBEdit
        Left = 172
        Top = 99
        Width = 159
        Height = 24
        DataField = 'bairro'
        DataSource = dsCadastro
        TabOrder = 4
      end
      object dbeCidade: TDBEdit
        Left = 341
        Top = 99
        Width = 182
        Height = 24
        DataField = 'cidade'
        DataSource = dsCadastro
        TabOrder = 5
      end
      object dbeEstado: TDBEdit
        Left = 12
        Top = 154
        Width = 91
        Height = 24
        DataField = 'estado'
        DataSource = dsCadastro
        TabOrder = 6
      end
      object dbePais: TDBEdit
        Left = 113
        Top = 154
        Width = 410
        Height = 24
        DataField = 'pais'
        DataSource = dsCadastro
        TabOrder = 7
      end
    end
  end
  object cdsCadastro: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 215
    Top = 16
    object cdsCadastronome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 50
    end
    object cdsCadastroidentidade: TStringField
      DisplayLabel = 'Identidade'
      FieldName = 'identidade'
    end
    object cdsCadastrocpf: TStringField
      DisplayLabel = 'CPF'
      FieldName = 'cpf'
      Size = 11
    end
    object cdsCadastrotelefone: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'telefone'
    end
    object cdsCadastroemail: TStringField
      DisplayLabel = 'e-Mail'
      FieldName = 'email'
      Size = 200
    end
    object cdsCadastrocep: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'cep'
      Size = 8
    end
    object cdsCadastrologradouro: TStringField
      DisplayLabel = 'Logradouro'
      FieldName = 'logradouro'
    end
    object cdsCadastronumero: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'numero'
      Size = 10
    end
    object cdsCadastrocomplemento: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'complemento'
      Size = 50
    end
    object cdsCadastrobairro: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'bairro'
      Size = 50
    end
    object cdsCadastrocidade: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 100
      FieldName = 'cidade'
      Size = 100
    end
    object cdsCadastroestado: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'estado'
      Size = 50
    end
    object cdsCadastropais: TStringField
      DisplayLabel = 'Pais'
      FieldName = 'pais'
      Size = 50
    end
  end
  object dsCadastro: TDataSource
    DataSet = cdsCadastro
    Left = 147
    Top = 16
  end
  object acCadastro: TActionList
    Left = 303
    Top = 15
    object aEnter: TAction
      Caption = 'aEnter'
      ShortCut = 13
      OnExecute = aEnterExecute
    end
    object aTab: TAction
      Caption = 'aTab'
      ShortCut = 9
      OnExecute = aTabExecute
    end
  end
  object IdSMTP: TIdSMTP
    SASLMechanisms = <>
    Left = 375
    Top = 18
  end
end
