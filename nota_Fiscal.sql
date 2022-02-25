create database caixa_mercado;

use caixa_mercado;

create table compras (
    id_nf integer not null,
    id_item integer not NULL,
    cod_produto integer not null,
    valor_unit NUMERIC(4,2) not null,
    quantidade int not null,
    desconto integer default NULL,
    constraint pk_compras primary key (id_nf, id_item, cod_produto)
);

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

select * from compras;

