-- profe inserte la tabla en csv para practicar la importacion

create table usuario (
	id_usuario serial ,
	email varchar(25),
	primary key (id_usuario)
);
------------------------------
create table post (
	post_id serial ,
	id_usuario_fk int,
	titulo varchar (50),
	fecha date,
	foreign key (id_usuario_fk) references usuario (id_usuario),
	primary key (post_id)
);
-------------------------------
create table comentario(
	id_comentario serial,
	id_usuario_2fk int ,
	id_post_2fk int ,
	texto varchar (225),
	fecha date,
	foreign key (id_usuario_2fk) references usuario(id_usuario),
	foreign key (id_post_2fk) references post (post_id)
);
------------------------------
-- Insertar los siguientes registros. (1 Punto)
-- cree archivo csv y despues lo exporte 
-----------------------------------
COPY usuario(id_usuario,email)
FROM '/Users/victortomasmolinaarias/Desktop/csv/usuario.csv'
DELIMITER ','
CSV HEADER;
select * from usuario
-------------------------------
COPY post(post_id,id_usuario_fk,titulo,fecha)
FROM '/Users/victortomasmolinaarias/Desktop/csv/post.csv'
DELIMITER ','
CSV HEADER;
select * from post
-------------------------------
COPY comentario(id_comentario,id_usuario_2fk,id_post_2fk,texto,fecha)
FROM '/Users/victortomasmolinaarias/Desktop/csv/comentario.csv'
DELIMITER ','
CSV HEADER;
select * from comentario
---------------------------
-- Seleccionar el correo, id y título de todos los post publicados por el usuario 5. (1 punto)
-- seleccionar el correo
select post.post_id,usuario.email ,post.titulo
from usuario 
inner join post 
on usuario.id_usuario = post.id_usuario_fk
where usuario.id_usuario = 5;
------------------------
-- Listar el correo, id y el detalle de todos los comentarios que no hayan sido realizados por el usuario con email usuario06@hotmail.com. (1 Punto)
select comentario.id_comentario, usuario.email ,comentario.texto
from usuario
inner join comentario 
on usuario.id_usuario = comentario.id_usuario_2fk
WHERE not usuario.id_usuario = 6;
-------------------------
-- Listar los usuarios que no han publicado ningún post. (1 Punto)
--------------------------------------
select usuario.email, post.fecha, post.titulo
from post
join usuario
on usuario.id_usuario = post.id_usuario_fk
where 
-- no se me ocurre que colocar :.( quede en blanco con esta pregunta 
----------------------------------------
--Listar todos los post con sus comentarios (incluyendo aquellos que no poseen comentarios). (1 Punto) 
---------------------------------------
select  post.titulo
from post
join usuario
on usuario.id_usuario = post.id_usuario_fk
------------------------------------------

--Listar todos los usuarios que hayan publicado un post en Junio. (2 Puntos)
-------------------------------
select usuario.email, post.fecha
from post
join usuario
on usuario.id_usuario = post.id_usuario_fk
where fecha between '2020-06-01' and '2020-06-30' ;
---------------------------------------------





