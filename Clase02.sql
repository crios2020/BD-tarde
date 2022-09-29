show databases;
select version();

drop database if exists clase02;
create database clase02;
use clase02;

show tables;

create table clientes(
	codigo int auto_increment primary key,
    nombre varchar(25) not null,
    apellido varchar(25) not null,
    cuit char(13),
    direccion varchar(50),
    comentarios varchar(255)
);

describe clientes;

insert into clientes (nombre,apellido,cuit,direccion) values
	('Juan','Perez','33333','Lima 22');
    
select * from clientes;

-- Ejercicio 1
-- 1- Borrar si existe la base de datos Agenda.
drop database if exists Agenda;

-- 2- Crear la base de datos Agenda.
create database Agenda;

-- 3- Ingresar a la base de datos creada.
use Agenda;

-- 4- Crear una tabla llamada "agenda". Debe tener los siguientes campos:

--    nombre (cadena de 20), 
--    domicilio (cadena de 30)
--    telefono (cadena de 11)

create table agenda(
	nombre varchar(20),
    domicilio varchar(30),
    telefono varchar(11)
);

-- 5- Visualizar las tablas existentes en la base de datos para verificar la creación de "agenda".
show tables;

-- 6- Visualizar la estructura de campos de la tabla "agenda". (describe).
describe agenda;

-- 7- Ingresar 10 registros con valores aleatorios.
insert into agenda (nombre, domicilio, telefono) values
	('Laura','W Morris 2332', '0303456');

-- 8- Seleccione y muestre todos los registros de la tabla:
select * from agenda;

-- Felicitaciones usted ha armado su agenda personal!!!!


-- -----------------------------------
-- Tipos de datos más comunes en MySQL
-- -----------------------------------


-- Tipo de datos Texto de datos más comunes

-- Tipo		Bytes de almacenamiento
-- _______________________________________
-- char(x)		x
-- varchar(x)	x+1

/*
	nombre char(20)
    |ANA                 | 				20 bytes
    |CARLOS              | 				20 bytes
    |MAXIMILIANO         | 				20 bytes
							Total:		60 bytes

	nombre varchar(20)
    |ANA                 | 				 3 + 1 = 4 bytes
    |CARLOS              |				 6 + 1 = 7 bytes
    |MAXIMILIANO         |				11 + 1 =12 bytes
							Total:				23 bytes
    

*/


-- Tipo de datos Numérico

-- Tipo		Bytes de almacenamiento
-- _______________________________________
-- bool (boolean)	1	(0 es false distinto de 0 es true)
-- tinyint			1	2^8			256
-- smallint			2	2^16		65536
-- mediumint		3	2^24		16777216
-- int (integer)	4	2^32		4294967296
-- bigint			8	2^64		18446744073709551616
-- float			4	 		
-- double			8
-- decimal(t,d)		t+2 

/*

		precio decimal(6,2)
        9999,99
        ----,--
        
        precio decimal(7,2)
        99999,99
        -----,--

		codigo tinyint (signed)
        
        |--------|--------|
	  -128       0       127
      
        codigo tinyint unsigned
		|-----------------|
        0                255

		campo float 32 bits
        
        10/3
        3.333333
        --------
        
        100/3
        33.33333
        --------
        
        1000/3
        333.3333
        --------
        
        10000/3
        3333.333
        --------
        
        
        campo double 64 bits
        
        10/3
        3.33333333333333
        ----------------
        
        100/3
        33.3333333333333
        ----------------

*/

-- Tipo de datos Fecha y Hora

-- Tipo		Bytes de almacenamiento
-- _______________________________________
-- date		3	Año Mes Dia ‘2012-10-25’		
-- datetime	8
-- time		3
-- year		1

select 'Hola Mundo!!';
select 2 + 2;
select 2 + 2 Total;					-- alias
select 2 + 2 Valor_Total;
select 2 + 2 'Valor Total';
select 2 + 2 as Total;

select pi() PI;
select round(pi(), 2) PI;
select curdate() Fecha_Actual;
select curtime() Hora_Actual;
select sysdate() Fecha_Hora_Actual;

