create database ecommerce;
use ecommerce;
create table cliente (
id integer auto_increment primary key,
nome varchar(50) not null,
email varchar(50) not null unique,
senha varchar(10) not null,
cpf varchar(15) not null unique
);

create table departamento(
numero integer not null auto_increment primary key,
nome varchar(30) not null,
descricao text
);

create table endereco(
num_seq integer not null auto_increment primary key,
tipo varchar(5) not null,
logradouro varchar(50) not null,
numero integer,
compl varchar(20),
bairro varchar(30), 
cidade varchar(50),
estado varchar(2),
cep varchar(10),
id_cliente integer not null,

constraint endereco_cliente foreign key (id_cliente) references cliente(id)
);

 -- default zero pra quando querer inicializar com valor 0
create table pedido(
numero integer not null auto_increment primary key,
status varchar(1) not null, 
data date, 
valor_bruto double,
desconto double ,
valor_liq double, 
id_cliente integer not null,

constraint cliente_pedido foreign key (id_cliente) references cliente(id)
);

create table produto(
codigo integer not null auto_increment primary key,
nome varchar(50) not null,
descricao text,
preco double,
estoque integer,
link_foto varchar(255),
numero_depto integer not null,

constraint produto_depto foreign key (numero_depto) references departamento(numero)
);

create table item_pedido(
seq integer not null auto_increment primary key,
quantidade integer,
preco_unit double,
preco_final double,
codigo_produto integer not null,
numero_pedido integer not null,

constraint item_produto foreign key (codigo_produto) references produto(codigo),
constraint item_pedido foreign key (numero_pedido) references pedido(numero)
);


-- na criação da model use a n:m e clique nas table produto e  pedido e cria uma tble que ja relaciona ambas
-- 1:n relação um pra muitos na model
-- database -> engineer... cria versao model ou a sql

-- altera a tabela add rg depois do campo senha
alter table cliente add column rg varchar(10) not null after senha;

-- apaga o banco
drop database ecommer;

-- altera o tipo e informações da coluna existente
alter table cliente modify column rg varchar(15);

-- altera o nome da coluna por outro nome 
alter table cliente change column rg registro_geral varchar (10) not null;

alter table cliente modify column registro_geral varchar(15);
alter table endereco modify column estado varchar(3);

insert into departamento(nome, descricao) values ('Tecnologia', 'Produtos pra computadores');
-- outro metodo de inserção mencionando o id auto increment como null, pois o banco ja gera a identificação
insert into departamento values (null, 'Eletronicos', 'Tudo o que não é computador e liga na tomada');

insert into departamento values (null, 'Games', 'Para jogadores hard level'), (null, 'Acessorios', 'Cabos e conectores que a gente sempre perde'), (null, 'Alimentação', 'Porque DEV não vive só de dogão');

select * from departamento;

-- exclui coluna especifica
alter table produto drop column produtocol;

insert into produto values (null, 'Computador', 'Computador cheio de led top de linha', 2500.0, 3, './imagens/computador.png', 1);

update departamento set nome = 'Informatica e Tecnologia' where numero = 1;

select * from produto;

delete from produto where codigo = 1;

delete from departamento where numero = 1;

select * from endereco;
-- tabela departamento

INSERT INTO departamento VALUES (null, "Tecnologia", "Equipamentos, computadores, tablets");
INSERT INTO departamento VALUES (null, "Acessorios", "Cabos, adaptadores, carregadores");
INSERT INTO departamento VALUES (null, "Games", "Jogos, Consoles, Acessórios");

-- tabela produto

INSERT INTO produto VALUES (null, "Computador Ultima Geração","Computaodr i9 32Gb Ram 1TbHD, Placa GTX1090",4000.0,3,"computador.jpg",1);
INSERT INTO produto VALUES (null, "Notebook Ultima Geração","Notebook i7 16 Gb Ram 500Gb HD SSD",3850.00,5,"notebook.jpg",1);
INSERT INTO produto VALUES (null, "Cabo USB C","Cabo USB 2M para carregar celulares",50.0,20,"cabousb.jpg",2);
INSERT INTO produto VALUES (null, "Conector USB","Conector USB para recarga em tomada 3A",35,15,"conector.jpg",2);
INSERT INTO produto VALUES (null, "Console XBOX One","Console XBOX One com Halo e 2 controles",1999.90,3,"xbox.jpg",3);
INSERT INTO produto VALUES (null, "Console Playstation 5","Nao acompanha jogo, vem com 1 controle",2999.90,2,"ps5.jpg",3);

-- tabela cliente

INSERT INTO cliente VALUES (null, "Jose Alberto Neves","josealberto@mail.com","123456","98.876.123-99","987.654.321-00");
INSERT INTO cliente VALUES (null, "Antonio Oliveira","antoniooli@mail.com","987654","12.983.256-72","765.432.987.10");
INSERT INTO cliente VALUES (null, "Regina Brito","reginabrito@mail.com","010203","83.235.645-90","123.456.789-00");

-- tabela endereco
INSERT INTO endereco VALUES (null,"Av", "Brasil",100,"Casa 1","Centro","Sao Paulo","SP", "01234-567",1);
INSERT INTO endereco VALUES (null,"Rua","Major Silva",12,"Ap 12A","Pitangueiras","Itapecerica da Serra","SP","98765-432",1);
INSERT INTO endereco VALUES (null,"Rua","Heitor Vila Lobos",98,"Casa 2","Vila das Flores","Osasco","SP","06543-123",2);
INSERT INTO endereco VALUES (null,"Av","Raquel Meyer",173,"Ap 42 Bl 1","Centro","Vitoria","ES","32987-122",3);

-- tabela pedido
INSERT INTO pedido VALUES (null,"F","2021-01-10",4000,0,4000,1);
INSERT INTO pedido VALUES (null,"F","2021-02-01",70,0,70,2);
INSERT INTO pedido VALUES (null,"F","2021-03-10",3850,0,3850,3);
INSERT INTO pedido VALUES (null,"F","2021-04-15",8000,1000,7000,1);
INSERT INTO pedido VALUES (null,"F","2021-05-05",1999.90,0,1999.90,2);
INSERT INTO pedido VALUES (null,"F","2021-06-08",2999.90,0,2999.90,3);
INSERT INTO pedido VALUES (null,"F","2021-07-10",250,0,250,2);
INSERT INTO pedido VALUES (null,"F","2021-08-22",350,0,350,2);
INSERT INTO pedido VALUES (null,"F","2021-09-19",700,0,700,3);
INSERT INTO pedido VALUES (null,"F","2021-10-07",3850,0,3850,1);
INSERT INTO pedido VALUES (null,"F","2021-11-01",50,0,50,1);
INSERT INTO pedido VALUES (null,"F","2021-12-05",1999.9,0,1999.9,1);
INSERT INTO pedido VALUES (null,"F","2022-12-05",2999.9,0,2999.9,2);
INSERT INTO pedido VALUES (null,"F","2022-12-12",4000,0,4000,3);
-- tabela itens

INSERT INTO item_pedido VALUES (null, 1, 4000, 4000, 1, 1);
INSERT INTO item_pedido VALUES (null, 2, 3.50, 70.0, 4, 2);
INSERT INTO item_pedido VALUES (null, 1, 3850, 3850, 2, 3);
INSERT INTO item_pedido VALUES (null, 2, 4000, 8000, 1, 4 ) ;
INSERT INTO item_pedido VALUES (null, 1, 1999.90, 1999.90, 5, 5 );
INSERT INTO item_pedido VALUES (null, 1, 2999.90, 2999.90, 6, 6);
INSERT INTO item_pedido VALUES (null, 5,  50, 250, 3, 7);
INSERT INTO item_pedido VALUES (null, 10, 35, 350, 4, 8);
INSERT INTO item_pedido VALUES (null, 20, 35, 700, 4, 9);
INSERT INTO item_pedido VALUES (null,  1, 3850, 3850, 2, 10);
INSERT INTO item_pedido VALUES (null, 1, 50, 50, 3, 11);
INSERT INTO item_pedido VALUES (null, 1, 1999.9, 1999.9, 5, 12);
INSERT INTO item_pedido VALUES (null, 1, 2999.9, 2999.9, 6, 13);
INSERT INTO item_pedido VALUES (null, 1, 4000, 4000, 1, 14);

-- selecionando algumas colunas
select id, nome, email, senha, cpf from cliente;

-- ordenando cliente pelo nome
select * from cliente order by nome asc;

-- buscando atraves de um criterio
select * from cliente where id = 1;

select id as 'codigo', nome as 'nome do cliente', cpf as 'cod do cliente' from cliente;

-- quero saber quantos cliente eu tenho
select count(id) from cliente;

-- a mesma consulta acima, mudando o titulo da coluna
select count(id) as 'total de cliente' from cliente;

-- recuperando todos os pedidos
select * from pedido;

-- recuperando o total faturado geral(sem criterio algum)
select sum(valor_bruto) from pedido;

-- buscar produtos por alguma palavra-chave
select * from produto where nome like "%USB%";

-- como saber quantos produtos ha em casa departamento
select * from produto;

-- recuperando quantos produto ha em cada um dos departamentos, group by ou agrupamentos normalmente estao relacionados a operações de  totalização
select numero_depto, count(codigo) from produto group by numero_depto;

-- recuperando a somatoria dos produtos por departamento, group by ou agrupamentos normalmente estao relacionados a operações de  totalização
select numero_depto, sum(preco*estoque) from produto group by numero_depto;

-- junção simples como produto cartesiano
select * from produto inner join departamento;

-- junção fazendo a relação entre produto e departamento
select * from produto inner join departamento on produto.numero_depto = departamento.numero;

-- recuperar todos os clientes e seus respectivos clientes 
select * from cliente inner join endereco on endereco.id_cliente = cliente.id;

-- passo 1 : a partir dos pedidos, faço a junção com os itens de pedido
-- passo 2 : fazer a junção com o produto
-- passo 3 : fazer a junção com o cliente
select * from pedido inner join item_pedido on pedido.numero = item_pedido.numero_pedido
inner join produto on produto.codigo = item_pedido.codigo_produto
inner join cliente on pedido.id_cliente = cliente.id;

-- a mesma consulta anterior, porem buscando todos os dados do pedido + nome do cliente + o nome do produto comprado
select pedido.numero, pedido.data, pedido.valor_bruto, pedido.desconto, pedido.valor_liq, cliente.nome, produto.nome from pedido inner join item_pedido on pedido.numero = item_pedido.numero_pedido
inner join produto on produto.codigo = item_pedido.codigo_produto
inner join cliente on pedido.id_cliente = cliente.id
order by numero;

-- quero totais de pedido por cliente (inclusive com o nome deles)
select cliente.nome, pedido.id_cliente, sum(pedido.valor_liq) from pedido inner join cliente on pedido.id_cliente = cliente.id group by pedido.id_cliente;

-- hipotese 1: buscando todos os produtos a partir dos departamentos
select * from departamento inner join produto on departamento.numero = produto.numero_depto;

-- inserindo um novo departamento
insert into departamento values(null, 'Moveis', 'Moveis para escritorios e gamers de todas as idades');

select * from departamento;

-- solução para isso: usar uma junção externa(outer join) (para os registros que não possuem dados) 
select * from departamento left outer join produto on departamento.numero = produto.numero_depto group by produto.codigo;

-- agora usando right outer join
select * from produto right outer join departamento on departamento.numero = produto.numero_depto group by produto.codigo;

-- gostaria de buscar todos os pedido que possuem o produto mais caro neles

-- como saber qual o produto mais caro?
select * from produto order by preco desc limit 1;

select * from produto having max(preco);

select * from produto where preco = (select max(preco) from produto);

-- mas na verdade eu quero os pedidos que contem este produto
select * from pedido inner join item_pedido on item_pedido.numero_pedido = pedido.numero
where item_pedido.codigo_produto = (select codigo from produto having max(preco));

-- caso eu queira os clientes que compraram este produto mais caro basta fazer na consulta externa um junção com cliente e recuperar seu nome
select * from cliente inner join pedido on cliente.id = pedido.id_cliente 
inner join item_pedido on item_pedido.numero_pedido = pedido.numero
where item_pedido.codigo_produto = (select codigo from produto having max(preco)); 