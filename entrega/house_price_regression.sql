-- 1. Cree una base de datos llamada house_price_regression.

CREATE DATABASE IF NOT EXISTS house_price_regression;

USE house_price_regression;

-- 2. Cree una tabla house_price_datacon las mismas columnas que figuran en el archivo csv. 
-- Asegúrese de utilizar los tipos de datos correctos para las columnas.

CREATE TABLE IF NOT EXISTS house_price_regression.house_price_date(
`id` BIGINT,
`fecha` DATE,                         
`dormitorios` INT ,                           
`baños` FLOAT,                         
`pies_cuadrados_vivienda` INT,                
`pies_cuadrados_lote` INT,                    
`pisos` FLOAT ,                               
`frente_al_mar` INT,                          
`vista` INT ,                                 
`estado`  INT ,                              
`calificación` INT  ,                        
`pies_cuadrados_sin_sotano` INT ,            
`pies_cuadrados_sótano` INT,                  
`año_construcción` INT ,                      
`año_renovación` INT,                         
`código_postal`  INT ,                        
`latitud` FLOAT,                              
`longitud` FLOAT ,                           
`pies_cuadrados_vivienda_15` INT ,            
`pies_cuadrados_lote_15` INT ,               
`precio` INT                                
);


-- 3. Importe los datos del archivo csv a la tabla. Antes de importar los datos a la tabla vacía, asegúrese de haber eliminado los encabezados del archivo csv. 
-- Para no modificar los datos originales, si lo deseas puedes crear una copia del archivo csv también. 
-- Tenga en cuenta que es posible que deba utilizar las siguientes consultas para otorgar permiso a SQL para importar datos desde archivos csv de forma masiva:

SHOW VARIABLES LIKE 'local_infile'; -- This query would show you the status of the variable ‘local_infile’. If it is off, use the next command, otherwise you should be good to go

SET GLOBAL local_infile = 1;

-- 4. Seleccione todos los datos de la tabla house_price_datapara verificar si los datos se importaron correctamente

SELECT * FROM house_price_date;

-- 5. Utilice el comando alterar tabla para eliminar la columna datede la base de datos, ya que no la usaríamos en el análisis con SQL. 
-- Seleccione todos los datos de la tabla para verificar si el comando funcionó. Limite los resultados devueltos a 10.

ALTER TABLE house_price_date
DROP COLUMN fecha;

SELECT * FROM house_price_date
LIMIT 10;


-- 6. Utilice la consulta SQL para encontrar cuántas filas de datos tiene.

SELECT count(*)
FROM house_price_date;

-- 7. Ahora intentaremos encontrar los valores únicos en algunas de las columnas categóricas:

USE house_price_regression;

-- ¿Cuáles son los valores únicos en la columna bedrooms?

SELECT DISTINCT dormitorios
FROM house_price_date;

-- ¿Cuáles son los valores únicos en la columna bathrooms?

SELECT DISTINCT baños
FROM house_price_date;

-- ¿Cuáles son los valores únicos en la columna floors?

SELECT DISTINCT baños
FROM house_price_date;

-- ¿Cuáles son los valores únicos en la columna condition?

SELECT DISTINCT pisos
FROM house_price_date;

-- ¿Cuáles son los valores únicos en la columna grade?

SELECT DISTINCT calificación
FROM house_price_date;

-- 8. Ordene los datos en orden decreciente según el precio de la casa. 

SELECT *
FROM house_price_date
ORDER BY precio desc;

--  Devuelva solo los ID de las 10 casas más caras de sus datos.

SELECT id, precio
FROM house_price_date
ORDER BY precio desc
LIMIT 10;

-- 9. ¿Cuál es el precio medio de todas las propiedades de tus datos?

SELECT AVG(precio) AS precio_medio 
FROM house_price_date;

-- 10. En este ejercicio usaremos un grupo simple por para verificar las propiedades de algunas de las variables categóricas en nuestros datos.

-- ¿Cuál es el precio medio de las casas agrupadas por dormitorios? 
-- El resultado devuelto debe tener sólo dos columnas, dormitorios y Promedio de los precios. 
-- Utilice un alias para cambiar el nombre de la segunda columna.

SELECT AVG(precio) AS promedio_de_precios, dormitorios
FROM house_price_date
GROUP BY dormitorios;

-- ¿Cuál es el promedio sqft_livingde las casas agrupadas por dormitorios? 
-- El resultado devuelto debe tener solo dos columnas, dormitorios y Promedio del sqft_living. 
-- Utilice un alias para cambiar el nombre de la segunda columna.

SELECT AVG(precio) AS promedio_de_pies_cuadrados_vivienda, dormitorios
FROM house_price_date
GROUP BY dormitorios;

-- ¿Cuál es el precio promedio de las casas con frente a mar y sin frente a mar?
-- El resultado devuelto debe tener solo dos columnas, frente al mar y el promedio del precios. 
-- Utilice un alias para cambiar el nombre de la segunda columna.

SELECT frente_al_mar, AVG(precio) AS Promedio_de_precios
FROM house_price_date
GROUP BY frente_al_mar;

-- ¿Existe alguna correlación entre las columnas conditiony grade? 
-- Puedes analizar esto agrupando los datos por una de las variables y luego agregando los resultados de la otra columna. 
-- Verifique visualmente si existe una correlación positiva, una correlación negativa o ninguna correlación entre las variables.

SELECT estado, AVG(calificación) AS avg_clasificacion
FROM house_price_date
GROUP BY estado
ORDER BY estado;

SELECT calificación, AVG(estado) AS avg_estado
FROM house_price_date
GROUP BY calificación
ORDER BY calificación;


-- 11. Uno de los clientes sólo está interesado en las siguientes casas:

-- Número de dormitorios 3 o 4
-- Baños más de 3
-- Un piso
-- Sin paseo marítimo
-- La condición debe ser 3 al menos.
-- La nota debe ser al menos 5.
-- Precio inferior a 300000

SELECT *
FROM house_price_date
WHERE dormitorios IN (3,4) -- Número de dormitorios 3 o 4
	AND baños > 3 -- Baños más de 3
    AND pisos = 1 -- Un piso
    AND frente_al_mar = 0 -- Sin paseo marítimo
    AND estado >= 3 -- Condición debe ser 3 al menos
    AND calificación >= 5 -- La nota debe ser al menos 5
    AND precio < 300000; -- Precio inferior a 300000
    
-- Lo siento, pero no encontramos lo que buscas.

-- 12. Su gerente quiere conocer la lista de propiedades cuyos precios son el doble que el promedio de todas las propiedades en la base de datos. 
-- Escriba una consulta para mostrarles la lista de dichas propiedades. 
-- Es posible que necesite utilizar una subconsulta para este problema.

SELECT *
FROM house_price_date
WHERE precio > (SELECT AVG(precio) * 2 
				FROM house_price_date);
                
-- 13. Dado que esto es algo que interesa habitualmente a la alta dirección, cree una vista de la misma consulta.

CREATE VIEW doble_precio_promedio AS 
SELECT *
FROM house_price_date
WHERE precio > (SELECT AVG(precio) * 2 
				FROM house_price_date);

SHOW CREATE VIEW doble_precio_promedio;

-- La mayoría de los clientes están interesados ​​en propiedades de tres o cuatro dormitorios. 
-- ¿Cuál es la diferencia en los precios medios de las propiedades de tres y cuatro dormitorios?

SELECT AVG(precio) AS precio_promedio_tres_dormitorios,
       (SELECT AVG(precio) 
			FROM house_price_date 
            WHERE dormitorios = 4) AS precio_promedio_cuatro_dormitorios,
       (SELECT AVG(precio) 
			FROM house_price_date 
            WHERE dormitorios = 4) - AVG(precio) AS diferencia_precios
FROM house_price_date
WHERE dormitorios = 3;

-- 15. ¿Cuáles son las diferentes ubicaciones donde las propiedades están disponibles en su base de datos? (códigos postales distintos)

SELECT DISTINCT código_postal
FROM house_price_date;

-- 16. Muestra la lista de todas las propiedades que fueron renovadas.

SELECT *
FROM house_price_date
WHERE año_renovación > 0;

-- 17. Proporcione los detalles de la propiedad que ocupa el puesto 11 entre las más caras de su base de datos.

SELECT *
FROM house_price_date
ORDER BY precio DESC
LIMIT 1 OFFSET 10;


SELECT *
FROM house_price_date
ORDER BY precio DESC
LIMIT 10,1;

