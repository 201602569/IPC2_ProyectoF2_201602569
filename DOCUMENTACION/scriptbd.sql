create database redsocialfase1;
use redsocialfase1;


Create table USUARIO(
id_usuario int primary key,
nombre_usuario varchar(75),
correo varchar(100),
fecha_nac date,
contraseña varchar(75),
nickname varchar(75),
karma int

);

Create table APLICACION(
id_proyecto int primary key,
nombre_proyecto varchar(100),
fecha_inicio date,
fecha_fin date,
precio numeric(12,2)

);

Create table PUBLICACION(
id_publicacion int primary key,
usuario int,
texto_publicacion text,
fecha_publicacion date,
id_aplicacion int

);
Alter table PUBLICACION add constraint fk1 foreign key (usuario) references USUARIO(id_usuario);
Alter table PUBLICACION add constraint fk2 foreign key (id_aplicacion) references APLICACION(id_proyecto);



Create table COMENTARIO(
id_comentario int primary key,
publicacion int,
usuario_comentario int,
comentario text,
id_aplicacion int
);

Alter table COMENTARIO add constraint fk3 foreign key (usuario_comentario) references USUARIO(id_usuario);
Alter table COMENTARIO add constraint fk4 foreign key (publicacion) references PUBLICACION(id_publicacion);

Create table TAREA (
id_tarea int primary key,
nombre_tarea varchar(100),
descripcion text,
fecha_inici date,
fecha_final date

);

Create table  ASIGNAR_TAREA(
id_asignaciontarea int primary key,
aplicacion int,
tarea int
);

Alter table ASIGNAR_TAREA add constraint fk5 foreign key (aplicacion) references APLICACION(id_proyecto);
Alter table ASIGNAR_TAREA add constraint fk6 foreign key (tarea) references TAREA(id_tarea);

Create table HABILIDAD(
id_habilidad int primary key,
nombre_habilidad varchar(75)

);


Create table ASIGNAR_HABILIDAD_TAREA(
id_AT int primary key,
id_asignaciontarea int,
id_habilidad2 int

);

Alter table ASIGNAR_HABILIDAD_TAREA add constraint fk7 foreign key (id_asignaciontarea) references ASIGNAR_HABILIDAD_TAREA(id_AT);
Alter table ASIGNAR_HABILIDAD_TAREA add constraint fk8 foreign key (id_habilidad2) references HABILIDAD(id_habilidad);


Create table ASIGNAR_USUARIO_TAREA (
id_aut int primary key,
id_usu int,
id_habili int

);

Alter table ASIGNAR_USUARIO_TAREA add constraint fk9 foreign key (id_usu) references USUARIO(id_usuario);
Alter table ASIGNAR_USUARIO_TAREA add constraint fk10 foreign key (id_habili) references HABILIDAD(id_habilidad);

Create table ASOCIACION (
id_asociacion int primary key,
nombre_asociacion varchar(100),
objetivo text,
logo varchar(150),
admin_asociacion int

);

Alter table ASOCIACION  add constraint f11 foreign key (admin_asociacion) references USUARIO(id_usuario);

Create table ASIGNAR_ASOCIACION(
cod_asignaciona int primary key,
asociacion varchar(100),
usuario_asignado int

);
Alter table ASOCIACION  add constraint f12 foreign key (admin_asociacion) references USUARIO(id_usuario);
Alter table ASOCIACION  add constraint f13 foreign key (asociacion) references ASOCIACION(id_asociacion);



Create table MENSAJE (
id_mensaje int primary key,
emisor int,
receptor int,
mensaje text,
fecha_msj date

);
Alter table MENSAJE add constraint f14 foreign key (emisor) references USUARIO(id_usuario);
Alter table MENSAJE add constraint f15 foreign key (receptor) references USUARIO(id_usuario);


Create table INVITACION(
cod_invitacion int primary key,
usuario_envia int,
usuario_recibe int,
estado varchar(10)

);
Alter table INVITACION add constraint f16 foreign key (usuario_envia) references USUARIO(id_usuario);
Alter table INVITACION add constraint f17 foreign key (usuario_recibe) references USUARIO(id_usuario);
