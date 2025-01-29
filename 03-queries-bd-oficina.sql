-- Usa o banco de dados bd_oficina
USE db_oficina;

-- Recuperações simples com SELECT Statement;
-- Listar todos os clientes
SELECT * FROM Cliente;

-- Listar todos os veículos
SELECT * FROM Veiculo;

-- Listar todos os mecânicos
SELECT * FROM Mecanico;

-- Listar todos os serviços
SELECT * FROM Servico;

-- Filtros com WHERE Statement;
-- Listar clientes com nome que contenha "Silva"
SELECT * FROM Cliente WHERE Nome LIKE '%Silva%';

-- Listar veículos do ano 2022
SELECT * FROM Veiculo WHERE Ano = 2022;

-- Listar serviços com valor de mão de obra maior que 200
SELECT * FROM Servico WHERE Valor_Mao_de_obra > 200;

-- Crie expressões para gerar atributos derivados;
-- Calcular valor total de cada ordem de serviço (sem considerar peças, somente serviços)
SELECT 
    os.OS_ID,
    os.Data_Emissao,
    os.Valor_Total,
    SUM(s.Valor_Mao_de_obra * sos.Quantidade) AS Valor_Total_Servicos
FROM OrdemServico os
INNER JOIN Servicos_OS sos ON os.OS_ID = sos.OS_ID
INNER JOIN Servico s ON sos.Servico_ID = s.Servico_ID
GROUP BY os.OS_ID;


-- Calcular a quantidade de peças por OS
SELECT
    os.OS_ID,
    os.Data_Emissao,
    SUM(pos.Quantidade) AS Quantidade_Total_Pecas
FROM OrdemServico os
INNER JOIN Pecas_OS pos ON os.OS_ID = pos.OS_ID
GROUP BY os.OS_ID;


-- Definir ordenações dos dados com ORDER BY;
-- Listar clientes em ordem alfabética
SELECT * FROM Cliente ORDER BY Nome;

-- Listar veículos por ano, do mais novo para o mais antigo
SELECT * FROM Veiculo ORDER BY Ano DESC;

-- Listar serviços em ordem decrescente de valor de mão de obra
SELECT * FROM Servico ORDER BY Valor_Mao_de_obra DESC;


-- Condições de filtros aos grupos – HAVING Statement;
-- Listar equipes com mais de um mecânico
SELECT 
    e.Equipe_ID, 
    e.Nome,
    COUNT(me.Mecanico_ID) AS Quantidade_Mecanicos
FROM Equipe e
JOIN Mecanicos_Equipe me ON e.Equipe_ID = me.Equipe_ID
GROUP BY e.Equipe_ID
HAVING COUNT(me.Mecanico_ID) > 1;


-- Listar tipos de serviços com valor médio da mao de obra maior que 200
SELECT 
    ts.TipoServico_ID,
    ts.Descricao,
    AVG(s.Valor_Mao_de_obra) AS Media_Valor_Mao_de_Obra
FROM TipoServico ts
JOIN Servico s ON ts.TipoServico_ID = s.TipoServico_ID
GROUP BY ts.TipoServico_ID
HAVING AVG(s.Valor_Mao_de_obra) > 200;

-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados;
-- Listar todos os serviços com os seus respectivos tipos
SELECT s.Descricao AS Servico, ts.Descricao AS Tipo
FROM Servico s
INNER JOIN TipoServico ts ON s.TipoServico_ID = ts.TipoServico_ID;


-- Listar clientes com seus respectivos veículos
SELECT c.Nome AS Cliente, v.Modelo AS Veiculo, v.Placa
FROM Cliente c
INNER JOIN Veiculo v ON c.Cliente_ID = v.Cliente_ID;


-- Listar todas as ordens de serviço com seus veículos, equipes e serviços
SELECT 
    os.OS_ID,
    os.Data_Emissao,
    os.Valor_Total,
    v.Modelo AS Veiculo,
    eq.Nome AS Equipe,
    s.Descricao AS Servico
FROM OrdemServico os
INNER JOIN Veiculo v ON os.Veiculo_ID = v.Veiculo_ID
INNER JOIN Equipe eq ON os.Equipe_ID = eq.Equipe_ID
INNER JOIN Servicos_OS sos ON os.OS_ID = sos.OS_ID
INNER JOIN Servico s ON sos.Servico_ID = s.Servico_ID;