# cartsys-crud
Sistema em Delphi 12.0 para o controle de clientes utilizando como banco de dados o Firebird na versão 3.0. Para implementar essa aplicação foram utilizados componentes compatíveis com o Delphi 12 Community Edition (CE), nesse caso, apesar de o DevExpress ter componentes compatíveis com a versão 12.x, não existe compatibilidade com versões Community Edition ou Trial de outras versões. Dessa forma, para estilização das telas e campos, foram utilizados componentes do TMS VCL, se assemelham ao DevExpress e são compatíveis com as versões do Delphi (CE e Trial). :)

# Boas Práticas Implementadas

# Estrutura do projeto 

```bash

```

# Tecnologias Utilizadas

- Delphi 12.0
- Firebird 3.0
- FireDAC
- MVC
- ReportBuilder
- TMS VCL
- DUnitX
- GitHub

# Instruções para Executar o Projeto Localmente

Necessário o download do Delphi (no projeto foi usada a versão 12.0) e Firebird (utilizada a versão 3.0).

## Criação do Banco de Dados

1. Dentro do Firebird ISQL Tool, execute o comando ``isql -user SYSDBA -password admin`` (o usuário e a senha são definidos durante a instalação do Firebird);
2. Depois, execute as tabelas que serão utilizadas:

```bash
CREATE DATABASE 'D:\Repository\cartsys-crud\SQL\CartSysClientes.fdb'
USER 'SYSDBA'
PASSWORD 'admin';

CREATE TABLE ESTADO (
    ID INTEGER NOT NULL,
    NOME VARCHAR(50),
    UF CHAR(2),
    CONSTRAINT PK_ESTADO PRIMARY KEY (ID)
);

CREATE TABLE CIDADE (
    ID INTEGER NOT NULL,
    NOME VARCHAR(50),
    ESTADOID INTEGER,
    CONSTRAINT PK_CIDADE PRIMARY KEY (ID),
    CONSTRAINT FK_CIDADE_ESTADO
        FOREIGN KEY (ESTADOID)
        REFERENCES ESTADO(ID)
);

CREATE TABLE CLIENTE (
    ID INTEGER NOT NULL,
    NOME VARCHAR(80),
    CEP CHAR(8),
    CPF_CNPJ VARCHAR(14),
    ENDERECO VARCHAR(100),
    NUMERO VARCHAR(20),
    COMPLEMENTO VARCHAR(60),
    BAIRRO VARCHAR(100),
    CIDADE INTEGER,
    DATANASCIMENTO DATE,
    CONSTRAINT PK_CLIENTE PRIMARY KEY (ID),
    CONSTRAINT FK_CLIENTE_CIDADE
        FOREIGN KEY (CIDADE)
        REFERENCES CIDADE(ID)
);

COMMIT;
```

4. Dentro do seu arquivo de conexão, informe o caminho do banco de dados. Nesse caso, o arquivo é o ``DAO/Conexao.DAO.pas``, a linha a ser inserida é algo como ``Result.Params.Values['Database'] := 'D:\Repository\cartsys-crud\SQL\CartSysClientes.fdb';``;
5. Gere o executável do projeto para que esse possa ser acessado de outra forma, além de dentro da IDE.
_O formulário e configurações do relatório serão feitas conforme as exigências do projeto._
