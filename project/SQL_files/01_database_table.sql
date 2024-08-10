-- Creación de la BASE
-- DROP DATABASE IF EXISTS DBDeposito;
-----------------------------------------------------
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

