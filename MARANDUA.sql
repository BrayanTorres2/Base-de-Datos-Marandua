
create database MARANDUA;
use MARANDUA;


--------TABLA UBICACION STAND --------

create table ubicacion_stand (
cod_bs int primary key identity  not null,
numero_bs varchar (15) unique not null
);
---------TABLA CATEGORIA -----------
create table categoria (
cod_cat int primary key identity not null,
nomb_cat varchar (30) unique not null,
cod_bs int,
foreign key (cod_bs) references ubicacion_stand (cod_bs)
);
---------TABLA PRODUCT0-----------
create table producto (
cod_prod int primary key not null,
nom_prod varchar (20) not null,
cod_cat int,
foreign key (cod_cat) references categoria (cod_cat),
sto_prod int not null,
pre_prod int not null
);

--------- TABLA CARGO --------

create table cargo (
cod_car int primary key identity not null,
nom_car varchar (30) unique not null
);


----------TABLA EPS -------------
 
 create table eps (
 cod_eps int primary key identity not null,
 nomb_eps varchar (30) unique not null,
 tel_eps varchar (15) not null,
 dir_eps varchar (40) null
 );
 
-------------TABLA EMPLEADO---------
create table empleado (         --inicie/vaya en 2 en 2
cod_emp int primary key identity not null,
id_emp bigint unique not null,
tid_emp varchar (30) not null,
nom_emp varchar (30) not null,
ape_emp varchar (30) not null,
tel_emp varchar (15) null,
cel_emp varchar (15) not null,
dir_emp varchar (40) not null,
cod_car int not null,
foreign key (cod_car ) references cargo (cod_car),
cod_eps int not null
foreign key (cod_eps) references eps (cod_eps)
);
--------TABLA LOGIN --------------
create table login (
cod_us int primary key identity (1,1)not null,
nombre varchar (30)unique not null,
contraseña varchar(30) not null,
cod_emp int unique not null,
foreign key (cod_emp) references empleado (cod_emp),
cod_car int not null
foreign key (cod_car) references cargo (cod_car)
);
----TABLA PROVEEDOR ------

create table proveedor (
cod_prov int primary key identity (1,1) not null,
nom_prov varchar (30)unique not null,
tel_prov varchar (15)not null,
dir_prov varchar (40) not null
);

--------TABLA FACTURA COMPRA -------
create table factura_compra (
cod_fc int primary key not null,
fec_fc varchar (20) not null,
cod_emp int not null,
foreign key (cod_emp) references empleado (cod_emp),
cod_prov int not null
foreign key (cod_prov)references proveedor (cod_prov)
);  
------ TABLA DETALLE FACTURA COMPRA -----

create table detalle_factura_compra (
cod_dfc int primary key not null,
can_dfc int not null,
cod_fc int not null,
foreign key (cod_fc) references factura_compra (cod_fc),
cod_prod int not null,
foreign key (cod_prod) references producto (cod_prod) 
);
-------TABLA CLIENTE ----------
create table cliente (
cod_clie int primary key identity (1,1) not null,
id_clie bigint unique not null,
tid_clie varchar (30) not null,
nom_clie varchar (30) not null,
ape_clie varchar (30) not null,
cel_clie varchar (15) null
);


------TABLA FACTURA VENTA ------
create table factura_de_venta (
cod_fv int primary key not null,
fec_fv varchar (20) not null,
cod_clie int not null,
foreign key (cod_clie) references cliente (cod_clie),
cod_emp int not null,
foreign key (cod_emp) references empleado (cod_emp)
)
------TABLA DETALLE FACTURA VENTA ------
create table detalle_factura_de_venta (
cod_dfv int primary key not null,
can_dfv int not null,
cod_prod int not null,
foreign key (cod_prod) references producto (cod_prod),
cod_fv int not null,
foreign  key (cod_fv) references factura_de_venta (cod_fv)
);
--AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA--------------
---detalle----


create trigger DIS_detalle_factura_de_venta_insertar
  on detalle_factura_de_venta
  for insert
  as
   declare @sto_prod int
   select @sto_prod= sto_prod from producto
		 join inserted
		 on inserted.cod_prod1=producto.cod_prod
		 where producto.cod_prod=inserted.cod_prod1
  if (@sto_prod>=(select can_dfv from inserted))
    update producto set sto_prod=sto_prod-inserted.can_dfv
     from producto
     join inserted
     on inserted.cod_prod1=producto.cod_prod
     where cod_prod=inserted.cod_prod1
  else
  begin
    raiserror ('Hay menos productos en stock de los solicitados para la venta', 16, 1)
    rollback transaction
  end
  insert into producto values ()
  select*  from producto 
  select * from detalle_factura_de_venta
  select*from factura_de_venta
  insert into detalle_factura_de_venta values (3,101,1,1)
--  ------TABLA INVENTARIO--------
--create table inventario (
--cod_inv int primary key not null,
--fech_inv varchar (20)not null,
--cod_prod int not null,
--foreign key (cod_prod)references producto (cod_prod)
--);
  
------INSERTAR UBICACION STAND ----
insert into ubicacion_stand values (1);
insert into ubicacion_stand values (2);
insert into ubicacion_stand values (3);
-------INSERTAR CATEGORIA ------
insert into categoria values ('LIBROS',1);
insert into categoria values ('CUADERNOS',2);
insert into categoria values ('CATULINAS',3);
SELECT *FROM CATEGORIA
-------INSERTAR PRODUCTO ------------
insert into producto values (1,'CUADERNO',1,30,1500);
insert into producto values (2,'LAPIZ',2,15,1500);

SELECT * FROM PRODUCTO

------------INSERTAR CARGO ----------------

insert into cargo values ('ADMINISTRADOR')
insert into cargo values ('EMPLEADO')

select * from cargo;

------INSERTAR EPS ------
 insert into eps values ('SALUD TOTAL',7931901,'CR 23 Y # 2 Sur');
 insert into eps values ('CAFE SALUD',7842947,'CALLE 8 P # 19 Norte');
 insert into eps values ('SALUD COOP',3250152,'CALLE 56 K # 20 Norte');
 
-----INSERTAR EMPLEADO ------
insert into empleado values (107885,'CEDULA','FALCA','RODRIGUEZ',7922901,3167043267,'CR 27 C # 71 I 31Sur',2,1);
insert into empleado values (107785,'CEDULA','JAMESS','RODRIGUEZ',7922901,3167043267,'CR 27 C # 71 I 31Sur',1,3);


select * from empleado
----INSERTAR LOGIN ----
insert into login values ('FALCAO',123,1,2);
insert into login values ('JAMES',321,2,1);
 select * from login
 SELECT * FROM EMPLEADO
-----INSERTAR PROVEEDOR -----
insert into proveedor values ('NORMA.LTD',7825943,'CALLE 25 K # 26Sur');
insert into proveedor values ('JUSTUS ',7628301,'CR 27 C # 23 Sur') ;
insert into proveedor values (' SCRIBE ',7983486,'CALLE 65 Ñ # 8 Sur');
SELECT * FROM PROVEEDOR
 ------INSERTAR FACTURA_COMPRA ------
insert into factura_compra values (80,'05-09/2016',1,1);
insert into factura_compra values (81,'12-09/2016',1,2);
insert into factura_compra values (82,'25-09/2016',2,1);
SELECT * FROM factura_de_venta
--------INSERTAR DETALLE FACTURA COMPRA ----------
insert into detalle_factura_compra values (90,20,80,1);
insert into detalle_factura_compra values (91,12,81,2);
insert into detalle_factura_compra values (92,15,82,1);

------INSERTAR CLIENTE ---------
insert into cliente values (1000725533,111,'CERQUERA','LASSO','3147046228');
insert into cliente values (2234525,112,'ANDRES','LONDOÑO','3169243267');
insert into cliente values (78025279,111,'MAICOL','REYES','31934431242');



------INSERTAR FACTURA VENTA -----
insert into factura_de_venta values (100,'01-09/2016',1,1);



-----INSERTAR DETALLE_FACTURA_VENTA-----
insert into detalle_factura_de_venta values (200,2,1,100);


------INSERTAR INVENTARIO ------
--insert into inventario values (500,'13-09/2016',1);
--insert into inventario values (501,'10-08/2016',2);
--BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB-------------
SELECT * FROM EPS
-------ACTUALIZAR UBICACION STAND -----
update ubicacion_stand set numero_bs = 4 where cod_bs=60 ;

-------ACTUALIZAR CATEGORIA---------
update categoria set nomb_cat = 'LIBROS X' where cod_cat=71; 
update categoria set cod_bs = 62 where cod_cat= 71;
update categoria set cod_bs = 61,nomb_cat ='MARCADORES' where cod_cat =73;

-------ACTUALIZAR DATOS-------------
update producto set nom_prod ='BLOCK' where cod_prod= 001;
update producto set sto_prod=9 where cod_prod =001;
update producto set pre_prod=2000 where cod_prod =001; 

-----------ACTUALIZAR CARGO ---------------
update cargo set nom_car = 'GERENTE' where cod_car = 11;

-------ACTUALIZAR -------------

update tipo_identificacion set nomb_tid = 'CEDULA CIUDADANIA' where cod_tid=111;

 -------ACTUALIZAR EPS -------
 update eps set nomb_eps='SALUDTOTAL' where cod_eps= 50;
 update eps set tel_eps = 7422905 where cod_eps=50 ;
 update eps set dir_eps = 'CALLE 23 t # 22 Sur' where  cod_eps=50;

-----ACTUALIZAR EMPLEADO ----
update empleado set nom_emp = 'FALCAO' where cod_emp= 21; 
update empleado set ape_emp = 'GARCIA' where cod_emp = 21;
update empleado set id_emp = 2899458 where cod_emp = 21;

-----ACTUALIZAR PROVEEDOR -------
update proveedor set nom_prov = 'NORMA' where cod_prov = 31; 
update proveedor set tel_prov = 3167043267 where cod_prov = 31;
update proveedor set dir_prov = 'CR 5 P # 24 Sur 'where cod_prov =31;  

------ACTUALIZAR ------
update factura_compra set fec_fc='04-09-2016',cod_emp=22,cod_prov=31 where cod_fc=80;

--------ACTUALIZAR DETALLE FACTURA COMPRA ---------
update detalle_factura_compra set can_dfc=10,cod_fc=82,cod_prod=3 where cod_dfc =90;

------ACTUALIZAR CLIENTE ---------
update cliente set nom_clie='ANDRES' where cod_clie=41;
update cliente set nom_clie='CERQUERA'where cod_clie=41;
update cliente set cel_clie='3167345267'where cod_clie=41;

------ACTUALIZAR FACTURA VENTA ------
update factura_venta  set fec_fv='29-08/2016',cod_clie=42,cod_emp= 22 where cod_fv=100 ;

------ACTUALIZAR-----
update detalle_factura_venta set can_dfv= 8,cod_prod=2,cod_fv=103,cod_emp=23 where cod_dfv=200 ;

-----ACTUALIZAR INVENTARIO -----
update inventario set fech_inv='10-08/2016' where cod_inv=501;

-------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------
---------------------- X             X ------------------------------------------------------------------------------------------
----------------------                 -------------------------------------------------------------------------------------------
----------------------      MMMMM      -----------------------------------------------------------------------------------------------------
----------------------                 -----------------------------------------------------------------------------------------
---------------------      -----     ---------------------------------------------------------------------------------------------------
----------------                         ----------------------------------------------------------------------------------------------
-----------------                        -----------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------

-------PROCEDIMIENTO ALMACENADO UBICACION STAND -------

-------INSERTAR ------
create proc sp_insertar_ubicacion_stand 
@codigo_ubicacion_stand int,
@numero_ubicacion_stand int
as
insert into ubicacion_stand values (@codigo_ubicacion_stand,@numero_ubicacion_stand );
exec sp_insertar_ubicacion_stand 63,5;
 
-----ACTUALIZAR ----
create procedure sp_actualizar_ubicacion_stand
@codigo_ubicacion_stand int,
@numero_ubicacion_stand int
as 
update ubicacion_stand set cod_bs=@codigo_ubicacion_stand,numero_bs=@numero_ubicacion_stand where cod_bs=@codigo_ubicacion_stand ;
exec sp_actualizar_ubicacion_stand 63,6;

---------GENERAR VISTA -----
create view vista_ubicacion_stand as select cod_bs,numero_bs from ubicacion_stand;

-----DISPARADOR O TRIGGER -----
create trigger trigger_ubicacion_stand
on ubicacion_stand
for insert 
as 
declare 
------INNER JOIN --------

--select * from TABLA1 inner join TABLA2 on TABLA1.COD_TABLA = TABLA2.COD_TABLA; --

-----ELIMINAR UN REGISTRO------
delete from ubicacion_stand where cod_bs =60;
-----ELIMINAR TODA LA TABLA -----
truncate table ubicacion_stand;
-----ELIMINAR UNA COLUMNA (*) ----
alter table ubicacion_stand drop column numero_bs;

-----ALTERAR TABLA------
alter table ubicacion_stand add numero_bs (16) ;
-----ALTERAR UN CAMPO -----
alter table ubicacion_stand alter column numero_bs varchar (17);

------BUSCAR DATOS COMPLETOS ----
select * from ubicacion_stand;
------BUSCAR DATOS ESPECIFICOS ----
select cod_bs,numero_bs from ubicacion_stand;
select cod_bs,numero_bs from ubicacion_stand where cod_bs =60;

-------CONSULTA CON OPERADORES------
select cod_bs,numero_bs from ubicacion_stand where cod_bs >=62;

-------CONSULTA LOGICA-----
select cod_bs,numero_bs from ubicacion_stand where cod_bs = 63 or numero_bs=6; 

------ALIAS-----
select cod_bs as CODIGO,numero_bs as NUMERO from ubicacion_stand;

-----FUNCIONES AGREGADO ----
select COUNT (cod_bs) as NUMERO_REGISTRO from ubicacion_stand;
select MAX (numero_bs) as VALOR_MAXIMO from ubicacion_stand;
select MIN (numero_bs) as VALOR_MINIMO from ubicacion_stand;

------ORDENAR DATOS FORMA ASCENDENTE O DESCENDENTE --------
select * from ubicacion_stand order by numero_bs asc;
select * from ubicacion_stand order by cod_bs desc; 

-------CONSULTA LIKE ----

----INICIAL----
select * from ubicacion_stand where numero_bs like '4%';
----FINAL---
select * from ubicacion_stand where cod_bs like '%3';

---------------------------------------------------------------------
----------------------------------------------------------------------


-------PROCEDIMIENTO ALMACENADO ------

------INSERTAR ------
create procedure sp_insertar_categoria
@codigo_categoria int,
@nombre_categoria varchar (30),
@codigo_ubicacion_stand int
as
insert into categoria values (@codigo_categoria,
@nombre_categoria,@codigo_ubicacion_stand);
exec sp_insertar_categoria 74,'PAPEL',63;

-----ACTUALIZAR------
create proc sp_actualizar_categoria
@codigo_categoria int,
@nombre_categoria varchar (30),
@codigo_ubicacion_stand int
as 
update categoria set nomb_cat=@nombre_categoria,cod_bs=@codigo_ubicacion_stand where cod_cat =@codigo_categoria;
exec sp_actualizar_categoria 74,'CARTULINA',62;

---CREAR VISTAS
create view vista_categoria as select cod_cat,nomb_cat,cod_bs from categoria;

------DISPARADORES O TRIGGER ----
create trigger trigger_categoria
on categoria 
for insert 
as 
------INNER JOIN ----
--select * from TABLA1 inner join TABLA2 on TABLA1.COD_TABLA = TABLA2.COD_TABLA; --

----ELIMINAR UN REGISTRO -----
delete from categoria where cod_cat=71;
----ELIMINAR TODA LA TABLA------
truncate table categoria;
-----ELIMINAR COLUMNA (*)----
alter table categoria drop column nomb_cat;

---------ALTERAR TABLA ----
alter table categoria add nomb_cat varchar (32);
---------ALTERAR UN CAMPO----
alter table categoria alter column nomb_car varchar (29);

-------BUSCAR DATOS COMPLETOS -----
select * from categoria;
--------BUSCAR DATOS ESPECIFICOS -----
select cod_cat,nomb_cat,cod_bs from categoria

select cod_cat,nomb_cat from categoria where cod_cat=71;
select cod_cat ,nomb_cat,cod_bs from categoria where nomb_cat = 'CUADERNOS';

-----CONSULTA CON OPERADORES -----
select cod_cat,nomb_cat,cod_bs from categoria where cod_bs >=62;

-------CONSULTA LOGICA-----
select cod_cat,nomb_cat,cod_bs from categoria where cod_bs = 62 and nomb_cat ='CARTULINA';

-------ALIAS -----
select cod_cat as CODIGO,nomb_cat as CATEGORIA ,cod_bs as CODIGO_UBICACION from categoria;

-------FUNCIONES AGREGADO -------
select COUNT (nomb_cat) as NUMERO_REGISTRO from categoria;
select MAX (cod_cat) as VALOR_MAXIMO from categoria;
select MIN (cod_bs) as VALOR_MINIMO from categoria;

-----ORDENAR FORMA ASCENDENTE O DESCENDENTE -----
select * from categoria order by nomb_cat asc;
select * from categoria order by cod_cat desc;

-----CONSULTA LIKE-----

-----INICIAL ----
select * from categoria where nomb_cat like 'C%';
------FINAL-------
select * from categoria where cod_cat like '%2';
------CONTENGA LETRA -----
select * from categoria where nomb_cat like '%A%';
------INICIE LETRA -----
select * from categoria where nomb_cat like 'C%________';
------FINALICE LETRA-----
select * from categoria where nomb_cat like '_________%S';

-----------------------------------------------------------------
------------------------------------------------------------------


-------PROCEDIMEINTOS ALAMCENADOS PRODUCTO --------

---INSERTAR------
create proc sp_insertar_producto
@codigo_producto int,
@nombre_producto varchar (20),
@stock_producto int,
@precio_producto int 
as
insert into producto values (@codigo_producto,@nombre_producto,@stock_producto,@precio_producto)
exec  sp_insertar_producto 006,'CARTON PAJA',6,150;

---ACTUALIZAR--------
create proc sp_actualizar_producto
@codigo_producto int,
@nombre_producto varchar (20),
@stock_producto int,
@precio_producto int
as 
update producto set nom_prod =@nombre_producto,sto_prod=@stock_producto,pre_prod= @precio_producto where cod_prod=@codigo_producto
exec sp_actualizar_producto 006,'CARTON MADERA',6,151      

------GENERAR VISTA -------
create view  VISTA_PRODUCTO as select cod_prod,nom_prod,sto_prod,pre_prod from producto ; 

------DISPARADORES O TRIGGER -----
create trigger TRIGGER_PRODUCTO
on producto 
for insert 
as
 declare @stock_producto int
 select @stoc = cod_stoc from prodcuto
   join insserted
   on inserted.cod_stoc=libros.procuto.codigo
   where libros.codigo =inserted.codigoproducto
   
   if (@stock_producto>=

--INNER JOIN---

--SINTAXIS from tabla 1 inner join tabla 2 on tabla 1 atributo tabla 2 atributos 

------ELIMINAR UN REGISTRO ----------------
delete from producto where cod_prod=001;

------ELIMINAR TODA LA TABLA---------------
truncate table producto;

------ELIMINAR UNA COLUMNA ( *) --------
alter table producto drop column pre_prod;

------ALTERAR TABLA ------
alter table producto add pres_prod bigint;
------ALTERAR UN CAMPO -----------
alter table producto alter column nom_prod  varchar (25);

------BUSCAR DATOS COMPLETOS-------
select * from producto;
------BUSCAR DATOS ESPECIFICOS--------
select cod_prod,nom_prod from producto; 

select cod_prod,nom_prod from producto where cod_prod=001; 
select cod_prod,nom_prod,sto_prod,pre_prod from producto where nom_prod ='CUADERNO';

------CONSULTAR CON OPERADORES -------
select nom_prod,pre_prod from producto where pre_prod >=500;  

------CONSULTA LOGICA ----------------
select cod_prod,nom_prod,pre_prod from producto where nom_prod = 'CUADERNO' and cod_prod =001; 

------ALIAS -----
select cod_prod as CODIGO,nom_prod as NOMBRE,sto_prod as CANTIDAD,pre_prod as PRECIO from producto; 

-----CALCULAR LAS COLUMNAS ------
select cod_prod,nom_prod,pre_prod,sto_prod, (pre_prod*sto_prod) as VALOR from producto; 

-----FUNCIONES AGREGADO ------
select AVG (pre_prod) as VALOR_PROMEDIO from producto; 
select COUNT (pre_prod) as NUMERO_REGISTRO from producto;
select MAX (pre_prod) as VALOR_MAXIMO from producto;
select MIN (pre_prod) as VALOR_MINIMO from producto;
select SUM (pre_prod) as VALOR_TOTAL from producto; 

------ORDENAR DATOS FORMA ASCENDENTE O DESCENDENTE---------
select  * from  producto order by nom_prod asc;
select * from producto order by sto_prod desc ;

------ CONSULTA LIKE -------------

----INICIAL------ 
select * from producto where sto_prod like '4%';
----FINAL--------
select * from producto where pre_prod like '%0';
----CONTENGA  LETRA-----
select * from producto where nom_prod like '%R%';
----INICIE LETRA ----
select * from producto where nom_prod like 'C%______';
---FINALICE LETRA -----
select * from producto where nom_prod like '____Z%';
select * from producto where nom_prod like '_______R%';

-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------



-----------PROCEDIMIENTO ALMACENADO --------

------INSERTAR ----------
create proc sp_insertar_cargo
@codigo_cargo int,
@nombre_cargo varchar (20)
as
insert into cargo values (@codigo_cargo,@nombre_cargo)
exec sp_insertar_cargo 16,'PUBLICISTA'

-------ACTUALIZAR ----------
create proc sp_actualizar_cargo 
@codigo_cargo int,
@nombre_cargo varchar (20)
as 
update cargo set nom_car=@nombre_cargo where cod_car=@codigo_cargo
exec sp_actualizar_cargo 16,'CONDUCTOR'


-------GENERAR VISTA -----
create view vista_cargo as select cod_car,nom_car from cargo;

-------DISPARADOR O TRIGGER--------
create trigger trigger_cargo
on cargo
for insert 
as 
  declare @nombre_cargo varchar (20)

-----INNER JOIN --------

 --SINTAXIS from  inner join tabla 2 on tabla 1 atributo tabla 2 atributos 

------ELIMINAR UN REGISTRO ------
delete from cargo where cod_car=16;

--------ELIMINAR TODA LA TABLA ----------
truncate table cargo;

--------ELIMINAR UNA COLUMNA (*)--------
alter table cargo drop colmn nom_car;

--------ALTERAR TABLA ----
alter table cargo add nom_car (25);
---------ALTERAR CAMPO -------
alter table  cargo alter column nom_car varchar (25);

-------BUSCAR DATOS COMPLETOS ------
select * from cargo;
-------BUSCAR DATOS ESPECIFICOS --------
select cod_car,nom_car from cargo;

select cod_car,nom_car from cargo where cod_car=16;
select cod_car,nom_car from cargo where nom_car= 'JEFE';

-------CONSULTAR CON OPERADORES --------
select cod_car,nom_car from cargo where cod_car>=12; 

-------CONSULTA LOGICA -----------
select cod_car,nom_car from cargo where nom_car='VENDEDOR' or cod_car = 13;


-----ALIAS ---------
select cod_car as CODIGO,nom_car as CARGO from cargo;

-----FUNCIONES AGREGADO ----------
select COUNT (nom_car) as NUMERO_REGISTRO from cargo;
select MAX (cod_car) as VALOR_MAXIMO from cargo;
select MIN (cod_car) as VALOR_MINIMO from cargo;

-------ORDENAR DATOS FORMA ASCENDENTE O DECENDENTE -------
select * from cargo order by nom_car asc;
select * from cargo order by cod_car desc;

------CONSULTA LIKE -------
---INICIAL-----
select * from cargo where nom_car like 'V%';
---FINAL -----
select * from cargo where nom_car like '%E';
-------CONTENGA LETRA ------
select * from cargo where nom_car like '%I%';
-------INICIE LETRA-------
select *from cargo where nom_car like 'J%___';
-------FINALICE LETRA-------
select * from cargo where nom_car like '________E%';


------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------



--------PROCEDIMIENTO ALMACENADO ------------

-----INSERTAR---------

create proc sp_insertar_tipo_identificacion 
@codigo_tipo_identificacion int,
@nombre_tipo_identificacion varchar (30)
as 
insert into tipo_identificacion values (@codigo_tipo_identificacion,@nombre_tipo_identificacion );
exec sp_insertar_tipo_identificacion 114,'CEDULA DE EXTRANJERO'

----ACTUALIZAR --------

create proc sp_actualizar_tipo_identificacion
@codigo_tipo_identificacion int,
@nombre_tipo_identificacion varchar (30)
as 
update tipo_identificacion set nomb_tid=@nombre_tipo_identificacion where cod_tid=@codigo_tipo_identificacion
exec sp_actualizar_tipo_identificacion 114,'CEDULA EXTRANJERO'

---GENERAR VISTA--------
create view vista_tipo_identificacion as select cod_tid,nomb_tid from tipo_identificacion;

----DISPARADORES O TRIGGER------
create trigger trigger_tipo_identificacion
on tipo_identificacion
for insert 
as 


-----INNER JOIN ------

--SINTAXIS from tabla 1 inner join tabla 2 on tabla 1 atributo tabla 2 atributos 

-----ELIMINAR UN REGISTRO ----
delete from tipo_identificacion where cod_tid=114;

-----ELIMINAR TODA LA TABLA ------
truncate table tipo_identificacion ;

-------ELIMINAR UNA COLUMNA (*)-------
alter table tipo_identificacion  drop column nomb_tid;

-----ALTERAR TABLA------
alter table tipo_identificacion add nomb_tid  varchar (25);
-------ALTERAR UN CAMPO -----
alter table tipo_identificacion alter column nomb_tid varchar (25);

---------BUSCAR DATOS COMPLETOS--------
select * from tipo_identificacion 
------BUSCAR DATOS ESPECIFICOS -------
select cod_tid,nomb_tid from tipo_identificacion;
select cod_tid,nomb_tid from tipo_identificacion  where cod_tid = 114;
------CONSULTAR  CON OPERADORES -----
select nomb_tid from tipo_identificacion where cod_tid >=112;
------CONSULTA LOGICA ------
select cod_tid,nomb_tid from tipo_identificacion where nomb_tid= 'CEDULA EXTRANJERO' and cod_tid=114;


----ALIAS ----
select cod_tid as CODIGO,nomb_tid as IDENTIFICACION from tipo_identificacion

 -----FUNCIONES AGREGADO -----
 select COUNT (nomb_tid) as NUMERO_REGISTRO from tipo_identificacion;
 select MAX (cod_tid) as VALOR_MAXIMO from tipo_identificacion;
 select MIN (cod_tid) as VALOR_MINIMO from tipo_identificacion,
 
 ----ORDENAR DATOS FROMA ASCENDENTE O DESCENTE------
 select * from tipo_identificacion order by nomb_tid asc;
 select * from tipo_identificacion order by cod_tid desc;
 
 -----CONSULTA LIKE -----
 ----INICIAL-------
 select * from tipo_identificacion where nomb_tid like 'C%';
 ----FINAL --------
 select * from tipo_identificacion where nomb_tid like '%A';
 -----CONTENGA LETRA ----
 select * from tipo_identificacion where nomb_tid like '%A%';
 ------INICIE LETRA -----
 select *from tipo_identificacion where nomb_tid like 'C%_____';
 -----FINALICE LETRA -------
 select * from tipo_identificacion where nomb_tid like '________ ____L%';
 
 ---------------------------------------------------------------------------------------------------------
 ---------------------------------------------------------------------------------------------------------
 
 
 
 
 ------PROCEDIMIENTO ALMACENADO EPS ---------
 -----INSERTAR-----
 create procedure sp_insertar_eps
 @codigo_eps int,
 @nombre_eps varchar (30),
 @telefono_eps varchar (15),
 @direccion_eps varchar (40)
 as
 insert into eps values ( @codigo_eps,@nombre_eps,@telefono_eps,@direccion_eps);
 exec sp_insertar_eps 53,'NUEVA EPS',7124823,'CR 3 # 25 Sur'
 
 ------ACTUALIZAR -------
 create proc sp_actualizar_eps
 @codigo_eps int,
 @nombre_eps varchar (30),
 @telefono_eps varchar (15),
 @direccion_eps varchar (40)
 as 
 update eps set cod_eps=@codigo_eps,nomb_eps=@nombre_eps,tel_eps=@telefono_eps,dir_eps=@direccion_eps where cod_eps =@codigo_eps ;
 exec sp_actualizar_eps 53,'SURA',7625251,'CR 6 L # 28 Norte';
 
 -----GENERAR VISTA------
 create view vista_eps as select cod_eps,nomb_eps,tel_eps,dir_eps from eps;

 -----DISPARADORES O TRIGGER ----
 create trigger trigger_eps
 on eps
 for insert 
 as 
 
 ----INNER JOIN -----
 --select * from TABLA1 inner join TABLA2 on TABLA1.COD_TABLA = TABLA2.COD_TABLA; --
 
 -----ELIMINAR REGISTRO ------
 delete from eps where cod_eps = 50;
 -----ELIMINAR TODA LA TABLA -----
 truncate table eps;
 --------ELIMINAR COLUMNA (*) -----
 alter table eps drop column dir_eps;
 
 ----------ALTERAR TABLA-------
 alter table eps add dir_eps varchar (45);
 ----------ALTERAR UN CAMPO ------
 alter table eps alter column nomb_eps varchar (42);
 
 ---------BUSCAR DATOS COMPLETOS ------
 select * from eps ;
 ---------BUSCAR DATOS ESPECIFICOS -----
 select cod_eps,nomb_eps from eps ;
 
 select cod_eps,nomb_eps from eps where cod_eps = 50;
 select cod_eps,nomb_eps,tel_eps from eps where nomb_eps = 'CAFE SALUD';
 
 ------CONSULTA CON OPERADORES ----
 select cod_eps,nomb_eps,tel_eps from eps where cod_eps >=52;
 
 -----CONSULTA LOGICA --------
 select cod_eps,nomb_eps,tel_eps from eps where nomb_eps = 'SALUDTOTAL' or cod_eps = 50;
 
 -------ALIAS -------
 select cod_eps as CODIGO,nomb_eps as EPS ,tel_eps as TELEFONO,dir_eps as DIRECCION from eps;

--------FUNCIONES AGREGADO -------
select COUNT (nomb_eps) as NUMERO_REGISTRO from eps;
select MAX (cod_eps) as VALOR_MAXIMO from eps ;
select MIN (cod_eps) as VALOR_MINIMO from eps;

------ORDENAR DATOS FORMA ASCENDENTE O DESCENDENTE ---
select * from eps order by nomb_eps asc;
select * from eps order by cod_eps desc;

-------CONSULTA LIKE ------------
-----INICIAL ------
select * from eps where nomb_eps like 'S%';
-----FINAL-----
select * from eps where nomb_eps like '%D';
-----CONTENGA LETRA -----
select * from eps where nomb_eps like '%P%';
-------INICIE LETRA -----
select * from eps where nomb_eps like 'S%___';
-------FINALICE LETRA ----
select * from eps where nomb_eps like '___%A';
--------------------------------------------------
---------------------------------------------------
----------------------------------------------------
 
 

--------PROCEDIMIENTO ALMACENADO ---------

------INSERTAR ----- 
create proc sp_insertar_empleado
@codigo_empleado int,
@identificacion_empleado int,
@codigo_tipo_identificacion int,
@nombre_empleado varchar (30),
@apellido_empleado varchar (30),
@telefono_empleado varchar (15),
@celular_empleado varchar (15),
@direccion_empleado varchar (40),
@codigo_cargo int
as 
insert into empleado values 
(@codigo_empleado,@identificacion_empleado,@codigo_tipo_identificacion,@nombre_empleado,@apellido_empleado,@telefono_empleado,@celular_empleado,@direccion_empleado,@codigo_cargo);
exec sp_insertar_empleado 24,98525,112,'NICOLAS','SANCHEZ',7933801,3162742268,'CR 12 D # 52 H 30Sur',14

-----ACTUALIZAR -------


create proc sp_actualizar_empleado
@codigo_empleado int,
@identificacion_empleado int,
@codigo_tipo_identificacion int,
@nombre_empleado varchar (30),
@apellido_empleado varchar (30),
@telefono_empleado varchar (15),
@celular_empleado varchar (15),
@direccion_empleado varchar (40),
@codigo_cargo int
as 
update empleado set id_emp=@identificacion_empleado,cod_emp=@codigo_empleado,cod_tid=@codigo_tipo_identificacion,nom_emp=@nombre_empleado,ape_emp=@apellido_empleado,tel_emp=@telefono_empleado,cel_emp=@celular_empleado,dir_emp=@direccion_empleado,cod_car=@codigo_cargo where cod_emp=@codigo_empleado;

exec sp_actualizar_empleado 22,28524,112,'DAVID','MATEUS',7972981,3147583267,'CR 4 M # 42 D 13Sur',14


-------GENERAR VISTAS ------
create view vista_empleado as select cod_emp,id_emp,cod_tid,nom_emp,ape_emp,tel_emp,cel_emp,dir_emp,cod_car from empleado;

-----DISPARADORES O TRIGGER ----
create trigger trigger_empleado
on empleado
for insert 
as


----INNER JOIN-----

--select * from TABLA1 inner join TABLA2 on TABLA1.COD_TABLA = TABLA2.COD_TABLA; --
select * from cargo inner join empleado on cargo.cod_car = empleado.cod_car;
select cargo.cod_car as CODIGO_CARGO ,nom_car as CARGO,empleado.nom_emp as NOMBRE,ape_emp as APELLIDO from cargo inner join empleado on cargo.cod_car = empleado.cod_car

-----ELIMINAR UN REGISTRO -------
delete from empleado where cod_emp=21;
-------ELIMINAR TODA LA TABLA ------
truncate table empleado;
-------ELIMINAR UN COLUMNA (*)-----
alter table empleado drop column cel_emp;
--------ALTERAR TABLA ------
alter table empleado add id_emp bigint;
---------ALTERAR UN CAMPO ------
alter table empleado alter column nom_emp varchar (30);

---------BUSCAR DATOS COMPLETOS -----
select * from emplado;
---------BUSCAR DATOS ESPECIFICOS--------
select cod_emp,id_emp,nom_emp,ape_emp from empleado ;

select cod_emp,id_emp,nom_emp,ape_emp from empleado where cod_emp=21;
select cod_emp,nom_emp,ape_emp from empleado where nom_emp ='ALDAIR';

--------CONSULTA CON OPERADORES ------
select cod_emp,id_emp,nom_emp,ape_emp from empleado where cod_emp>=22;

--------CONSULTA LOGICA ----
select cod_emp,id_emp,nom_emp,ape_emp from empleado where nom_emp = 'DAVID' and cod_emp=22;

-------ALIAS ------
select cod_emp as CODIGO,id_emp as IDENTIFICACION,cod_tid as CODIGO_IDENTIFICACION,
nom_emp as NOMBRE,ape_emp as APELLIDO,tel_emp as TELEFONO, cel_emp as CELULAR,
dir_emp as DIRECCION,cod_car as CODIGO_CARGO from empleado;

-------FUNCIONES AGREGADO -------
select COUNT (nom_emp) as NUMERO_REGISTRO from empleado ;
select MAX (cod_emp) as VALOR_MAXIMO from empleado;
select MIN (cod_emp) as VALOR_MINIMO from empleado;

-------ORDENAR DATOS FORMA ASCENDENTE O DESCENDENTE --------
select * from empleado order by nom_emp asc;
select * from empleado order by cod_emp desc;

-------CONSULTAR LIKE -------

-----INICIAL-----
select * from empleado where nom_emp like 'A%';
-----FINAL ------
select * from empleado where ape_emp like '%S';
-----CONTENGA LETRA -----
select * from empleado where nom_emp like '%I%';
-----INICIE LETRA ----
select * from empleado where ape_emp like 'G%_____';
-----FINALICE LETRA -----
select * from empleado where ape_emp like '______Z%';
---------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
---------------------------------------------------------------------------------


----PROCEDIMIENTOS ALMACENADOS ----
-----INSERTAR LOGIN -----
create procedure sp_insertar_login
@nom_emp varchar (30),
@con_emp int,
@cod_emp int
as
insert into login values (@nom_emp,@con_emp,
@cod_emp);
exec sp_insertar_login 'FALCAO',123,21

---ACTUALIZAR LOGIN ----
create proc sp_actualizar_login
@id_us int,
@nom_emp varchar (30),
@con_emp int,
@cod_emp int 
as
update login set nombre=@nom_emp,contraseña=@con_emp,cod_emp=@cod_emp where cod_us=@id_us;
exec sp_actualizar_login 100725533,'DAVID',321,22
select * from cargo;
select * from empleado;
select * from producto;
select * from tipo_identificacion;
select * from login ;



---------PROCEDIMIENTO ALMACENADO ------

---------INSERTAR --------
create proc sp_insertar_proveedor 
@codigo_proveedor int, 
@nombre_proveedor varchar (30),
@telefono_proveedor varchar (15),
@direccion_proveedor varchar (40)
as
insert into proveedor values (@codigo_proveedor,@nombre_proveedor,@telefono_proveedor,@direccion_proveedor)
exec sp_insertar_proveedor  34,'TORRE',3114191149,'CR 43 J # 71 Sur';

------ACTUALIZAR --------
create proc sp_actualizar_proveedor
@codigo_proveedor int,
@nombre_proveedor varchar (30),
@telefono_proveedor varchar (15),
@direccion_proveedor varchar (40)
as 
update proveedor set cod_prov=@codigo_proveedor,nom_prov=@nombre_proveedor,tel_prov=@telefono_proveedor,dir_prov=@direccion_proveedor where cod_prov = @codigo_proveedor
exec sp_actualizar_proveedor 34,'TORRE.LTDA',32447083267,'CR 5 K# 2 Sur';

----------GENERAR VISTA ---------
create view vista_proveedor as select cod_prov,nom_prov,tel_prov,dir_prov from proveedor;

----DISPARADORES O TRIGGER-----
create trigger trigger_proveedor 
on proveedor
for insert 
as 
 declare 

--INNER JOIN -------

--select * from TABLA1 inner join TABLA2 on TABLA1.COD_TABLA = TABLA2.COD_TABLA; --

------ELIMINAR UN REGISTRO ------
delete from proveedor where cod_prov=21;

-----ELIMINAR TADA LA TABLA -------
truncate table proveedor;

-----ELIMINAR UNA COLUMNA (*)-------
alter table proveedor drop column dir_prov;

------ALTERAR TABLA -----
alter table proveedor add dir_prov varchar (50);
------ALTERAR UN CAMPO------
alter table proveedor alter column nom_prov varchar (45);
 
-----BUSCAR DATOS COMPLETOS ------
select * from proveedor;
-----BUSCAR DATOS ESPECIFICOS ----
select cod_prov,nom_prov from proveedor; 

select cod_prov,nom_prov from proveedor where cod_prov = 31;
select cod_prov,nom_prov,tel_prov from proveedor where cod_prov = 32 or nom_prov ='JUSTUS'; 

----CONSULTAR OPERADORES---------
select nom_prov,tel_prov from proveedor where cod_prov >=32;

----ALIAS ------
select cod_prov as CODIGO,nom_prov as PROVEEDOR,tel_prov as TELEFONO,dir_prov as DIRECCION from proveedor  

-------FUNCIONES AGREGADAO -------------
select COUNT (nom_prov) as NUMERO_REGISTRO from provedor;
select MAX (cod_prov ) as VALOR_MAXIMO from  provedor;
select MIN (cod_prov as VALOR_MINIMO from proveedor;

------ORDENAR DATOS FROMA ASCENDENTE O DESCENDENTE ------
select * from proveedor order by nom_prov asc;
select * from proveedor order by cod_prov desc;

---------CONSULTA LIKE ---------
----INICIAL-------
select * from  proveedor where nom_prov like 'N%';
-----FINAL -------
select * from proveedor where nom_prov like '%S';
------CONTENGA LETRA -------
select * from proveedor where nom_prov like '%O%';
--------INICIE LETRA --------
select * from proveedor where nom_prov like 'N%____';
-------FINALICE LETRA -------
select * from proveedor where nom_prov like '_____%E';
-------------------------------------------------------------------
-------------------------------------------------------------------
--------------------------------------------------------------------


------PROCEDIMIENTOS ALMACENADOS FACTURA COMPRA ----

---INSERTAR -----
create procedure sp_insertar_factura_compra
@codigo_factura_compra int,
@fecha_factura_compra varchar (20),
@codigo_empleado int,
@codigo_proveedor int
as 
insert into factura_compra values (@codigo_factura_compra,
@fecha_factura_compra,@codigo_empleado,@codigo_proveedor)
exec sp_insertar_factura_compra 83,'30-09/2016',22,33

-----ACTUALIZAR -----
create procedure sp_actualizar_factura_compra 
@codigo_factura_compra int,
@fecha_factura_compra varchar (20),
@codigo_empleado int,
@codigo_proveedor int
as
update factura_compra set cod_fc=@codigo_factura_compra,fec_fc=@fecha_factura_compra,
cod_emp=@codigo_empleado,cod_prov=@codigo_proveedor where cod_fc=@codigo_factura_compra;
exec sp_actualizar_factura_compra 83,'29-09/2016',23,33;

create table factura_compra (
cod_fc int primary key not null,
fec_fc varchar (20) not null,
cod_emp int,
foreign key (cod_emp) references empleado (cod_emp),
cod_prov int
foreign key (cod_prov)references proveedor (cod_prov)
);  
-----GENERAR VISTA ---
create view vista_factura_compra as select cod_fc,fec_fc,cod_emp,cod_prov from factura_compra ;

----DISPARADORES O TRIGGER ----
create trigger trigger_factura_compra
on factura_compra
for insert 

------INNER JOIN -----
--select * from TABLA1 inner join TABLA2 on TABLA1.COD_TABLA = TABLA2.COD_TABLA; --

----ELIMINAR UN REGISTRO ----
delete from  factura_compra where cod_fc = 80;
----ELIMINAR TADA LA TABLA-----
truncate table factura_compra;
----ELIMINAR UNA COLUMNA (*)-----
alter table factura_compra drop column cod_emp;

-----ALTERAR TABLA -----
alter table factura_compra add fec_fc varchar (25);
-----ALTERAR UN CAMPO ----
alter table factura_compra alter column fec_fc varchar (23);

-----BUSCAR DATOS COMPLETOS ---
select * from factura_compra;
-----BUSCAR DATOS ESPECIFICOS---
select cod_fc,fec_fc from factura_compra;

select cod_fc,fec_fc,cod_emp,cod_prov from factura_compra where cod_fc =80;
select cod_fc,fec_fc from factura_compra where fec_fc = '04-09-2016';

--------CONSULTAR CON OPERADORES-----
select cod_fc,fec_fc from factura_compra where cod_fc >=82;

-------CONSULTA LOGICA ----
select cod_fc,fec_fc,cod_emp,cod_prov from factura_compra where fec_fc= '25-09/2016' or cod_prov = 31;

----ALIAS----
select cod_fc as CODIGO,fec_fc as FECHA,cod_emp as CODIGO_EMPLEADO,cod_prov as CODIGO_PROVEEDOR from factura_compra;

---FUNCIONES DE AGREGADO ------
select COUNT (cod_fc) as NUMERO_REGISTRO from factura_compra;
select MAX (fec_fc) as VALOR_MAXIMO from factura_compra;
select MIN (cod_prov) as VALOR_MINIMO from factura_compra;

----ORDENAR DATOS FORMA ASCENDENTE O DESCENDENTE -----
select * from factura_compra order by cod_emp asc;
select * from factura_compra order by fec_fc desc ; 

----CONSULTA LIKE ----

----INICIAL -----
select * from factura_compra where fec_fc like '3%';
----FINAL-----
select * from factura_compra where  cod_emp like '%2';
----CONTENGA LETRA ----
select * from factura_compra where fec_fc like '%5%';
-----INICIE LETRA -----
select * from factura_compra where fec_fc like '1%_________' ,
-----FINALICE LETRA ----
select * from factura_compra where cod_prov like '_%1';

----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
----------------------------------------------------------------------------------

select * from empleado;
select * from proveedor;


------PROCEDIMIENTOS ALMACENADOS ------
create table detalle_factura_compra (
cod_dfc int primary key not null,
can_dfc int,
cod_fc int,
foreign key (cod_fc) references factura_compra (cod_fc),
cod_prod int,
foreign key (cod_prod) references producto (cod_prod) 
);
----INSERTAR-----
create procedure sp_insertar_detalle_factura_compra
@codigo_detalle_factura_compra int,
@cantidad_detalle_factura_compra int,
@codigo_factura_compra int,
@codigo_producto int
as
insert into detalle_factura_compra values (@codigo_detalle_factura_compra,@cantidad_detalle_factura_compra,@codigo_factura_compra,@codigo_producto);
exec sp_insertar_detalle_factura_compra 93,20,83,4
----ACTUALIZAR------
create procedure sp_actualizar_detalle_factura_compra
@codigo_detalle_factura_compra int,
@cantidad_detalle_factura_compra int,
@codigo_factura_compra int,
@codigo_producto int
as
update detalle_factura_compra set can_dfc=@cantidad_detalle_factura_compra,cod_fc=@codigo_factura_compra,cod_prod=@codigo_producto where cod_dfc=@codigo_detalle_factura_compra;
exec sp_actualizar_detalle_factura_compra 93,25,82,3 ;

-----GENERAR VISTA -------
create view vista_detalle_factura_compra as select cod_dfc,can_dfc,cod_fc,cod_prod from detalle_factura_compra;

----DISPARADORES O TRIGGER -----
create trigger trigger_detalle_factura_compra
on detalle_factura_compra
for insert

-----INNER JOIN -----
--select * from TABLA1 inner join TABLA2 on TABLA1.COD_TABLA = TABLA2.COD_TABLA; --

------ELIMINAR UN REGISTRO ------
delete from detalle_factura_compra where cod_dfc=90;
------ELIMINAR TODA LA TABLA ------
delete table detalle_factura_compra;;
-----ELIMINAR UNA COLUMNA (*)----
truncate table detalle_factura_compra;

-------ALTERAR TABLA ------
alter table detalle_factura_compra add can_dfc bigint;
-------ALTER UN CAMPO-----
alter table detalle_factura_compra alter column can_dfc bigint;

------BUSCAR DATOS GENERALES----
select * from detalle_factura_compra;
-----BUSCAR DATOS ESPECIFICAR------
select cod_dfc,can_dfc from detalle_factura_compra;

select cod_dfc,can_dfc,cod_fc,cod_prod from detalle_factura_compra where cod_dfc=90;
select cod_dfc,can_dfc,cod_fc,cod_prod from detalle_factura_compra where can_dfc=12;

-------CONSULTAR CON OPERADORES ------
select cod_dfc,can_dfc,cod_fc,cod_prod from detalle_factura_compra where can_dfc >=12;

------CONSULTA LOGICA ----
select cod_dfc,can_dfc,cod_fc,cod_prod from detalle_factura_compra where cod_dfc = 92 or can_dfc=25;

----ALIAS ----
select cod_dfc as DETALLE_FACTURA_COMPRA,can_dfc as CANTIDAD,cod_fc as CODIGO_FACTURA_COMPRA ,cod_prod as CODIGO_PRODCUTO from detalle_factura_compra;  

------FUNCIONES AGREGADO -----
select COUNT (cod_dfc) as NUMERO_REGISTRO from detalle_factura_compra ;
select MAX (can_dfc) as VALOR_MAXIMO from detalle_factura_compra;
select MIN (can_dfc) as VALOR_MINIMO from detalle_factura_compra;  

-----ORDENAR DATOS FORMA ASCENDENTE O DESCENDENTE-----
select * from detalle_factura_compra order by cod_dfc asc;
select * from detalle_factura_compra order by can_dfc desc;

------CONSULTA LIKE ------

----INICIAL -----
select * from detalle_factura_compra where can_dfc like '2%';
----FINAL ------
select * from detalle_factura_compra where cod_dfc like'%3';
----CONTENGA CARACTER -----
select * from detalle_factura_compra where can_dfc like '%5%';

------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------


select * from detalle_factura_compra;

select * from factura_compra
select * from producto ; 



------PROCEDIMIENTO ALMACENADO --------

----INSERTAR------
create proc sp_insertar_cliente
@codigo_cliente int,
@identificacion_cliente int,
@codigo_tipo_identificacion int,
@nombre_cliente varchar (30),
@apellido_cliente varchar (30),
@celular_cliente varchar (15)
as 
insert into cliente values (@codigo_cliente,@identificacion_cliente,@codigo_tipo_identificacion,@nombre_cliente,@apellido_cliente,@celular_cliente);
exec sp_insertar_cliente 44,28984583,111,'MARIA','GOMEZ','3127543367'
-------ACTUALIZAR ----------
create procedure sp_actualizar_cliente
@codigo_cliente int,
@identificacion_cliente int,
@codigo_tipo_identificacion int,
@nombre_cliente varchar (30),
@apellido_cliente varchar (30),
@celular_cliente varchar (15)
as
update cliente set cod_clie=@codigo_cliente,
id_clie=@identificacion_cliente,
cod_tid=@codigo_tipo_identificacion,
nom_clie=@nombre_cliente,
ape_clie=@apellido_cliente,
cel_clie=@celular_cliente where cod_clie=@codigo_cliente
exec sp_actualizar_cliente 44,28384884,112,'LAURA','GARCIA','3127548899'

--------GENERAR VISTA -----
create view vista_cliente as select cod_clie,id_clie,cod_tid,nom_clie,ape_clie,cel_clie from cliente;

--------DISPARADORES O TRIGGER-----
create trigger trigger_cliente
on cliente
for insert 
as 
  declare 
  
-------INNER JOIN -------

--select * from TABLA1 inner join TABLA2 on TABLA1.COD_TABLA = TABLA2.COD_TABLA; --

-------ELIMINAR UN REGISTRO------
delete from cliente where cod_clie=41;
-------ELIMINAR TODA LA TABLA ------
truncate table cliente;
-------ELIMINAR UNA COLUMNA (*)--------
alter table cliente drop column cel_clie;

-------ALTERAR TABLA------
alter table cliente add cel_clie varchar (20);
-------ALTERAR UN CAMPO ------
alter table cliente alter column nom_clie varchar (22);

-------BUSCAR DATOS COMPLEATOS -----
select * from cliente;
--------BUSCAR DATOS ESPECIFICOS ----
select cod_clie,nom_clie from cliente;

select cod_clie,nom_clie from cliente where cod_clie=41;
select cod_clie,nom_clie,ape_clie from cliente where nom_clie='LAURA',

---------CONSULTAR CON OPERDORES -------
select cod_clie,nom_clie,ape_clie from cliente where cod_clie>=41;

-----------CONSULTA LOGICA --------
select cod_clie,id_clie,nom_clie,ape_clie from cliente where nom_clie ='ANDRES' or cod_clie=42;

-------ALIAS ---------
select cod_clie as CODIGO,id_clie as IDENTIFICACION,cod_tid as CODIGO_IDENTIFICACION, nom_clie as NOMBRE,ape_clie as APELLIDO,cel_clie as CLIENTE from cliente ; 

-----FUNCIONES AGREGADO --------
select COUNT (nom_clie) as NUMERO_REGISTRO from cliente ;
select MAX (cod_clie ) as VALOR_MAXIMO from cliente ;
select MIN (cod_clie ) as VALOR_MINIMO from cliente ;

------ORDENAR DATOS FORMA ASCENDENTE O DESCENDENTE -----
select * from cliente order by nom_clie asc;
select * from cliente order by cod_clie desc;

-----CONSULTA LIKE ---------

------INICIAL ------
select * from cliente where nom_clie like 'A%';
------FINAL------
select * from cliente where cod_clie like '%4';
------CONTENGA LETRA--------
select * from cliente where nom_clie like'%E%';
-------INICIE LETRA -----
select * from cliente  where ape_clie like 'L%______';
------FINALICE LETRA -----
select * from cliente where ape_clie like '_____%A';
-----------------------------------------------------------
-----------------------------------------------------------------
---------------------------------------------------------------------------


--------PROCEDIMIENTOS ALMACENADOS------

-----INSERTAR-------
create procedure sp_insertar_factura_venta
@codigo_factura_venta int,
@fecha_factura_venta varchar (20),
@codigo_cliente int,
@codigo_empleado int
as
insert into factura_venta values (@codigo_factura_venta,@fecha_factura_venta,
@codigo_cliente,@codigo_empleado)
exec sp_insertar_factura_venta 103,'04-09/2016',44,24

-----ACTUALIZAR --------
create procedure sp_actualizar_factura_venta
@codigo_factura_venta int,
@fecha_factura_venta varchar (20),
@codigo_cliente int,
@codigo_empleado int
as
update factura_venta set fec_fv=@fecha_factura_venta,cod_clie=@codigo_cliente,cod_emp=@codigo_empleado where cod_fv=@codigo_factura_venta ; 

----GENERAR VISTA ----
create view vista_factura_venta as select cod_fv,fec_fv,cod_clie,cod_emp from factura_venta;

--- DISPARADORES O TRIGGER ----
create trigger trigger_factura_venta
on factura_venta
for insert
as 
declare 

----INNER JOIN ----
---select * from TABLA1 inner join TABLA2 on TABLA1.COD_TABLA =TABLA2.COD_TABLA;--

---ELIMINAR UN REGISTRO ---
delete from factura_venta where cod_fv=100;
---ELIMINAR TODA LA TABLA ----
truncate table factura_venta;
---ELIMINAR UNA COLUMNA (*)----
alter table factura_venta drop column fec_fc;

----ALTERAR TABLA ----
alter table factura_venta add fec_fc varchar 22;
----ALTERAR UN CAMPO ---
alter table factura_venta alter column fec_fc varchar (23);


----BUSCAR DATOS GENERALES----
select * from factura_venta ;
----BUSCAR DATOS ESPECIFICOS ----
select cod_fv,fec_fv from factura_venta;
select cod_fv,fec_fv from factura_venta where cod_fv =100;
select cod_fv,fec_fv,cod_clie,cod_emp from factura_venta where fec_fv='02-09/2016';

-----CONSULTA CON OPERADORES----
select cod_fv,fec_fv,cod_clie,cod_emp from factura_venta where cod_fv >=101;
------CONSULTA LOGICA -----
select cod_fv,fec_fv,cod_clie,cod_emp from factura_venta where fec_fv = '02-09/2016' and cod_fv =102;

-----ALIAS ----
select cod_fv as FACTURA_VENTA,fec_fv as FECHA,cod_clie as CODIGO_CLIENTE,cod_emp as CODIGO_EMPLEADO from factura_venta;

---FUNCIONES AGREGADO -------
select COUNT (cod_fv) as NUMERO_REGISTRO from factura_venta;
select MAX (cod_fv) as VALOR_MAXIMO from factura_venta;
select MIN (cod_fv) as VALOR_MINIMO from factura_venta;

---ORDERNAR FROMA ASCENDETE O DESCENTE ----
select * from factura_venta order by fec_fv asc;
select * from factura_venta order by cod_fv desc;

----CONSULTA LIKE ----

----INICIAL -----
select * from factura_venta where fec_fv like '2%';
----FINAL-----
select * from factura_venta where cod_clie like '%3';
----CONTENGA LETRA ----
select * from factura_venta where fec_fv like '%4%';
-----INICIE LETRA -----
select * from factura_venta where fec_fv like '2%_________' ;
-----FINALICE LETRA ----
select * from factura_venta where cod_emp like '_%2';

select * from factura_venta
select * from cliente
select * from empleado
select * from detalle_factura_compra
select * from factura_compra
select * from producto;
---------------------------------------------------------------------------------
--------------------------------------------------------------------
-----------------------------------------------------------------------------

------TABLA DETALLE FACTURA VENTA ------



-------PROCEDIMIENTOS ALMACENADOS----
create table detalle_factura_venta (
cod_dfv int primary key not null,
can_dfv varchar (20),
cod_prod int,
foreign key (cod_prod) references producto (cod_prod),
cod_fv int,
foreign  key (cod_fv) references factura_venta (cod_fv),
cod_emp int,
foreign key (cod_emp) references empleado (cod_emp)
);
----INSERTAR -----------------
create procedure sp_insertar_detalle_factura_venta
@codigo_detalle_factura_venta int,
@cantidad_detalle_factura_venta int,
@codigo_producto int,
@codigo_factura_venta int,
@codigo_empleado int
as
insert into detalle_factura_venta values (@codigo_detalle_factura_venta,
@cantidad_detalle_factura_venta,@codigo_producto,
@codigo_factura_venta,@codigo_empleado)
exec sp_insertar_detalle_factura_venta 203,6,5,102,23 ;

-----ACTUALIZAR-----
create procedure sp_actualizar_detalle_factura_venta
@codigo_detalle_factura_venta int,
@cantidad_detalle_factura_venta int,
@codigo_producto int,
@codigo_factura_venta int,
@codigo_empleado int
as 
update detalle_factura_venta set can_dfv=@cantidad_detalle_factura_venta,cod_prod=@codigo_producto,cod_emp=@codigo_empleado where cod_dfv =@codigo_detalle_factura_venta ;
exec sp_actualizar_detalle_factura_venta 203,9,3,101,22 ;


-------GENERAR VISTA-------
create view vista_detalle_factura_venta as select cod_dfv,can_dfv,cod_prod,cod_fv,cod_emp from detalle_factura_venta ;


--DISPARADORES O TRIGGER -----
create trigger trigger_detalle_factura_venta 
on detalle_factura_venta 
for insert 
as 

-----INNER JOIN-----
--select * from  TABLA1 inner join TABLA2 on  TABLA1.COD_TABLA = TABLA2.COD_TABLA;---

----ELIMINAR UN REGISTRO ---
delete from detalle_factura_venta  where cod_dfv = 200;

----ELIMINAR TODA LA TABLA ----
truncate table detalle_factura_venta;;

-----ELIMINAR UNA COLUMNA (*) ----
alter table detalle_factura_venta drop column can_dfv; 

-----ALTERAR TABLA ---
alter table detalle_factura_venta add can_dfv bigint;
------ALTERAR UN CAMPO---
alter table detalle_factura_venta alter column can_dfv bigint ,
 
-----BUSCAR DATOS COMPLETOS -----
select * from detalle_factura_venta;

------BUSCAR DATOS ESPECIFICOS----
select cod_dfv,can_dfv from detalle_factura_venta ;

select cod_dfv,can_dfv from detalle_factura_venta where cod_dfv=203;  
select cod_dfv,can_dfv,cod_prod,cod_fv,cod_emp from detalle_factura_venta where can_dfv=6; 

-----CONSULTAR CON OPERADORES ----
select cod_dfv,can_dfv,cod_emp from detalle_factura_venta where cod_emp >=23;
------CONSULTA LOGICA-----
select cod_dfv,can_dfv from detalle_factura_venta where can_dfv =6 or cod_dfv =203 ;

-----ALIAS ------
select cod_dfv as DETALLE_FACTURA,can_dfv as CANTIDAD,cod_prod as CODIGO_PRODUCTO,cod_fv as CODIGO_FACTURA_COMPRA,cod_emp as CODIGO_EMPLEADO from detalle_factura_venta;  

------FUNCIONES AGREGADO -----
select COUNT (cod_dfv) as NUMERO_REGISTRO from detalle_factura_venta;
select MAX (can_dfv) as VALOR_MAXIMO from detalle_factura_venta;
select MIN (can_dfv) as VALOR_MINIMO from detalle_factura_venta;

-----ORDENAR FORMA ASCENDENTE O DESCENDENTE ----
select * from detalle_factura_venta order by can_dfv asc;
select * from detalle_factura_venta order by cod_dfv desc;

-----CONSULTA LIKE ------

-----INICIAL ----
select * from detalle_factura_venta where cod_dfv like '2%';
---FINAL----
select * from detalle_factura_venta where cod_dfv like '%3';
------CONTENGA EL CARACTER -----
select * from detalle_factura_venta where cod_dfv like '%3%';
-----INICIE CARACTER -----
select * from detalle_factura_venta where cod_dfv like '2%__' ;
-----FINALICE LETRA ----
select * from detalle_factura_venta where cod_dfv like '__%3';


------------------------------------------------------------------
---------------------------------------------------------------------
---------------------------------------------------------------------- 

-----PROCEDIMIENTOS ALMACENADOS---
----INSERTAR ------
create proc sp_insertar_inventario 
@codigo_inventario int,
@fecha_inventario varchar (20)
as 
insert into inventario values (@fecha_inventario)
exec sp_insertar_inventario '12-09/2016'

----ACTUALIZAR ------
create procedure sp_actualizar_inventario
@fecha_inventario varchar (20)
as 
update inventario set fech_inv=@fecha_inventario 
exec sp_actualizar_inventario '13-08/2016'



select * from inventario
select * from factura_venta;
select * from factura_compra;
select * from tipo_pago;
select * from pago;


select * from detalle_factura_venta;
select * from producto;
select * from empleado;
select * from detalle_factura_compra;


                               select * from categoria;
select * from cliente;
select * from detalle_factura_venta;
select * from detalle_factura_compra;
select * from empleado;
select * from eps;
select * from factura_compra;
select * from factura_venta;
select * from producto;
select * from proveedor;
select * from tipo_identificacion;
select * from tipo_pago;
select * from ubicacion_stand;
select* from login;

insert into login values ('nicolas',36885,23);

