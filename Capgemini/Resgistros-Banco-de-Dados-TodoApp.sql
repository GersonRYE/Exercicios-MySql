create database todoapp;

use todoapp;

create table projeto(
id int primary key auto_increment,
nome varchar(50) not null,
descricao varchar(255),
data_criacao datetime,
data_atualizacao datetime
);

create table tarefa(
id int primary key auto_increment,
projeto_id int not null,
nome varchar(50) not null,
descricao varchar(255),
completada boolean not null,
observacao varchar(255),
prazo date,
data_criacao datetime,
data_atualizacao datetime,

foreign key (projeto_id) references projetos(id) on delete cascade on update cascade
);

