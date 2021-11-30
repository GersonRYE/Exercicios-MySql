-- Criando banco de dados db_cdz
create database db_cdz;

-- criando tabelas tb_armadura, tb_deus, tb_personagem
use db_cdz;

create table tb_armadura(
id_armadura int auto_increment,
constelacao varchar(250) not null,
golpe1 varchar(250) not null,
golpe2 varchar (250) not null,
golpe3 varchar (250) not null,

primary key (id_armadura)
);

-- Alteração na tabela tb_armadura no atributo constelacao para armadura_constelacao
alter table tb_armadura change constelacao armadura_constelacao varchar(250) not null;

create table tb_deus(
id_deus int auto_increment,
nome varchar(250) not null, 
armadura varchar (250) not null, 
arma varchar (250) not null,
titulo varchar (250) not null, 
classificação varchar (250) not null,
reino varchar (250) not null,
exercito varchar(250) not null, 

primary key (id_deus)
);

-- Alteração na tabela tb_armadura no atributo constelacao para deus
alter table tb_deus change nome deus varchar(250) not null;

create table tb_personagem(
id_personagem int auto_increment,
nome varchar(100) not null, 
idade int not null, 
aniversario date not null, 
setimo_sentido boolean, 
armadura int not null,
deus int not null,

primary key (id_personagem),
foreign key (armadura) references tb_armadura(id_armadura),
foreign key (deus) references tb_deus(id_deus)
);

-- Alteração na tabela tb_deus no atributo deus para protetor
alter table tb_personagem change deus protetor int not null;


-- Inserindo valores(dados) nas tabelas tb_armadura, tb_deus, tb_personagem
insert into tb_armadura (constelacao, golpe1, golpe2, golpe3) values ("Pégaso", "Meteoro de Pegasus", "Cometa de Pégasus", "Turbilhão de Pégasus");
insert into tb_armadura (constelacao, golpe1, golpe2, golpe3) values ("Cavalo Marinho", "Ventos de Tempestade(Furacão)", "Muro de Proteção", "Assopro Divino");
insert into tb_armadura (constelacao, golpe1, golpe2, golpe3) values ("Wyvern", "Destruição Máxima", "N/A", "N/A");

-- Execução da tabela tb_armadura
select * from tb_armadura;

insert into tb_deus (nome, armadura, arma, titulo, classificação, reino, exercito) values ("Athena", "Armadura de Athena", "Niké e Aegis", "Deusa da Sabedoria", "Deus Olímpico", "Mundo", "Cavaleiros de Athena");
insert into tb_deus (nome, armadura, arma, titulo, classificação, reino, exercito) values ("Poseidon", "Escama de Poseidon", "Tridente", "O Imperador dos Mares", "Deus Olímpico", "Kaikai(Mundos dos Mares)", "Marinas de Poseidon");
insert into tb_deus (nome, armadura, arma, titulo, classificação, reino, exercito) values ("Hades", "Sobrepeliz de Hades", "Espada", "Deus das Trevas", "Deus Olímpico", "Submundo", "Exepctros de Hades");

-- Execução da tabela tb_deus

-- Atualizando o valor(dado) da tabela tb_deus atributo(coluna) exercito na linha 3
update tb_deus set exercito = "Expectros de Hades" where id_deus = 3;

insert into tb_personagem (nome, idade, aniversario, setimo_sentido, armadura, deus) values ("Seiya", 13, 19990112, true, 1, 1);
insert into tb_personagem (nome, idade, aniversario, setimo_sentido, armadura, deus) values ("Bian", 18, 19920705, true, 2, 2);
insert into tb_personagem (nome, idade, aniversario, setimo_sentido, armadura, deus) values ("Radamanthys", 23, 19991210, true, 3, 3);

-- Execução da tabela tb_personagem
select * from tb_personagem;

-- Mesclando as 3 tabelas tb_personagem, tb_armadura, tb_deus
select tb_personagem.nome, tb_armadura.armadura_constelacao, tb_deus.deus from tb_personagem inner join tb_armadura on tb_armadura.id_armadura = tb_personagem.armadura 
inner join tb_deus on tb_deus.id_deus = tb_personagem.protetor;
