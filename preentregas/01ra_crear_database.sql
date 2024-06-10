-- Creación de la BASE
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS DBDeposito;
USE DBDeposito;

-- Tabla: PERSONA
CREATE TABLE IF NOT EXISTS PERSONA (
    cuil INT NOT NULL UNIQUE PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    apellido VARCHAR(40) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    tel_contacto INT NOT NULL,
    sexo VARCHAR(1) NOT NULL
);

-- Tabla: AGENTE
CREATE TABLE IF NOT EXISTS AGENTE (
    legajo INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    cuil INT NOT NULL UNIQUE,
    rol_ocupacion VARCHAR(20) NOT NULL,
    legajo_superior INT NOT NULL,
    fecha_ingreso DATE NOT NULL,
    sector_trabajo VARCHAR(20) NOT NULL,
    tel_interno INT NULL,
    email VARCHAR(40) NOT NULL
);

-- Tabla: PEDIDO
CREATE TABLE IF NOT EXISTS PEDIDO (
    id_pedido INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    legajo_agente INT NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    apellido VARCHAR(40) NOT NULL,
    fecha_solicitud DATE NOT NULL,
    tipo_pedido VARCHAR(10) NOT NULL
);

-- Tabla: LISTA_MATERIALES
CREATE TABLE IF NOT EXISTS LISTA_MATERIALES (
    nro INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    nro_item INT NOT NULL UNIQUE,
    id_producto VARCHAR(40) NOT NULL UNIQUE,
    descripcion_producto VARCHAR(40) NOT NULL,
    utilizado_en VARCHAR(40) NOT NULL,
    cantidad INT NOT NULL
);

-- Tabla: STOCK_MATERIALES
CREATE TABLE IF NOT EXISTS STOCK_MATERIALES (
    nro_item INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    id_producto VARCHAR(40) NOT NULL UNIQUE,
    stock_disponible INT NOT NULL,
    clasificacion_material VARCHAR(40) NOT NULL,
    descripcion_material VARCHAR(40) NOT NULL,
    fabricante VARCHAR(40) NOT NULL,
    id_compra VARCHAR(40) NOT NULL,
    lote INT NOT NULL
);


-- Tabla: MOVIMIENTO
CREATE TABLE IF NOT EXISTS MOVIMIENTO (
    id_movimiento INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    cantidad_movimiento INT NOT NULL,
    legajo_supervisor INT NOT NULL,
    nombre_supervisor VARCHAR(40) NOT NULL,
    nro_legajo_entrega INT NOT NULL,
    nombre_agente_entrega VARCHAR(40) NOT NULL,
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
    nro INT NOT NULL UNIQUE PRIMARY KEY,
    id_producto VARCHAR(40) NOT NULL,
    valor INT NOT NULL,
    tolerancia INT NOT NULL,
    potencia INT NOT NULL,
    tipo_smd_though_hole VARCHAR(20) NOT NULL,
    material VARCHAR(40) NOT NULL,
    fabricante VARCHAR(40) NOT NULL,
    descripcion VARCHAR(80) NOT NULL,
    hoja_datos_link VARCHAR(40) NOT NULL,
    fecha_ingreso DATE NOT NULL
);

-- Tabla: CAPACITOR
CREATE TABLE IF NOT EXISTS CAPACITOR (
    nro INT NOT NULL UNIQUE PRIMARY KEY,
    id_producto VARCHAR(40) NOT NULL,
    valor INT NOT NULL,
    tolerancia INT NOT NULL,
    tipo_material VARCHAR(20) NOT NULL,
    tipo_smd_though_hole VARCHAR(20) NOT NULL,
    hoja_datos_link VARCHAR(40) NOT NULL,
    fabricante VARCHAR(40) NOT NULL,
    voltage VARCHAR(10) NOT NULL,
    fecha_ingreso DATE NOT NULL
);

-- Tabla: BOBINA
CREATE TABLE IF NOT EXISTS BOBINA (
    nro INT NOT NULL UNIQUE PRIMARY KEY,
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
    nro INT NOT NULL UNIQUE PRIMARY KEY,
    id_producto VARCHAR(40) NOT NULL,
    tecnologia VARCHAR(40) NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    Vco INT NOT NULL,
    Ic_max VARCHAR(10) NOT NULL,
    tipo_smd_though_hole VARCHAR(20) NOT NULL,
    hoja_datos_link VARCHAR(40) NOT NULL,
    fabricante VARCHAR(40) NOT NULL,
    descripcion VARCHAR(80) NOT NULL,
    fecha_ingreso DATE NOT NULL
);

-- Tabla: IC_COMPUERTAS
CREATE TABLE IF NOT EXISTS IC_COMPUERTAS (
    nro INT NOT NULL UNIQUE PRIMARY KEY,
    id_producto VARCHAR(40) NOT NULL,
    tecnologia VARCHAR(40) NOT NULL,
    Vcc INT NOT NULL,
    logica VARCHAR(20) NOT NULL,
    descripcion VARCHAR(80) NOT NULL,
    tipo_smd_though_hole VARCHAR(20) NOT NULL,
    hoja_datos_link VARCHAR(40) NOT NULL,
    fabricante VARCHAR(40) NOT NULL,
    Io_max VARCHAR(10) NOT NULL,
    fecha_ingreso DATE NOT NULL
);

-- *******************************************************************
/*------------------------ CLAVES FORÁNEAS -------------------------*/
-- *******************************************************************

-- Referencia: fk_agente_persona (tabla: AGENTE)
ALTER TABLE AGENTE 
ADD CONSTRAINT fk_agente_persona 
FOREIGN KEY (cuil) 
REFERENCES PERSONA(cuil) 
ON DELETE CASCADE ON UPDATE CASCADE;

-- Referencia: fk_agente_supervisor (tabla: AGENTE)
ALTER TABLE AGENTE 
ADD CONSTRAINT fk_agente_supervisor 
FOREIGN KEY (legajo_superior) 
REFERENCES AGENTE(legajo) 
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


nro_item
stock_disponible
clasificacion_material
id_compra
-- Referencia: fk_stock_id_producto (tabla: STOCK_MATERIALES)
ALTER TABLE STOCK_MATERIALES
ADD CONSTRAINT fk_stock_id_producto
FOREIGN KEY (id_producto) 
REFERENCES PRODUCTO(id_producto) 
ON DELETE CASCADE ON UPDATE CASCADE;
-- Referencia: fk_stock_fabricante (tabla: STOCK_MATERIALES)
ALTER TABLE STOCK_MATERIALES
ADD CONSTRAINT fk_stock_fabricante
FOREIGN KEY (fabricante) 
REFERENCES PRODUCTO(fabricante) 
ON DELETE CASCADE ON UPDATE CASCADE;
-- Referencia: fk_stock_descripcion_material (tabla: STOCK_MATERIALES)
ALTER TABLE STOCK_MATERIALES
ADD CONSTRAINT fk_stock_descripcion_material
FOREIGN KEY (descripcion_material) 
REFERENCES PRODUCTO(descripcion) 
ON DELETE CASCADE ON UPDATE CASCADE;

-- Referencia: fk_movimiento_id_pedido (tabla: MOVIMIENTO)
ALTER TABLE MOVIMIENTO
ADD CONSTRAINT fk_movimiento_id_pedido
FOREIGN KEY (id_pedido) 
REFERENCES PEDIDO(id_pedido) 
ON DELETE CASCADE ON UPDATE CASCADE;

-- Referencia: fk_movimiento_leg_supervisor (tabla: MOVIMIENTO)
ALTER TABLE MOVIMIENTO
ADD CONSTRAINT fk_movimiento_leg_supervisor
FOREIGN KEY (legajo_supervisor) 
REFERENCES AGENTE(legajo) 
ON DELETE CASCADE ON UPDATE CASCADE;
-- Referencia: fk_movimiento_nombre_supervisor (tabla: MOVIMIENTO)
ALTER TABLE MOVIMIENTO
ADD CONSTRAINT fk_movimiento_nombre_supervisor
FOREIGN KEY (nombre_supervisor) 
REFERENCES AGENTE(nombre) 
ON DELETE CASCADE ON UPDATE CASCADE;
-- Referencia: fk_movimiento_leg_agente_entrega (tabla: MOVIMIENTO)
ALTER TABLE MOVIMIENTO
ADD CONSTRAINT fk_movimiento_leg_agente_entrega
FOREIGN KEY (nro_legajo_entrega) 
REFERENCES AGENTE(legajo) 
ON DELETE CASCADE ON UPDATE CASCADE;
-- Referencia: fk_movimiento_nombre_agente_entrega (tabla: MOVIMIENTO)
ALTER TABLE MOVIMIENTO
ADD CONSTRAINT fk_movimiento_nombre_agente_entrega
FOREIGN KEY (nombre_agente_entrega) 
REFERENCES AGENTE(nombre) 
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

-- Referencia: fk_ic_compuerta_producto (tabla: IC_COMPUERTA)
ALTER TABLE IC_COMPUERTA 
ADD CONSTRAINT fk_ic_compuerta_producto
FOREIGN KEY (id_producto)
REFERENCES PRODUCTO(id_producto) 
ON DELETE CASCADE ON UPDATE CASCADE;
