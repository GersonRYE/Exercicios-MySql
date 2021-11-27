-- Criando Banco de Dados
create database db_ecommerce;

-- Criando Tabela Produtos e Atributos
use db_ecommerce;

create table tb_produtosComida(
id_cod bigint(5) auto_increment,
Nome varchar(50) not null,
Marca varchar(50) not null, 
Kg decimal(10,2) not null, 
Categoria varchar(50) not null, 
Preço decimal(10,2) not null,

primary key(id_cod)
);

select * from tb_produtosComida;

-- Inserindo valores aos Atributos na tb_produtosComida
insert into tb_produtosComida (Nome, Marca, Kg, Categoria, Preço) values ("Arroz", "Camil", 250, "Grãos", 700.98);
insert into tb_produtosComida (Nome, Marca, Kg, Categoria, Preço) values ("Linhaça", "Native", 100, "Grãos", 556.69);
insert into tb_produtosComida (Nome, Marca, Kg, Categoria, Preço) values ("Aveia", "Quacker", 150, "Grãos", 456.766);
insert into tb_produtosComida (Nome, Marca, Kg, Categoria, Preço) values ("Centeio", "Mais Vita", 110, "Grãos", 336.45);
insert into tb_produtosComida (Nome, Marca, Kg, Categoria, Preço) values ("Cevada", "Superbom", 250, "Grãos", 689.64);
insert into tb_produtosComida (Nome, Marca, Kg, Categoria, Preço) values ("Milho", "Quero", 320, "Grãos", 668.45);
insert into tb_produtosComida (Nome, Marca, Kg, Categoria, Preço) values ("Sorgo", "Horizonte", 160, "Grãos", 332.69);
insert into tb_produtosComida (Nome, Marca, Kg, Categoria, Preço) values ("Trigo", "Ecobio", 560, "Grãos", 485.97);

select * from tb_produtosComida;

-- Selecionando produto maior a R$500,00
select * from tb_produtosComida where Preço > 500;

-- Selecionando produto menor ou igual a R$500,00
select * from tb_produtosComida where Preço <= 500;

-- Atualização de um dado da tb_produtosComidas
update tb_produtosComida set Kg = 150 where id_cod = 2;
select * from tb_produtosComida;