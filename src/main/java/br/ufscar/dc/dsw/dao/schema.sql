drop database if exists ClinicaSpring;

create database ClinicaSpring;
   
use ClinicaSpring;

create table Usuario(
	login varchar(32) primary key,
	senha varchar(64) not null,
	papel varchar(16) not null,
	email varchar(128) not null unique,
	nome varchar(64) not null
);

create table Medico(
	CRM varchar(32) not null unique,
	email varchar(128) not null unique,
	especialidade varchar(64) not null,
	nome varchar(64) not null,
	login varchar(32) not null,
	senha varchar(64) not null,
	papel varchar(16) not null,
	foreign key (login) references Usuario(login)
		on delete cascade
		on update cascade
);

create table Paciente(
	CPF varchar(32) not null unique,
	dataNascimento date not null,
	email varchar(128) not null unique,
	genero varchar(32) not null,
	nome varchar(64) not null,
	telefone varchar(64) not null unique,
	login varchar(32) not null,
	senha varchar(64) not null,
	papel varchar(16) not null,
	foreign key (login) references Usuario(login)
		on delete cascade
		on update cascade
);

create table Consulta(
	protocolo bigint auto_increment primary key,
	CPF varchar(32) not null,
	CRM varchar(32) not null,
	especialidade varchar(64) not null,
	nomeMedico varchar(64) not null,
	nomePaciente varchar(64) not null,
	horario datetime not null
);

insert into Usuario(login, senha, papel, email, nome) values
 ('admin1', 'senhaadmin1', 'ROLE_ADMIN', 'admin1@org.com', 'Administrador 1'),
 ('admin2', 'senhaadmin2', 'ROLE_ADMIN', 'admin2@org.com', 'Administrador 2');

insert into Usuario(login, senha, papel, email, nome) values
 ('medico1', 'senhamedico1', 'ROLE_USER', 'robertodesouza@gmail.com', 'Roberto de Souza'),
 ('medico2', 'senhamedico2', 'ROLE_USER', 'fernandobarbosa@gmail.com', 'Fernando Barbosa'),
 ('medico3', 'senhamedico3', 'ROLE_USER', 'sebastiaodecarvalho@gmail.com', 'Sebastião de Carvalho'),
 ('medico4', 'senhamedico4', 'ROLE_USER', 'carladesouza@gmail.com', 'Carla de Souza'),
 ('medico5', 'senhamedico5', 'ROLE_USER', 'mariaramos@gmail.com', 'Maria Ramos'),
 ('medico6', 'senhamedico6', 'ROLE_USER', 'andreiadealmeida@gmail.com', 'Andréia de Almeida'),
 ('medico7', 'senhamedico7', 'ROLE_USER', 'luisdasilva@gmail.com', 'Luís da Silva'),
 ('medico8', 'senhamedico8', 'ROLE_USER', 'thiagosilva@gmail.com', 'Thiago Silva'),
 ('medico9', 'senhamedico9', 'ROLE_USER', 'joaosantos@gmail.com', 'João Santos'),
 ('medico10', 'senhamedico10', 'ROLE_USER', 'gabrielasoares@gmail.com', 'Gabriela Soares'),
 ('medico11', 'senhamedico11', 'ROLE_USER', 'alinenascimento@gmail.com', 'Aline Nascimento'),
 ('medico12', 'senhamedico12', 'ROLE_USER', 'camiladealmeida@gmail.com', 'Camila de Almeida'),
 ('medico13', 'senhamedico13', 'ROLE_USER', 'pedrosantana@gmail.com', 'Pedro Santana'),
 ('medico14', 'senhamedico14', 'ROLE_USER', 'guilhermemarques@gmail.com', 'Guilherme Marques'),
 ('medico15', 'senhamedico15', 'ROLE_USER', 'fernandomarques@gmail.com', 'Fernando Marques'),
 ('medico16', 'senhamedico16', 'ROLE_USER', 'vanessaalmeida@gmail.com', 'Vanessa Almeida'),
 ('medico17', 'senhamedico17', 'ROLE_USER', 'lucianabarbosa@gmail.com', 'Luciana Barbosa'),
 ('medico18', 'senhamedico18', 'ROLE_USER', 'josefadesousa@gmail.com', 'Josefa de Sousa'),
 ('medico19', 'senhamedico19', 'ROLE_USER', 'geraldodearaujo@gmail.com', 'Geraldo de Araujo'),
 ('medico20', 'senhamedico20', 'ROLE_USER', 'manoelalves@gmail.com', 'Manoel Alves'),
 ('medico21', 'senhamedico21', 'ROLE_USER', 'rodrigosantana@gmail.com', 'Rodrigo Santana'),
 ('medico22', 'senhamedico22', 'ROLE_USER', 'luciabatista@gmail.com', 'Lúcia Batista'),
 ('medico23', 'senhamedico23', 'ROLE_USER', 'deboracarvalho@gmail.com', 'Débora Carvalho'),
 ('medico24', 'senhamedico24', 'ROLE_USER', 'gabrielateixeira@gmail.com', 'Gabriela Teixeira'),
 ('medico25', 'senhamedico25', 'ROLE_USER', 'sergiorodrigues@gmail.com', 'Sérgio Rodrigues'),
 ('medico26', 'senhamedico26', 'ROLE_USER', 'renatodossantos@gmail.com', 'Renato dos Santos'),
 ('medico27', 'senhamedico27', 'ROLE_USER', 'eduardofernandes@gmail.com', 'Eduardo Fernandes'),
 ('medico28', 'senhamedico28', 'ROLE_USER', 'vitoriadias@gmail.com', 'Vitória Dias'),
 ('medico29', 'senhamedico29', 'ROLE_USER', 'rosanunes@gmail.com', 'Rosa Nunes'),
 ('medico30', 'senhamedico30', 'ROLE_USER', 'soniaalmeida@gmail.com', 'Sônia Almeida');

insert into Usuario(login, senha, papel, email, nome) values
 ('paciente1', 'senhapaciente1', 'ROLE_USER', 'vitordesousa@gmail.com', 'Vítor de Sousa'),
 ('paciente2', 'senhapaciente2', 'ROLE_USER', 'lucascosta@gmail.com', 'Lucas Costa'),
 ('paciente3', 'senhapaciente3', 'ROLE_USER', 'fabiovieira@gmail.com', 'Fábio Vieira'),
 ('paciente4', 'senhapaciente4', 'ROLE_USER', 'sergiodossantos@gmail.com', 'Sérgio dos Santos'),
 ('paciente5', 'senhapaciente5', 'ROLE_USER', 'joaodeoliveira@gmail.com', 'João de Oliveira'),
 ('paciente6', 'senhapaciente6', 'ROLE_USER', 'raquelrodrigues@gmail.com', 'Raquel Rodrigues'),
 ('paciente7', 'senhapaciente7', 'ROLE_USER', 'simonerocha@gmail.com', 'Simone Rocha'),
 ('paciente8', 'senhapaciente8', 'ROLE_USER', 'brunalopes@gmail.com', 'Bruna Lopes'),
 ('paciente9', 'senhapaciente9', 'ROLE_USER', 'larissadacosta@gmail.com', 'Larissa da Costa'),
 ('paciente10', 'senhapaciente10', 'ROLE_USER', 'raquelsoares@gmail.com', 'Raquel Soares');

insert into Medico(CRM, email, especialidade, nome, login, senha, papel) values
 ('942864/AL', 'robertodesouza@gmail.com', 'DERMATOLOGIA', 'Roberto de Souza', 'medico1', 'senhamedico1', 'ROLE_USER'),
 ('184233/PB', 'fernandobarbosa@gmail.com', 'DERMATOLOGIA', 'Fernando Barbosa', 'medico2', 'senhamedico2', 'ROLE_USER'),
 ('995426/RN', 'sebastiaodecarvalho@gmail.com', 'DERMATOLOGIA', 'Sebastião de Carvalho', 'medico3', 'senhamedico3', 'ROLE_USER'),
 ('842615/GO', 'carladesouza@gmail.com', 'DERMATOLOGIA', 'Carla de Souza', 'medico4', 'senhamedico4', 'ROLE_USER'),
 ('152246/SE', 'mariaramos@gmail.com', 'DERMATOLOGIA', 'Maria Ramos', 'medico5', 'senhamedico5', 'ROLE_USER'),
 ('842695/SP', 'andreiadealmeida@gmail.com', 'DERMATOLOGIA', 'Andréia de Almeida', 'medico6', 'senhamedico6', 'ROLE_USER'),
 ('100526/RJ', 'luisdasilva@gmail.com', 'CARDIOLOGIA', 'Luís da Silva','medico7', 'senhamedico7', 'ROLE_USER'),
 ('106539/DF', 'thiagosilva@gmail.com', 'CARDIOLOGIA', 'Thiago Silva','medico8', 'senhamedico8', 'ROLE_USER'),
 ('548924/PR', 'joaosantos@gmail.com', 'CARDIOLOGIA', 'João Santos','medico9', 'senhamedico9', 'ROLE_USER'),
 ('542863/AP', 'gabrielasoares@gmail.com', 'CARDIOLOGIA', 'Gabriela Soares','medico10', 'senhamedico10', 'ROLE_USER'),
 ('826340/SP', 'alinenascimento@gmail.com', 'CARDIOLOGIA', 'Aline Nascimento','medico11', 'senhamedico11', 'ROLE_USER'),
 ('248379/RJ', 'camiladealmeida@gmail.com', 'CARDIOLOGIA', 'Camila de Almeida','medico12', 'senhamedico12', 'ROLE_USER'),
 ('342852/BA', 'pedrosantana@gmail.com', 'ACUPUNTURA', 'Pedro Santana', 'medico13', 'senhamedico13', 'ROLE_USER'),
 ('824915/MG', 'guilhermemarques@gmail.com', 'ACUPUNTURA', 'Guilherme Marques', 'medico14', 'senhamedico14', 'ROLE_USER'),
 ('943825/RS', 'fernandomarques@gmail.com', 'ACUPUNTURA', 'Fernando Marques', 'medico15', 'senhamedico15', 'ROLE_USER'),
 ('334056/PA', 'vanessaalmeida@gmail.com', 'ACUPUNTURA', 'Vanessa Almeida', 'medico16', 'senhamedico16', 'ROLE_USER'),
 ('322841/PR', 'lucianabarbosa@gmail.com', 'ACUPUNTURA', 'Luciana Barbosa', 'medico17', 'senhamedico17', 'ROLE_USER'),
 ('635995/MS', 'josefadesousa@gmail.com', 'ACUPUNTURA', 'Josefa de Sousa', 'medico18', 'senhamedico18', 'ROLE_USER'),
 ('615248/TO', 'geraldodearaujo@gmail.com', 'ENDOCRINOLOGIA_E_METABOLOGIA', 'Geraldo de Araujo', 'medico19', 'senhamedico19', 'ROLE_USER'),
 ('352855/AM', 'manoelalves@gmail.com', 'ENDOCRINOLOGIA_E_METABOLOGIA', 'Manoel Alves', 'medico20', 'senhamedico20', 'ROLE_USER'),
 ('310823/AC', 'rodrigosantana@gmail.com', 'ENDOCRINOLOGIA_E_METABOLOGIA', 'Rodrigo Santana', 'medico21', 'senhamedico21', 'ROLE_USER'),
 ('672331/PE', 'luciabatista@gmail.com', 'ENDOCRINOLOGIA_E_METABOLOGIA', 'Lúcia Batista', 'medico22', 'senhamedico22', 'ROLE_USER'),
 ('005624/MA', 'deboracarvalho@gmail.com', 'ENDOCRINOLOGIA_E_METABOLOGIA', 'Débora Carvalho', 'medico23', 'senhamedico23', 'ROLE_USER'),
 ('511249/RR', 'gabrielateixeira@gmail.com', 'ENDOCRINOLOGIA_E_METABOLOGIA', 'Gabriela Teixeira', 'medico24', 'senhamedico24', 'ROLE_USER'),
 ('955736/RO', 'sergiorodrigues@gmail.com', 'GASTROENTEROLOGIA', 'Sérgio Rodrigues', 'medico25', 'senhamedico25', 'ROLE_USER'),
 ('351885/ES', 'renatodossantos@gmail.com', 'GASTROENTEROLOGIA', 'Renato dos Santos', 'medico26', 'senhamedico26', 'ROLE_USER'),
 ('726115/MT', 'eduardofernandes@gmail.com', 'GASTROENTEROLOGIA', 'Eduardo Fernandes', 'medico27', 'senhamedico27', 'ROLE_USER'),
 ('152944/SC', 'vitoriadias@gmail.com', 'GASTROENTEROLOGIA', 'Vitória Dias', 'medico28', 'senhamedico28', 'ROLE_USER'),
 ('874653/PI', 'rosanunes@gmail.com', 'GASTROENTEROLOGIA', 'Rosa Nunes', 'medico29', 'senhamedico29', 'ROLE_USER'),
 ('426851/CE', 'soniaalmeida@gmail.com', 'GASTROENTEROLOGIA', 'Sônia Almeida', 'medico30', 'senhamedico30', 'ROLE_USER');

insert into Paciente(CPF, dataNascimento, email, genero, nome, telefone, login, senha, papel) values
 ('152.322.641-10', '2001-01-01', 'vitordesousa@gmail.com', 'M', 'Vítor de Sousa', '97355-8221', 'paciente1', 'senhapaciente1', 'ROLE_USER'),
 ('429.215.384-76', '2002-02-02', 'lucascosta@gmail.com', 'M', 'Lucas Costa', '94751-5233', 'paciente2', 'senhapaciente2', 'ROLE_USER'),
 ('442.625.153-88', '2003-03-03', 'fabiovieira@gmail.com', 'M', 'Fábio Vieira', '95524-9653', 'paciente3', 'senhapaciente3', 'ROLE_USER'),
 ('763.248.615-55', '2004-04-04', 'sergiodossantos@gmail.com', 'M', 'Sérgio dos Santos', '96488-0423', 'paciente4', 'senhapaciente4', 'ROLE_USER'),
 ('942.615.320-81', '2005-05-05', 'joaodeoliveira@gmail.com', 'M', 'João de Oliveira', '97102-5124', 'paciente5', 'senhapaciente5', 'ROLE_USER'),
 ('152.342.615-82', '2006-06-06', 'raquelrodrigues@gmail.com', 'F', 'Raquel Rodrigues', '98144-8364', 'paciente6', 'senhapaciente6', 'ROLE_USER'),
 ('156.931.526-84', '2007-07-07', 'simonerocha@gmail.com', 'F', 'Simone Rocha', '94155-7525', 'paciente7', 'senhapaciente7', 'ROLE_USER'),
 ('426.153.286-50', '2008-08-08', 'brunalopes@gmail.com', 'F', 'Bruna Lopes', '94221-8253', 'paciente8', 'senhapaciente8', 'ROLE_USER'),
 ('816.420.301-82', '2009-09-09', 'larissadacosta@gmail.com', 'F', 'Larissa da Costa', '95428-8422', 'paciente9', 'senhapaciente9', 'ROLE_USER'),
 ('516.234.526-81', '2010-10-10', 'raquelsoares@gmail.com', 'F', 'Raquel Soares', '98425-6435', 'paciente10', 'senhapaciente10', 'ROLE_USER');
