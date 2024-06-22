-- Uno de esos parámetros incluye comprender qué factores son responsables del mayor valor de la propiedad: $650 mil y más

-- Consulta SQL para seleccionar propiedades con valor de $650,000 o más:

SELECT *
FROM house_price_date
WHERE precio >= 650000;

SELECT AVG(dormitorios) AS promedio_dormitirio, 
		AVG(baños) AS promedio_baños, 
        AVG(pies_cuadrados_vivienda) AS promedio_pies_cuadrados_vivienda, 
        AVG(calificación) AS promedio_calificación, 
        AVG(estado) AS promedio_estado,
        AVG(precio) AS promedio_precio
FROM house_price_date
WHERE precio >= 650000;


SELECT AVG(dormitorios) AS promedio_dormitirio, 
		AVG(baños) AS promedio_baños, 
        AVG(pies_cuadrados_vivienda) AS promedio_pies_cuadrados_vivienda, 
        AVG(calificación) AS promedio_calificación, 
        AVG(estado) AS promedio_estado,
        AVG(precio) AS promedio_precio
FROM house_price_date
WHERE precio < 650000;

SELECT precio
from house_price_date
WHERE precio >= 650000
order by precio desc;

SELECT 
    CASE 
        WHEN precio BETWEEN 650000 AND 1000000 THEN '650000-1000000'
        WHEN precio BETWEEN 1000001 AND 3000000 THEN '1000001-3000000'
        ELSE '3000001+' 
    END AS rango_precio,
    AVG(dormitorios) AS promedio_dormitorios, 
    AVG(baños) AS promedio_baños, 
    AVG(pies_cuadrados_vivienda) AS promedio_pies_cuadrados_vivienda, 
    AVG(calificación) AS promedio_calificación, 
    AVG(estado) AS promedio_estado,
    AVG(precio) AS promedio_precio
FROM house_price_date
GROUP BY rango_precio
ORDER BY MIN(precio);



SELECT código_postal, COUNT(*) AS count, AVG(precio)
FROM house_price_date
WHERE precio >= 650000
GROUP BY código_postal
ORDER BY count DESC;


SELECT *
FROM house_price_date;


SELECT DISTINCT ROUND(precio / 50000) * 50000 AS precio_redondeado
FROM house_price_date;

SELECT ROUND(precio / 50000) * 50000 AS precio_redondeado, COUNT(*) AS cantidad_precios
FROM house_price_date
GROUP BY ROUND(precio / 50000) * 50000;

SELECT 
    ROUND(precio / 50000) * 50000 AS precio_redondeado, 
    COUNT(*) AS cantidad_precios,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM house_price_date) AS porcentaje
FROM house_price_date
GROUP BY precio_redondeado;


SELECT 
    CASE
        WHEN precio_redondeado >= 1 AND precio_redondeado <= 250000 THEN '1 - 250,000'
        WHEN precio_redondeado >= 300000 AND precio_redondeado <= 800000 THEN '300,000 - 750,000'
        ELSE '850,000 - Resto'
    END AS rango_precio,
    COUNT(*) AS cantidad_precios,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM house_price_date) AS porcentaje
FROM (
    SELECT ROUND(precio / 50000) * 50000 AS precio_redondeado
    FROM house_price_date
) AS subconsulta
GROUP BY rango_precio;



