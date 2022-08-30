CREATE DATABASE hairstudio;

\c hairstudio

CREATE TABLE cliente (
    cpfcli VARCHAR(11) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    telefone VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    CONSTRAINT pk_cpfcli PRIMARY KEY (cpfcli),
    CONSTRAINT uk_email UNIQUE (email)
);

CREATE TABLE profissional (
    pfid SERIAL NOT NULL,
    nome VARCHAR(50) NOT NULL,
    taxa NUMERIC(3,2) NOT NULL,
    salario MONEY NOT NULL,
    CONSTRAINT pk_pfid PRIMARY KEY (pfid)
);

CREATE TABLE servico (
    svid SERIAL NOT NULL,
    nome VARCHAR(50) NOT NULL,
    preco MONEY NOT NULL,
    CONSTRAINT pk_svid PRIMARY KEY (svid)
);

CREATE TABLE horario (
    cpfcli VARCHAR(11) NOT NULL,
    pfid INTEGER NOT NULL,
    svid INTEGER NOT NULL,
    data_hora TIMESTAMP NOT NULL,
    detalhes VARCHAR(255),
    CONSTRAINT pk_horario PRIMARY KEY (cpfcli,pfid,svid,data_hora),
    CONSTRAINT fk_cpfcli FOREIGN KEY (cpfcli) REFERENCES cliente(cpfcli),
    CONSTRAINT fk_pfid FOREIGN KEY (pfid) REFERENCES profissional(pfid),
    CONSTRAINT fk_svid FOREIGN KEY (svid) REFERENCES servico(svid)
);

CREATE TABLE produto (
    pdid SERIAL NOT NULL,
    nome VARCHAR(50) NOT NULL,
    peso NUMERIC(7,1) NOT NULL,
    preco MONEY NOT NULL,
    custo MONEY NOT NULL,
    estoque INTEGER NOT NULL,
    prct_imposto NUMERIC(3,2) NOT NULL,
    cod_ncm INTEGER NOT NULL,
    CONSTRAINT pf_pdid PRIMARY KEY (pdid)
);

CREATE TABLE nf_venda (
    nfvid SERIAL NOT NULL,
    data_hora TIMESTAMP NOT NULL,
    CONSTRAINT pk_nfvid PRIMARY KEY (nfvid)
);

CREATE TABLE prod_venda (
    nfvid INTEGER NOT NULL,
    pdid INTEGER NOT NULL,
    qtd INTEGER NOT NULL,
    CONSTRAINT pk_nfvid_pdid PRIMARY KEY (nfvid,pdid),
    CONSTRAINT fk_nfvid FOREIGN KEY (nfvid) REFERENCES nf_venda(nfvid),
    CONSTRAINT fk_pdid FOREIGN KEY (pdid) REFERENCES produto(pdid)
);

CREATE TABLE despesa_prod (
    dpid SERIAL NOT NULL,
    pdid INTEGER NOT NULL,
    data_hora TIMESTAMP NOT NULL,
    CONSTRAINT pk_dpid PRIMARY KEY (dpid),
    CONSTRAINT fk_pdid FOREIGN KEY (pdid) REFERENCES produto(pdid)
);

CREATE TABLE despesa_geral (
    dgid SERIAL NOT NULL,
    descr VARCHAR(150) NOT NULL,
    valor MONEY NOT NULL,
    tipo SMALLINT NOT NULL,
    data_hora TIMESTAMP NOT NULL,
    CONSTRAINT pk_dgid PRIMARY KEY (dgid)
);