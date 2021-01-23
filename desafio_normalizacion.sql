--Creacion base de datos
CREATE DATABASE libreria;

--Entrar a la base de datos
\c libreria

--Creacion de tablas.

CREATE TABLE Libro(
codigo INT PRIMARY KEY,
nombre_libro VARCHAR(20)
);

CREATE TABLE Autor(
id_autor INT PRIMARY KEY,
nombre_autor VARCHAR(40)
);

CREATE TABLE Editorial(
id_editorial INT PRIMARY KEY,
nombre_editorial VARCHAR(30)
);

CREATE TABLE Autor_Libro(
id_autor INT REFERENCES Autor(id_autor),
codigo_libro INT REFERENCES Libro(codigo)
);

CREATE TABLE Editorial_Libro(
id_editorial INT REFERENCES Editorial(id_editorial),
id_libro INT REFERENCES Libro(codigo)
);

CREATE TABLE Lector(
id_lector SERIAL PRIMARY KEY,
nombre VARCHAR(20)
);

CREATE TABLE Prestamos(
id_prestamo SERIAL PRIMARY KEY,
codigo_libro INT REFERENCES Libro(codigo),
id_lector INT REFERENCES Lector(id_lector),
fecha_devolucion DATE CHECK(fecha_devolucion < CURRENT_DATE)
);
