-- ====================================================================
-- 📁 consultas_avancadas.sql
-- Objetivo: Dominar lógicas complexas de manipulação e análise de dados
--           utilizando Subqueries, CTEs e Window Functions (Funções de Janela).
-- ====================================================================

-- --------------------------------------------------------------------
-- 1. SUBQUERY (Subconsultas)
-- --------------------------------------------------------------------

-- Subquery: Clientes que realizaram mais de 3 vendas/compras no total
SELECT nome, email
FROM clientes
WHERE id_cliente IN (
    SELECT Cliente
    FROM vendas
    GROUP BY Cliente
    HAVING COUNT(*) > 3
);
-- A subquery interna identifica e isola os IDs dos clientes com mais de 3 registros na tabela de vendas, e a consulta externa retorna seus respectivos nomes e e-mails.


-- --------------------------------------------------------------------
-- 2. CTE (Common Table Expressions - WITH)
-- --------------------------------------------------------------------

-- CTE: Calcula o faturamento total gerado por cada cliente
WITH total_por_cliente AS (
    SELECT v.Cliente AS id_do_cliente, SUM(p.valor) AS faturamento_total
    FROM vendas v
    INNER JOIN produtos p ON v.Produto = p.id_produto
    GROUP BY v.Cliente
)
SELECT c.nome, c.cidade, t.faturamento_total
FROM clientes c
INNER JOIN total_por_cliente t ON c.id_cliente = t.id_do_cliente
ORDER BY t.faturamento_total DESC;
-- A CTE (WITH) cria uma tabela temporária na memória chamada 'total_por_cliente' para calcular a soma dos valores dos produtos vendidos por cliente. A consulta principal consome essa CTE e junta com a tabela de clientes para trazer os nomes organizados por maior faturamento.


-- --------------------------------------------------------------------
-- 3. WINDOW FUNCTIONS (Funções de Janela - RANK / DENSE_RANK)
-- --------------------------------------------------------------------

-- Função de janela: Ranking de produtos mais caros vendidos, mantendo o histórico de vendas
SELECT 
    v.id_venda, 
    p.produto, 
    p.valor,
    RANK() OVER (ORDER BY p.valor DESC) AS ranking_posicao,
    DENSE_RANK() OVER (ORDER BY p.valor DESC) AS ranking_sem_pulos
FROM vendas v
INNER JOIN produtos p ON v.Produto = p.id_produto;
-- O RANK() atribui uma posição de classificação para cada linha com base no valor do produto vendido. 
-- Diferença importante: O RANK() pula posições se houver empate (ex: 1, 2, 2, 4), enquanto o DENSE_RANK() mantém a sequência sem pular números (ex: 1, 2, 2, 3).
