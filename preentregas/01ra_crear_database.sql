-- Creación de la BASE
-- DROP DATABASE IF EXISTS DBDeposito;
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS DBDeposito;
USE DBDeposito;

-- Tabla: PERSONA
CREATE TABLE IF NOT EXISTS PERSONA (
    cuil INT UNSIGNED NOT NULL UNIQUE PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    apellido VARCHAR(40) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    tel_contacto INT NOT NULL,
    sexo ENUM('M','F') NOT NULL
);

-- Tabla: AGENTE
CREATE TABLE IF NOT EXISTS AGENTE (
    legajo INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cuil INT UNSIGNED NOT NULL UNIQUE,
    rol_ocupacion VARCHAR(20) NOT NULL,
    fecha_ingreso DATE NOT NULL,
    sector_trabajo VARCHAR(20) NOT NULL,
    tel_interno INT,
    email VARCHAR(40) NOT NULL
);

-- Tabla: PEDIDO
CREATE TABLE IF NOT EXISTS PEDIDO (
    id_pedido INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    legajo_agente INT UNSIGNED NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    apellido VARCHAR(40) NOT NULL,
    fecha_solicitud DATE NOT NULL,
    tipo_pedido VARCHAR(10) NOT NULL
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
    fecha_ejecucion DATE NOT NULL
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
    tipo_smd_through_hole VARCHAR(20) NOT NULL,
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
    tipo_material VARCHAR(20) NOT NULL,
    tipo_smd_through_hole VARCHAR(20) NOT NULL,
    hoja_datos_link VARCHAR(40) NOT NULL,
    fabricante VARCHAR(40) NOT NULL,
    voltage VARCHAR(10) NOT NULL,
    fecha_ingreso DATE NOT NULL
);

-- Tabla: BOBINA
CREATE TABLE IF NOT EXISTS BOBINA (
    nro INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_producto VARCHAR(40) NOT NULL,
    material VARCHAR(40) NOT NULL,
    valor INT NOT NULL,
    tolerancia INT NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    fabricante VARCHAR(40) NOT NULL,
    hoja_datos_link VARCHAR(40) NOT NULL,
    resistencia_parasita VARCHAR(10) NOT NULL,
    descripcion VARCHAR(80) NOT NULL,
    fecha_ingreso DATE NOT NULL
);

-- Tabla: TRANSISTOR
CREATE TABLE IF NOT EXISTS TRANSISTOR (
    nro INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_producto VARCHAR(40) NOT NULL,
    tecnologia VARCHAR(40) NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    Vco INT NOT NULL,
    Ic_max VARCHAR(10) NOT NULL,
    tipo_smd_through_hole VARCHAR(20) NOT NULL,
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
    logica VARCHAR(20) NOT NULL,
    descripcion VARCHAR(80) NOT NULL,
    tipo_smd_through_hole VARCHAR(20) NOT NULL,
    hoja_datos_link VARCHAR(40) NOT NULL,
    fabricante VARCHAR(40) NOT NULL,
    Io_max VARCHAR(10) NOT NULL,
    fecha_ingreso DATE NOT NULL
);

-- *******************************************************************
--                      CLAVES FORÁNEAS 
-- *******************************************************************

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

-- *******************************************************************
--                      FORÁNEAS DE PRODUCTOS 
-- *******************************************************************

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
