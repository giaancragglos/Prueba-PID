CREATE TABLE clientes (
    id_cliente NUMBER PRIMARY KEY,
    nombre VARCHAR2(100),
    fecha_registro DATE,
    id_padre NUMBER NULL, 
    CONSTRAINT fk_padre FOREIGN KEY (id_padre) REFERENCES clientes(id_cliente)
);


BEGIN
    FOR i IN 1..100500 LOOP
        INSERT INTO clientes (id_cliente, nombre, fecha_registro, id_padre)
        VALUES (
            i, 
            'Cliente_' || i, 
            TRUNC(SYSDATE) - DBMS_RANDOM.VALUE(0, 365), 
            CASE 
                WHEN i <= 10 THEN NULL
                ELSE TRUNC(DBMS_RANDOM.VALUE(1, i-1)) 
            END
        );
    END LOOP;
    COMMIT;
END;