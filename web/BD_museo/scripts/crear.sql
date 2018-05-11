CREATE DATABASE museo CHARACTER SET utf8 COLLATE utf8_general_ci;
USE museo;


CREATE TABLE		Obra
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	fechaobra VARCHAR(5) NOT NULL,
	fechapublicacion DATETIME DEFAULT CURRENT_TIMESTAMP,
	fechamodificacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 	descripcion TEXT NOT NULL,
	titulo VARCHAR(30) NOT NULL,
	autor VARCHAR(50) NOT NULL,
 	imagen VARCHAR(100) NOT NULL,
	vermas VARCHAR(120)
);


CREATE TABLE		Comentario
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	obraref INT NOT NULL,
	fechapublicacion VARCHAR(20) NOT NULL,
	ip VARCHAR(16) NOT NULL,
 	usuario VARCHAR(60) NOT NULL,
	email VARCHAR(80) NOT NULL,
 	comentario TEXT NOT NULL,
	FOREIGN KEY (obraref) REFERENCES Obra(id)
);


CREATE TABLE		PalabrasMalsonantes
(
	palabra VARCHAR(20) PRIMARY KEY
);


CREATE TABLE		DatosWeb
(
	nombreDato VARCHAR(60) PRIMARY KEY,
	valorDato  VARCHAR(120) NOT NULL
);


CREATE TABLE		Coleccion
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	tituloColeccion	VARCHAR(50) NOT NULL,
	descripcion VARCHAR(250) NOT NULL
);


CREATE TABLE		EnColeccion
(
	idColeccion INT	NOT NULL,
	idObra INT NOT NULL,
	FOREIGN KEY (idColeccion) REFERENCES Coleccion(id),
	FOREIGN KEY (idObra) REFERENCES Obra(id)
);



CREATE TABLE        nivelprivilegios
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(30) NOT NULL,
	editardatos BIT DEFAULT 0,
	comentar BIT DEFAULT 0,
	moderar BIT DEFAULT 0,
	gestionmuseo BIT DEFAULT 0,
	gestionpermisos BIT DEFAULT 0

);


CREATE TABLE        usuarios
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	fecharegistro DATETIME DEFAULT CURRENT_TIMESTAMP,
 	nombreusuario VARCHAR(30) NOT NULL,
	password VARCHAR(30) NOT NULL,
	privilegios INT NOT NULL,
	imagen VARCHAR(30),
	FOREIGN KEY (privilegios) REFERENCES nivelprivilegios(id)
);
