USE DBDeposito;

-- Inserciones en la tabla PERSONA
INSERT INTO PERSONA (cuil, nombre, apellido, fecha_nacimiento, tel_contacto, sexo) VALUES
(12345678901, 'Juan'    , 'Pérez'       , '2003-05-10', 1122334455, 'M'),
(23456789012, 'Ana'     , 'Gómez'       , '2004-08-15', 1133445566, 'F'),
(34567890123, 'Carlos'  , 'López'       , '1998-12-20', 1144556677, 'M'),
(45678901234, 'Marta'   , 'Sánchez'     , '1995-03-25', 1155667788, 'F'),
(56789012345, 'Luis'    , 'Fernández'   , '2002-07-30', 1166778899, 'M'),
(67890123456, 'Lucía'   , 'Martínez'    , '1988-11-12', 1177889900, 'F'),
(78901234567, 'Pedro'   , 'García'      , '1992-04-05', 1188990011, 'M'),
(89012345678, 'Sofía'   , 'Hernández'   , '1993-06-23', 1199001122, 'F'),
(90123456789, 'Diego'   , 'Torres'      , '2009-09-17', 1100112233, 'M'),
(12345678012, 'Laura'   , 'Mendoza'     , '1996-02-14', 1111122334, 'F');

-- Inserciones en la tabla AGENTE
INSERT INTO AGENTE (cuil, rol_ocupacion, fecha_ingreso, sector_trabajo, tel_interno, email, nro_pedidos) VALUES
(12345678901, 'Supervisor'      , '2010-06-01', 'Almacén'       , 101, 'juan.perez@example.com'     , 0),
(23456789012, 'Empleado'        , '2015-09-15', 'Ventas'        , 102, 'ana.gomez@example.com'      , 0),
(34567890123, 'Gerente'         , '2008-01-10', 'Administración', 103, 'carlos.lopez@example.com'   , 2),
(45678901234, 'Operario'        , '2012-03-20', 'Producción'    , 104, 'marta.sanchez@example.com'  , 0),
(56789012345, 'Supervisor'      , '2018-11-05', 'Logística'     , 105, 'luis.fernandez@example.com' , 0),
(67890123456, 'Contador'        , '2011-05-10', 'Finanzas'      , 106, 'lucia.martinez@example.com' , 0),
(78901234567, 'Técnico'         , '2013-07-22', 'Mantenimiento' , 107, 'pedro.garcia@example.com'   , 0),
(89012345678, 'Analista'        , '2016-10-02', 'TI'            , 108, 'sofia.hernandez@example.com', 0),
(90123456789, 'Jefe de equipo'  , '2009-03-15', 'Producción'    , 109, 'diego.torres@example.com'   , 0),
(12345678012, 'Coordinador'     , '2014-12-01', 'Logística'     , 110, 'laura.mendoza@example.com'  , 0);


-- Inserciones en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_producto, nombre_producto, descripcion) VALUES
('P001', 'Resistencia'  , 'Resistencia de 10k Ohms'  ),
('P002', 'Capacitor'    , 'Capacitor de 100uF'       ),
('P003', 'Transistor'   , 'Transistor NPN'           ),
('P004', 'Bobina'       , 'Bobina de 10mH'           ),
('P005', 'IC Compuerta' , 'IC de Compuerta AND'      ),
('P006', 'Diodo'        , 'Diodo 1N4007'             ),
('P007', 'LED'          , 'LED Rojo'                 ),
('P008', 'Potenciómetro', 'Potenciómetro de 10k'     ),
('P009', 'Relay'        , 'Relay de 5V'              ),
('P010', 'Oscilador'    , 'Oscilador de cuarzo 16MHz');

-- Inserciones en la tabla RESISTENCIA
INSERT INTO RESISTENCIA (id_producto, valor, tolerancia, potencia, tipo_smd_through_hole, material, fabricante, descripcion, hoja_datos_link, fecha_ingreso) VALUES
('P001', 10000  , 5 , 0.25  , 'Through Hole', 'Carbono'     , 'XYZ Corp', 'Resistencia de 10k Ohms' , 'http://example.com/r1', '2023-01-01'),
('P001', 4700   , 1 , 0.125 , 'SMD'         , 'Metal Film'  , 'ABC Inc' , 'Resistencia de 4.7k Ohms', 'http://example.com/r2', '2023-02-01'),
('P001', 3300   , 5 , 0.25  , 'Through Hole', 'Metal Oxide' , 'JKL GmbH', 'Resistencia de 3.3k Ohms', 'http://example.com/r3', '2023-03-01'),
('P001', 8200   , 1 , 1     , 'SMD'         , 'Carbono'     , 'MNO Corp', 'Resistencia de 8.2k Ohms', 'http://example.com/r4', '2023-04-01');

-- Inserciones en la tabla CAPACITOR
INSERT INTO CAPACITOR (id_producto, valor, tolerancia, tipo_material, tipo_smd_through_hole, hoja_datos_link, fabricante, voltage, fecha_ingreso) VALUES
('P002', 100, 10, 'Electrolítico', 'Through Hole', 'http://example.com/c1', 'ABC Inc' , '16V', '2023-01-01'),
('P002', 220, 20, 'Cerámico'     , 'SMD'         , 'http://example.com/c2', 'XYZ Corp', '25V', '2023-02-01'),
('P002', 330, 5 , 'Tántalo'      , 'Through Hole', 'http://example.com/c3', 'PQR Inc' , '25V', '2023-03-01'),
('P002', 470, 10, 'Mica'         , 'SMD'         , 'http://example.com/c4', 'STU Ltd' , '50V', '2023-04-01');

-- Inserciones en la tabla BOBINA
INSERT INTO BOBINA (id_producto, material, valor, tolerancia, tipo, fabricante, hoja_datos_link, resistencia_parasita, descripcion, fecha_ingreso) VALUES
('P004', 'Cobre' , 10 , 5 , 'Inductancia', 'GHI PLC' , 'http://example.com/b1', '1 Ohm' , 'Bobina de 10mH' , '2023-01-01'),
('P004', 'Hierro', 100, 10, 'Inductancia', 'DEF Ltd' , 'http://example.com/b2', '2 Ohms', 'Bobina de 100mH', '2023-02-01'),
('P004', 'Níquel', 47 , 2 , 'Inductancia', 'YZA GmbH', 'http://example.com/b3', '3 Ohms', 'Bobina de 47mH' , '2023-03-01'),
('P004', 'Plata' , 68 , 1 , 'Inductancia', 'MNO Corp', 'http://example.com/b4', '4 Ohms', 'Bobina de 68mH' , '2023-04-01');

-- Inserciones en la tabla TRANSISTOR
INSERT INTO TRANSISTOR (id_producto, tecnologia, tipo, Vco, Ic_max, tipo_smd_through_hole, hoja_datos_link, fabricante, descripcion, fecha_ingreso) VALUES
('P003', 'BJT'   , 'NPN'      , 60 , '10A', 'Through Hole', 'http://example.com/t1', 'DEF Ltd', 'Transistor NPN'           , '2023-01-01'),
('P003', 'MOSFET', 'P-Channel', 30 , '5A' , 'SMD'         , 'http://example.com/t2', 'GHI PLC', 'Transistor P-Channel'     , '2023-02-01'),
('P003', 'IGBT'  , 'N-Channel', 120, '20A', 'Through Hole', 'http://example.com/t3', 'PQR Inc', 'Transistor N-Channel IGBT', '2023-03-01'),
('P003', 'JFET'  , 'N-Channel', 30 , '1A' , 'SMD'         , 'http://example.com/t4', 'STU Ltd', 'Transistor N-Channel JFET', '2023-04-01');

-- Inserciones en la tabla IC_COMPUERTAS
INSERT INTO IC_COMPUERTAS (id_producto, tecnologia, Vcc, logica, descripcion, tipo_smd_through_hole, hoja_datos_link, fabricante, Io_max, fecha_ingreso) VALUES
('P005', 'CMOS'  , 5    , 'AND' , 'IC de Compuerta AND' , 'SMD'         , 'http://example.com/ic1', 'JKL GmbH', '20mA', '2023-01-01'),
('P005', 'TTL'   , 3.3  , 'OR'  , 'IC de Compuerta OR'  , 'Through Hole', 'http://example.com/ic2', 'XYZ Corp', '15mA', '2023-02-01'),
('P005', 'BiCMOS', 5    , 'NAND', 'IC de Compuerta NAND', 'Through Hole', 'http://example.com/ic3', 'YZA GmbH', '25mA', '2023-03-01'),
('P005', 'ECL'   , 3.3  , 'NOR' , 'IC de Compuerta NOR' , 'SMD'         , 'http://example.com/ic4', 'MNO Corp', '10mA', '2023-04-01');


-- Inserciones en la tabla STOCK_MATERIALES
INSERT INTO STOCK_MATERIALES (id_producto, stock_disponible, clasificacion_material, descripcion_material, fabricante, id_compra, lote) VALUES
('P001', 5000, 'Resistencias'    , '10k Ohms'                    , 'XYZ Corp'    , 'C001', 1 ),
('P002', 3000, 'Capacitores'     , '100uF'                       , 'ABC Inc'     , 'C002', 2 ),
('P003', 2000, 'Transistores'    , 'NPN'                         , 'DEF Ltd'     , 'C003', 3 ),
('P004', 1500, 'Bobinas'         , '10mH'                        , 'GHI PLC'     , 'C004', 4 ),
('P005', 1000, 'ICs'             , 'Compuerta AND'               , 'JKL GmbH'    , 'C005', 5 ),
('P006', 4000, 'Diodos'          , 'Diodo 1N4007'                , 'MNO Corp'    , 'C006', 6 ),
('P007', 6000, 'LEDs'            , 'LED Rojo'                    , 'PQR Inc'     , 'C007', 7 ),
('P008', 3000, 'Potenciómetros'  , 'Potenciómetro 10k'           , 'STU Ltd'     , 'C008', 8 ),
('P009', 2000, 'Relays'          , 'Relay 5V'                    , 'VWX PLC'     , 'C009', 9 ),
('P010', 3500, 'Osciladores'     , 'Oscilador de cuarzo 16MHz'   , 'YZA GmbH'    , 'C010', 10);

-- Inserciones en la tabla LISTA_MATERIALES
INSERT INTO LISTA_MATERIALES (nro_item, id_producto, descripcion_producto, utilizado_en, cantidad) VALUES
(1, 'P001' , 'Resistencia 10k Ohms'     , 'Circuito A', 100),
(2, 'P002' , 'Capacitor 100uF'          , 'Circuito B', 200),
(3, 'P003' , 'Transistor NPN'           , 'Circuito C', 300),
(4, 'P004' , 'Bobina 10mH'              , 'Circuito D', 150),
(5, 'P005' , 'IC Compuerta AND'         , 'Circuito E', 50 ),
(6, 'P006' , 'Diodo 1N4007'             , 'Circuito F', 200),
(7, 'P007' , 'LED Rojo'                 , 'Circuito G', 500),
(8, 'P008' , 'Potenciómetro 10k'        , 'Circuito H', 150),
(9, 'P009' , 'Relay 5V'                 , 'Circuito I', 100),
(10, 'P010', 'Oscilador de cuarzo 16MHz', 'Circuito J', 250);

-- Inserciones en la tabla PEDIDO
INSERT INTO PEDIDO (legajo_agente, nombre, apellido, fecha_solicitud, tipo_pedido) VALUES
(1, 'Juan'  , 'Pérez'       , '2023-01-10', 'Materiales'    ),
(2, 'Ana'   , 'Gómez'       , '2023-02-15', 'Herramientas'  ),
(3, 'Carlos', 'López'       , '2023-03-20', 'Equipos'       ),
(4, 'Marta' , 'Sánchez'     , '2023-04-25', 'Suministros'   ),
(5, 'Luis'  , 'Fernández'   , '2023-05-30', 'Materiales'    ),
(6, 'Lucía' , 'Martínez'    , '2023-06-01', 'Herramientas'  ),
(7, 'Pedro' , 'García'      , '2023-06-15', 'Materiales'    ),
(8, 'Sofía' , 'Hernández'   , '2023-07-05', 'Equipo'        ),
(3, 'Carlos', 'López'       , '2023-07-15', 'Materiales'    ),
(9, 'Diego' , 'Torres'      , '2023-07-20', 'Suministros'   ),
(10,'Laura' , 'Mendoza'     , '2023-08-10', 'Materiales'    ),
(3, 'Carlos', 'López'       , '2023-10-21', 'Herramientas'  );

-- Inserciones en la tabla MOVIMIENTO
INSERT INTO MOVIMIENTO (cantidad_movimiento, legajo_supervisor, nro_legajo_entrega, ingreso_egreso, fecha_ejecucion, id_pedido) VALUES
(50, 1 , 2  , 'Ingreso' , '2023-06-10', 1),
(30, 2 , 3  , 'Egreso'  , '2023-07-15', 2),
(20, 3 , 4  , 'Ingreso' , '2023-08-20', 3),
(40, 4 , 5  , 'Egreso'  , '2023-09-25', 4),
(60, 5 , 1  , 'Ingreso' , '2023-10-30', 5),
(70, 6 , 7  , 'Ingreso' , '2023-11-10', 6),
(40, 7 , 8  , 'Egreso'  , '2023-12-15', 7),
(30, 8 , 9  , 'Ingreso' , '2024-01-20', 8),
(80, 10, 6  , 'Ingreso' , '2024-03-30', 9),
(80, 10, 6  , 'Ingreso' , '2024-04-01', 10);




/*------------------------------------------*/
/*          EJECUCION DE FUNCIONES          */
/*------------------------------------------*/

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

-- Ejecución de la función actualizar_contar_pedidos_agente
SET @LEG_AGENTE := 3;
SET @nro_pedidos := pedidos_restantes_agente(@LEG_AGENTE);
-- Actualizar la tabla utilizando el valor calculado
UPDATE AGENTE
SET nro_pedidos = @nro_pedidos
WHERE legajo = @LEG_AGENTE;

SELECT * FROM AGENTE;
