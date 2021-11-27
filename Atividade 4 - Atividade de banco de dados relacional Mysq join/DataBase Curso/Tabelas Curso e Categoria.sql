-- Criando o Banco de Dados
create database db_cursoDaMinhaVida;

-- Criando tabela categoria
use db_cursoDaMinhaVida;

create table tb_categoria(
Id_categoria int auto_increment, 
Plataforma boolean,
Curso varchar(50) not null,
Turma varchar(50), 


primary key(Id_categoria)
);

-- Criando tabela produtos
use db_cursoDaMinhaVida;

create table tb_curso(
Id_produtos int auto_increment, 
Nome varchar(250) not null,
Disponibilidade boolean, 
Periodo varchar(250),
Preço decimal(10,2) not null,
Categoria int not null, 
 
primary key (Id_produtos),
foreign key(Categoria) references tb_categoria(Id_categoria)
);


-- Inserindo valores para os atributos da tb_categoria
insert into tb_categoria (Plataforma, Curso, Turma) values (true, "Desenvolvedor Java Full-Stack", "A");
insert into tb_categoria (Plataforma, Curso, Turma) values (true, "Phyton", "B");
insert into tb_categoria (Plataforma, Curso, Turma) values (true, "Java Script", "C");
insert into tb_categoria (Plataforma, Curso, Turma) values (true, "PHP", "D");
insert into tb_categoria (Plataforma, Curso, Turma) values (true, "Swift", "E");

select * from tb_categoria;

-- Inserindo valores para os atributos da tb_curso
insert into tb_curso (Nome, Disponibilidade, Periodo, Preço, Categoria) values ("Generation", true, "Integral", 49.99, 1);
insert into tb_curso (Nome, Disponibilidade, Periodo, Preço, Categoria) values ("Code Academy", true, "Manhã", 70.99, 2);
insert into tb_curso (Nome, Disponibilidade, Periodo, Preço, Categoria) values ("Coursera", true, "Tarde", 39.99, 3);
insert into tb_curso (Nome, Disponibilidade, Periodo, Preço, Categoria) values ("Codewars", true, "Noite", 49.99, 4);
insert into tb_curso (Nome, Disponibilidade, Periodo, Preço, Categoria) values ("Udemy", true, "Integral", 15.99, 5);
insert into tb_curso (Nome, Disponibilidade, Periodo, Preço, Categoria) values ("Kahn Academy", true, "Manhã", 29.99, 1);
insert into tb_curso (Nome, Disponibilidade, Periodo, Preço, Categoria) values ("Solo Learn", true, "Tarde", 99.99, 2);
insert into tb_curso (Nome, Disponibilidade, Periodo, Preço, Categoria) values ("Code Avengers", true, "Noite", 49.99, 3);


select * from tb_curso;

-- Curso com valor maior que R$ 50,00
select tb_curso.Nome, tb_curso.Preço from tb_curso where Preço > 50;

-- Produtos com valor entre R$ 3,00 e R$ 60,00
select tb_curso.Nome, tb_curso.Preço from tb_curso where Preço > 3 and Preço < 60;

-- Alterando nome para J&P
update tb_curso set Nome = "J&P" where Id_produtos = 2;

-- LIKE na tab_produtos referente a letra J 

select tb_curso.Nome from tb_curso where Nome like "%J%";

-- Mesclagem entre as tabelas curso e categoria
select * from tb_curso inner join tb_categoria on tb_categoria.Id_categoria = tb_curso.Categoria;

-- Selecionando apenas a categoria Desenvolvedor Java Full-Stack
select tb_curso.Nome, tb_curso.Categoria, tb_categoria.Curso  from tb_curso inner join tb_categoria on tb_categoria.Id_categoria = tb_curso.Categoria where Curso = "Desenvolvedor Java Full-Stack";