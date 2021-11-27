-- Criando o Banco de Dados
create database db_açougue;

-- Criando tabela categoria
use db_açougue;

create table tb_categoria(
Id_categoria int auto_increment, 
Nome varchar(50) not null,
Contem_Osso boolean, 
Animal varchar(50) not null,

primary key(Id_categoria)
);

-- Criando tabela produtos
use db_açougue;

create table tb_produtos(
Id_produtos int auto_increment, 
Nome varchar(250) not null, 
Peso decimal(10,2)not null ,
Disponibilidade boolean,
Preço decimal(10,2) not null,
Categoria int not null, 
 
primary key (Id_produtos),
foreign key(Categoria) references tb_categoria(Id_categoria)
);


-- Inserindo valores para os atributos da tb_categoria
insert into tb_categoria (Nome, Contem_Osso, Animal) values ("Branca", true, "Galinha" );
insert into tb_categoria (Nome, Contem_Osso, Animal) values ("Branca", true, "Pato" );
insert into tb_categoria (Nome, Contem_Osso, Animal) values ("Branca", true, "Peru" );
insert into tb_categoria (Nome, Contem_Osso, Animal) values ("Branca", true, "Ganso" );
insert into tb_categoria (Nome, Contem_Osso, Animal) values ("Branca", true, "Peixes" );


-- Inserindo valores para os atributos da tb_produto
insert into tb_produtos (Nome, Peso, Disponibilidade, Preço, Categoria) values ("Coxa de Frango", 1.0, true, 35.00, 1);
insert into tb_produtos (Nome, Peso, Disponibilidade, Preço, Categoria) values ("Peito de Pato", 1.0, true, 75.00, 2);
insert into tb_produtos (Nome, Peso, Disponibilidade, Preço, Categoria) values ("Peito de Peru", 1.0, true, 85.00, 3);
insert into tb_produtos (Nome, Peso, Disponibilidade, Preço, Categoria) values ("Peito de Ganso", 1.0, true, 45.00, 4);
insert into tb_produtos (Nome, Peso, Disponibilidade, Preço, Categoria) values ("Estômago do Peixe", 1.0, true, 25.00, 5);
insert into tb_produtos (Nome, Peso, Disponibilidade, Preço, Categoria) values ("Asa de Frango", 1.0, true, 35.00, 1);
insert into tb_produtos (Nome, Peso, Disponibilidade, Preço, Categoria) values ("Asa de Pato", 1.0, true, 65.00, 2);
insert into tb_produtos (Nome, Peso, Disponibilidade, Preço, Categoria) values ("Asa de Peru", 1.0, true, 75.00, 3);




-- Produtos com valor maior que R$ 50,00
select tb_produtos.Nome, tb_produtos.Preço from tb_produtos where Preço > 50;

-- Produtos com valor entre R$ 3,00 e R$ 60,00
select tb_produtos.Nome, tb_produtos.Preço from tb_produtos where Preço > 3 and Preço < 60;

-- LIKE na tab_produtos referente a letra C 
select tb_produtos.Nome from tb_produtos where Nome like "%C%";

-- Mesclagem entre as tabelas produto e categoria
select * from tb_produtos inner join tb_categoria on tb_categoria.Id_categoria = tb_produtos.Categoria;

-- Selecionando apenas a categoria Galinha
select tb_produtos.Nome, tb_produtos.Categoria, tb_categoria.Animal  from tb_produtos inner join tb_categoria on tb_categoria.Id_categoria = tb_produtos.Categoria where Animal = "Galinha";