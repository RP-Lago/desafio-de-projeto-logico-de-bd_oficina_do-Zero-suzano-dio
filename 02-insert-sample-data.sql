-- Inserindo dados na tabela Cliente
INSERT INTO Cliente (Nome, CPF, Telefone, Endereco) VALUES
('João Silva', '123.456.789-00', '(11) 9999-8888', 'Rua A, 123'),
('Maria Souza', '987.654.321-00', '(21) 8888-7777', 'Avenida B, 456'),
('Pedro Oliveira', '456.789.123-00', '(31) 7777-6666', 'Travessa C, 789'),
('Ana Pereira', '654.321.987-00', '(41) 6666-5555', 'Rua D, 101'),
('Carlos Santos', '789.123.456-00', '(51) 5555-4444', 'Avenida E, 202');

-- Inserindo dados na tabela Veiculo
INSERT INTO Veiculo (Placa, Modelo, Marca, Ano, Cliente_ID) VALUES
('ABC-1234', 'Fusca', 'VW', 1978, 1),
('DEF-5678', 'Celta', 'GM', 2010, 2),
('GHI-9012', 'Corolla', 'Toyota', 2022, 3),
('JKL-3456', 'Onix', 'GM', 2021, 4),
('MNO-7890', 'Gol', 'VW', 2015, 5);

-- Inserindo dados na tabela Mecanico
INSERT INTO Mecanico (Nome, Telefone, Especialidade) VALUES
('Ricardo Almeida', '(11) 9123-4567', 'Motor'),
('Fernanda Costa', '(21) 8765-4321', 'Freios'),
('Lucas Pereira', '(31) 7654-3210', 'Suspensão'),
('Patrícia Oliveira', '(41) 6543-2109', 'Elétrica'),
('Gustavo Santos', '(51) 5432-1098', 'Transmissão');

-- Inserindo dados na tabela Equipe
INSERT INTO Equipe (Nome, Descricao) VALUES
('Alfa', 'Equipe de motores e freios'),
('Beta', 'Equipe de suspensão e elétrica'),
('Gama', 'Equipe de transmissão e geral');


-- Inserindo dados na tabela Mecanicos_Equipe
INSERT INTO Mecanicos_Equipe (Mecanico_ID, Equipe_ID) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3);

-- Inserindo dados na tabela TipoServico
INSERT INTO TipoServico (Descricao) VALUES
('Conserto'),
('Revisão'),
('Manutenção'),
('Troca de Óleo'),
('Alinhamento');


-- Inserindo dados na tabela Servico
INSERT INTO Servico (Descricao, Valor_Mao_de_obra, TipoServico_ID) VALUES
('Troca de óleo e filtro', 150.00, 4),
('Revisão de freios', 200.00, 2),
('Alinhamento e balanceamento', 120.00, 5),
('Conserto do motor', 500.00, 1),
('Troca de embreagem', 350.00, 3);

-- Inserindo dados na tabela Peca
INSERT INTO Peca (Descricao, Valor) VALUES
('Filtro de óleo', 30.00),
('Pastilha de freio', 60.00),
('Pneu', 250.00),
('Vela de ignição', 20.00),
('Embreagem', 300.00);

-- Inserindo dados na tabela Fornecedor
INSERT INTO Fornecedor (Nome, CNPJ, Telefone, Endereco) VALUES
('Auto Peças Silva', '12.345.678/0001-90', '(11) 9876-5432', 'Rua X, 100'),
('Pneus e Cia', '98.765.432/0001-12', '(21) 8765-4321', 'Avenida Y, 200'),
('Motor Mania', '45.678.912/0001-34', '(31) 7654-3210', 'Travessa Z, 300');


-- Inserindo dados na tabela Pecas_Fornecedor
INSERT INTO Pecas_Fornecedor (Peca_ID, Fornecedor_ID) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 3);


-- Inserindo dados na tabela OrdemServico
INSERT INTO OrdemServico (Data_Emissao, Data_Conclusao, Status, Valor_Total, Veiculo_ID, Equipe_ID) VALUES
('2023-10-26', '2023-10-28', 'Concluído', 700.00, 1, 1),
('2023-10-26', '2023-10-27', 'Concluído', 320.00, 2, 2),
('2023-10-27', NULL, 'Em Andamento', 150.00, 3, 3),
('2023-10-28', NULL, 'Em Andamento', 650.00, 4, 1),
('2023-10-28', '2023-10-29', 'Concluído', 470.00, 5, 2);


-- Inserindo dados na tabela Servicos_OS
INSERT INTO Servicos_OS (OS_ID, Servico_ID, Quantidade) VALUES
(1, 1, 1),
(1, 4, 1),
(2, 2, 1),
(2, 3, 1),
(3, 1, 1),
(4, 4, 1),
(5, 2, 1),
(5, 5, 1);

-- Inserindo dados na tabela Pecas_OS
INSERT INTO Pecas_OS (OS_ID, Peca_ID, Quantidade) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 1, 1),
(2, 3, 1),
(3, 1, 1),
(4, 4, 2),
(5, 2, 2),
(5, 5, 1);