drop database if exists negocio;
create database negocio;
use negocio;

create table clientes (
codigo integer auto_increment,
nombre varchar(20) not null,
apellido varchar(20) not null,
cuit char(13),
direccion varchar(50),
comentarios varchar(140),
primary key (codigo)
);

create table facturas(
letra char(1),
numero integer,
fecha date,
monto double,
primary key (letra,numero)
);

create table articulos(
codigo integer auto_increment,
nombre varchar(50),
precio double,
stock integer,
primary key (codigo)
);

insert into clientes (nombre,apellido,cuit,direccion) values ('juan','perez','xxxxx','peru 323');
insert into clientes (nombre,apellido,cuit,direccion) values ('diego','torres','xxxxx','chile 320');
insert into clientes (nombre,apellido,cuit,direccion) values ('laura','gomez','xxxxx','san juan 420');
insert into clientes (nombre,apellido,cuit,direccion) values ('mario','lopez','xxxxx','lavalle 770');
insert into clientes (nombre,apellido,cuit,direccion) values ('dario','sanchez','xxxxx','mexico 150');

insert into articulos values (1,'destornillador',25,50);
insert into articulos values (2,'pinza',35,22);
insert into articulos values (3,'martillo',15,28);
insert into articulos values (4,'maza',35,18);
insert into articulos values (5,'valde',55,13);

insert into facturas values ('a',0001,'2011/10/18',500);
insert into facturas values ('a',0002,'2011/10/18',2500);
insert into facturas values ('b',0003,'2011/10/18',320);
insert into facturas values ('b',0004,'2011/10/18',120);
insert into facturas values ('b',0005,'2011/10/18',560);
-- inserto un registro con la fecha actual
insert into facturas values ('c',0006,curdate(),300);

insert into clientes (nombre,apellido,cuit,direccion) values ('maria','fernandez','xxxxx','');
insert into clientes (nombre,apellido,cuit,direccion) values ('gustavo','ramirez','xxxxx',null);


insert into facturas values ('f',0006,curdate(),300);
insert into facturas values ('f',0007,curdate(),400);

insert into clientes (nombre,apellido,cuit,direccion) values ('jose','benuto','3647493','loria 940');

insert into facturas (letra,numero,fecha,monto) values ('a',1001,'2012/10/25',350);
insert into facturas (letra,numero,fecha,monto) values ('a',1002,curdate(),540);

insert into articulos (codigo,nombre,precio,stock) values (110,'destornillador',30,100);
insert into articulos (codigo,nombre,precio,stock) values (111,'martillo',40*1.21,50);

insert into clientes (nombre,apellido,direccion) values ('Andrea','Abate','Laprida 648');
insert into clientes (apellido,nombre) values ('Stuart','Jhon');
insert into clientes values(null,'Laura','Georgeff','56565','Berutti 2589','');
insert into clientes (codigo,nombre,apellido,cuit,direccion) values (null,'jose','sanchez','xxxxx','chile 150');
insert into clientes values (null,'marta','martinez','xxxxx','florida 150','');
insert into clientes (nombre,apellido,cuit,direccion) values ('carlos','flores','xxxxx','bolivar 150');
insert into clientes values (20,'Romeo','Lopez','34343434','Anchorena 950','');
insert into clientes (nombre,apellido,cuit,direccion) values ('Florencia','Salinas','82828282','W.Morris 3420');
insert into clientes (apellido,nombre,direccion) values ('Ana','Salone',null);

show tables;
describe articulos;
describe clientes;
describe facturas;
select * from articulos;
select * from clientes;
select * from facturas;

-- comando DML select (ANSI)

-- comodin * (todos los campos)
select * from clientes;
select nombre, apellido from clientes;
select apellido, nombre, apellido, curdate() fecha_actual from clientes;
select codigo, concat(nombre,' ',apellido) nombre, cuit, direccion, comentarios 
	from clientes;

-- columna calculada
select letra, numero, fecha, monto, monto*0.21 valor_iva from facturas;
select letra, numero, fecha, monto, round(monto*0.21, 2) valor_iva from facturas;

-- filtrado con where
select * from clientes;
select * from clientes where nombre='Laura';
select * from clientes where codigo=3;

-- Operadores relacionales < <= >= > <> !=
select * from clientes where codigo=6;
select * from clientes where codigo<6;
select * from clientes where codigo<=6;
select * from clientes where codigo>=6;
select * from clientes where codigo>6;
select * from clientes where codigo<>6;
select * from clientes where codigo!=6;

-- Operadores Logicos and or
select * from clientes where nombre='Laura' and apellido='Perez';
select * from clientes where nombre='Laura' or apellido='Perez';
select * from clientes where nombre='Juan' or nombre='Laura';

select * from facturas where monto>=300 and monto<=400;
select * from facturas where monto<300 or monto>400;

-- clausula between, not between
select * from facturas where monto between 300 and 400;
select * from facturas where monto not between 300 and 400;

select * from clientes 
	where codigo=3
    or codigo=5
    or codigo=6
    or codigo=13
    or codigo=15;
    
select * from clientes 
	where codigo!=3
    and codigo!=5
    and codigo!=6
    and codigo!=13
    and codigo!=15;

-- clausula in, not in
select * from clientes where codigo in (3,6,13,15);
select * from clientes where codigo not in (3,6,13,15);

-- valores null
insert into clientes (nombre, apellido, direccion) values
	('Karina','Amanda',null),
    ('Andrea','Moretti','');

select * from clientes where direccion is null;
select * from clientes where direccion is not null;
select * from clientes where direccion=null; -- no funciona

insert into clientes (nombre,apellido) values
	('Mirta','Herrera'),('Marta','Herrera'),
    ('Omar','Herrera'),('Armando','Herrera'),
    ('Monica','Herrera'),('Malena','Herrera'),
    ('Magali','Herrera'),('Melina','Herrera'),
    ('Marcela','Herrera'),('Martin','Herrera'),
    ('Martina','Herrera'),('Mariano','Herrera'),
    ('Mariana','Herrera'),('Carlos','Herrera'),
    ('Miriam','Herrera'),('Marcelo','Herrera');

-- busqueda de expresiones, like, not like
select * from clientes where nombre not like 'm%';
select * from clientes where nombre like 'm%';
select * from clientes where nombre like 'ma%';
select * from clientes where nombre like 'mar%';
select * from clientes where nombre like 'mari%';


-- Laboratorio 3

-- 1 - Ingrese a la base de datos negocio.
use negocio;

-- 2 - Ingrese 5 registros aleatorios en cada tabla.

-- 3 - Basándose en la tabla artículos obtener los siguientes listados.

-- a-	artículos con precio mayor a 100
select * from articulos where precio>100;

-- b-	artículos con precio entre 20 y 40 (usar < y >)
select * from articulos where precio >20 and precio<40;

-- c-	artículos con precio entre 40 y 60 (usar BETWEEN)
select * from articulos where precio between 40 and 60;

-- d-	artículos con precio = 20 y stock mayor a 30
select * from articulos where precio=20 and stock>30;

-- e-	artículos con precio (12,20,30) no usar IN
select * from articulos where precio=12 or precio=20 or precio=30;

-- f-	artículos con precio (12,20,30) usar el IN
select * from articulos where precio in (12, 20, 30);

-- g-	artículos que su precio no sea (12,20,30)
select * from articulos where precio not in (12, 20, 30);

-- h-   artículos que su precio mas iva(21 %) sea mayor a 100
select * from articulos where precio*1.21>100;

-- i-   listar nombre y descripción de los artículos que no cuesten $100
select nombre from articulos where precio<>100;

-- j- 	artículos con nombre que contengan la cadena 'lampara' (usar like)
select * from articulos where nombre like '%lampara%';

-- k-   artículos que su precio sea menor que 200 y en su nombre no contenga la letra 'a'
select * from articulos where precio<200 and not nombre like '%a%';

-- 	2- Listar los artículos ordenados por precio de mayor a menor, y si hubiera precio iguales deben 
--     quedar ordenados por nombre.
select * from articulos order by precio desc, nombre;

-- 	3- Listar todos los artículos incluyendo una columna denominada precio con IVA, la cual 
--     deberá tener el monto con el iva del producto.
select codigo, nombre, precio, precio *1.21 precio_con_IVA, stock from articulos;

-- 	4- Listar todos los artículos incluyendo una columna denominada 'cantidad de cuotas' 
--     y otra 'valor de cuota', la cantidad es fija y es 3, 
--     el valor de cuota corresponde a 1/3 del monto con un 5% de interés.
select codigo, nombre, precio, 3 'cantidad de cuotas', round(precio/3*1.05,2) 'valor cuota', stock 
		from articulos;

-- comando DML Insert

-- insert normal con definición de campos ANSI
insert into clientes (nombre, apellido, cuit, direccion) values
	('Jose','Larralde','23456','Rauch 3434');
    
-- insert abreviado sin definición de campos ANSI
insert into clientes values (null, 'Maria', 'Molina', '345678', 'Lima 321', '');

-- insert set NO ANSI
insert clientes set nombre='Juanita', apellido='Viale';

-- insert masivo ANSI
insert into clientes (nombre, apellido, direccion) values 
	('Ana','Sanchez','Lima 222'),
    ('Mariela','Gerez','Perete 333'),
    ('Carlos','Rios','Lima 345'),
    ('Juan','Colina','Florida 3434'),
    ('Lautaro','Ledesma','Maipu 5433'),
    ('Guillermo','Leguizamon','Peru 650'),
    ('Rodolfo','Durante','Lavalle 648');

describe clientes;
select * from clientes;

-- Pedientes DELETE UPDATE

-- comando DML delete
-- delete from clientes where codigo=4;
-- delete from clientes where nombre='Laura';
delete from clientes;

-- desactivamos la protección safe updates
set sql_safe_updates=0;		-- =1;

select * from clientes;
insert into clientes (codigo,nombre,apellido) values (100,'Homero','Simpson');
delete from clientes where codigo=100;
insert into clientes (nombre,apellido) values ('Bart','Simpson');

-- DDL truncate
truncate clientes;


-- Comando DML Update
select * from clientes;
update clientes set direccion='Lima 234' where codigo=5;
update clientes set apellido='Paoli', cuit='324322', direccion='Olazabal 1234'
	where codigo=3;

-- update masivo
-- update clientes set nombre='Juana' where nombre='Juan';
-- update clientes set nombre='Juana';


-- Agregar un campo a la tabla
alter table clientes add edad int;
describe clientes;
select * from clientes;
update clientes set edad=23 where codigo=1;
update clientes set edad=34 where codigo=2;

-- Modificar el campo de una table
alter table clientes modify edad tinyint unsigned;

-- Mover el campo de una tabla
alter table clientes modify edad tinyint unsigned after cuit;

-- borrar el campo de una tabla
alter table clientes drop edad;

-- Usando la base de datos negocio.

-- Basándose en la tabla clientes realizar los siguientes puntos.

-- 1- 	Insertar 5 clientes en la tabla clientes utilizando el insert into sin utilizar campos como parte de la sentencias, es decir de la forma simplificada.
-- 2-	Insertar 5 clientes en la tabla clientes utilizando los campos como parte de la sentencias, es decir de la forma extendida. Completar solo los campos nombre, apellido y CUIT.
-- 3-	Actualizar el nombre del cliente 1 a Jose.
-- 4-	Actualizar el nombre apellido y cuit del cliente 3 a Pablo Fuentes 20-21053119-0.
-- 5-	Actualizar todos los comentarios NULL  a ''.
-- 6-	Eliminar los clientes con apellido Perez.
-- 7-	Eliminar los clientes con CUIT Terminan en 0.

-- Basando se en la tabla artículos, realizar los siguientes puntos.
-- 	8- Aumentar un 20% los precios de los artículos con precio menor igual a 50.
-- 	9- Aumentar un 15% los precios de los artículos con precio mayor a 50.
-- 	10- Bajar un 5% los precios de los artículos con precio mayor a 200.
-- 	11- Eliminar los artículos con stock menor a 0.

-- 	12- Agregar a la tabla articulos, los campos stockMinimo y stockMaximo. (usar alter table add)
--  13- Completar en los registros los valores de los campos stockMinimo y stockMaximo (usar update)
--      teniendo en cuenta que el stock mínimo debe ser menor que el stock máximo.
--  14- Lista los articulos que se deben reponer y que cantidad se debe reponer de cada articulos.
--      Tener en cuenta que se debe reponer cuando el stock es menor al stockMinimo y la cantidad de articulos a 
--      reponer es stockMaximo - stock.
--  15- Calcular el valor de venta de toda la mercaderia que hay en stock.
--  16- Calcular el valor de venta + iva de toda la mercaderia que hay en stock.



