-- Criando o Banco de Dados
create database db_construindo_a_nossa_vida;

-- Criando tabela categoria
use db_construindo_a_nossa_vida;

create table tb_categoria(
Id_categoria int auto_increment, 
Area varchar(50) not null,
Marca varchar(50) not null, 
Eletrico boolean,

primary key(Id_categoria)
);

-- Criando tabela produtos
use db_construindo_a_nossa_vida;

create table tb_produtos(
Id_produtos int auto_increment, 
Nome varchar(250) not null,
Disponibilidade boolean, 
Qtd int not null ,
Preço decimal(10,2) not null,
Categoria int not null, 
 
primary key (Id_produtos),
foreign key(Categoria) references tb_categoria(Id_categoria)
);


-- Inserindo valores para os atributos da tb_categoria
insert into tb_categoria (Area, Marca, Eletrico) values ("Construção Civil", "Tramontina", true );
insert into tb_categoria (Area, Marca, Eletrico) values ("Automobilistica", "Titanium", true );
insert into tb_categoria (Area, Marca, Eletrico) values ("Marcenaria", "Makita", true );
insert into tb_categoria (Area, Marca, Eletrico) values ("Eletrônica", "Yaxun", true );
insert into tb_categoria (Area, Marca, Eletrico) values ("Elétrica", "Sparta", true );

select * from tb_categoria;

-- Inserindo valores para os atributos da tb_produto
insert into tb_produtos (Nome, Disponibilidade, Qtd, Preço, Categoria) values ("Martelo", true, 5, 39.99, 1);
insert into tb_produtos (Nome, Disponibilidade, Qtd, Preço, Categoria) values ("Macaco", true, 6, 119.99, 2);
insert into tb_produtos (Nome, Disponibilidade, Qtd, Preço, Categoria) values ("Lima", true, 2, 29.99, 3);
insert into tb_produtos (Nome, Disponibilidade, Qtd, Preço, Categoria) values ("Estação de Solda", true, 2, 399.99, 4);
insert into tb_produtos (Nome, Disponibilidade, Qtd, Preço, Categoria) values ("Fio 2.00mm", true, 8, 82.99, 5);
insert into tb_produtos (Nome, Disponibilidade, Qtd, Preço, Categoria) values ("Compressor de Ar", true, 1, 59.99, 1);
insert into tb_produtos (Nome, Disponibilidade, Qtd, Preço, Categoria) values ("Torquímetro", true, 1, 59.99, 2);
insert into tb_produtos (Nome, Disponibilidade, Qtd, Preço, Categoria) values ("Martelo de Borracha", true, 1, 9.99, 3);

select * from tb_produtos;

-- Produtos com valor maior que R$ 50,00
select tb_produtos.Nome, tb_produtos.Preço from tb_produtos where Preço > 50;

-- Produtos com valor entre R$ 3,00 e R$ 60,00
select tb_produtos.Nome, tb_produtos.Preço from tb_produtos where Preço > 3 and Preço < 60;

-- LIKE na tab_produtos referente a letra C 
select tb_produtos.Nome from tb_produtos where Nome like "%C%";

-- Mesclagem entre as tabelas produto e categoria
select * from tb_produtos inner join tb_categoria on tb_categoria.Id_categoria = tb_produtos.Categoria;

-- Selecionando apenas a categoria Marcenaria
select tb_produtos.Nome, tb_produtos.Categoria, tb_categoria.Area  from tb_produtos inner join tb_categoria on tb_categoria.Id_categoria = tb_produtos.Categoria where Area = "Marcenaria";