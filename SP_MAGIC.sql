use mtg_shopkeeper;



INSERT INTO USUARIO(imagen_portada, imagen_avatar, nombre, apellido_p, apellido_m, correo, nombre_usuario, pass, tipo_usuario) 
VALUES("dasdassda", "dasasfa", 'pedsro', 'rarsez', 'resrito', "hol2i@hol", "stabu", sha2('1232a', 256), 1);



Delimiter //

CREATE PROCEDURE LOGIN( IN SELECCION INT(30) , IN SPnombre_usuario VARCHAR(20), IN SPPASS VARCHAR(120))

BEGIN
CASE
WHEN SELECCION =0 THEN
SELECT imagen_portada, imagen_avatar, nombre, apellido_p, apellido_m, correo, nombre_usuario, pass from USUARIO W
WHERE nombre_usuario = SPnombre_usuario and pass= sha2(SPPASS, 256);

END CASE;

END//