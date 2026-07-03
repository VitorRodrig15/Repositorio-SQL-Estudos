-- ====================================================================
-- 📁 funcoes_agregacao.sql
-- Objetivo: Praticar a sumarização de dados através de funções
--           agregadas e agrupamentos utilizando cláusulas complexas.
-- ====================================================================

-- --------------------------------------------------------------------
-- 1. FUNÇÕES AGREGADAS BÁSICAS (SUM, AVG, COUNT, MIN, MAX)
-- --------------------------------------------------------------------

-- [ COUNT ] Conta o número total de clientes cadastrados
SELECT COUNT(*) AS total_clientes
FROM clientes;
-- Utiliza a função de agregação COUNT(*) para contar todas as linhas da tabela clientes.

-- [ AVG ] Calcula a média salarial dos vendedores cadastrados
SELECT AVG(salario) AS media_salarial
FROM vendedores;
-- AVG(salario) retorna a média aritmética dos salários da tabela de vendedores.

-- [ SUM ] Soma o valor total de todos os produtos em estoque/cadastro
SELECT SUM(valor) AS valor_total_produtos
FROM produtos;
-- SUM(valor) calcula o valor total somado de todos os registros da coluna valor.

-- [ MIN e MAX ] Retorna o produto mais barato e o mais caro cadastrado
SELECT MIN(valor) AS menor_preco, MAX(valor) AS maior_preco
FROM produtos;
-- MIN() retorna o menor valor da coluna e MAX() retorna o maior valor.


-- --------------------------------------------------------------------
-- 2. AGRUPAMENTOS E SUMARIZAÇÃO (GROUP BY e ORDER BY)
-- --------------------------------------------------------------------

-- Agrupa clientes por cidade e conta quantos há em cada uma
SELECT cidade, COUNT(*) AS qtd_clientes
FROM clientes
GROUP BY cidade
ORDER BY qtd_clientes DESC;
-- Agrupa os clientes por cidade e conta quantos há em cada grupo, ordenando do maior para o menor.

-- Agrupa os produtos por sexo (público-alvo) e calcula a média de preço de cada categoria
SELECT sexo, AVG(valor) AS preco_medio
FROM produtos
GROUP BY sexo
ORDER BY preco_medio DESC;
-- Agrupa pelas categorias 'M'/'F' e traz a média de preço correspondente de cada uma.

-- Agrupa os produtos por tamanho e soma o valor total cadastrado por tamanho (ex: P, M, G)
SELECT tamanho, SUM(valor) AS total_por_tamanho
FROM produtos
GROUP BY tamanho
ORDER BY total_por_tamanho DESC;
-- Agrupa os registros com base no tamanho do produto e soma os valores de cada bloco.
