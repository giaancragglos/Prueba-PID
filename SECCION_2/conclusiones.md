| # Paso	    | # Acción                                                                      |	# Beneficio                                                 |
| ------------- | ----------------------------------------------------------------------------- | ------------------------------------------------------------- |
| Índices       |	Se crearon índices en productos.nombre y categorias.nombre.                 |	Aceleración de búsquedas por nombre.                        |
| Explain Plan  |	Se usó explain("executionStats") para verificar que MongoDB usa índices.    |	Confirma si las consultas están optimizadas.                |
| Agregaciones  |	Se usó $group para cálculos complejos en MongoDB.                           |	Reduce la carga en el cliente.                              |
| Uso de hint() |	Se forzó el uso de índices cuando fue necesario.                            |	Garantiza que MongoDB use el índice en consultas críticas.  |