-- Creación de la BASE
-- DROP DATABASE IF EXISTS DBDeposito;
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS DBDeposito;
USE DBDeposito;

/*------------------------------------------*/
/*                  TABLAS                  */
/*------------------------------------------*/

-- Tabla: PERSONA
CREATE TABLE IF NOT EXISTS PERSONA (
    cuil BIGINT UNSIGNED NOT NULL UNIQUE PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    apellido VARCHAR(40) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    tel_contacto INT NOT NULL,
    sexo ENUM('M','F') NOT NULL
);

-- Tabla: AGENTE
CREATE TABLE IF NOT EXISTS AGENTE (
    legajo INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cuil BIGINT UNSIGNED NOT NULL UNIQUE,
    rol_ocupacion VARCHAR(40) NOT NULL,
    fecha_ingreso DATE NOT NULL,
    sector_trabajo VARCHAR(40) NOT NULL,
    tel_interno INT,
    email VARCHAR(40) NOT NULL,
    nro_pedidos INT UNSIGNED NOT NULL
);

-- Tabla: PEDIDO
CREATE TABLE IF NOT EXISTS PEDIDO (
    id_pedido INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    legajo_agente INT UNSIGNED NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    apellido VARCHAR(40) NOT NULL,
    fecha_solicitud DATE NOT NULL,
    tipo_pedido VARCHAR(40) NOT NULL
);

-- Tabla: LISTA_MATERIALES
CREATE TABLE IF NOT EXISTS LISTA_MATERIALES (
    nro INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nro_item INT NOT NULL UNIQUE,
    id_producto VARCHAR(40) NOT NULL,
    descripcion_producto VARCHAR(40) NOT NULL,
    utilizado_en VARCHAR(40) NOT NULL,
    cantidad INT UNSIGNED NOT NULL
);

-- Tabla: STOCK_MATERIALES
CREATE TABLE IF NOT EXISTS STOCK_MATERIALES (
    nro_item INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_producto VARCHAR(40) NOT NULL,
    stock_disponible INT NOT NULL,
    clasificacion_material VARCHAR(40) NOT NULL,
    descripcion_material VARCHAR(40) NOT NULL,
    fabricante VARCHAR(40) NOT NULL,
    id_compra VARCHAR(40) NOT NULL,
    lote INT NOT NULL
);

-- Tabla: MOVIMIENTO
CREATE TABLE IF NOT EXISTS MOVIMIENTO (
    id_movimiento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cantidad_movimiento INT NOT NULL,
    legajo_supervisor INT UNSIGNED NOT NULL,
    nro_legajo_entrega INT UNSIGNED NOT NULL,
    ingreso_egreso VARCHAR(40) NOT NULL,
    fecha_ejecucion DATE NOT NULL,
    id_pedido INT NOT NULL
);

-- Tabla: PRODUCTO
CREATE TABLE IF NOT EXISTS PRODUCTO (
    id_producto VARCHAR(40) NOT NULL UNIQUE PRIMARY KEY,
    nombre_producto VARCHAR(40) NOT NULL,
    descripcion VARCHAR(80) NOT NULL
);

-- Tabla: RESISTENCIA
CREATE TABLE IF NOT EXISTS RESISTENCIA (
    nro INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_producto VARCHAR(40) NOT NULL,
    valor INT NOT NULL,
    tolerancia INT NOT NULL,
    potencia INT NOT NULL,
    tipo_smd_through_hole VARCHAR(40) NOT NULL,
    material VARCHAR(40) NOT NULL,
    fabricante VARCHAR(40) NOT NULL,
    descripcion VARCHAR(80) NOT NULL,
    hoja_datos_link VARCHAR(40) NOT NULL,
    fecha_ingreso DATE NOT NULL
);

-- Tabla: CAPACITOR
CREATE TABLE IF NOT EXISTS CAPACITOR (
    nro INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_producto VARCHAR(40) NOT NULL,
    valor INT NOT NULL,
    tolerancia INT NOT NULL,
    tipo_material VARCHAR(40) NOT NULL,
    tipo_smd_through_hole VARCHAR(40) NOT NULL,
    hoja_datos_link VARCHAR(40) NOT NULL,
    fabricante VARCHAR(40) NOT NULL,
    voltage VARCHAR(40) NOT NULL,
    fecha_ingreso DATE NOT NULL
);

-- Tabla: BOBINA
CREATE TABLE IF NOT EXISTS BOBINA (
    nro INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_producto VARCHAR(40) NOT NULL,
    material VARCHAR(40) NOT NULL,
    valor INT NOT NULL,
    tolerancia INT NOT NULL,
    tipo VARCHAR(40) NOT NULL,
    fabricante VARCHAR(40) NOT NULL,
    hoja_datos_link VARCHAR(40) NOT NULL,
    resistencia_parasita VARCHAR(40) NOT NULL,
    descripcion VARCHAR(80) NOT NULL,
    fecha_ingreso DATE NOT NULL
);

-- Tabla: TRANSISTOR
CREATE TABLE IF NOT EXISTS TRANSISTOR (
    nro INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_producto VARCHAR(40) NOT NULL,
    tecnologia VARCHAR(40) NOT NULL,
    tipo VARCHAR(40) NOT NULL,
    Vco INT NOT NULL,
    Ic_max VARCHAR(40) NOT NULL,
    tipo_smd_through_hole VARCHAR(40) NOT NULL,
    hoja_datos_link VARCHAR(40) NOT NULL,
    fabricante VARCHAR(40) NOT NULL,
    descripcion VARCHAR(80) NOT NULL,
    fecha_ingreso DATE NOT NULL
);

-- Tabla: IC_COMPUERTAS
CREATE TABLE IF NOT EXISTS IC_COMPUERTAS (
    nro INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_producto VARCHAR(40) NOT NULL,
    tecnologia VARCHAR(40) NOT NULL,
    Vcc INT NOT NULL,
    logica VARCHAR(40) NOT NULL,
    descripcion VARCHAR(80) NOT NULL,
    tipo_smd_through_hole VARCHAR(40) NOT NULL,
    hoja_datos_link VARCHAR(40) NOT NULL,
    fabricante VARCHAR(40) NOT NULL,
    Io_max VARCHAR(40) NOT NULL,
    fecha_ingreso DATE NOT NULL
);

-- ******************************************************
--                    CLAVES FORÁNEAS 
-- ******************************************************

-- Referencia: fk_agente_persona (tabla: AGENTE)
ALTER TABLE AGENTE 
ADD CONSTRAINT fk_agente_persona 
FOREIGN KEY (cuil) 
REFERENCES PERSONA(cuil) 
ON DELETE CASCADE ON UPDATE CASCADE;

-- Referencia: fk_pedido_agente (tabla: PEDIDO)
ALTER TABLE PEDIDO 
ADD CONSTRAINT fk_pedido_agente 
FOREIGN KEY (legajo_agente) 
REFERENCES AGENTE(legajo) 
ON DELETE CASCADE ON UPDATE CASCADE;

-- Referencia: fk_lista_materiales_producto (tabla: LISTA_MATERIALES)
ALTER TABLE LISTA_MATERIALES 
ADD CONSTRAINT fk_lista_materiales_producto
FOREIGN KEY (id_producto) 
REFERENCES PRODUCTO(id_producto) 
ON DELETE CASCADE ON UPDATE CASCADE;

-- Referencia: fk_stock_id_producto (tabla: STOCK_MATERIALES)
ALTER TABLE STOCK_MATERIALES
ADD CONSTRAINT fk_stock_id_producto
FOREIGN KEY (id_producto) 
REFERENCES PRODUCTO(id_producto) 
ON DELETE CASCADE ON UPDATE CASCADE;

-- Referencia: fk_movimiento_leg_supervisor (tabla: MOVIMIENTO)
ALTER TABLE MOVIMIENTO
ADD CONSTRAINT fk_movimiento_leg_supervisor
FOREIGN KEY (legajo_supervisor) 
REFERENCES AGENTE(legajo) 
ON DELETE CASCADE ON UPDATE CASCADE;

-- Referencia: fk_movimiento_leg_agente_entrega (tabla: MOVIMIENTO)
ALTER TABLE MOVIMIENTO
ADD CONSTRAINT fk_movimiento_leg_agente_entrega
FOREIGN KEY (nro_legajo_entrega) 
REFERENCES AGENTE(legajo) 
ON DELETE CASCADE ON UPDATE CASCADE;

-- Referencia: fk_movimiento_pedido (tabla: MOVIMIENTO)
ALTER TABLE MOVIMIENTO
ADD CONSTRAINT fk_movimiento_pedido
FOREIGN KEY (id_pedido) 
REFERENCES PEDIDO(id_pedido) 
ON DELETE CASCADE ON UPDATE CASCADE;

-- ***********************************************************
--                  FORÁNEAS DE PRODUCTOS 
-- ***********************************************************

-- Referencia: fk_resistencia_producto (tabla: RESISTENCIA)
ALTER TABLE RESISTENCIA 
ADD CONSTRAINT fk_resistencia_producto
FOREIGN KEY (id_producto)
REFERENCES PRODUCTO(id_producto) 
ON DELETE CASCADE ON UPDATE CASCADE;

-- Referencia: fk_capacitor_producto (tabla: CAPACITOR)
ALTER TABLE CAPACITOR 
ADD CONSTRAINT fk_capacitor_producto
FOREIGN KEY (id_producto)
REFERENCES PRODUCTO(id_producto) 
ON DELETE CASCADE ON UPDATE CASCADE;

-- Referencia: fk_bobina_producto (tabla: BOBINA)
ALTER TABLE BOBINA 
ADD CONSTRAINT fk_bobina_producto
FOREIGN KEY (id_producto)
REFERENCES PRODUCTO(id_producto) 
ON DELETE CASCADE ON UPDATE CASCADE;

-- Referencia: fk_transistor_producto (tabla: TRANSISTOR)
ALTER TABLE TRANSISTOR 
ADD CONSTRAINT fk_transistor_producto
FOREIGN KEY (id_producto)
REFERENCES PRODUCTO(id_producto) 
ON DELETE CASCADE ON UPDATE CASCADE;

-- Referencia: fk_ic_compuertas_producto (tabla: IC_COMPUERTAS)
ALTER TABLE IC_COMPUERTAS 
ADD CONSTRAINT fk_ic_compuertas_producto
FOREIGN KEY (id_producto)
REFERENCES PRODUCTO(id_producto) 
ON DELETE CASCADE ON UPDATE CASCADE;


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


/*------------------------------------------*/
/*                FUNCIONES                 */
/*------------------------------------------*/

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


/*------------------------------------------*/
/*            STORED PROCEDURES             */
/*------------------------------------------*/

/*-------- PRIMER STORED PROCEDURES --------*/

-- SP para ordenar una tabla según un campo y dirección
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE OrdenarTabla (
    IN tabla_name VARCHAR(50),
    IN orden_campo VARCHAR(50),
    IN orden_tipo VARCHAR(10)
)
BEGIN
    SET @query = CONCAT('SELECT * FROM ', tabla_name, ' ORDER BY ', orden_campo, ' ', orden_tipo, ';');
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //
DELIMITER ;

/*-------- SEGUNDO STORED PROCEDURES ---------*/
-- SP para insertar o eliminar registros en una tabla
DELIMITER //
CREATE PROCEDURE InsertarEliminarRegistro (
    IN operacion INT,
    IN tabla_name VARCHAR(50),
    IN id_registro INT
)
BEGIN
    IF operacion = 1 THEN
        -- Insertar registro (ejemplo, ajusta según tu tabla)
        INSERT INTO tabla_name (campo1, campo2, campo3) VALUES (valor1, valor2, valor3);
    ELSEIF operacion = 2 THEN
        -- Eliminar registro
        DELETE FROM tabla_name WHERE id = id_registro;
    ELSE
        SELECT 'Operación no válida. Usar 1 para insertar o 2 para eliminar.';
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE InsertarPersona(
    IN p_cuil BIGINT UNSIGNED,
    IN p_nombre VARCHAR(40),
    IN p_apellido VARCHAR(40),
    IN p_fecha_nacimiento DATE,
    IN p_tel_contacto INT,
    IN p_sexo ENUM('M','F')
)
BEGIN
    INSERT INTO PERSONA (cuil, nombre, apellido, fecha_nacimiento, tel_contacto, sexo)
    VALUES (p_cuil, p_nombre, p_apellido, p_fecha_nacimiento, p_tel_contacto, p_sexo);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE EliminarAgente(
    IN p_legajo INT UNSIGNED
)
BEGIN
    DELETE FROM AGENTE WHERE legajo = p_legajo;
END //
DELIMITER ;


/*------------------------------------------*/
/*                 TRIGGER                  */
/*------------------------------------------*/

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

