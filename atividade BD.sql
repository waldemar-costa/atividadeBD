CREATE SCHEMA IF NOT EXISTS projetoata;

USE projetoata;

SHOW TABLES;

DROP TABLE IF EXISTS projetoata.professor;
DROP TABLE IF EXISTS projetoata.projeto;

CREATE TABLE IF NOT EXISTS
	projetoata.professor
(
	id_prof INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(200) NOT NULL,
    formacao VARCHAR(200) NOT NULL,
    titulacao VARCHAR(200),
    PRIMARY KEY(id_prof)
);

CREATE TABLE IF NOT EXISTS
	projetoata.projeto
(
	id_proj INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(200)NOT NULL,
    professor INT NOT NULL,
    PRIMARY KEY(id_proj),
    FOREIGN KEY(professor)
		REFERENCES projetoata.professor(id_prof)
);

CREATE TABLE IF NOT EXISTS
	projetoata.ata
(
	id_ata INT NOT NULL AUTO_INCREMENT,
    assunto VARCHAR(200)NOT NULL,
    dataproj DATE,
    professor INT NOT NULL,
    PRIMARY KEY(id_ata),
    FOREIGN KEY(professor)
		REFERENCES projetoata.professor(id_prof)
);
 CREATE TABLE IF NOT EXISTS
	projetoata.projeto_ata
(
	ata INT NOT NULL,
    professor INT NOT NULL,
    PRIMARY KEY(ata, professor),
    FOREIGN KEY (ata)
		REFERENCES projetoata.ata(id_ata),
	FOREIGN KEY(professor)
		REFERENCES projetoata.professor(id_prof)
);
CREATE TABLE IF NOT EXISTS
	projetoata.aluno
(
	id_aluno INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(200) NOT NULL,
    cpf INT NOT NULL,
    curso INT NOT NULL,
    PRIMARY KEY(id_aluno)
);
CREATE TABLE IF NOT EXISTS
	projetoata.ata_aluno
(
	aluno INT NOT NULL,
    ata INT NOT NULL,
    PRIMARY KEY(aluno,ata),
    FOREIGN KEY(aluno)
		REFERENCES projetoata.aluno(id_aluno),
	FOREIGN KEY(ata)
		REFERENCES projetoata.ata(id_ata)
);
CREATE TABLE IF NOT EXISTS
	projetoata.encaminhamento
(
	id_enc INT NOT NULL AUTO_INCREMENT,
    assunto VARCHAR(200) NOT NULL,
    tarefa VARCHAR(200) NOT NULL,
    aluno INT NOT NULL,
    PRIMARY KEY(id_enc),
    FOREIGN KEY(aluno)
		REFERENCES projetoata.aluno(id_aluno)
    
);
CREATE TABLE IF NOT EXISTS
	projetoata.ata_encaminhamento
(
	ata INT NOT NULL,
    encaminhamento INT NOT NULL,
    PRIMARY KEY(ata, encaminhamento),
    FOREIGN KEY(ata)
		REFERENCES projetoata.ata(id_ata),
	FOREIGN KEY(encaminhamento)
		REFERENCES projetoata.encaminhamento(id_enc)
);



