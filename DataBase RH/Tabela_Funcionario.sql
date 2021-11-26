-- Criando Banco de dados
create database db_rh;

-- Criando tab_funcionario e Atributos
use db_rh;

create table tb_funcionario( 
id_cod bigint(5) auto_increment, 
Nome varchar(50) not null, 
Cargo varchar(50) not null,
CPF varchar(14) not null,
salario decimal(10,2) not null, 

primary key(id_cod)
);
select * from tb_funcionario;

-- Inserindo Valores aos Atributos na tb_funcionario
insert into tb_funcionario (Nome, Cargo, CPF, salario) values ("Augusto Ferreira", "Estagiário", "123.456.789-98", 899.75); 
insert into tb_funcionario (Nome, Cargo, CPF, salario) values ("Zeus das Trevas", "Presidente", "321.654.987-99", 6000.75);
insert into tb_funcionario (Nome, Cargo, CPF, salario) values ("Caliope Perdizes", "Diretora", "132.465.798-88", 5000.75);
insert into tb_funcionario (Nome, Cargo, CPF, salario) values ("Pandora Malicios", "Supervisora", "312.645.978-78", 3500.75);
insert into tb_funcionario (Nome, Cargo, CPF, salario) values ("Hercules o Brabo", "Analista", "231.564.897-87", 1975.75);
select * from tb_funcionario;

-- Selecionando apenas salarios maior que R$ 2000,00
select * from tb_funcionario where salario > 2000;


-- Selecionando apenas salarios menor ou igual a R$ 2000,00
select * from tb_funcionario where salario <= 2000;


-- Atualização de um dado da tab_funcionario
update tb_funcionario set Nome = "Oliveira Augusto" where id_cod = 1;
select * from tb_funcionario;

-- Alterando o nome do Atributo de salario para Salário
alter table tb_funcionario
change salario Salário decimal(10,2);
select * from tb_funcionario;
