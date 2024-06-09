-- Creación de la BASE
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS DBDeposito;
USE DBDeposito;

-- Tabla: persona
CREATE TABLE IF NOT EXISTS persona (
    cuil INT NOT NULL UNIQUE PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    apellido VARCHAR(40) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    tel_contacto INT NOT NULL,
    fecha_nacimiento INT NOT NULL,
    sexo VARCHAR(1) NOT NULL
);

-- Tabla: agente
CREATE TABLE IF NOT EXISTS agente (
    legajo INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    cuil INT NOT NULL UNIQUE,
    rol_ocupacion VARCHAR(20) NOT NULL,
    legajo_superior INT NOT NULL,
    fecha_ingreso DATE NOT NULL,
    sector_trabajo VARCHAR(20) NOT NULL,
    tel_interno INT NULL,
    email VARCHAR(40) NOT NULL
);

-- Tabla: pedido
CREATE TABLE IF NOT EXISTS pedido (
    id_pedido INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    legajo_agente INT NOT NULL,
    Nombre VARCHAR(40) NOT NULL,
    Apellido VARCHAR(40) NOT NULL,
    fecha_solicitud DATE NOT NULL,
    tipo_pedido VARCHAR(10) NOT NULL
);

-- Tabla: Lista_Materiales
CREATE TABLE IF NOT EXISTS Lista_Materiales (
    nro INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    nro_item INT NOT NULL UNIQUE,
    id_producto VARCHAR(40) NOT NULL UNIQUE,
    descripcion_producto VARCHAR(40) NOT NULL,
    utilizado_en VARCHAR(40) NOT NULL,
    cantidad INT NOT NULL
);

-- Tabla: Movimiento
CREATE TABLE IF NOT EXISTS Movimiento (
    id_motimiento INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    cantidad_movimiento INT NOT NULL,
    legajo_supervisor INT NOT NULL,
    nombre_supervisor VARCHAR(40) NOT NULL,
    nro_legajo_entrega INT NOT NULL,
    nombre_agente_entrega VARCHAR(40) NOT NULL,
    ingreso_egreso VARCHAR(40) NOT NULL,
    fecha_ejecucion DATE NOT NULL,
);

-- Tabla: Resistencia
CREATE TABLE IF NOT EXISTS Resistencia (
    id_producto VARCHAR(40) NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    valor INT NOT NULL,
    tolerancia INT NOT NULL,
    potencia INT NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    material VARCHAR(40) NOT NULL,
    fabricante VARCHAR(40) NOT NULL,
    descripcion VARCHAR(80) NOT NULL,
    hoja_datos_link VARCHAR(40) NOT NULL,
    fecha_ingreso DATE NOT NULL
);

-- Tabla: Bobina
CREATE TABLE IF NOT EXISTS Bobina (
    id_producto VARCHAR(40) NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    material VARCHAR(40) NOT NULL,
    valor INT NOT NULL,
    tolerancia INT NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    fabricante VARCHAR(40) NOT NULL,
    hoja_datos_link VARCHAR(40) NOT NULL,
    resistencia_paracita VARCHAR(10) NOT NULL,
    descripcion VARCHAR(80) NOT NULL,
    fecha_ingreso DATE NOT NULL
);



/*---------------------------CLAVES FORÁNEAS----------------------------*/

-- Referencia: fk_agente_persona (tabla: agente)
ALTER TABLE agente 
ADD CONSTRAINT fk_agente_persona 
FOREIGN KEY fk_agente_persona (cuil) 
REFERENCES persona(cuil) 
ON DELETE CASCADE ON UPDATE CASCADE;

