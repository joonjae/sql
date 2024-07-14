USE DBDeposito;

/*-------------------PRIMERA FUNCION-------------------*/
DROP FUNCTION IF EXISTS calcula_stock_disponible;
DELIMITER //
CREATE FUNCTION calcula_stock_disponible(p_id_producto VARCHAR(40), p_cantidad INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE nuevo_stock INT;
    
    -- Calcular el nuevo stock
    SELECT stock_disponible - p_cantidad INTO nuevo_stock
    FROM STOCK_MATERIALES
    WHERE id_producto = p_id_producto;

    -- Asegurar que el nuevo stock no sea negativo
    IF nuevo_stock < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Stock insuficiente';
    END IF;

    RETURN nuevo_stock;
END//
DELIMITER ;

-- Ejecución de la función calcula_stock_disponible
SET @id_producto := 'P001';
SET @cantidad_a_restar := 10000;

-- Calcular el nuevo stock utilizando la función. TIENE QUE DECIR QUE EL STOCK DISPONIBLE ES INSUFICIENTE
SET @nuevo_stock := calcula_stock_disponible(@id_producto, @cantidad_a_restar);


SET @cantidad_a_restar := 50;
SET @nuevo_stock := calcula_stock_disponible(@id_producto, @cantidad_a_restar);
-- Actualizar la tabla utilizando el valor calculado
UPDATE STOCK_MATERIALES
SET stock_disponible = @nuevo_stock
WHERE id_producto = @id_producto;

SELECT * FROM STOCK_MATERIALES;


/*-----------------SEGUNDA FUNCION------------------*/
DROP FUNCTION IF EXISTS pedidos_restantes_agente;
DELIMITER //
CREATE FUNCTION pedidos_restantes_agente(leg_agente INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_pedidos INT;
    DECLARE pedidos_movidos INT;
    DECLARE pedidos_restantes INT;

    -- Contar el total de pedidos asignados al agente
    SELECT COUNT(*) INTO total_pedidos
    FROM PEDIDO
    WHERE legajo_agente = leg_agente;

    -- Contar los pedidos movidos (registrados en la tabla MOVIMIENTO)
    SELECT COUNT(*) INTO pedidos_movidos
    FROM PEDIDO p
    JOIN MOVIMIENTO m ON p.id_pedido = m.id_pedido
    WHERE p.legajo_agente = leg_agente;

    -- Calcular los pedidos restantes
    SET pedidos_restantes = total_pedidos - pedidos_movidos;

    RETURN pedidos_restantes;
END//
DELIMITER ;

SELECT * FROM AGENTE;
SELECT * FROM PEDIDO;
SELECT * FROM MOVIMIENTO;

-- Ejecución de la función actualizar_contar_pedidos_agente
SET @LEG_AGENTE := 3;
SET @nro_pedidos := pedidos_restantes_agente(@LEG_AGENTE);
-- Actualizar la tabla utilizando el valor calculado
UPDATE AGENTE
SET nro_pedidos = @nro_pedidos
WHERE legajo = @LEG_AGENTE;

SELECT * FROM AGENTE;
