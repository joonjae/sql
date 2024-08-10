
USE DBDeposito;

/*------------------------------------------*/
/*       SENTENCIAS - CREA 2 USUARIOS       */
/*------------------------------------------*/

-- Crear usuario para acceso de solo lectura
CREATE USER IF NOT EXISTS 'first_user'@'localhost' IDENTIFIED BY '12345678';
-- GRANT para dar permisos de solo lectura sobre todas las tablas en la base de datos DBDeposito
GRANT SELECT ON DBDeposito.* TO 'first_user'@'localhost';

-- Crear usuario para acceso con permisos de lectura, inserción y modificación
CREATE USER IF NOT EXISTS 'second_user'@'localhost' IDENTIFIED BY '87654321';
-- GRANT para dar permisos de lectura, inserción y modificación sobre todas las tablas en la base de datos DBDeposito
GRANT SELECT, INSERT, UPDATE ON DBDeposito.* TO 'second_user'@'localhost';


