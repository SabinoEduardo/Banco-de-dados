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
        carga_horária   numeric(3)
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
        ano numeric(4) not null,
        horário varchar(7),

        constraint turma_cod_disciplina_fk foreign key(cod_disciplina) references disciplinas(cod_disciplina),

        constraint turma_cod_professor_fk foreign key(cod_professor) references professores(cod_professor),

        constraint turma_pk primary key 
        (cod_disciplina, cod_turma, cod_professor, ano)
    );

/* Criando a tabela histórico */

    create table historico (
        matricula numeric(10) not null, 
        cod_disciplina  varchar(3) not null, 
        cod_turma numeric(10) not null,
        cod_professor numeric(10) not null,
        ano numeric(4) not null,
        frequencia numeric(2),
        nota numeric(5,2)

        constraint historico_matricula_fk foreign key (matricula) references alunos(matricula),

        constraint historico_fk foreign key (cod_disciplina, cod_turma, cod_professor, ano)
        references turma(cod_disciplina, cod_turma, cod_professor, ano)
    );

/* Inserindo valores nas tabelas */

    insert into alunos 
    values
    (2015010101, 'JOSE DE ALENCAR', 'RUA DAS ALMAS', 'NATAL'),
    (2015010102, 'JOÃO JOSÉ', 'AVENIDA RUY CARNEIRO', 'JOÃO PESSOA'),
    (2015010103, 'MARIA JOAQUINA', 'RUA CARROSSEL', 'RECIFE'),
    (2015010104, 'MARIA DAS DORES', 'RUA DAS LADEIRAS', 'FORTALEZA'),
    (2015010105, 'JOSUÉ CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL'),
    (2015010106, 'JOSUÉLISSON CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL');


    insert into disciplinas
    values 
    ('BD', 'BANCO DE DADOS', 100),
    ('POO', 'PROGRAMAÇÃO COM ACESSO A BANCO DE DADOS', 100),
    ('WEB', 'AUTORIA WEB', 50),
    ('ENG', 'ENGENHARIA DE SOFTWARE', 80);


    insert into professores 
    values 
    (212131, 'NICKERSON FERREIRA', 'RUA MANAÍRA', 'JOÃO PESSOA'),
    (122135, 'ADORILSON BEZERRA', 'AVENIDA SALGADO FILHO','NATAL'),
    (192011, 'DIEGO OLIVEIRA', 'AVENIDA ROBERTO FREIRE', 'NATAL');


    insert into turma
    values 
    ('BD', 1, 212131, 2015, '11H-12H'),
    ('BD', 2, 212131, 2015, '13H-14H'),
    ('POO', 1, 192011, 2015, '08H-09H'),
    ('WEB', 1, 192011, 2015, '07H-08H'),
    ('ENG', 1, 122135, 2015, '10H-11H'); 



    insert into historico
    values 
    (2015010101, 'BD', 1, 212131, 2015, 90, 8),
    (2015010101, 'POO', 1, 192011, 2015, 78, 7),
    (2015010101, 'WEB', 1, 192011, 2015, 89, 8),
    (2015010101, 'ENG', 1, 122135, 2015, 79, 10),

    (2015010102, 'BD', 1, 212131, 2015, 82, 10),
    (2015010102, 'POO', 1, 192011, 2015, 90, 9),
    (2015010102, 'WEB', 1, 192011, 2015, 88, 8),
    (2015010102, 'ENG', 1, 122135, 2015, 95, 7),

    (2015010103, 'BD', 1, 212131, 2015, 99, 8.50),
    (2015010103, 'POO', 1, 192011, 2015, 87, 9.30),
    (2015010103, 'WEB', 1, 192011, 2015, 96, 7.90),
    (2015010103, 'ENG', 1, 122135, 2015, 90, 9),

    (2015010104, 'BD', 1, 212131, 2015, 67, 5),
    (2015010104, 'POO', 1, 192011, 2015, 90, 8),
    (2015010104, 'WEB', 1, 192011, 2015, 90, 9),
    (2015010104, 'ENG', 1, 122135, 2015, 90, 6.70),

    (2015010105, 'BD', 1, 212131, 2015, 90, 8),
    (2015010105, 'POO', 1, 192011, 2015, 90, 8),
    (2015010105, 'WEB', 1, 192011, 2015, 90, 8),
    (2015010105, 'ENG', 1, 122135, 2015, 90, 8),

    (2015010106, 'BD', 1, 212131, 2015, 90, 8),
    (2015010106, 'POO', 1, 192011, 2015, 90, 8),
    (2015010106, 'WEB', 1, 192011, 2015, 90, 8),
    (2015010106, 'ENG', 1, 122135, 2015, 90, 8);
   

