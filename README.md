# Banco de dados
 Estudos sobre banco de Dados - Listas de Exercícios tutoriais
 
                            *Exercicios*
 
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
