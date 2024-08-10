USE DBDeposito;

/*------------------------------------------*/
/*                  VISTAS                  */
/*------------------------------------------*/

-- Vista de relación entre AGENTE y PERSONA
-- Esta vista crea una relación entre las tablas AGENTE y PERSONA, 
-- uniendo los datos de ambas tablas basándose en el campo cuil. 
-- Devuelve el legajo y el CUIL del agente junto con el nombre y 
-- apellido de la persona asociada.
SELECT a.legajo, a.cuil, p.nombre, p.apellido
FROM AGENTE a
INNER JOIN PERSONA p ON a.cuil = p.cuil;

-- Vista de relación entre PEDIDO y AGENTE
-- Esta vista une las tablas PEDIDO y AGENTE basándose en 
-- el campo legajo_agente de la tabla PEDIDO y el campo legajo 
-- de la tabla AGENTE. Devuelve el ID del pedido, el nombre y 
-- apellido del agente que realizó el pedido, y el rol u 
-- ocupación del agente.
SELECT p.id_pedido, p.nombre, p.apellido, a.rol_ocupacion
FROM PEDIDO p
INNER JOIN AGENTE a ON p.legajo_agente = a.legajo;

-- Vista de relación entre LISTA_MATERIALES y PRODUCTO
-- Esta vista une las tablas LISTA_MATERIALES y PRODUCTO 
-- basándose en el campo id_producto. Devuelve el número de 
-- la lista de materiales, la descripción del producto y 
-- el nombre del producto.
SELECT l.nro, l.descripcion_producto, p.nombre_producto
FROM LISTA_MATERIALES l
INNER JOIN PRODUCTO p ON l.id_producto = p.id_producto;

-- Vista de relación entre STOCK_MATERIALES y PRODUCTO
-- Esta vista une las tablas STOCK_MATERIALES y PRODUCTO 
-- basándose en el campo id_producto. Devuelve el número del 
-- ítem de stock, la descripción del material y el nombre del 
-- producto.
SELECT s.nro_item, s.descripcion_material, p.nombre_producto
FROM STOCK_MATERIALES s
INNER JOIN PRODUCTO p ON s.id_producto = p.id_producto;

-- Vista de relación entre MOVIMIENTO y AGENTE
-- Esta vista une las tablas MOVIMIENTO y AGENTE basándose en 
-- el campo legajo_supervisor. Devuelve el ID del movimiento, 
-- si es un ingreso o egreso, y el rol u ocupación del supervisor 
-- del agente.
SELECT m.id_movimiento, m.ingreso_egreso, a.rol_ocupacion
FROM MOVIMIENTO m
INNER JOIN AGENTE a ON m.legajo_supervisor = a.legajo;

-- Vista de pedidos y las cantidades solicitadas
-- Esta vista muestra los pedidos y las cantidades solicitadas 
-- de materiales, uniendo las tablas PEDIDO, LISTA_MATERIALES y 
-- STOCK_MATERIALES. Devuelve el ID del pedido, nombre y apellido 
-- del agente, ID del producto, descripción del producto, cantidad 
-- solicitada y el stock disponible, filtrando los resultados para 
-- mostrar solo aquellos en los que la cantidad solicitada sea 
-- menor o igual al stock disponible.
SELECT 
    p.id_pedido,
    p.nombre,
    p.apellido,
    lm.id_producto,
    lm.descripcion_producto,
    lm.cantidad AS cantidad_solicitada,
    sm.stock_disponible
FROM 
    PEDIDO p
JOIN 
    LISTA_MATERIALES lm ON p.legajo_agente = lm.nro_item
JOIN 
    STOCK_MATERIALES sm ON lm.id_producto = sm.id_producto
WHERE 
    lm.cantidad <= sm.stock_disponible;

-- Vista adicional de pedidos y sus materiales
-- Esta vista muestra una relación entre los pedidos y 
-- los materiales solicitados. Une las tablas PEDIDO y 
-- LISTA_MATERIALES basándose en el campo legajo_agente 
-- de PEDIDO y nro_item de LISTA_MATERIALES. Devuelve el ID 
-- del pedido, nombre y apellido del agente, número del ítem, 
-- ID del producto, descripción del producto, en qué se 
-- utiliza y la cantidad solicitada.
SELECT 
    p.id_pedido,
    p.nombre AS nombre_agente,
    p.apellido AS apellido_agente,
    lm.nro AS numero_item,
    lm.id_producto,
    lm.descripcion_producto,
    lm.utilizado_en,
    lm.cantidad
FROM 
    PEDIDO p
JOIN 
    LISTA_MATERIALES lm ON p.legajo_agente = lm.nro_item;

