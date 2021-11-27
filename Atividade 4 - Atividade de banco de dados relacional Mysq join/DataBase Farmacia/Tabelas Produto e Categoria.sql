-- Criando o Banco de Dados
create database db_farmacia_do_bem;

-- Criando tabela categoria
use db_farmacia_do_bem;

create table tb_categoria(
Id_categoria int auto_increment, 
Tipo varchar(50) not null, 
Setor varchar(3), 
Prateleira int not null,

primary key(Id_categoria)
);

-- Criando tabela produtos
use db_farmacia_do_bem;

create table tb_produtos(
Id_produtos int auto_increment, 
Nome varchar(250) not null, 
Receita boolean,
Disponibilidade boolean,
Preço decimal(10,2) not null,
Categoria int not null, 
 
primary key (Id_produtos),
foreign key(Categoria) references tb_categoria (Id_categoria)
);

select*from tb_categoria;
select*from tb_produtos;
-- Inserindo valores para os atributos da tb_categoria
insert into tb_categoria (Tipo, Setor, Prateleira) values ("Medicamento", "A", 1 );
insert into tb_categoria (Tipo, Setor, Prateleira) values ("Perfumes", "B", 2 );
insert into tb_categoria (Tipo, Setor, Prateleira) values ("Higiene Pessoal", "C", 3);
insert into tb_categoria (Tipo, Setor, Prateleira) values ("Produtos Médicos", "D", 4);
insert into tb_categoria (Tipo, Setor, Prateleira) values ("Cosméticos", "E", 5);


-- Inserindo valores para os atributos da tb_produto
insert into tb_produtos (Nome, Receita, Disponibilidade, Preço, Categoria) values ("Sabonete", false, true, 1.99, 3);
insert into tb_produtos (Nome, Receita, Disponibilidade, Preço, Categoria) values ("Pasta de dente", false, true, 7.99, 3);
insert into tb_produtos (Nome, Receita, Disponibilidade, Preço, Categoria) values ("Cheira Bem", false, true, 55.99, 5);
insert into tb_produtos (Nome, Receita, Disponibilidade, Preço, Categoria) values ("Esmalte", false, true, 2.99, 5);
insert into tb_produtos (Nome, Receita, Disponibilidade, Preço, Categoria) values ("Gel", false, true, 7.99, 5);
insert into tb_produtos (Nome, Receita, Disponibilidade, Preço, Categoria) values ("Advil", false, true, 15.99, 1);
insert into tb_produtos (Nome, Receita, Disponibilidade, Preço, Categoria) values ("Seringa", false, true, 5.99, 4);
insert into tb_produtos (Nome, Receita, Disponibilidade, Preço, Categoria) values ("Bisturi", false, true, 32.99, 4);



-- Produtos com valor maior que R$ 50,00
select tb_produtos.Preço from tb_produtos where Preço > 50;

-- Produtos com valor entre R$ 3,00 e R$ 60,00
select tb_produtos.Preço from tb_produtos where Preço > 3 and Preço < 60;

-- LIKE na tab_produtos referente a letra B 
select tb_produtos.Nome from tb_produto where Nome like "%B%";

-- Mesclagem entre as tabelas produto e categoria
select * from tb_produtos inner join tb_categoria on tb_categoria.Id_categoria = tb_produtos.Categoria;

-- Selecionando apenas a categoria cosméticos
select tb_produtos.Nome, tb_produtos.Categoria, tb_categoria.Tipo  from tb_produtos inner join tb_categoria on tb_categoria.Id_categoria = tb_produtos.Categoria where Tipo = "Cosméticos";