USE DBDeposito;

-- Chequeo de la relación entre AGENTE y PERSONA
SELECT a.legajo, a.cuil, p.nombre, p.apellido
FROM AGENTE a
INNER JOIN PERSONA p ON a.cuil = p.cuil;

-- Chequeo de la relación entre PEDIDO y AGENTE
SELECT p.id_pedido, p.nombre, p.apellido, a.rol_ocupacion
FROM PEDIDO p
INNER JOIN AGENTE a ON p.legajo_agente = a.legajo;

-- Chequeo de la relación entre LISTA_MATERIALES y PRODUCTO
SELECT l.nro, l.descripcion_producto, p.nombre_producto
FROM LISTA_MATERIALES l
INNER JOIN PRODUCTO p ON l.id_producto = p.id_producto;

-- Chequeo de la relación entre STOCK_MATERIALES y PRODUCTO
SELECT s.nro_item, s.descripcion_material, p.nombre_producto
FROM STOCK_MATERIALES s
INNER JOIN PRODUCTO p ON s.id_producto = p.id_producto;

-- Chequeo de la relación entre MOVIMIENTO y AGENTE
SELECT m.id_movimiento, m.ingreso_egreso, a.rol_ocupacion
FROM MOVIMIENTO m
INNER JOIN AGENTE a ON m.legajo_supervisor = a.legajo;

-- Chequeo de los pedidos y las cantidades solicitadas
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


/*
-- Chequeo de datos en la tabla PERSONA
SELECT * FROM PERSONA;

-- Chequeo de datos en la tabla AGENTE
SELECT * FROM AGENTE;

-- Chequeo de datos en la tabla PEDIDO
SELECT * FROM PEDIDO;

-- Chequeo de datos en la tabla LISTA_MATERIALES
SELECT * FROM LISTA_MATERIALES;

-- Chequeo de datos en la tabla STOCK_MATERIALES
SELECT * FROM STOCK_MATERIALES;

-- Chequeo de datos en la tabla MOVIMIENTO
SELECT * FROM MOVIMIENTO;

-- Chequeo de datos en la tabla PRODUCTO
SELECT * FROM PRODUCTO;

-- Chequeo de datos en la tabla RESISTENCIA
SELECT * FROM RESISTENCIA;

-- Chequeo de datos en la tabla CAPACITOR
SELECT * FROM CAPACITOR;

-- Chequeo de datos en la tabla BOBINA
SELECT * FROM BOBINA;

-- Chequeo de datos en la tabla TRANSISTOR
SELECT * FROM TRANSISTOR;

-- Chequeo de datos en la tabla IC_COMPUERTAS
SELECT * FROM IC_COMPUERTAS;

*/