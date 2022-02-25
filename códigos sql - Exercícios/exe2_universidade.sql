/*
    2. Crie uma base de dados Universidade com as tabelas a seguir:
        Alunos (MAT, nome, endereço, cidade)
        Disciplinas (COD_DISC, nome_disc, carga_hor)
        Professores (COD_PROF, nome, endereço, cidade)
        Turma (COD_DISC, COD_TURMA, COD_PROF, ANO, horário)
        COD_DISC referencia Disciplinas
        COD_PROF referencia Professores
        Histórico (MAT, COD_DISC, COD_TURMA, COD_PROF, ANO, frequência, nota)
        MAT referencia Alunos
        COD_DISC, COD_TURMA, COD_PROF, ANO referencia Turma
*/

create database universidade     /* Criando banco de dados */

use universidade; /* Usando o banco de dados */

create table alunos (
    matricula numeric(10) not NULL primary key,
    nome varchar(40) not null,
    endereco varchar(45),
    cidade VARCHAR(20)
);


exec sp_columns alunos;

