DROP DATABASE MTG_Shopkeeper;
CREATE DATABASE IF NOT EXISTS  MTG_Shopkeeper;

Use MTG_Shopkeeper;

CREATE TABLE IF NOT EXISTS USUARIO(
 id_usuario INT AUTO_INCREMENT NOT NULL,
 
 imagen_portada MEDIUMBLOB NOT NULL,
 imagen_avatar MEDIUMBLOB NOT NULL,
 nombre VARCHAR(20) NOT NULL,
 apellido_p VARCHAR(20) NOT NULL,
 apellido_m VARCHAR(20) NOT NULL,
 correo VARCHAR(20) NOT NULL UNIQUE,
 nombre_usuario VARCHAR(20) NOT NULL UNIQUE,
 pass VARCHAR(120) NOT NULL,
 tipo_usuario BOOLEAN NOT NULL,
 
 PRIMARY KEY (id_usuario)
);

CREATE TABLE IF NOT EXISTS BORRADOR(
id_borrador INT AUTO_INCREMENT NOT NULL,
id_usuario INT NOT NULL,
descripcion VARCHAR(300) NOT NULL,
fecha DATE NOT NULL,
video BLOB NOT NULL,
coste_articulo INT (30) NOT NULL,

PRIMARY KEY(id_borrador),
FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario)
);

CREATE TABLE IF NOT EXISTS CARTA(
id_carta INT AUTO_INCREMENT NOT NULL,

imagen MEDIUMBLOB NOT NULL,
tipo_carta VARCHAR(30) NOT NULL,
color VARCHAR(30) NOT NULL,
precio VARCHAR(30) NOT NULL,
expansion VARCHAR(30) NOT NULL,
nombre VARCHAR(30) NOT NULL,
subtipo VARCHAR(30) NOT NULL,
c_mana INT(4) NOT NULL,
defensa INT(4) NOT NULL,
poder INT(4) NOT NULL,
 
 PRIMARY KEY(id_carta)
);

CREATE TABLE IF NOT EXISTS ARTICULO(
id_articulo INT AUTO_INCREMENT NOT NULL,
id_borrador INT NOT NULL,
id_carta INT NOT NULL,

nombre_articulo VARCHAR(80) NOT NULL,
descripcion VARCHAR(300) NOT NULL,
fecha DATE NOT NULL,
video BLOB NOT NULL,
valoracion INT (3) NOT NULL,

PRIMARY KEY (id_articulo),
FOREIGN KEY (id_borrador) REFERENCES BORRADOR(id_borrador),
FOREIGN KEY (id_carta) REFERENCES CARTA(id_carta)
);



CREATE TABLE IF NOT EXISTS COMENTARIO (
id_comentario INT AUTO_INCREMENT NOT NULL,
id_articulo INT NOT NULL,

fecha DATE  NOT NULL,
valoracion INT(3) NOT NULL,
opinion VARCHAR(100) NOT NULL,

PRIMARY KEY (id_comentario),
FOREIGN KEY (id_articulo) REFERENCES ARTICULO(id_articulo)
);


CREATE TABLE IF NOT EXISTS CARRITO(
id_carrito INT AUTO_INCREMENT NOT NULL,
id_articulo INT NOT NULL,

fecha DATE NOT NULL,
nombre_articulo VARCHAR(80) NOT NULL,
coste_articulo INT (30) NOT NULL,

PRIMARY KEY (id_carrito),
FOREIGN KEY (id_articulo) REFERENCES ARTICULO(id_articulo)
);

CREATE TABLE IF NOT EXISTS HISTORIAL(
id_historial INT AUTO_INCREMENT NOT NULL,
id_carrito INT NOT NULL,
id_usuario INT NOT NULL,

nombre_articulo VARCHAR (80) NOT NULL,
fecha_compra DATE NOT NULL,
coste_articulo INT (30) NOT NULL,

PRIMARY KEY (id_historial),

FOREIGN KEY (id_carrito) REFERENCES 	CARRITO(id_carrito),
FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario)
)
