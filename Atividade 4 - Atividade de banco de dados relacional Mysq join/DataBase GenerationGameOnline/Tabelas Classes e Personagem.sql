-- Criando o Banco de Dados
create database db_generation_game_online;

-- Criando tabela classe para o banco de dados da db_generation_game_online
use db_generation_game_online;

create table tb_classes(
Id int auto_increment, 
NomeClasse varchar(20) not null, 
Arma varchar(20)not null, 
Skin boolean, 
primary key(Id)
);

-- Criando tabela personagem para o banco de dados da db_generation_game_online
use db_generation_game_online;

create table tb_personagem(
id int auto_increment, 
Genero varchar(20) not null,
Nome varchar(20) not null, 
Classe int(2) not null, 
Ataque int not null, 
Defesa int not null, 

primary key (id),
foreign key(Classe) references tb_classes (Id)
);

-- Inserindo valores para os atributos da tb_classes
insert into tb_classes (NomeClasse, Arma, Skin) values ("Protetor Robusto", "Espada / Escudo", true);
insert into tb_classes (NomeClasse, Arma, Skin) values ("Lutador Dinâmico", "Soco Inglês", true);
insert into tb_classes (NomeClasse, Arma, Skin) values ("Arqueiro Preciso", "Arco de Precisão", true);
insert into tb_classes (NomeClasse, Arma, Skin) values ("Soldado Infernal", "Espadas Duplas", true);
insert into tb_classes (NomeClasse, Arma, Skin) values ("Mago da Floresta", "Cajado animal", true);

-- Inserindo valores para os atributos da tb_persongem
insert into tb_personagem (Genero, Nome, Classe, Ataque, Defesa) values ("Masculino", "Estevan", 1, 1100, 1800);
insert into tb_personagem (Genero, Nome, Classe, Ataque, Defesa) values ("Feminino", "Gloria", 2, 2100, 800);
insert into tb_personagem (Genero, Nome, Classe, Ataque, Defesa) values ("Masculino", "Atreus", 3, 1600, 1500);
insert into tb_personagem (Genero, Nome, Classe, Ataque, Defesa) values ("Feminino", "Caliope", 4, 3100, 2500);
insert into tb_personagem (Genero, Nome, Classe, Ataque, Defesa) values ("Masculino", "Kratos", 5, 1000, 1800);
insert into tb_personagem (Genero, Nome, Classe, Ataque, Defesa) values ("Feminino", "Sakura", 1, 4100, 2300);
insert into tb_personagem (Genero, Nome, Classe, Ataque, Defesa) values ("Masculino", "Naruto", 2, 1500, 800);
insert into tb_personagem (Genero, Nome, Classe, Ataque, Defesa) values ("Feminino", "Noelle", 3, 800, 800);



-- Personagens com Ataque maior que 2000
select tb_personagem.Genero, tb_personagem.Nome, tb_personagem.Ataque from tb_personagem where Ataque > 2000;

-- Personagens com Defesa entre 1000 e 2000
select tb_personagem.Genero, tb_personagem.Nome, tb_personagem.Defesa from tb_personagem where Defesa > 1000 and Defesa < 2000;

-- LIKE Personagens com a Letra C 
select tb_personagem.Nome from tb_personagem where tb_personagem.Nome like "%C%";

-- Mesclagem entre as tabelas classe e personagem
select * from tb_personagem inner join tb_classes on tb_classes.Id = tb_personagem.Classe;

-- Selecionando apenas Lutadores Dinâmicos
select tb_personagem.Nome, tb_personagem.Classe, tb_classes.NomeClasse from tb_personagem inner join tb_classes on tb_classes.Id = tb_personagem.Classe where tb_classes.NomeClasse = "Lutador Dinâmico";
