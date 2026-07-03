-- ====================================================================
-- 📁 select_basico.sql
-- Objetivo: Praticar consultas estruturadas básicas (DQL) com filtros, 
--           ordenamentos e limites de registros.
-- ====================================================================

-- --------------------------------------------------------------------
-- 1. ESTRUTURA BÁSICA E PROJEÇÕES (SELECT, ORDER BY, LIMIT)
-- --------------------------------------------------------------------

-- Seleciona os 10 primeiros clientes em ordem alfabética ascendente
SELECT nome, email, cidade
FROM clientes
ORDER BY nome ASC
LIMIT 10;

-- Seleciona todos os produtos ordenando do mais caro para o mais barato
SELECT produto, cor, valor
FROM produtos
ORDER BY valor DESC;


-- --------------------------------------------------------------------
-- 2. OPERADORES COMPARATIVOS NA CLÁUSULA WHERE
-- --------------------------------------------------------------------

-- [ = ] Busca um cliente específico pelo e-mail
SELECT nome, telefone 
FROM clientes 
WHERE email = 'contato@email.com';

-- [ > ] Busca produtos com valor maior que 100
SELECT produto, valor 
FROM produtos 
WHERE valor > 100.00;

-- [ <= ] Busca vendedores com salário menor ou igual a 3000
SELECT nome, salario 
FROM vendedores 
WHERE salario <= 3000.00;

-- [ <> ou != ] Busca clientes que NÃO moram na cidade de 'São Paulo'
SELECT nome, cidade 
FROM clientes 
WHERE cidade <> 'São Paulo';


-- --------------------------------------------------------------------
-- 3. OPERADORES LÓGICOS NA CLÁUSULA WHERE
-- --------------------------------------------------------------------

-- [ AND ] Filtra produtos que são da cor 'Preto' E têm valor acima de 50
SELECT produto, cor, valor 
FROM produtos 
WHERE cor = 'Preto' AND valor > 50.00;

-- [ OR ] Filtra clientes que moram no 'Rio de Janeiro' OU em 'Belo Horizonte'
SELECT nome, cidade 
FROM clientes 
WHERE cidade = 'Rio de Janeiro' OR cidade = 'Belo Horizonte';

-- [ NOT ] Filtra produtos que NÃO sejam do sexo masculino 'M'
SELECT produto, sexo 
FROM produtos 
WHERE NOT sexo = 'M';

-- [ IN ] Filtra registros que correspondam a uma lista de opções específica
SELECT nome, cidade 
FROM clientes 
WHERE cidade IN ('Curitiba', 'Salvador', 'Fortaleza');

-- [ BETWEEN ] Filtra dados dentro de um intervalo inclusivo (ex: valores entre 20 e 80)
SELECT produto, valor 
FROM produtos 
WHERE valor BETWEEN 20.00 AND 80.00;

-- [ LIKE ] Busca por padrões de texto usando o caractere curinga % (ex: nomes que começam com 'Ana')
SELECT nome, email 
FROM clientes 
WHERE nome LIKE 'Ana%';

-- [ LIKE ] Busca por e-mails que contenham '@gmail' em qualquer parte do texto
SELECT nome, email 
FROM clientes 
WHERE email LIKE '%@gmail%';
