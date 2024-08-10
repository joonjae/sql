
USE DBDeposito;

/*------------------------------------------*/
/*                  TCL                     */
/*------------------------------------------*/

-- Eliminación + ROLLBACK
START TRANSACTION;
    DELETE FROM AGENTE
    WHERE legajo < 4;
    SELECT * FROM AGENTE; -- Verifico si se eliminaron los registros

ROLLBACK; -- Deshago la eliminación
SELECT * FROM AGENTE; -- Verifico si los registros eliminados reaparecen

-- Eliminación + COMMIT 
START TRANSACTION;
    DELETE FROM AGENTE
    WHERE legajo < 4;
    SELECT * FROM AGENTE; -- Verifico si se eliminaron los registros

COMMIT; -- Confirmo la eliminación de los registros
SELECT * FROM AGENTE; -- Verifico si se eliminaron los registros

-- Inserción de registros con SAVEPOINTs
START TRANSACTION;
    INSERT INTO MOVIMIENTO (cantidad_movimiento, legajo_supervisor, nro_legajo_entrega, ingreso_egreso, fecha_ejecucion, id_pedido)
    VALUES (250, 5, 7, 'Egreso', '2023-08-04', 4);
    INSERT INTO MOVIMIENTO (cantidad_movimiento, legajo_supervisor, nro_legajo_entrega, ingreso_egreso, fecha_ejecucion, id_pedido)
    VALUES (300, 5, 6, 'Ingreso', '2023-08-05', 5);
SAVEPOINT reg1;
    INSERT INTO MOVIMIENTO (cantidad_movimiento, legajo_supervisor, nro_legajo_entrega, ingreso_egreso, fecha_ejecucion, id_pedido)
    VALUES (350, 5, 8, 'Egreso', '2023-08-06', 6);
    INSERT INTO MOVIMIENTO (cantidad_movimiento, legajo_supervisor, nro_legajo_entrega, ingreso_egreso, fecha_ejecucion, id_pedido)
    VALUES (400, 5, 6, 'Ingreso', '2023-08-07', 7);
SAVEPOINT reg2;
    INSERT INTO MOVIMIENTO (cantidad_movimiento, legajo_supervisor, nro_legajo_entrega, ingreso_egreso, fecha_ejecucion, id_pedido)
    VALUES (450, 5, 8, 'Egreso', '2023-08-08', 8);
    INSERT INTO MOVIMIENTO (cantidad_movimiento, legajo_supervisor, nro_legajo_entrega, ingreso_egreso, fecha_ejecucion, id_pedido)
    VALUES (500, 5, 9, 'Ingreso', '2023-08-09', 10);
SAVEPOINT reg3;

#RELEASE SAVEPOINT reg1;
