SHOW DATABASES ;
USE tienda;
SHOW TABLES;
-- CONSULTA 1
SELECT * from producto;
-- CONSULTA 2
SELECT nombre, precio FROM  producto;
-- Consulta 3
DESCRIBE producto;
-- Consulta 4
SELECT nombre, precio, precio * 1.3 as precio_dolares
FROM tienda.producto;
-- Consulta 5
SELECT nombre as nombre_del_producto , precio as euro, precio * 1.3 as dolares
FROM tienda.producto;
-- Consulta 6
SELECT UPPER(nombre), precio
FROM tienda.producto;
-- Consulta 7
SELECT lower(nombre), precio
FROM tienda.producto;
-- Consulta 8
SELECT nombre , UPPER(left(nombre ,2)) AS 2primer_caracter 
FROM tienda.fabricante;
-- Consulta 9 
SELECT nombre, round(precio)
FROM tienda.producto;
-- Consulta 10
SELECT nombre, truncate(precio,0)
FROM tienda.producto;
-- Consulta 11
SELECT codigo_fabricante
FROM tienda.producto;
-- Consulta 12
SELECT distinct codigo_fabricante
FROM tienda.producto;
-- Consulta 13
SELECT nombre FROM fabricante
order by nombre asc;
-- Consulta 14
 SELECT nombre FROM fabricante
order by nombre desc;
-- Consulta 15
SELECT nombre , precio from tienda.producto 
order by nombre asc , precio desc; 
-- Consulta 16 
SELECT nombre FROM tienda.producto limit 0,5;
-- Consulta 17
SELECT nombre FROM tienda.producto limit 3,2;
-- Consulta 18
select nombre, precio
from producto
ORDER BY precio asc
LIMIT 11;
-- Consulta 19
select nombre, precio
from producto
ORDER BY precio desc
LIMIT 11;
-- Consulta 20
SELECT nombre FROM tienda.producto
where codigo_fabricante=2;
-- Consulta 21
SELECT p.nombre, p.precio, f.nombre
FROM producto p
JOIN fabricante f
on p.codigo_fabricante=f.codigo;
-- Consulta 22
SELECT p.nombre, p.precio, f.nombre
FROM producto p
JOIN fabricante f
on p.codigo_fabricante=f.codigo
order by f.nombre;
-- Consulta 23
SELECT p.codigo, p.nombre, f.codigo, f.nombre
From producto p
JOIN fabricante f
ON p.codigo_fabricante = f.codigo;
-- Consulta 24
SELECT p.nombre, min(p.precio), f.nombre
FROM producto p
JOIN fabricante f
ON p.codigo_fabricante = f.codigo;
-- Consulta 25
SELECT p.nombre, max(p.precio), f.nombre
FROM producto p
JOIN fabricante f
ON p.codigo_fabricante = f.codigo;
-- Consulta 26
SELECT p.nombre from producto p
JOIN fabricante f
on p.codigo_fabricante = f.codigo
WHERE f.nombre = "lenovo";
-- Consulta 27
SELECT p.nombre from producto p
JOIN fabricante f
on p.codigo_fabricante = f.codigo
WHERE f.nombre = "crucial" and (p.precio > 200);
-- Consulta 28
SELECT p.nombre from producto p
JOIN fabricante f
on p.codigo_fabricante = f.codigo
WHERE f.nombre = "Asus" or f.nombre= "Hewlett-Packardy" or f.nombre="Seagate";
-- Consulta 29
SELECT p.nombre from producto p
JOIN fabricante f
on p.codigo_fabricante = f.codigo
WHERE f.nombre IN ("Asus","Hewlett-Packardy","Seagate") ;
-- Consulta 30
SELECT p.nombre, p.precio 
FROM producto p 
JOIN fabricante f
on p.codigo_fabricante = f.codigo
WHERE f.nombre LIKE "%e";
-- Consulta 31
SELECT p.nombre, p.precio 
FROM producto p 
JOIN fabricante f
on p.codigo_fabricante = f.codigo
WHERE f.nombre LIKE "%w%";
-- Consulta 32
SELECT p.nombre, p.precio, f.nombre
from producto p
JOIN fabricante f
on p.codigo_fabricante = f.codigo
WHERE (p.precio >= 180)
ORDER BY p.precio desc, f.nombre asc ;
-- Consulta 33
select tienda.fabricante.codigo, 
tienda.fabricante.nombre 
from tienda.fabricante 
where exists (select * from tienda.producto 
where tienda.fabricante.codigo = tienda.producto.codigo_fabricante);
-- Consulta 34
SELECT f.codigo ,f.nombre,p.nombre from fabricante f
left join producto p
on p.codigo_fabricante = f.codigo;
-- Consulta 35
select * 
from tienda.fabricante 
where not exists (select * from tienda.producto 
where tienda.fabricante.codigo = tienda.producto.codigo_fabricante);
-- Consulta 36
select tienda.producto.nombre 
from tienda.producto 
where exists (select * from tienda.fabricante 
where tienda.fabricante.codigo = tienda.producto.codigo_fabricante 
and tienda.fabricante.nombre = 'Lenovo');
-- Consulta 37
select * 
from producto 
where tienda.producto.precio = (select max(precio) 
from tienda.producto 
where tienda.producto.codigo_fabricante = (select tienda.fabricante.codigo 
from tienda.fabricante 
where tienda.fabricante.nombre = 'Lenovo'));
-- Consulta 38
select tienda.fabricante.nombre, 
max(precio) 
from tienda.producto
inner join tienda.fabricante 
on (tienda.fabricante.codigo = tienda.producto.codigo_fabricante)
where tienda.fabricante.nombre = 'Lenovo';  
-- Consulta 39
select tienda.fabricante.nombre, 
min(precio) from tienda.producto
inner join tienda.fabricante
on (tienda.fabricante.codigo = tienda.producto.codigo_fabricante)
where tienda.fabricante.nombre = 'Hewlett-Packard';
-- Consulta 40
select * 
from tienda.producto
where tienda.producto.precio >= (select max(precio) from tienda.producto 
where tienda.producto.codigo_fabricante = (select tienda.fabricante.codigo from tienda.fabricante 
where nombre = 'Lenovo'));
-- Consulta 41
select * 
from tienda.producto 
where tienda.producto.precio > (select avg(precio) 
from tienda.producto 
where tienda.producto.codigo_fabricante = (select tienda.fabricante.codigo 
from tienda.fabricante 
where tienda.fabricante.nombre = 'Asus'));
-- Consulta 42 UNIVERSIDAD 1
SELECT p.nombre, p.apellido1, p.apellido2 
from persona p 
order by p.apellido1 asc, p.apellido2 asc, p.nombre;
-- Consulta 43 UNIVERSIDAD 2
Select p.nombre, p.apellido1 ,p.telefono
from persona p 
Where p.telefono is null ;
-- Consulta 44 UNIVERSIDAD 3
SELECT p.nombre , p.fecha_nacimiento 
from persona p
where year (p.fecha_nacimiento) = 1999 ;
-- Consulta 45 Universidad 4
select * from universidad.persona 
where (universidad.persona.tipo = 'profesor' 
and universidad.persona.telefono is null 
and nif like '%K');
-- Consulta 46 Universidad 5
select * from universidad.asignatura 
where universidad.asignatura.curso = 3 
and universidad.asignatura.cuatrimestre = 1 
and universidad.asignatura.id_grado = 7;
-- Consulta 47 Universidad 6
select universidad.persona.apellido1, universidad.persona.apellido2, universidad.persona.nombre, universidad.departamento.nombre
from universidad.persona 
inner join universidad.profesor 
on (universidad.persona.id = universidad.profesor.id_profesor)
inner join universidad.departamento 
on (universidad.profesor.id_departamento = universidad.departamento.id) 
order by universidad.persona.apellido1 asc, universidad.persona.apellido2 asc, universidad.persona.nombre asc;
-- Consulta 48 Universidad 7
select universidad.asignatura.nombre, universidad.curso_escolar.anyo_inicio, universidad.curso_escolar.anyo_fin
from universidad.asignatura 
inner join universidad.alumno_se_matricula_asignatura 
on (universidad.asignatura.id = universidad.alumno_se_matricula_asignatura.id_asignatura)
inner join universidad.persona 
on (universidad.alumno_se_matricula_asignatura.id_alumno = universidad.persona.id)
inner join universidad.curso_escolar 
on (universidad.asignatura.curso = universidad.curso_escolar.id)
where universidad.persona.nif = '26902806M'; 
-- Consulta 49 Universidad 8
select distinctrow universidad.departamento.nombre 
from universidad.departamento
inner join universidad.profesor 
on (universidad.departamento.id = universidad.profesor.id_departamento)
inner join universidad.asignatura 
on (universidad.profesor.id_profesor = universidad.asignatura.id_profesor)
inner join universidad.grado 
on (universidad.asignatura.id_grado = universidad.grado.id)
where universidad.grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
-- Consulta 50 Universidad 9 
select distinctrow universidad.persona.nombre, universidad.persona.apellido1, universidad.persona.apellido2, universidad.curso_escolar.anyo_inicio
from universidad.persona 
inner join universidad.alumno_se_matricula_asignatura 
on (universidad.persona.id = universidad.alumno_se_matricula_asignatura.id_alumno)
inner join universidad.curso_escolar 
on (universidad.alumno_se_matricula_asignatura.id_curso_escolar = universidad.curso_escolar.id)
where universidad.curso_escolar.anyo_inicio = 2018;
-- Consulta 51 Universidad 10
select universidad.departamento.nombre as nombre_departamento, 
universidad.persona.apellido1, universidad.persona.apellido2, universidad.persona.nombre
from universidad.departamento 
right join universidad.profesor 
on (universidad.profesor.id_departamento = universidad.departamento.id) 
right join universidad.persona 
on (universidad.profesor.id_profesor = universidad.persona.id)
order by universidad.departamento.nombre asc, 
universidad.persona.apellido1 asc, 
universidad.persona.apellido2 asc, 
universidad.persona.nombre asc;
-- Consulta 52 Universidad 11
select universidad.departamento.nombre as nombre_departamento, 
universidad.persona.apellido1, 
universidad.persona.apellido2, 
universidad.persona.nombre
from universidad.departamento 
right join universidad.profesor 
on (universidad.profesor.id_departamento = universidad.departamento.id)
right join universidad.persona 
on (universidad.profesor.id_profesor = universidad.persona.id) 
where universidad.departamento.nombre is null; 
-- Consulta 53 Universidad 12
select universidad.departamento.nombre as nombre_departamento, 
universidad.persona.apellido1, 
universidad.persona.apellido2, 
universidad.persona.nombre
from universidad.departamento 
left join universidad.profesor 
on (universidad.profesor.id_departamento = universidad.departamento.id)
left join universidad.persona 
on (universidad.profesor.id_profesor = universidad.persona.id) 
where universidad.persona.nombre is null 
and universidad.persona.apellido1 is null 
and universidad.persona.apellido2 is null;
-- Consulta 54 Universidad 13
select distinctrow universidad.persona.apellido1, universidad.persona.apellido2, universidad.persona.nombre
from universidad.persona 
left join universidad.asignatura 
on (universidad.persona.id = universidad.asignatura.id_profesor)
where universidad.persona.tipo = 'profesor' and universidad.asignatura.nombre is null;
-- Consulta 55 Universidad 14
select distinct universidad.asignatura.nombre
from universidad.persona
right join universidad.asignatura
on (universidad.persona.id = universidad.asignatura.id_profesor)
where universidad.persona.nombre is null
and universidad.persona.apellido1 is null
and universidad.persona.apellido2 is null;
-- Consulta 56 Universidad 15
select distinct universidad.departamento.nombre
from universidad.departamento
left join universidad.profesor 
on (universidad.departamento.id = universidad.profesor.id_departamento)
where universidad.profesor.id_profesor is null; 
-- Consulta 57 Universidad 16
select universidad.persona.tipo, count(*) as numero_alumnos
from universidad.persona
where universidad.persona.tipo = 'alumno';
-- Consulta 58 Universidad 17
select year(universidad.persona.fecha_nacimiento) as anio_nacimiento, count(*) as numero_Alumnos 
from universidad.persona
where year(universidad.persona.fecha_nacimiento) = 1999;  
-- Consulta 59 Universidad 18 
select universidad.departamento.nombre as nombre_departamento,
count(universidad.profesor.id_departamento) as numero_profesores
from universidad.profesor
inner join universidad.departamento
on (universidad.profesor.id_departamento = universidad.departamento.id)
group by universidad.departamento.nombre
order by numero_profesores desc;
-- Consulta 60 Universidad 19
select universidad.departamento.nombre as nombre_departamento,
count(universidad.profesor.id_departamento) as numero_profesores
from universidad.profesor
right join universidad.departamento
on (universidad.profesor.id_departamento = universidad.departamento.id)
group by universidad.departamento.nombre;
-- Consulta 61 Universidad 20
select universidad.grado.nombre as nombre_grados_existentes,
count(universidad.asignatura.id_grado) as numero_asignaturas
from universidad.grado
left join universidad.asignatura
on (universidad.grado.id = universidad.asignatura.id_grado)
group by universidad.grado.nombre
order by numero_asignaturas desc; 
-- Consulta 62 Universidad 21
select universidad.grado.nombre as nombre_grados_existentes,
count(universidad.asignatura.id_grado) as numero_asignaturas
from universidad.grado
left join universidad.asignatura
on (universidad.grado.id = universidad.asignatura.id_grado)
group by universidad.grado.nombre
having numero_asignaturas > 40; 
-- Consulta 63 Universidad 22
select universidad.grado.nombre as nombre_grado,
universidad.asignatura.tipo as tipo_asignatura,
sum(universidad.asignatura.creditos) as total_creditos_existentes
from universidad.grado
left join universidad.asignatura
on (universidad.grado.id = universidad.asignatura.id_grado)
group by universidad.grado.nombre,
universidad.asignatura.tipo; 







