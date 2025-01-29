-- Cria o banco de dados bd_oficina
CREATE DATABASE IF NOT EXISTS db_oficina;

-- Usa o banco de dados bd_oficina
USE db_oficina;

-- Tabela Cliente
CREATE TABLE Cliente (
    Cliente_ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    CPF VARCHAR(14) UNIQUE NOT NULL,
    Telefone VARCHAR(15),
    Endereco VARCHAR(200)
);

-- Tabela Veiculo
CREATE TABLE Veiculo (
    Veiculo_ID INT AUTO_INCREMENT PRIMARY KEY,
    Placa VARCHAR(8) UNIQUE NOT NULL,
    Modelo VARCHAR(50) NOT NULL,
    Marca VARCHAR(50) NOT NULL,
    Ano INT,
    Cliente_ID INT NOT NULL,
    FOREIGN KEY (Cliente_ID) REFERENCES Cliente(Cliente_ID)
);

-- Tabela Mecanico
CREATE TABLE Mecanico (
    Mecanico_ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Telefone VARCHAR(15),
    Especialidade VARCHAR(50)
);

-- Tabela Equipe
CREATE TABLE Equipe (
    Equipe_ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Descricao VARCHAR(200)
);

-- Tabela Mecanicos_Equipe (Para o relacionamento N:N)
CREATE TABLE Mecanicos_Equipe (
    Mecanico_ID INT NOT NULL,
    Equipe_ID INT NOT NULL,
    PRIMARY KEY (Mecanico_ID, Equipe_ID),
    FOREIGN KEY (Mecanico_ID) REFERENCES Mecanico(Mecanico_ID),
    FOREIGN KEY (Equipe_ID) REFERENCES Equipe(Equipe_ID)
);

-- Tabela TipoServico (Conserto e revisão são tipos de serviço)
CREATE TABLE TipoServico (
    TipoServico_ID INT AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(50) NOT NULL
);

-- Tabela Servico
CREATE TABLE Servico (
    Servico_ID INT AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(100) NOT NULL,
    Valor_Mao_de_obra DECIMAL(10,2) NOT NULL,
    TipoServico_ID INT NOT NULL,
    FOREIGN KEY (TipoServico_ID) REFERENCES TipoServico(TipoServico_ID)
);

-- Tabela Peca
CREATE TABLE Peca (
    Peca_ID INT AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(100) NOT NULL,
    Valor DECIMAL(10,2) NOT NULL
);

-- Tabela Fornecedor
CREATE TABLE Fornecedor (
    Fornecedor_ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    CNPJ VARCHAR(20) UNIQUE,
    Telefone VARCHAR(15),
    Endereco VARCHAR(200)
);

-- Tabela Pecas_Fornecedor (Relacionamento N:N entre Peça e Fornecedor)
CREATE TABLE Pecas_Fornecedor (
    Peca_ID INT NOT NULL,
    Fornecedor_ID INT NOT NULL,
    PRIMARY KEY (Peca_ID, Fornecedor_ID),
    FOREIGN KEY (Peca_ID) REFERENCES Peca(Peca_ID),
    FOREIGN KEY (Fornecedor_ID) REFERENCES Fornecedor(Fornecedor_ID)
);

-- Tabela Ordem de Serviço (OS)
CREATE TABLE OrdemServico (
    OS_ID INT AUTO_INCREMENT PRIMARY KEY,
    Data_Emissao DATE NOT NULL,
    Data_Conclusao DATE,
    Status VARCHAR(20) NOT NULL,
    Valor_Total DECIMAL(10,2) NOT NULL,
    Veiculo_ID INT NOT NULL,
    Equipe_ID INT NOT NULL,
    FOREIGN KEY (Veiculo_ID) REFERENCES Veiculo(Veiculo_ID),
    FOREIGN KEY (Equipe_ID) REFERENCES Equipe(Equipe_ID)
);

-- Tabela Servicos_OS (N:N entre OS e Serviço)
CREATE TABLE Servicos_OS (
    OS_ID INT NOT NULL,
    Servico_ID INT NOT NULL,
    Quantidade INT NOT NULL,
    PRIMARY KEY (OS_ID, Servico_ID),
    FOREIGN KEY (OS_ID) REFERENCES OrdemServico(OS_ID),
    FOREIGN KEY (Servico_ID) REFERENCES Servico(Servico_ID)
);

-- Tabela Pecas_OS  (N:N entre OS e Peça)
CREATE TABLE Pecas_OS (
    OS_ID INT NOT NULL,
    Peca_ID INT NOT NULL,
    Quantidade INT NOT NULL,
    PRIMARY KEY (OS_ID, Peca_ID),
    FOREIGN KEY (OS_ID) REFERENCES OrdemServico(OS_ID),
    FOREIGN KEY (Peca_ID) REFERENCES Peca(Peca_ID)
);