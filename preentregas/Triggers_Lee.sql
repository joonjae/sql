USE DBDeposito;


/*---- Creación de las tablas de bitácora (log) -----*/

CREATE TABLE IF NOT EXISTS LOG_PEDIDO (
    id_log INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    accion VARCHAR(50) NOT NULL,
    id_pedido INT NOT NULL,
    legajo_agente INT UNSIGNED NOT NULL,
    nombre VARCHAR(40),
    apellido VARCHAR(40),
    fecha_solicitud DATE,
    tipo_pedido VARCHAR(50),
    usuario VARCHAR(40) NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL
);

CREATE TABLE IF NOT EXISTS LOG_STOCK_MATERIALES (
    id_log INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    accion VARCHAR(50) NOT NULL,
    nro_item INT NOT NULL,
    id_producto VARCHAR(40),
    stock_disponible INT,
    clasificacion_material VARCHAR(40),
    descripcion_material VARCHAR(40),
    fabricante VARCHAR(40),
    id_compra VARCHAR(40),
    lote INT,
    usuario VARCHAR(40) NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL
);


/*---- Creación de Triggers para la Tabla PEDIDO -----*/

-- Trigger BEFORE INSERT
-- Este trigger registrará la acción antes de insertar un nuevo pedido en la tabla PEDIDO.
-- Es decir, registra un intento de inserción de pedido capturando los detalles relevantes 
-- y el usuario que realiza la acción.
DELIMITER $$
CREATE TRIGGER before_insert_pedido
BEFORE INSERT ON PEDIDO
FOR EACH ROW
BEGIN
    INSERT INTO LOG_PEDIDO (accion, id_pedido, legajo_agente, nombre, apellido, fecha_solicitud, tipo_pedido, usuario, fecha, hora)
    VALUES ('Intento de inserción de pedido', NEW.id_pedido, NEW.legajo_agente, NEW.nombre, NEW.apellido, NEW.fecha_solicitud, NEW.tipo_pedido, USER(), CURDATE(), CURTIME());
END $$
DELIMITER ;

-- Trigger AFTER DELETE
-- Este trigger registrará la acción después de eliminar un pedido de la tabla PEDIDO.
-- Esto es para registrar la eliminación de un pedido capturando los detalles relevantes y el usuario que realiza la acción.
DELIMITER $$
CREATE TRIGGER after_delete_pedido
AFTER DELETE ON PEDIDO
FOR EACH ROW
BEGIN
    INSERT INTO LOG_PEDIDO (accion, id_pedido, legajo_agente, nombre, apellido, fecha_solicitud, tipo_pedido, usuario, fecha, hora)
    VALUES ('Eliminación de pedido', OLD.id_pedido, OLD.legajo_agente, OLD.nombre, OLD.apellido, OLD.fecha_solicitud, OLD.tipo_pedido, USER(), CURDATE(), CURTIME());
END $$
DELIMITER ;


/*---- Creación de Triggers para la Tabla STOCK_MATERIALES -----*/

-- BEFORE UPDATE en STOCK_MATERIALES
-- Este trigger registrará la acción antes de actualizar un registro en la tabla STOCK_MATERIALES.
-- Es para poder registrar un intento de actualización de stock antes de que se apliquen los cambios, 
-- capturando los detalles relevantes y el usuario que realiza la acción.
DELIMITER $$
CREATE TRIGGER before_update_stock_materiales
BEFORE UPDATE ON STOCK_MATERIALES
FOR EACH ROW
BEGIN
    INSERT INTO LOG_STOCK_MATERIALES (accion, nro_item, id_producto, stock_disponible, clasificacion_material, descripcion_material, fabricante, id_compra, lote, usuario, fecha, hora)
    VALUES ('Intento de actualización de stock', OLD.nro_item, OLD.id_producto, NEW.stock_disponible, NEW.clasificacion_material, NEW.descripcion_material, NEW.fabricante, NEW.id_compra, NEW.lote, USER(), CURDATE(), CURTIME());
END $$
DELIMITER ;

-- AFTER INSERT en STOCK_MATERIALES
-- Este trigger registrará la acción después de insertar un nuevo registro en la tabla STOCK_MATERIALES.
-- Es decir, registra la inserción de un nuevo registro de stock después de que se complete la operación, 
-- capturando los detalles relevantes y el usuario que realiza la acción.
DELIMITER $$
CREATE TRIGGER after_insert_stock_materiales
AFTER INSERT ON STOCK_MATERIALES
FOR EACH ROW
BEGIN
    INSERT INTO LOG_STOCK_MATERIALES (accion, nro_item, id_producto, stock_disponible, clasificacion_material, descripcion_material, fabricante, id_compra, lote, usuario, fecha, hora)
    VALUES ('Nuevo registro de stock', NEW.nro_item, NEW.id_producto, NEW.stock_disponible, NEW.clasificacion_material, NEW.descripcion_material, NEW.fabricante, NEW.id_compra, NEW.lote, USER(), CURDATE(), CURTIME());
END $$
DELIMITER ;


/* EJEMPLO */
-- Inserción de un Nuevo Pedido
INSERT INTO PEDIDO (legajo_agente, nombre, apellido, fecha_solicitud, tipo_pedido)
VALUES (1, 'Juan', 'Pérez', '2024-01-15', 'Materiales');
SELECT * FROM LOG_PEDIDO;

-- Eliminación de un Pedido Existente
DELETE FROM PEDIDO WHERE id_pedido = 1;
SELECT * FROM LOG_PEDIDO;


-- Actualización de Stock de Materiales
SELECT * FROM STOCK_MATERIALES;
ALTER TABLE LOG_STOCK_MATERIALES MODIFY accion VARCHAR(50);
UPDATE STOCK_MATERIALES SET stock_disponible = 100 WHERE nro_item = 1;

SELECT * FROM LOG_STOCK_MATERIALES;

-- Inserción de Nuevo Registro en Stock de Materiales
SELECT * FROM STOCK_MATERIALES;
INSERT INTO STOCK_MATERIALES (id_producto, stock_disponible, clasificacion_material, descripcion_material, fabricante, id_compra, lote)
VALUES ('P010', 150, 'Inductor', 'Inductor 27uH, 65mA, 12.5Ω', 'TE Connectivity', 'C012', 12);
SELECT * FROM LOG_STOCK_MATERIALES;


