-- ====================================================================
-- 📁 joins.sql
-- Objetivo: Praticar o relacionamento entre múltiplas tabelas através
--           de chaves primárias e estrangeiras (INNER, LEFT e RIGHT JOIN).
-- ====================================================================

-- --------------------------------------------------------------------
-- 1. INNER JOIN (Intersecção - Registros Correspondentes)
-- --------------------------------------------------------------------

-- Lista o nome do cliente e a data da venda realizada
SELECT c.nome AS nome_cliente, v.data_venda
FROM clientes c
INNER JOIN vendas v ON c.id_cliente = v.Cliente;
-- INNER JOIN une as tabelas 'clientes' e 'vendas' trazendo apenas os clientes que possuem vendas registradas.

-- Relatório completo de Vendas: Traz o nome do cliente, o produto vendido e o vendedor
SELECT v.id_venda, c.nome AS cliente, p.produto, vd.nome AS vendedor, v.data_venda
FROM vendas v
INNER JOIN clientes c   ON v.Cliente = c.id_cliente
INNER JOIN produtos p   ON v.Produto = p.id_produto
INNER JOIN vendedores vd ON v.Vendedor = vd.id_vendedor;
-- É possível encadear múltiplos INNER JOINs para cruzar todas as tabelas relacionadas do banco.


-- --------------------------------------------------------------------
-- 2. LEFT JOIN (Preserva a Tabela da Esquerda)
-- --------------------------------------------------------------------

-- Lista TODOS os clientes e suas vendas (se houver)
SELECT c.nome AS nome_cliente, v.id_venda, v.data_venda
FROM clientes c
LEFT JOIN vendas v ON c.id_cliente = v.Cliente;
-- LEFT JOIN garante que TODOS os clientes apareçam na lista, mesmo aqueles que nunca compraram nada (retornando NULL no id_venda).


-- --------------------------------------------------------------------
-- 3. RIGHT JOIN (Preserva a Tabela da Direita)
-- --------------------------------------------------------------------

-- Lista todas as vendas e seus respectivos vendedores (garantindo que o vendedor apareça)
SELECT vd.nome AS nome_vendedor, v.id_venda, v.data_venda
FROM vendas v
RIGHT JOIN vendedores vd ON v.Vendedor = vd.id_vendedor;
-- RIGHT JOIN garante que TODOS os vendedores sejam listados, mesmo os recém-contratados que ainda não fizeram nenhuma venda.


-- --------------------------------------------------------------------
-- 4. RIGHT JOIN COM FILTRO (Identificação de Registros Órfãos/Inconsistências)
-- --------------------------------------------------------------------

-- Identifica produtos que estão cadastrados mas que NUNCA foram vendidos
SELECT p.id_produto, p.produto
FROM vendas v
RIGHT JOIN produtos p ON v.Produto = p.id_produto
WHERE v.id_venda IS NULL;
-- RIGHT JOIN combinado com WHERE ... IS NULL isola os produtos da tabela da direita que não possuem nenhum vínculo na tabela de vendas.
