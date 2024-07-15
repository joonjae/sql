# sql

## 1ra entrega del Proyecto Final y Desafíos complementarios
* 01ra_preentrega_doc.pdf
* 01ra_crear_database.sql
* 01ra_preentrega_tablas.xlsx
* 01ra_preentrega.drawio

-----------------------------------------------------------------------------------------------------------------------------------------------------------

### Desafío CLASE 13: Desafío entregable - Script de inserción de datos
Presentar en formato .sql el script de datos del proyecto final. inserción de datos de la base. En caso tal que la inserción de la información sea una importación de archivos, presetar los archivos que contienen los datos, y presentar en un segundo archivo, en formato pdf. el paso a paso de como realizar la importación de esos datos en las tablas previamente creadas.
#### Aspecto a incluir
El script deberá tener la inserción de datos de las tablas generadas hasta ahora en tu proyecto. Si tu archivo es en formato .sql, deberá poder ejecutarse de una sola vez en la ventana de script de MySQL Workbench. Para evitar demoras o desaprobaciones, te pedimos que pruebes y revises este proceso de scripting en una segunda base de datos, antes de presentar el desafío.

*ScriptIns+Lee.sql*[5]

### Desafío CLASE 14: Desafío Complementario - Presentación de script de creación de vistas
Presentar en formato .sql el script de creación de 5 vistas con base en los datos de la base de datos del proyecto final.
#### Aspecto a incluir
En base a las tablas elegidas para tu proyecto, deberás idear 5 o más vistas de una o más tablas y generar el SCRIPT de creación de las mismas.
Ejemplo: Si tu proyecto tiene una tabla productos, puedes crear una vista relacionándola con la tabla categorías, mostrar el de costo cada producto, representando distintos valores de IVA (TAX), etc.

*ScriptVis+Lee.sql*[6]

### Desafío CLASE 15: Desafío entregable - Presentar en formato SQL
Presentar el script de creación de 2 funciones almacenadas con base en los datos de la base de datos del proyecto final.
#### Aspecto a incluir
Procura que cada función recibida, al menos, un parametro de entrada.
- Los datos que retorne pueden ser cualquier tipo de dato.

*Formato+Lee.sql*

### Desafío CLASE 16: Desafío Complementario - Script de creación de stored procedures
- Sobre las tablas creadas anteriormente para tu proyecto final, agregar 2 Stored Procedures que te permitan trabajar sobre las mismas.
#### Aspecto a incluir
El primer S.P. debe permitir indicar a través de un parámetro el campo de ordenamiento de una tabla y mediante un segundo parámetro, si el orden es descendente o ascendente.
El otro S.P. puede (1: insertar registros en una tabla de tu proyecto. 2: eliminar algún registro específico de una tabla de tu proyecto).
- Agregar comentarios en ambos Scripts de los S.P. para saber qué hacen y cómo usarlos.
- Procura guiarte con los ejemplos abordados en esta clase.

*Stored+Lee.sql*


### Desafío CLASE 17: Desafío Complementario - Script de creación de Triggers
- En la base de datos de tu proyecto final, debes incluir al menos dos tablas del tipo LOG, Bitácora o Movimientos. Elegir dos de las tablas más importantes donde se operan con registros de forma frecuente, y crearás dos Triggers en cada una de ellas.
- Los Triggers a crear deberán controlar la acción previo a la operación elegida (BEFORE), y una acción prosterior a otra operación elegida (AFTER).
#### Aspecto a incluir
- Agregar una explicación por cada trigger a crear, explicando qué controlará el mismo.
- Recuerda agregar el script de creación de las tablas LOG.
- Debe registrar el usuario que realizó la operación, la fecha, y la hora (en campos separados)

*Triggers+Lee.sql*

-----------------------------------------------------------------------------------------------------------------------------------------------------------

## 2da entrega del Proyecto Final y Desafíos complementarios
- Listado de Vistas más una descripción detallada, su objetivo, y qué tablas las componen.
- Listado de Funciones que incluyan una descripción detallada, el objetivo para la cual fueron creadas y qué datos o tablas manipulan y/o son implementadas.
- Listado de Stored Procedures con una descripción detallada, qué objetivo o beneficio aportan al proyecto, y las tablas que lo componen y/o tablas con las que interactúa.
### Un archivo .sql que contenga:
- Script de inserción de datos en las bases.
- Si se insertan datos mediante importación, agregar el paso a paso de éste en el DOC PDF más los archivos con el contenido a importar, en el formato que corresponda.
- Script de creación de Vistas, Funciones, Stored Procedures y Triggers.

[5]: https://github.com/joonjae/sql/blob/main/preentregas/ScriptIns_Lee.sql
