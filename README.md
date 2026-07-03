# 🗄️ Estudos em SQL

Este repositório contém consultas, exercícios e projetos práticos em SQL, organizados para consolidar o aprendizado em bancos de dados relacionais e análise de dados.

---

## 📚 Conteúdo

*   📁 **`select_basico.sql`** → `SELECT`, `WHERE`, `ORDER BY`
*   📁 **`funcoes_agregacao.sql`** → `COUNT`, `SUM`, `AVG`, `GROUP BY`
*   📁 **`joins.sql`** → `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`
*   📁 **`consultas_avancadas.sql`** → Subqueries, CTEs, Window Functions

---

## 🚀 Tecnologias

*   **SGBDs:** MySQL / MariaDB / SQLite / PostgreSQL
*   **Ferramentas de Gerenciamento:** DBeaver / DB Browser SQLite

💡 *Objetivo: praticar e estruturar consultas SQL focadas em Análise de Dados.*

---

## 📐 Modelagem e Diagramas de Banco de Dados

Abaixo estão as representações visuais da estrutura e das regras de negócio das tabelas utilizadas nestes estudos, divididas por seus níveis de abstração:

#### 1. Modelo Conceitual (Estrutura de Atributos)
Representação inicial e visual das entidades do sistema e seus respectivos campos mapeados.
<p align="center">
  <img src="modelo_conceitual.png" alt="Modelo Conceitual do Banco de Dados" width="85%">
</p>

#### 2. Modelo Lógico (Relacionamentos)
Mapeamento lógico evidenciando as conexões e a cardinalidade entre as tabelas de Clientes, Fornecedores, Produtos, Vendedores e Vendas.
<p align="center">
  <img src="modelo_logico.png" alt="Modelo Lógico de Relacionamentos" width="85%">
</p>

#### 3. Modelo Físico (Tipagem e Chaves)
Visão técnica final contendo a especificação das chaves primárias (`PRIMARY KEY`), chaves estrangeiras (`FOREIGN KEY`) e os tipos de dados (`Numeric`, `Text`, `VARCHAR`, `Datetime`) configurados para cada coluna no banco de dados.
<p align="center">
  <img src="modelo_fisico.png" alt="Modelo Físico e Tipagem das Tabelas" width="85%">
</p>

---

## 🧠 Guia de Referência SQL (Anotações de Estudo)

### 1. Comandos Fundamentais

#### 🏗️ Estruturação (DDL - Data Definition Language)
Comandos que definem e modificam a estrutura dos objetos no banco de dados.
*   **`CREATE DATABASE`**: Cria um novo banco de dados.
*   **`CREATE TABLE`**: Cria uma nova tabela especificando colunas e tipos de dados.
*   **`ALTER TABLE`**: Modifica a estrutura de uma tabela existente (como adicionar colunas ou restrições).
*   **`DROP TABLE`**: Exclui permanentemente uma tabela e todos os seus dados.
*   **`DROP COLUMN`**: Remove uma coluna específica de uma tabela existente (usado junto com `ALTER TABLE`).

#### 🔍 Consulta (DQL - Data Query Language)
*   **`SELECT`**: O comando base do SQL, serve para buscar e projetar dados de uma ou mais tabelas.

#### ✍️ Manipulação de Dados (DML - Data Manipulation Language)
Comandos que gerenciam os dados armazenados dentro das tabelas.
*   **`INSERT`**: Insere novos registros (linhas) em uma tabela.
*   **`UPDATE`**: Modifica dados que já existem na tabela. *Atenção: Sempre use com `WHERE` para não alterar a tabela inteira!*
*   **`DELETE`**: Remove registros de uma tabela. *Atenção: Sempre use com `WHERE` para não apagar dados indesejados!*

---

### 2. Constraints (Restrições de Integridade)

As restrições garantem a qualidade, consistência e a confiabilidade dos dados no banco:

*   **`NOT NULL`**: Garante que uma coluna não pode aceitar valores nulos (`NULL`). O preenchimento torna-se obrigatório.
*   **`PRIMARY KEY` (Chave Primária)**: Identificador único de cada registro na tabela. Não aceita valores repetidos e nem nulos.
*   **`DEFAULT`**: Define um valor padrão para a coluna caso nenhum dado seja informado no momento do `INSERT`.
*   **`CHECK`**: Valida uma condição antes de permitir a inserção do dado (ex: verificar se um valor é maior que zero).
*   **`UNIQUE`**: Garante que todos os valores de uma coluna sejam distintos (diferentes), impedindo dados duplicados.
*   **`AUTO_INCREMENT`**: Gera sequências numéricas automáticas (muito usada em chaves primárias para IDs).

---

### 3. Cláusula Where (Filtros) e Operadores

A cláusula **`WHERE`** é utilizada para realizar filtros em comandos SQL. Ela permite que acessemos registros ou conjuntos de registros específicos. *Deve ser utilizada com muito cuidado para não alterar/apagar registros importantes por engano.*

#### ⚖️ Operadores Comparativos
*   `=`: Igual a
*   `>`: Maior que
*   `<`: Menor que
*   `>=`: Maior ou igual a
*   `<=`: Menor ou igual a
*   `<>` ou `!=`: Diferente de

#### 🧠 Operadores Lógicos
*   **`AND`**: Retorna verdadeiro se **todas** as expressões booleanas separadas por ele forem verdadeiras.
*   **`OR`**: Retorna verdadeiro se **pelo menos uma** das expressões for verdadeira.
*   **`NOT`**: Inverte o valor de qualquer outro operador booleano.
*   **`IN`**: Verifica se o valor corresponde a qualquer elemento dentro de uma lista de expressões.
*   **`LIKE`**: Busca por um padrão de texto utilizando caracteres curinga (como `%`).
*   **`BETWEEN`**: Filtra dados que estão dentro de um intervalo inclusivo (ex: `BETWEEN 10 AND 50`).
*   **`SOME` / `ANY`**: Retorna verdadeiro se algum elemento do conjunto de comparações atender à condição.

---

### 4. Agrupamento e Ordenação

*   **`ORDER BY ASC/DESC`**: Ordena o resultado da consulta por ordem ascendente (crescente) ou descendente (decrescente).
*   **`GROUP BY`**: Permite agrupar dados e visualizar os resultados de forma tabelada para resumir e analisar valores.

#### 📊 Funções Agregadas
*   **`SUM`**: Calcula a soma total dos valores de uma coluna.
*   **`AVG`**: Calcula a média aritmética dos valores de uma coluna.
*   **`COUNT`**: Conta a quantidade de registros ou linhas encontradas.
*   **`MIN`**: Retorna o menor (mínimo) valor encontrado.
*   **`MAX`**: Retorna o maior (máximo) valor encontrado.

---

### 5. JOINS (Relacionamentos entre Tabelas)

Os Joins realizam o relacionamento entre tabelas, permitindo criar relatórios relacionais utilizando informações de mais de uma tabela em uma única consulta.

| Tipo de JOIN | Descrição Visual / Comportamento |
| :--- | :--- |
| **`INNER JOIN`** | **Intersecção:** Retorna apenas as linhas que possuem valores correspondentes em ambas as tabelas. |
| **`LEFT JOIN`** | Retorna **todos** os registros da tabela da esquerda (Outer), e os dados correspondentes da tabela da direita (retorna `NULL` se não houver par). |
| **`RIGHT JOIN`** | Retorna **todos** os registros da tabela da direita (Outer), e os dados correspondentes da tabela da esquerda (retorna `NULL` se não houver par). |

🎯 **Objetivo:** Criar uma base sólida de consultas SQL estruturadas voltadas para a Engenharia e Análise de Dados.
