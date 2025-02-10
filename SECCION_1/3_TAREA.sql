/********************************
         Tarea 3
********************************/
SET TIMING ON;
SELECT c.id_cliente, c.nombre
FROM clientes c
WHERE c.id_padre = 1;

SET TIMING OFF;

/*
>>Query Run In:Resultado de la Consulta 2
Transcurrido: 00:00:00.450
*/

EXPLAIN PLAN FOR
SELECT c.id_cliente, c.nombre
FROM clientes c
WHERE c.id_padre = 1;


SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);


/*
Plan hash value: 433215520
 
---------------------------------------------------------------------------------------------------------------------------------
| Id  | Operation             | Name                       | Rows  | Bytes | Cost (%CPU)| Time     |    TQ  |IN-OUT| PQ Distrib |
---------------------------------------------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT      |                            |    20 |  1560 |     6  (17)| 00:00:01 |        |      |            |
|   1 |  RESULT CACHE         | aj3nxcq84hpv9bt1gj9dyjzs3a |       |       |            |          |        |      |            |
|   2 |   PX COORDINATOR      |                            |       |       |            |          |        |      |            |
|   3 |    PX SEND QC (RANDOM)| :TQ10000                   |    20 |  1560 |     6  (17)| 00:00:01 |  Q1,00 | P->S | QC (RAND)  |
|   4 |     PX BLOCK ITERATOR |                            |    20 |  1560 |     6  (17)| 00:00:01 |  Q1,00 | PCWC |            |
|*  5 |      TABLE ACCESS FULL| CLIENTES                   |    20 |  1560 |     6  (17)| 00:00:01 |  Q1,00 | PCWP |            |
---------------------------------------------------------------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   5 - filter("C"."ID_PADRE"=1)
 
Result Cache Information (identified by operation id):
------------------------------------------------------
 
"   1 - column-count=2; dependencies=(ADMIN2.CLIENTES); name="SELECT c.id_cliente, c.nombre
FROM clientes c
WHERE c.id_padre = 1""
 
Note
-----
   - dynamic statistics used: dynamic sampling (level=2)
   - automatic DOP: Computed Degree of Parallelism is 4

*/


-- CREACION DE INDICE (OPTM CONSULTA)

CREATE INDEX idx_id_padre ON clientes(id_padre);

SET TIMING ON;
SELECT c.id_cliente, c.nombre
FROM clientes c
WHERE c.id_padre = 1;

SET TIMING OFF;

/*
>>Query Run In:Resultado de la Consulta 4
Transcurrido: 00:00:00.117
*/

EXPLAIN PLAN FOR
SELECT c.id_cliente, c.nombre
FROM clientes c
WHERE c.id_padre = 1;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

/*
Plan hash value: 433215520
 
---------------------------------------------------------------------------------------------------------------------------------
| Id  | Operation             | Name                       | Rows  | Bytes | Cost (%CPU)| Time     |    TQ  |IN-OUT| PQ Distrib |
---------------------------------------------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT      |                            |     7 |   546 |     6  (17)| 00:00:01 |        |      |            |
|   1 |  RESULT CACHE         | aj3nxcq84hpv9bt1gj9dyjzs3a |       |       |            |          |        |      |            |
|   2 |   PX COORDINATOR      |                            |       |       |            |          |        |      |            |
|   3 |    PX SEND QC (RANDOM)| :TQ10000                   |     7 |   546 |     6  (17)| 00:00:01 |  Q1,00 | P->S | QC (RAND)  |
|   4 |     PX BLOCK ITERATOR |                            |     7 |   546 |     6  (17)| 00:00:01 |  Q1,00 | PCWC |            |
|*  5 |      TABLE ACCESS FULL| CLIENTES                   |     7 |   546 |     6  (17)| 00:00:01 |  Q1,00 | PCWP |            |
---------------------------------------------------------------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   5 - filter("C"."ID_PADRE"=1)
 
Result Cache Information (identified by operation id):
------------------------------------------------------
 
"   1 - column-count=2; dependencies=(ADMIN2.CLIENTES); name="SELECT c.id_cliente, c.nombre
FROM clientes c
WHERE c.id_padre = 1""
 
Note
-----
   - dynamic statistics used: dynamic sampling (level=2)
   - automatic DOP: Computed Degree of Parallelism is 4 because of no expensive parallel operation
   
*/