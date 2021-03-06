DROP DATABASE IF EXISTS covidtrack;
CREATE DATABASE covidtrack;
USE covidtrack;
CREATE TABLE doctores (
	doc_apellidos VARCHAR (40) NOT NULL,
	doc_nombres VARCHAR (40) NOT NULL,
	doc_email VARCHAR (40) NOT NULL,
	doc_contrasenia VARCHAR (255) NOT NULL,
	doc_celular VARCHAR (9) NOT NULL,
	doc_sexo VARCHAR (20) NOT NULL,
	doc_dni  VARCHAR(9) NOT NULL,
	doc_especialidad VARCHAR(50) NOT NULL,
	#no mostrar celular, ni deni
	#agregar campo colegiatura
	PRIMARY KEY (doc_dni)
);
CREATE TABLE paciente (
	pac_dni VARCHAR(9) NOT NULL,
	pac_apellidos VARCHAR (40) NOT NULL,
	pac_nombres VARCHAR (40) NOT NULL,
	pac_email VARCHAR (40) NOT NULL,
	pac_contrasenia VARCHAR (255) NOT NULL,
	pac_celular VARCHAR (9) NOT NULL,
	pac_direccion VARCHAR (40) NOT NULL,
	pac_nacimiento DATE NOT NULL,
	pac_distrito VARCHAR(40) NOT NULL,
	pac_sexo VARCHAR(20) NOT NULL,
	doc_dni VARCHAR(9) NOT NULL ,
	FOREIGN KEY (doc_dni) REFERENCES doctores (doc_dni),
	PRIMARY KEY (pac_dni)
);

CREATE TABLE formulario (
	form_id int NOT NULL AUTO_INCREMENT,
	pac_dni VARCHAR(9) NOT NULL,
	doc_dni VARCHAR(9) NOT NULL,
	temperatura FLOAT NOT NULL,
	saturacion FLOAT NOT NULL,
	sintomas VARCHAR(300) NOT NULL,
	enfermedades VARCHAR (300) NOT NULL,
	fecha DATE NOT NULL,
	FOREIGN KEY (pac_dni) REFERENCES paciente (pac_dni),
	FOREIGN KEY (doc_dni) REFERENCES doctores (doc_dni),
	PRIMARY KEY(form_id)
	#fecha del sistema
);

CREATE TABLE citas(
	cita_id INT NOT NULL AUTO_INCREMENT,
	fecha DATETIME NOT NULL,
	estado VARCHAR(20) NOT NULL,
	pac_dni VARCHAR (9)NOT NULL,
	doc_dni VARCHAR(9) NOT NULL,
	FOREIGN KEY (doc_dni) REFERENCES doctores (doc_dni),
	FOREIGN KEY (pac_dni) REFERENCES paciente (pac_dni),
	PRIMARY KEY(cita_id)
);
CREATE TABLE mensajes(
	mensaje_id INT NOT NULL AUTO_INCREMENT,
	mensaje VARCHAR(1000) NOT NULL,
	emisor_dni VARCHAR(9) NOT NULL,
	receptor_dni  VARCHAR(9) NOT NULL,
	PRIMARY KEY(mensaje_id)
);