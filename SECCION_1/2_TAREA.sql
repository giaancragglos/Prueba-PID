/********************************
         Tarea 2
********************************/

SELECT 
    c.id_cliente AS id,        
    c.nombre AS nombre,        
    PRIOR c.nombre AS padre    
FROM clientes c
START WITH c.id_padre IS NULL  
CONNECT BY PRIOR c.id_cliente = c.id_padre 
ORDER BY id;