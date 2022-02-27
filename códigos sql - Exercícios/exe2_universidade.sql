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

/* Criando a tabela alunos */

    create table alunos (
        matricula numeric(10) not NULL primary key,
        nome varchar(45) not null,
        endereco varchar(50),
        cidade VARCHAR(20)
    );


/* Criando a tabela disciplinas */

    create table disciplinas (
        cod_disciplina  varchar(3) not null primary key,
        nome_disciplina varchar(50) not null,
        carga_horária   numeric(2)
    );

/* Criando a tabela professores */

    create table professores (
        cod_professor numeric(10) not null primary key,
        nome_professor varchar(45) not null,
        endereco varchar(50),
        cidade varchar(20)
    );

/* Criando a tabela turmas */

    create table turma (
        cod_disciplina  varchar(3) not null,
        cod_turma numeric(10) not null,
        cod_professor numeric(10) not null,
        ano numeric(10) not null,
        horário varchar(7),

        constraint turma_cod_disciplina_fk foreign key(cod_disciplina) references disciplinas(cod_disciplina),

        constraint turma_cod_professor_fk foreign key(cod_professor) references professores(cod_professor),

        constraint turma_pk primary key 
        (cod_disciplina, cod_turma, cod_professor, ano)
    );


    exec sp_columns turma;

    