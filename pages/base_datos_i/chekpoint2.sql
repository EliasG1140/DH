-- CASO DE ESTUDIO: DHTube
-- 1. Listar todos los usuarios cuyo nombre comience con la letra “a”.
SELECT idUsuario, nombre FROM usuario WHERE nombre LIKE "a%";

-- 2. Listar todos los usuarios que no hayan cargado el email
SELECT idUsuario, nombre, email FROM usuario WHERE email IS NULL;

-- 3. Mostrar todos los canales creados entre el 01/04/2021 y el 01/06/2021.
SELECT idCanal, nombre, fechaCreacion FROM canal WHERE fechaCreacion BETWEEN "2021/04/01" and "2021/06/01";

-- 4. Listar los 10 usuarios más jóvenes.
SELECT idUsuario, nombre, fechaNacimiento FROM usuario ORDER BY fechaNacimiento DESC LIMIT 10;

-- 5. Mostrar todas las playlists que sean privadas.
SELECT idPlaylist, nombre, privado FROM playlist WHERE privado = 1;

-- 6. Listar el top 5 de videos con más cantidad de likes.
SELECT titulo, cantidadLikes  FROM video limit 5;

-- 7. Insertar un usuario con los siguientes datos:
INSERT INTO usuario(nombre, email, password, fechaNacimiento, codigoPostal, pais_idPais, avatar_idAvatar)  VALUES ('Juan Jose Batzal', 'jjbatzal@gmail.com', 'jj1597', '2000-01-04', 1429, 9, 85);

-- 8. Generar un listado con todos los usuarios que hayan nacido en el año 2000.
SELECT * FROM usuario WHERE fechaNacimiento BETWEEN "2000/00/00" and "2000/12/31";

-- 9. Listar todos los países ordenados alfabéticamente y su nombre en mayúsculas.
SELECT UPPER(nombre) as Nombre FROM pais;

-- 10.Listar todos los videos que posean más de 500.000 reproducciones.
SELECT titulo, cantidadReproducciones AS reproducciones FROM video HAVING reproducciones >= 500000;

-- 11. Generar un reporte de todos los videos publicados en el año 2020 que sean privados y que posean más de 100 dislikes.
SELECT titulo, privado, cantidadDislikes, fechaPublicacion FROM video WHERE fechaPublicacion LIKE "2020%" AND privado = true AND cantidadDislikes > 100;

-- 12.Por error hemos cargado mal los datos de Juan Jose Batzal. La fecha de nacimiento no era 01/04/2000, sino 04/01/2000. Ahora debemos crear y
-- ejecutar la sentencia necesaria para realizar la modificación.
UPDATE  usuario SET fechaNacimiento= '2000-01-04' WHERE nombre ="Juan Jose Batzal" AND fechaNacimiento= '2000-04-01';

-- 13.Listar todos los usuarios cuyo password contenga menos de 5 caracteres (pista: ver la función length()).
SELECT nombre, password FROM usuario WHERE length(password)<5;

-- 14. Generar un reporte de los usuarios. En la consulta mostrar los siguientes
-- títulos: ID, Nombre, E-mail, Fecha de Nacimiento,Edad Codigo de Pais
SELECT idUsuario AS ID, nombre AS Nombre, email AS "E-mail", fechaNacimiento AS "Fechas de Nacimiento", (2021)-year(fechaNacimiento) as Edad, Pais_idPais AS "Codigo del Pais" FROM usuario;

-- 15.Listar el video de mayor tamaño.
SELECT titulo, tamanio FROM video WHERE tamanio order by tamanio desc limit 1;

-- 16.Generar un reporte de las últimas 10 reacciones, listando la fecha, el código de reacción, el ID de usuario y el video.
SELECT * FROM reaccion ORDER BY fecha DESC LIMIT 10 ;

-- 17. Listar todos los videos que tengan menos de 100.000 reproducciones y 100 o más likes.
SELECT idVideo , titulo, cantidadReproducciones FROM video WHERE cantidadReproducciones < 100000 AND cantidadLikes >= 100 ;

-- 18. Mostrar todos los videos que incluyan la palabra “FAN” dentro de su descripción.
SELECT idVideo , titulo FROM video WHERE descripcion LIKE "%FAN%" ;

-- 19.Generar un listado de los usuarios cuyos passwords sean aquellos que no
-- satisfacen las políticas de seguridad de la empresa. Estos son los que se
-- corresponden con: 123, 1234, 12345, abc, clave, password.
SELECT idUsuario , nombre, password FROM usuario WHERE password IN (123 , 1234 , 12345,"abc","clave","password") ;

-- 20. Eliminar el avatar cuyo nombre sea avDhTube.
DELETE FROM avatar WHERE nombre = "avDhTube";
