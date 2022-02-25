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


/* a) Pesquise os itens que foram vendidos sem desconto. As colunas presentes no resultado da consulta são: ID_NF, ID_ITEM, COD_PROD E VALOR_UNIT. */

        select id_nf, id_item, cod_produto, valor_unit from compras where desconto is null;


/* b) Pesquise os itens que foram vendidos com desconto. As colunas presentes no resultado da consulta são: ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT e o VALOR_VENDIDO. OBS: O valor vendido é igual ao VALOR_UNIT -(VALOR_UNIT*(DESCONTO/100)) */

        select id_nf, id_item, cod_produto, valor_unit, 
        convert(decimal(4,2),(valor_unit - (valor_unit*desconto/100)))  as valor_vendido  
        from compras
        where desconto is not null;

/* c) Altere o valor do desconto (para zero) de todos os registros onde este campo é nulo. */

        update compras set desconto = 0 
        where desconto is null;

/*d) Pesquise os itens que foram vendidos. As colunas presentes no resultado da consulta são: ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, VALOR_TOTAL, DESCONTO, VALOR_VENDIDO. OBS: O VALOR_TOTAL é obtido pela fórmula: QUANTIDADE*VALOR_UNIT. O VALOR_VENDIDO é igual a VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)).*/

        select id_nf, id_item, cod_produto, valor_unit,
        quantidade * valor_unit as valor_total, desconto, 
        convert(decimal(5,2),(valor_unit*quantidade - (valor_unit*quantidade*desconto/100))) as valor_vendido
        from compras;

/*e) Pesquise o valor total das NF e ordene o resultado do maior valor para o menor. As colunas presentes no resultado da consulta são: ID_NF, VALOR_TOTAL. OBS: O VALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE * VALOR_UNIT. Agrupe o resultado da consulta por ID_NF.*/