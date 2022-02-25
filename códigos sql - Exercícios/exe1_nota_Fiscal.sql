/*
 1. Crie, no seu banco de dados, a tabela abaixo, insira os valores apresentados e em
   seguida escreva as consultas solicitadas abaixo.
   OBS: Os valores em branco devem ser nulos no banco de dados

![foto](https://user-images.githubusercontent.com/83090183/155594183-734bbf63-6956-45c3-8b34-22e7034b11ba.png)

a) Pesquise os itens que foram vendidos sem desconto. As colunas presentes no resultado da consulta são: ID_NF, ID_ITEM, COD_PROD E VALOR_UNIT.

b) Pesquise os itens que foram vendidos com desconto. As colunas presentes no resultado da consulta são: ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT E O VALOR
   VENDIDO. OBS: O valor vendido é igual ao VALOR_UNIT -
   (VALOR_UNIT*(DESCONTO/100)).

c) Altere o valor do desconto (para zero) de todos os registros onde este campo é nulo.

d) Pesquise os itens que foram vendidos. As colunas presentes no resultado da consulta são: ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, VALOR_TOTAL, DESCONTO,
   VALOR_VENDIDO. OBS: O VALOR_TOTAL é obtido pela fórmula: QUANTIDADE*VALOR_UNIT. O VALOR_VENDIDO é igual a VALOR_UNIT -
   (VALOR_UNIT*(DESCONTO/100)).

e) Pesquise o valor total das NF e ordene o resultado do maior valor para o menor. As colunas presentes no resultado da consulta são: ID_NF, VALOR_TOTAL. OBS: O
   VALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE * VALOR_UNIT. Agrupe o resultado da consulta por ID_NF. 
   
f) Pesquise o valor vendido das NF e ordene o resultado do maior valor para o menor. As
colunas presentes no resultado da consulta são: ID_NF, VALOR_VENDIDO. OBS: O
VALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE * VALOR_UNIT. O
VALOR_VENDIDO é igual a ∑ VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)). Agrupe
o resultado da consulta por ID_NF.

g) Consulte o produto que mais vendeu no geral. As colunas presentes no resultado da
consulta são: COD_PROD, QUANTIDADE. Agrupe o resultado da consulta por
COD_PROD.

h) Consulte as NF que foram vendidas mais de 10 unidades de pelo menos um produto.
As colunas presentes no resultado da consulta são: ID_NF, COD_PROD, QUANTIDADE.
Agrupe o resultado da consulta por ID_NF, COD_PROD.

i) Pesquise o valor total das NF, onde esse valor seja maior que 500, e ordene o
resultado do maior valor para o menor. As colunas presentes no resultado da consulta
são: ID_NF, VALOR_TOT. OBS: O VALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE
* VALOR_UNIT. Agrupe o resultado da consulta por ID_NF.

j) Qual o valor médio dos descontos dados por produto. As colunas presentes no
resultado da consulta são: COD_PROD, MEDIA. Agrupe o resultado da consulta por
COD_PROD.

k) Qual o menor, maior e o valor médio dos descontos dados por produto. As colunas
presentes no resultado da consulta são: COD_PROD, MENOR, MAIOR, MEDIA. Agrupe
o resultado da consulta por COD_PROD.

l) Quais as NF que possuem mais de 3 itens vendidos. As colunas presentes no resultado
da consulta são: ID_NF, QTD_ITENS. OBS:: NÃO ESTÁ RELACIONADO A QUANTIDADE
VENDIDA DO ITEM E SIM A QUANTIDADE DE ITENS POR NOTA FISCAL. Agrupe o
resultado da consulta por ID_NF.
*/


                                /* Resolução */

create database caixa_mercado;     /* Criando banco de dados */ 

use caixa_mercado;              /* Usando o banco de dados */


/* Crando a tabela compras */
        create table compras (
            id_nf integer not null,
            id_item integer not NULL,
            cod_produto integer not null,
            valor_unit decimal(4,2) not null,
            quantidade int not null,
            desconto integer default NULL,
            constraint pk_compras primary key (id_nf, id_item, cod_produto)
        );


/* Inserindo registros no banco de dados */
        insert into compras
        values 
        (1, 1, 1, 25.00, 10, 5),
        (1, 2, 1, 13.50, 3, default),
        (1, 3, 3, 15.00, 2, default),
        (1, 4, 3, 10.00, 1, default),
        (1, 5, 5, 30.00, 1, default),
        (2, 1, 3, 15.00, 4, default),
        (2, 2, 4, 10.00, 5, default),
        (2, 3, 5, 30.00, 7, default),
        (3, 1, 1, 25.00, 5, default),
        (3, 2, 4, 10.50, 4, default),
        (3, 3, 4, 30.00, 5, default),
        (3, 4, 2, 13.50, 7, default),
        (4, 2, 5, 30.00, 12, 15),
        (4, 2, 4, 10.00, 10, 5),
        (4, 3, 1, 25.00, 13, 5),
        (4, 4, 2, 13.50, 15, 5),
        (5, 1, 3, 15.00, 3, default),
        (5, 2, 5, 30.00, 6, default),
        (6, 1, 1, 35.00, 22, 15),
        (6, 2, 3, 15.00, 25, 20),
        (7, 1, 1, 25.00, 10, 3),
        (7, 2, 2, 13.50, 10, 4),
        (7, 3, 3, 15.00, 10, 4),
        (7, 4, 5, 30.00, 10, 1);

select * from compras;   /* Selecionando todos os registros da tabela */


/* 
a) Pesquise os itens que foram vendidos sem desconto. As colunas presentes no resultado da consulta são: ID_NF, ID_ITEM, COD_PROD E VALOR_UNIT. 
*/

        select id_nf, id_item, cod_produto, valor_unit from compras where desconto is null;


/*
 b) Pesquise os itens que foram vendidos com desconto. As colunas presentes no resultado da consulta são: ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT e o VALOR_VENDIDO. 
OBS: O valor vendido é igual ao VALOR_UNIT -(VALOR_UNIT*(DESCONTO/100))
 */

        select id_nf, id_item, cod_produto, valor_unit, 
        convert(decimal(4,2),(valor_unit - (valor_unit*desconto/100)))  as valor_vendido  
        from compras
        where desconto is not null;

/* 
c) Altere o valor do desconto (para zero) de todos os registros onde este campo é nulo. 
*/

        update compras set desconto = 0 
        where desconto is null;

/*
d) Pesquise os itens que foram vendidos. As colunas presentes no resultado da consulta são: ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, VALOR_TOTAL, DESCONTO, VALOR_VENDIDO.
OBS: O VALOR_TOTAL é obtido pela fórmula: QUANTIDADE*VALOR_UNIT. O VALOR_VENDIDO é igual a VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)).
*/

        select id_nf, id_item, cod_produto, valor_unit,
        quantidade * valor_unit as valor_total, desconto, 
        convert(decimal(5,2),(valor_unit*quantidade - (valor_unit*quantidade*desconto/100))) as valor_vendido
        from compras;

/*
e) Pesquise o valor total das NF e ordene o resultado do maior valor para o menor. As colunas presentes no resultado da consulta são: ID_NF, VALOR_TOTAL. 
OBS: O VALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE * VALOR_UNIT. Agrupe o resultado da consulta por ID_NF.
*/

        select id_nf, sum(quantidade*valor_unit) as valor_total 
        from compras
        group by id_nf
        order by valor_total desc;

/*
f) Pesquise o valor vendido das NF e ordene o resultado do maior valor para o menor. As
colunas presentes no resultado da consulta são: ID_NF, VALOR_VENDIDO. OBS: O
VALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE * VALOR_UNIT. O
VALOR_VENDIDO é igual a ∑ VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)). Agrupe
o resultado da consulta por ID_NF.
*/

        select id_nf, sum(valor_unit*quantidade - (valor_unit*quantidade*desconto/100)) as valor_vendido
        from compras
        group by id_nf
        order by valor_vendido desc;

/*
g) 
Consulte o produto que mais vendeu no geral. As colunas presentes no resultado da
consulta são: COD_PROD, QUANTIDADE. Agrupe o resultado da consulta por
COD_PROD.
*/

        select cod_produto,
        sum(quantidade) as qtde_vendida
        from compras
        group by cod_produto;

/*
h) Consulte as NF que foram vendidas mais de 10 unidades de pelo menos um produto.
As colunas presentes no resultado da consulta são: ID_NF, COD_PROD, QUANTIDADE.
Agrupe o resultado da consulta por ID_NF, COD_PROD.
*/

        select id_nf, cod_produto, sum(quantidade) as qtde_vendida
        from compras
        group by id_nf, cod_produto
        having sum(quantidade) > 10;
        

/*
i) Pesquise o valor total das NF, onde esse valor seja maior que 500, e ordene o
resultado do maior valor para o menor. As colunas presentes no resultado da consulta
são: ID_NF, VALOR_TOT. OBS: O VALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE
* VALOR_UNIT. Agrupe o resultado da consulta por ID_NF.
*/

        select id_nf, sum(valor_unit*quantidade) as valor_total
        from compras
        group by id_nf
        having sum(valor_unit*quantidade) > 500
        order by valor_total desc;

/*
j) Qual o valor médio dos descontos dados por produto. As colunas presentes no
resultado da consulta são: COD_PROD, MEDIA. Agrupe o resultado da consulta por
COD_PROD.
*/
        select * from compras; 

        select cod_produto, convert(decimal(5,2), avg(valor_unit*quantidade*desconto/100)) as desconto_médio
        from compras
        where desconto <> 0
        group by cod_produto;

/* 
k) Qual o menor, maior e o valor médio dos descontos dados por produto. As colunas
presentes no resultado da consulta são: COD_PROD, MENOR, MAIOR, MEDIA. Agrupe
o resultado da consulta por COD_PROD.
*/

        select cod_produto, convert(decimal(5,2), max(valor_unit*quantidade*desconto/100)) as desconto_máximo,
        convert(decimal(5,2), min(valor_unit*quantidade*desconto/100)) as desconto_minimo,
        convert(decimal(5,2), avg(valor_unit*quantidade*desconto/100)) as desconto_médio
        from compras
        where desconto <> 0
        group by cod_produto;

/*
l) Quais as NF que possuem mais de 3 itens vendidos. As colunas presentes no resultado
da consulta são: ID_NF, QTD_ITENS. OBS:: NÃO ESTÁ RELACIONADO A QUANTIDADE
VENDIDA DO ITEM E SIM A QUANTIDADE DE ITENS POR NOTA FISCAL. Agrupe o
resultado da consulta por ID_NF. 
*/

        select id_nf, sum(quantidade) as qtde_itens
        from compras
        group by id_nf
        having sum(quantidade) > 3;
