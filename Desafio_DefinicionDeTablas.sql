-- Coneccion a motor de base de datos (en mi caso puerto 5433, por defecto debiera ser 5432)
psql -p 5433 -U postgres 

-- 1. Crear una base de datos llamada películas.

CREATE DATABASE peliculas;


-- 2. Cargar ambos archivos a su tabla correspondiente.
-- Crea tabla peliculas
CREATE TABLE peliculas (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(255),
    anio_estreno INT,
    director VARCHAR(255)
);

-- crea tabla reparto
CREATE TABLE reparto (
    id SERIAL PRIMARY KEY,
    id_pelicula INT REFERENCES peliculas(id),
    actor VARCHAR(255)
);

-- carga datos de peliculas a partir de archivo peliculas.csv
\COPY peliculas (id, titulo, anio_estreno, director) FROM './data/peliculas.csv' DELIMITER ',' CSV HEADER; 

-- carga datos de reparto a partir de archivo reparto.csv
\COPY reparto (id_pelicula, actor) FROM './data/reparto.csv' DELIMITER ',' CSV HEADER;

-- 3. Obtener el ID de la película “Titanic”.

SELECT id FROM peliculas WHERE titulo = 'Titanic';
-- resultado: 

/*******
id
----
  2
(1 row)
*******/

-- 5. Consultar en cuántas películas del top 100 participa Harrison Ford.

SELECT COUNT(*) FROM reparto WHERE actor = 'Harrison Ford';

-- resultado:
/*******
 count
-------
     8
(1 row)

*******/


-- 6. Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente.

SELECT * FROM peliculas WHERE anio_estreno BETWEEN 1990 AND 1999 ORDER BY titulo ASC;

-- resultado:
/*******
 id |                   titulo                   | anio_estreno |       director
----+--------------------------------------------+--------------+-----------------------
 76 | American Beauty                            |         1999 | Sam Mendes
 20 | American History X                         |         1998 | Tony Kaye
  9 | Braveheart                                 |         1995 | Mel Gibson
  7 | Cadena perpetua                            |         1994 | Frank Darabont
 12 | Eduardo Manostijeras                       |         1990 | Tim Burton
 27 | El club de la pelea                        |         1999 | David Fincher
 68 | El Padrino. Parte III                      |         1990 | Francis Ford Coppola
 75 | El profesional                             |         1994 | Luc Besson
 22 | El sexto sentido                           |         1999 | M. Night Shyamalan
 45 | El show de Truman                          |         1998 | Peter Weir
 25 | El silencio de los corderos                |         1991 | Jonathan Demme
 61 | Entrevista con el vampiro                  |         1994 | Neil Jordan
 22 | El sexto sentido                           |         1999 | M. Night Shyamalan
 45 | El show de Truman                          |         1998 | Peter Weir
 25 | El silencio de los corderos                |         1991 | Jonathan Demme
 61 | Entrevista con el vampiro                  |         1994 | Neil Jordan
  1 | Forest Gump                                |         1994 | Robert Zemeckis
 42 | Hombres de negro                           |         1997 | Barry Sonnenfeld
 10 | La lista de Schindler                      |         1993 | Steven Spielberg
 31 | La milla verde                             |         1999 | Frank Darabont
 30 | Matrix                                     |         1999 | Andy y Lana Wachowski
 89 | Mejor... imposible                         |         1997 | James L. Brooks
 29 | Parque Jur├ísico                           |         1993 | Steven Spielberg
 47 | Pesadilla antes de navidad                 |         1993 | Henry Selick
 23 | Pulp Fiction                               |         1994 | Quentin Tarantino
 14 | Salvar al soldado Ryan                     |         1998 | Steven Spielberg
 22 | El sexto sentido                           |         1999 | M. Night Shyamalan
 45 | El show de Truman                          |         1998 | Peter Weir
 25 | El silencio de los corderos                |         1991 | Jonathan Demme
 61 | Entrevista con el vampiro                  |         1994 | Neil Jordan
  1 | Forest Gump                                |         1994 | Robert Zemeckis
 42 | Hombres de negro                           |         1997 | Barry Sonnenfeld
 10 | La lista de Schindler                      |         1993 | Steven Spielberg
 31 | La milla verde                             |         1999 | Frank Darabont
 30 | Matrix                                     |         1999 | Andy y Lana Wachowski
 89 | Mejor... imposible                         |         1997 | James L. Brooks
 29 | Parque Jur├ísico                           |         1993 | Steven Spielberg
 47 | Pesadilla antes de navidad                 |         1993 | Henry Selick
 22 | El sexto sentido                           |         1999 | M. Night Shyamalan
 45 | El show de Truman                          |         1998 | Peter Weir
 25 | El silencio de los corderos                |         1991 | Jonathan Demme
 61 | Entrevista con el vampiro                  |         1994 | Neil Jordan
  1 | Forest Gump                                |         1994 | Robert Zemeckis
 42 | Hombres de negro                           |         1997 | Barry Sonnenfeld
 10 | La lista de Schindler                      |         1993 | Steven Spielberg
 31 | La milla verde                             |         1999 | Frank Darabont
 30 | Matrix                                     |         1999 | Andy y Lana Wachowski
 22 | El sexto sentido                           |         1999 | M. Night Shyamalan
 45 | El show de Truman                          |         1998 | Peter Weir
 25 | El silencio de los corderos                |         1991 | Jonathan Demme
 61 | Entrevista con el vampiro                  |         1994 | Neil Jordan
  1 | Forest Gump                                |         1994 | Robert Zemeckis
 42 | Hombres de negro                           |         1997 | Barry Sonnenfeld
 10 | La lista de Schindler                      |         1993 | Steven Spielberg
 22 | El sexto sentido                           |         1999 | M. Night Shyamalan
 45 | El show de Truman                          |         1998 | Peter Weir
 25 | El silencio de los corderos                |         1991 | Jonathan Demme
 61 | Entrevista con el vampiro                  |         1994 | Neil Jordan
  1 | Forest Gump                                |         1994 | Robert Zemeckis
 45 | El show de Truman                          |         1998 | Peter Weir
 25 | El silencio de los corderos                |         1991 | Jonathan Demme
 61 | Entrevista con el vampiro                  |         1994 | Neil Jordan
  1 | Forest Gump                                |         1994 | Robert Zemeckis
 61 | Entrevista con el vampiro                  |         1994 | Neil Jordan
  1 | Forest Gump                                |         1994 | Robert Zemeckis
 42 | Hombres de negro                           |         1997 | Barry Sonnenfeld
  1 | Forest Gump                                |         1994 | Robert Zemeckis
 42 | Hombres de negro                           |         1997 | Barry Sonnenfeld
 42 | Hombres de negro                           |         1997 | Barry Sonnenfeld
 10 | La lista de Schindler                      |         1993 | Steven Spielberg
 10 | La lista de Schindler                      |         1993 | Steven Spielberg
 31 | La milla verde                             |         1999 | Frank Darabont
 31 | La milla verde                             |         1999 | Frank Darabont
 30 | Matrix                                     |         1999 | Andy y Lana Wachowski
 89 | Mejor... imposible                         |         1997 | James L. Brooks
 30 | Matrix                                     |         1999 | Andy y Lana Wachowski
 89 | Mejor... imposible                         |         1997 | James L. Brooks
 89 | Mejor... imposible                         |         1997 | James L. Brooks
 29 | Parque Jur├ísico                           |         1993 | Steven Spielberg
 47 | Pesadilla antes de navidad                 |         1993 | Henry Selick
 23 | Pulp Fiction                               |         1994 | Quentin Tarantino
 14 | Salvar al soldado Ryan                     |         1998 | Steven Spielberg
 39 | Seven                                      |         1995 | David Fincher
 86 | Star Wars. Episodio I: La amenaza fantasma |         1999 | George Lucas
 40 | Terminator 2: el juicio final              |         1991 | James Cameron
  2 | Titanic                                    |         1997 | James Cameron
 11 | Toy Story                                  |         1995 | John Lasseter
 46 | Toy Story 2                                |         1999 | John Lasseter
 79 | Trainspotting                              |         1996 | Danny Boyle
 98 | Uno de los nuestros                        |         1990 | Martin Scorsese
(30 rows)
*******/


-- 7. Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”.
SELECT titulo, LENGTH(titulo) AS longitud_titulo FROM peliculas;
-- OPCION MAS CORTA PARA VISUALIZACION
SELECT titulo, LENGTH(titulo) AS longitud_titulo FROM peliculas ORDER BY longitud_titulo DESC FETCH FIRST 20 ROWS ONLY;

-- resultado:
/*******
                        titulo                         | longitud_titulo
-------------------------------------------------------+-----------------
 Sweeney Todd: El barbero diab├│lico de la calle Fleet |              53
 Piratas del Caribe: La maldici├│n de la Perla Negra   |              51
 El Se├▒or de los anillos: La comunidad del anillo     |              49
 Star Wars. Episodio III: La venganza de los Sith      |              48
 Piratas del Caribe: El cofre del hombre muerto        |              46
 Star Wars. Episodio V: El imperio contraataca         |              45
 El Se├▒or de los anillos: El retorno del rey          |              44
 Star Wars. Episodio IV: Una nueva esperanza           |              43
 Star Wars. Episodio VI: El retorno del Jedi           |              43
 Star Wars. Episodio I: La amenaza fantasma            |              42
 El Se├▒or de los anillos: Las dos torres              |              40
 Harry Potter y el Prisionero de Azkaban               |              39
 Alguien vol├│ sobre el nido del cuco                  |              36
 Indiana Jones y la ├║ltima cruzada                    |              34
 Indiana Jones y el templo maldito                     |              33
 Blancanieves y los siete enanitos                     |              33
 Terminator 2: el juicio final                         |              29
 El silencio de los corderos                           |              27
 Pesadilla antes de navidad                            |              26
 Lo que el viento se llev├│                            |              26
(20 rows)

*******/

-- 8. Consultar cual es la longitud más grande entre todos los títulos de las películas. 
SELECT MAX(LENGTH(titulo)) FROM peliculas;

-- resultado:
/*******
  max
-----
  53
(1 row)
*******/

-- Se añade el titulo a esa pelicula

SELECT titulo, LENGTH(titulo) AS longitud_titulo FROM peliculas ORDER BY longitud_titulo DESC FETCH FIRST 1 ROWS ONLY;

-- resultado:
/*******
                        titulo                         | longitud_titulo
-------------------------------------------------------+-----------------
 Sweeney Todd: El barbero diab├│lico de la calle Fleet |              53
(1 row)
*******/