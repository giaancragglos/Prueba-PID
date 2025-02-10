/********************************
         Tarea 1
********************************/
SELECT 
    TO_CHAR(fecha_registro, 'YYYY-MM') AS MES_ANIO,
    COUNT(*) AS CANTIDAD_CLIENTES
FROM clientes
GROUP BY TO_CHAR(fecha_registro, 'YYYY-MM')
ORDER BY MES_ANIO;