DROP DATABASE IF EXISTS freycenet;

CREATE DATABASE IF NOT EXISTS freycenet;
USE freycenet;

CREATE TABLE IMAGE
(
	IDIMG INT auto_increment,
   IDTYPEMEDIA INT NOT NULL,
   CHEMINIMG TEXT NULL, 
   PRIMARY KEY (IDIMG)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE TYPE_EVENEMENT
(
	IDTYPEEVENT	int auto_increment,
	LIBELLETYPEEVENT CHAR(50),
	PRIMARY KEY (IDTYPEEVENT) 
)ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE EVENEMENT
(
	IDEVENT 		int auto_increment,
	LIBELLEEVENT 	char(30),
	DESCRIPTIF		TEXT,
	PRIMARY KEY (IDEVENT)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE ACTUALITE
(
	IDACTU INT auto_increment,
   IDTYPEMEDIA INT,
   TITREACTU CHAR(30),
   TEXTEACTU TEXT,
   DATEACTU DATE, 
   PRIMARY KEY (IDACTU) 
)ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE ELUCM
(
	IDELU INT auto_increment,
   NOMELU CHAR(30),
   PRENOMELU CHAR(30),
   FONCTIONELU CHAR(70),
   PHOTOELU TEXT 
   , PRIMARY KEY (IDELU)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE NOUVEAUTE
(
	 IDNOUVEAUTE INTEGER(2) auto_increment  ,
   IDTYPEMEDIA INTEGER(2) NOT NULL  ,
   LIBELLENOUVEAUTE CHAR(32) NULL  ,
   DESCRIPTIF TEXT NULL  ,
   DATENOUVEAUTE DATE NULL  
   , PRIMARY KEY (IDNOUVEAUTE)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE USERS
(
IDUSERS INT auto_increment,
   NOM CHAR(30) NULL  ,
   PRENOM CHAR(20) NULL  ,
   LOGIN CHAR(50) NULL  ,
   MDP CHAR(50) NULL  ,
   DROIT BOOL NULL  
   , PRIMARY KEY (IDUSERS)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE TYPE_MEDIA
(
	IDTYPEMEDIA INT NOT NULL,
   LIBELLEMEDIA CHAR(32) NULL, 
   PRIMARY KEY (IDTYPEMEDIA)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE ENTREPRISES
(
	IDENTREPRISES INT auto_increment,
   NOMENTREPRISE CHAR(70) NULL,
   NOMGERANT CHAR(30) NULL,
   CORPSMETIER CHAR(50) NULL  
   , PRIMARY KEY (IDENTREPRISES)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE VIDEO
(
	IDVID INT auto_increment,
   IDTYPEMEDIA INT NOT NULL,
   CHEMINVID TEXT NULL,  
   PRIMARY KEY (IDVID)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE CORRESPONDRE
(
	 IDEVENT INTEGER(2) NOT NULL,
   IDTYPEEVENT INTEGER(2) NOT NULL,  
   PRIMARY KEY (IDEVENT,IDTYPEEVENT) 
)ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE POSSEDER
 (
   IDEVENT INT NOT NULL,
   IDIMG INT NOT NULL,
   PRIMARY KEY (IDEVENT,IDIMG) 
)ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE AJOUTER
 (
   IDUSERS INT NOT NULL,
   IDACTU INT NOT NULL,
   IDIMG INT NOT NULL,
   IDNOUVEAUTE INT NOT NULL,
   PRIMARY KEY (IDUSERS,IDACTU,IDIMG,IDNOUVEAUTE) 
 )ENGINE=INNODB DEFAULT CHARSET=utf8;


 ALTER TABLE IMAGE 
  ADD FOREIGN KEY FK_IMAGE_TYPE_MEDIA (IDTYPEMEDIA)
      REFERENCES TYPE_MEDIA (IDTYPEMEDIA) ;


ALTER TABLE ACTUALITE 
  ADD FOREIGN KEY FK_ACTUALITE_TYPE_MEDIA (IDTYPEMEDIA)
      REFERENCES TYPE_MEDIA (IDTYPEMEDIA) ;


ALTER TABLE NOUVEAUTE 
  ADD FOREIGN KEY FK_NOUVEAUTE_TYPE_MEDIA (IDTYPEMEDIA)
      REFERENCES TYPE_MEDIA (IDTYPEMEDIA) ;


ALTER TABLE VIDEO 
  ADD FOREIGN KEY FK_VIDEO_TYPE_MEDIA (IDTYPEMEDIA)
      REFERENCES TYPE_MEDIA (IDTYPEMEDIA) ;


ALTER TABLE CORRESPONDRE 
  ADD FOREIGN KEY FK_CORRESPONDRE_EVENEMENT (IDEVENT)
      REFERENCES EVENEMENT (IDEVENT) ;


ALTER TABLE CORRESPONDRE 
  ADD FOREIGN KEY FK_CORRESPONDRE_TYPE_EVENEMENT (IDTYPEEVENT)
      REFERENCES TYPE_EVENEMENT (IDTYPEEVENT) ;


ALTER TABLE POSSEDER 
  ADD FOREIGN KEY FK_POSSEDER_EVENEMENT (IDEVENT)
      REFERENCES EVENEMENT (IDEVENT) ;


ALTER TABLE POSSEDER 
  ADD FOREIGN KEY FK_POSSEDER_IMAGE (IDIMG)
      REFERENCES IMAGE (IDIMG) ;


ALTER TABLE AJOUTER 
  ADD FOREIGN KEY FK_AJOUTER_USERS (IDUSERS)
      REFERENCES USERS (IDUSERS) ;


ALTER TABLE AJOUTER 
  ADD FOREIGN KEY FK_AJOUTER_ACTUALITE (IDACTU)
      REFERENCES ACTUALITE (IDACTU) ;


ALTER TABLE AJOUTER 
  ADD FOREIGN KEY FK_AJOUTER_IMAGE (IDIMG)
      REFERENCES IMAGE (IDIMG) ;


ALTER TABLE AJOUTER 
  ADD FOREIGN KEY FK_AJOUTER_NOUVEAUTE (IDNOUVEAUTE)
      REFERENCES NOUVEAUTE (IDNOUVEAUTE) ;

INSERT INTO TYPE_MEDIA
VALUES (1, "IMAGE"),
(2, "VIDEO"),
(3, "ACTUALITE");


INSERT INTO ACTUALITE
VALUES (NULL, "3","titre 1", "Texte 1", "2019/06/03"),
(NULL, "3","titre 2", "Texte 2", "2019/06/01"),
(NULL, "3","titre 3", "Texte 3", "2019/05/24");

INSERT INTO USERS
VALUES (null, "Fargier", "Jean-Marc", "J-MFargier", "d033e22ae348aeb5660fc2140aec35850c4da997", 1);

INSERT INTO IMAGE 
VALUES (null, 1, "photos_paysage/les_Barthes/f0277034.jpg")
(null, 1, "photos_paysage/les_sucs_autour_de_freycenet_la_tour/f0538666.jpg")
(null, 1, "photos_paysage/photos_paysage_freycenet_la_tour/f0436074.jpg")
(null, 1, "photos_paysage/église de la mairie.jpg")


INSERT INTO entreprises
VALUES (null, "entreprises 1", "gérant 1", "Corps métier 1");


#ETC...

