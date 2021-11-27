-- Criando Banco de Dados
create database db_escola;

-- Criando Tabela Estudantes e Atributos
use db_escola;

create table tb_estudantes(
id_cod int auto_increment,
Nome varchar(50) not null,
Série int not null, 
Turma varchar(3) not null, 
RA int not null, 
Nota decimal(10,2) not null,

primary key(id_cod)
);

select * from tb_estudantes;

-- Inserindo valores aos Atributos na tb_estudantes
insert into tb_estudantes (Nome, Série, Turma, RA, Nota) values ("Enzo da Silva", 3, "A", 00000001, 8.2);
insert into tb_estudantes (Nome, Série, Turma, RA, Nota) values ("Izadora Lima", 5, "B", 00000002, 10.0);
insert into tb_estudantes (Nome, Série, Turma, RA, Nota) values ("João Tadeu", 2, "C", 00000003, 5.2);
insert into tb_estudantes (Nome, Série, Turma, RA, Nota) values ("Fernanda Muniza", 6, "A", 00000004, 7.2);
insert into tb_estudantes (Nome, Série, Turma, RA, Nota) values ("Carlos da Fe", 8, "B", 00000005, 6.5);
insert into tb_estudantes (Nome, Série, Turma, RA, Nota) values ("Monique Ferreira", 1, "C", 00000006, 4.2);
insert into tb_estudantes (Nome, Série, Turma, RA, Nota) values ("Pedro Bonfim", 4, "A", 00000007, 7.2);
insert into tb_estudantes (Nome, Série, Turma, RA, Nota) values ("Ana da Estrada", 7, "B", 00000008, 6.5);

select * from tb_estudantes;

-- Selecionando nota maior que 7
select * from tb_estudantes where Nota > 7;

-- Selecionando nota menor ou igual a 7
select * from tb_estudantes where Nota <= 7;

-- Atualização de um dado da tb_estudante
update tb_estudantes set Nota = 3.8 where id_cod = 6;
select * from tb_estudantes;