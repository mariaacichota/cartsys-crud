# cartsys-crud
Sistema em Delphi 12.0 para o controle de clientes utilizando como banco de dados o Firebird na versão 3.0. Para implementar essa aplicação foram utilizados componentes compatíveis com o Delphi 12 Community Edition (CE), nesse caso, apesar de o DevExpress ter componentes compatíveis com a versão 12.x, não existe compatibilidade com versões Community Edition ou Trial de outras versões. Dessa forma, para estilização das telas e campos, foram utilizados componentes do TMS VCL, se assemelham ao DevExpress e são compatíveis com as versões do Delphi (CE e Trial). :)

## Boas Práticas Implementadas

### Arquitetura MVC
- Model
- View
- Controller
- DAO

### Controle de Transações
- Commit em operações bem sucedidas
- Rollback em caso de erro

### Memory Leak Report

```delphi
ReportMemoryLeaksOnShutdown := True;
```

### Validações
- Nome obrigatório
- CPF/CNPJ obrigatório e único
- Endereço obrigatório
- Bairro obrigatório
- Cidade obrigatória
- Data de nascimento não pode ser futura

### Exclusão Protegida
IDs bloqueados:
1, 5, 8, 10, 15

## Estrutura do projeto 

```bash
cartsys-crud/
│
├── Controller/
│   ├── Cliente.Controller.pas
│   ├── Cidade.Controller.pas
│   ├── Estado.Controller.pas
│   └── Relatorio.Controller.pas
│
├── DAO/
│   ├── Cliente.DAO.pas
│   ├── Cidade.DAO.pas
│   ├── Estado.DAO.pas
│   ├── Relatorio.DAO.pas
│   └── Conexao.DAO.pas
│
├── Model/
│   ├── Cliente.Model.pas
│   ├── Cidade.Model.pas
│   └── Estado.Model.pas
│
├── View/
│   ├── Principal.View.pas
│   ├── Cliente.View.pas
│   └── Relatorio.View.pas
│
├── Test/
│   └── Cliente.Test.pas
│
├── SQL/
│   └── CARTSYSCLIENTES.FDB
|
├── Utils/
│   └── logo.png
│
└── CartSys_CRUD.dpr
```

## Estrutura do Banco de Dados
### Criação do banco de dados

```bash
CREATE DATABASE 'D:\Repository\cartsys-crud\cartsys-crud\SQL\CartSysClientes.fdb'
USER 'SYSDBA'
PASSWORD 'admin';
```

### Criação das tabelas e generators (CLIENTE, ESTADO, CIDADE)
```bash
CREATE TABLE ESTADO (
    ID INTEGER NOT NULL,
    NOME VARCHAR(50) NOT NULL,
    UF CHAR(2) NOT NULL,
    CONSTRAINT PK_ESTADO PRIMARY KEY (ID)
);

CREATE TABLE CIDADE (
    ID INTEGER NOT NULL,
    NOME VARCHAR(50) NOT NULL,
    ESTADOID INTEGER NOT NULL,

    CONSTRAINT PK_CIDADE PRIMARY KEY (ID),

    CONSTRAINT FK_CIDADE_ESTADO
        FOREIGN KEY (ESTADOID)
        REFERENCES ESTADO(ID)
);

CREATE TABLE CLIENTE (
    ID INTEGER NOT NULL,
    NOME VARCHAR(80) NOT NULL,
    CEP CHAR(8),
    CPF_CNPJ VARCHAR(14) NOT NULL,
    ENDERECO VARCHAR(100) NOT NULL,
    NUMERO VARCHAR(20),
    COMPLEMENTO VARCHAR(60),
    BAIRRO VARCHAR(100) NOT NULL,
    CIDADE INTEGER NOT NULL,
    DATANASCIMENTO DATE NOT NULL,

    CONSTRAINT PK_CLIENTE PRIMARY KEY (ID),

    CONSTRAINT UK_CLIENTE_CPF_CNPJ
        UNIQUE (CPF_CNPJ),

    CONSTRAINT FK_CLIENTE_CIDADE
        FOREIGN KEY (CIDADE)
        REFERENCES CIDADE(ID)
);

CREATE SEQUENCE GEN_CLIENTE_ID;
CREATE SEQUENCE GEN_CIDADE_ID;
CREATE SEQUENCE GEN_ESTADO_ID;

COMMIT;
```

### Populando as tabelas

#### Populando a tabela ESTADO com os estados

```bash
INSERT INTO ESTADO (ID, NOME, UF) VALUES (1, 'Acre', 'AC');
INSERT INTO ESTADO (ID, NOME, UF) VALUES (2, 'Alagoas', 'AL');
INSERT INTO ESTADO (ID, NOME, UF) VALUES (3, 'Amapa', 'AP');
INSERT INTO ESTADO (ID, NOME, UF) VALUES (4, 'Amazonas', 'AM');
INSERT INTO ESTADO (ID, NOME, UF) VALUES (5, 'Bahia', 'BA');
INSERT INTO ESTADO (ID, NOME, UF) VALUES (6, 'Ceara', 'CE');
INSERT INTO ESTADO (ID, NOME, UF) VALUES (7, 'Distrito Federal', 'DF');
INSERT INTO ESTADO (ID, NOME, UF) VALUES (8, 'Espirito Santo', 'ES');
INSERT INTO ESTADO (ID, NOME, UF) VALUES (9, 'Goias', 'GO');
INSERT INTO ESTADO (ID, NOME, UF) VALUES (10, 'Maranhao', 'MA');
INSERT INTO ESTADO (ID, NOME, UF) VALUES (11, 'Mato Grosso', 'MT');
INSERT INTO ESTADO (ID, NOME, UF) VALUES (12, 'Mato Grosso do Sul', 'MS');
INSERT INTO ESTADO (ID, NOME, UF) VALUES (13, 'Minas Gerais', 'MG');
INSERT INTO ESTADO (ID, NOME, UF) VALUES (14, 'Para', 'PA');
INSERT INTO ESTADO (ID, NOME, UF) VALUES (15, 'Paraiba', 'PB');
INSERT INTO ESTADO (ID, NOME, UF) VALUES (16, 'Parana', 'PR');
INSERT INTO ESTADO (ID, NOME, UF) VALUES (17, 'Pernambuco', 'PE');
INSERT INTO ESTADO (ID, NOME, UF) VALUES (18, 'Piaui', 'PI');
INSERT INTO ESTADO (ID, NOME, UF) VALUES (19, 'Rio de Janeiro', 'RJ');
INSERT INTO ESTADO (ID, NOME, UF) VALUES (20, 'Rio Grande do Norte', 'RN');
INSERT INTO ESTADO (ID, NOME, UF) VALUES (21, 'Rio Grande do Sul', 'RS');
INSERT INTO ESTADO (ID, NOME, UF) VALUES (22, 'Rondonia', 'RO');
INSERT INTO ESTADO (ID, NOME, UF) VALUES (23, 'Roraima', 'RR');
INSERT INTO ESTADO (ID, NOME, UF) VALUES (24, 'Santa Catarina', 'SC');
INSERT INTO ESTADO (ID, NOME, UF) VALUES (25, 'Sao Paulo', 'SP');
INSERT INTO ESTADO (ID, NOME, UF) VALUES (26, 'Sergipe', 'SE');
INSERT INTO ESTADO (ID, NOME, UF) VALUES (27, 'Tocantins', 'TO');

COMMIT;
```

#### Populando a tabela CIDADE com as capitais

```bash
INSERT INTO CIDADE (ID, NOME, ESTADOID) VALUES (1, 'Rio Branco', 1);
INSERT INTO CIDADE (ID, NOME, ESTADOID) VALUES (2, 'Maceio', 2);
INSERT INTO CIDADE (ID, NOME, ESTADOID) VALUES (3, 'Macapa', 3);
INSERT INTO CIDADE (ID, NOME, ESTADOID) VALUES (4, 'Manaus', 4);
INSERT INTO CIDADE (ID, NOME, ESTADOID) VALUES (5, 'Salvador', 5);
INSERT INTO CIDADE (ID, NOME, ESTADOID) VALUES (6, 'Fortaleza', 6);
INSERT INTO CIDADE (ID, NOME, ESTADOID) VALUES (7, 'Brasilia', 7);
INSERT INTO CIDADE (ID, NOME, ESTADOID) VALUES (8, 'Vitória', 8);
INSERT INTO CIDADE (ID, NOME, ESTADOID) VALUES (9, 'Goiania', 9);
INSERT INTO CIDADE (ID, NOME, ESTADOID) VALUES (10, 'Sao Luis', 10);
INSERT INTO CIDADE (ID, NOME, ESTADOID) VALUES (11, 'Cuiaba', 11);
INSERT INTO CIDADE (ID, NOME, ESTADOID) VALUES (12, 'Campo Grande', 12);
INSERT INTO CIDADE (ID, NOME, ESTADOID) VALUES (13, 'Belo Horizonte', 13);
INSERT INTO CIDADE (ID, NOME, ESTADOID) VALUES (14, 'Belem', 14);
INSERT INTO CIDADE (ID, NOME, ESTADOID) VALUES (15, 'João Pessoa', 15);
INSERT INTO CIDADE (ID, NOME, ESTADOID) VALUES (16, 'Curitiba', 16);
INSERT INTO CIDADE (ID, NOME, ESTADOID) VALUES (17, 'Recife', 17);
INSERT INTO CIDADE (ID, NOME, ESTADOID) VALUES (18, 'Teresina', 18);
INSERT INTO CIDADE (ID, NOME, ESTADOID) VALUES (19, 'Rio de Janeiro', 19);
INSERT INTO CIDADE (ID, NOME, ESTADOID) VALUES (20, 'Natal', 20);
INSERT INTO CIDADE (ID, NOME, ESTADOID) VALUES (21, 'Porto Alegre', 21);
INSERT INTO CIDADE (ID, NOME, ESTADOID) VALUES (22, 'Porto Velho', 22);
INSERT INTO CIDADE (ID, NOME, ESTADOID) VALUES (23, 'Boa Vista', 23);
INSERT INTO CIDADE (ID, NOME, ESTADOID) VALUES (24, 'Florianopolis', 24);
INSERT INTO CIDADE (ID, NOME, ESTADOID) VALUES (25, 'Sao Paulo', 25);
INSERT INTO CIDADE (ID, NOME, ESTADOID) VALUES (26, 'Aracaju', 26);
INSERT INTO CIDADE (ID, NOME, ESTADOID) VALUES (27, 'Palmas', 27);

COMMIT;
```

#### Populando a tabela CLIENTE com dados fictícios

```bash
INSERT INTO CLIENTE (
    ID, NOME, CEP, CPF_CNPJ,
    ENDERECO, NUMERO, COMPLEMENTO,
    BAIRRO, CIDADE, DATANASCIMENTO
)
VALUES (
    1,
    'Maria Silva',
    '01001000',
    '12345678901',
    'Rua das Flores',
    '100',
    'Apto 12',
    'Centro',
    25,
    '1990-05-10'
);

INSERT INTO CLIENTE (
    ID, NOME, CEP, CPF_CNPJ,
    ENDERECO, NUMERO, COMPLEMENTO,
    BAIRRO, CIDADE, DATANASCIMENTO
)
VALUES (
    2,
    'João Pereira',
    '30140071',
    '98765432100',
    'Av. Brasil',
    '250',
    '',
    'Savassi',
    13,
    '1985-08-22'
);

INSERT INTO CLIENTE (
    ID, NOME, CEP, CPF_CNPJ,
    ENDERECO, NUMERO, COMPLEMENTO,
    BAIRRO, CIDADE, DATANASCIMENTO
)
VALUES (
    3,
    'Ana Costa',
    '70040900',
    '45612378900',
    'SQN 210',
    '45',
    'Bloco B',
    'Asa Norte',
    7,
    '1992-11-15'
);

INSERT INTO CLIENTE (
    ID, NOME, CEP, CPF_CNPJ,
    ENDERECO, NUMERO, COMPLEMENTO,
    BAIRRO, CIDADE, DATANASCIMENTO
)
VALUES (
    4,
    'Carlos Souza',
    '80010000',
    '74185296300',
    'Rua XV de Novembro',
    '500',
    '',
    'Centro',
    16,
    '1978-03-30'
);

INSERT INTO CLIENTE (
    ID, NOME, CEP, CPF_CNPJ,
    ENDERECO, NUMERO, COMPLEMENTO,
    BAIRRO, CIDADE, DATANASCIMENTO
)
VALUES (
    5,
    'Fernanda Lima',
    '40010000',
    '85274196300',
    'Av. Oceânica',
    '900',
    'Casa',
    'Barra',
    5,
    '1995-07-18'
);

COMMIT;
```

#### Reposicionando generators após carga manual 

```bash
ALTER SEQUENCE GEN_ESTADO_ID RESTART WITH 28;
ALTER SEQUENCE GEN_CIDADE_ID RESTART WITH 28;
ALTER SEQUENCE GEN_CLIENTE_ID RESTART WITH 6;

COMMIT;
```

## Tecnologias
- Delphi 12 Community Edition
- Firebird 3.0
- FireDAC
- MVC
- ReportBuilder
- TMS VCL
- DUnitX
- ViaCEP API
- Git
- GitHub
