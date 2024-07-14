USE DBDeposito;

/*------------------PRIMER STORED PROCEDURES--------------------*/
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

CALL OrdenarTabla('PERSONA', 'apellido', 'ASC');


/*------------------SEGUNDO STORED PROCEDURES--------------------*/
-- SP para insertar o eliminar registros en una tabla
DROP PROCEDURE IF EXISTS InsertarEliminarRegistro;
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

CALL InsertarEliminarRegistro(1, 'PERSONA', NULL);




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

CALL InsertarPersona(20345678901, 'Jose', 'Pérez', '1999-05-25', 113456789, 'M');


DELIMITER //
CREATE PROCEDURE EliminarAgente(
    IN p_legajo INT UNSIGNED
)
BEGIN
    DELETE FROM AGENTE WHERE legajo = p_legajo;
END //
DELIMITER ;

CALL EliminarAgente(2);


SELECT * FROM PERSONA;
SELECT * FROM AGENTE;
