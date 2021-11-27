-- Criando o Banco de Dados
create database db_pizzaria_legal;

-- Criando tabela categoria
use db_pizzaria_legal;

create table tb_categoria(
Id int auto_increment, 
NomePizza varchar(50) not null, 
Ingredientes varchar(250)not null, 
Preço  decimal(10,2), 

primary key(Id)
);

-- Criando tabela pizza
use db_pizzaria_legal;

create table tb_pizza(
Id int auto_increment, 
Pizza int not null, 
BordaRecheada boolean,
SaborBorda varchar(50), 
QuerAzeitona boolean,
 
primary key (Id),
foreign key(Pizza) references tb_categoria (Id)
);

-- Inserindo valores para os atributos da tb_categoria
insert into tb_categoria (NomePizza, Ingredientes, Preço) values ("Calabresa", "Calabresa Fatiada, Cebola, Molho de Tomate, Tomate Fresco, Orégano", 29.99);
insert into tb_categoria (NomePizza, Ingredientes, Preço) values ("Potuguesa", "Ovos, Cebola, Ervilha, Queijo Mussarela, Presunto, Molho de Tomate, Orégano", 49.99);
insert into tb_categoria (NomePizza, Ingredientes, Preço) values ("Frango c/ Catupiry", "Peito de Frango Fatiado, Queijo Catupiry, Molho de Tomate, Orégano", 45.99);
insert into tb_categoria (NomePizza, Ingredientes, Preço) values ("Atum", "2x Latas Atum, Cebola, Molho de Tomate, Orégano", 39.99);
insert into tb_categoria (NomePizza, Ingredientes, Preço) values ("Mussarela", "Queijo Mussarela, Molho de Tomate, Tomate, Orégano", 29.99);


-- Inserindo valores para os atributos da tb_pizza
insert into tb_pizza (Pizza, BordaRecheada, SaborBorda, QuerAzeitona) values (1, true, "Cheddar", true);
insert into tb_pizza (Pizza, BordaRecheada, SaborBorda, QuerAzeitona) values (2, true, "Calabresa com Catupiry", false);
insert into tb_pizza (Pizza, BordaRecheada, SaborBorda, QuerAzeitona) values (3, true, "Calabresa", true);
insert into tb_pizza (Pizza, BordaRecheada, SaborBorda, QuerAzeitona) values (4, true, "Cream Cheese Philadelphia", false);
insert into tb_pizza (Pizza, BordaRecheada, SaborBorda, QuerAzeitona) values (5, true, "Gergelim", true);
insert into tb_pizza (Pizza, BordaRecheada, SaborBorda, QuerAzeitona) values (1, true, "Mista(Requeijão e Cheddar)", false);
insert into tb_pizza (Pizza, BordaRecheada, SaborBorda, QuerAzeitona) values (2, true, "Requeijão", true);
insert into tb_pizza (Pizza, BordaRecheada, SaborBorda, QuerAzeitona) values (3, true, "Cheddar", false);


-- Pizzas com preços maior que R$ 45,00
select tb_categoria.NomePizza, tb_categoria.Preço from tb_categoria where Preço > 45;

-- Pizzas com preços entre R$ 29,00 e R$ 60,00
select tb_categoria.NomePizza, tb_categoria.Preço from tb_categoria where Preço > 29 and Preço < 60;

-- LIKE nome de pizzas com a letra C 
select tb_categoria.NomePizza from tb_categoria where NomePizza like "%C%";

-- Mesclagem entre as tabelas categoria e pizza
select * from tb_pizza inner join tb_categoria on tb_categoria.Id = tb_pizza.Pizza;

-- Selecionando apenas pizza Calabresa
select tb_pizza.Pizza, tb_categoria.NomePizza from tb_pizza inner join tb_categoria on tb_categoria.Id = tb_pizza.Pizza where NomePizza = "Calabresa";