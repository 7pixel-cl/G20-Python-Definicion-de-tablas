# Desafío - Definición de tablas

Se requiere crear un sitio web dedicado al mundo cinematográfico donde los usuarios
puedan buscar detalles del top 100 de películas más populares. El plus más importante de
este sitio web debe ser la variedad de filtros que ofrece para una búsqueda más efectiva.
Para este desafío necesitarás crear 2 tablas llamadas películas y reparto, sus datos los
consigues en los ficheros de extensión csv ubicados en el Apoyo Desafío.

## Requisitos

- PostgreSQL
- psql CLI

## Configuración

1. Conéctese al motor de base de datos (en este caso, puerto 5433, por defecto debiera ser 5432):

   ```sh
   psql -p 5433 -U postgres
   ```

2. Crear la base de datos llamada `peliculas`:

   ```sql
   CREATE DATABASE peliculas;
   ```

3. Conéctese a la base de datos `peliculas`:

   ```sh
   \c peliculas
   ```

4. Crear las tablas `peliculas` y `reparto`:

   ```sql
   CREATE TABLE peliculas (
       id SERIAL PRIMARY KEY,
       titulo VARCHAR(255),
       anio_estreno INT,
       director VARCHAR(255)
   );

   CREATE TABLE reparto (
       id SERIAL PRIMARY KEY,
       id_pelicula INT REFERENCES peliculas(id),
       actor VARCHAR(255)
   );
   ```

5. Cargar los datos desde los archivos CSV:

   ```sql
   \COPY peliculas (id, titulo, anio_estreno, director) FROM './data/peliculas.csv' DELIMITER ',' CSV HEADER;
   \COPY reparto (id_pelicula, actor) FROM './data/reparto.csv' DELIMITER ',' CSV HEADER;
   ```

## Consultas SQL

### Obtener el ID de la película “Titanic”:

```sql
SELECT id FROM peliculas WHERE titulo = 'Titanic';
```

### Consultar en cuántas películas del top 100 participa Harrison Ford:

```sql
SELECT COUNT(*) FROM reparto WHERE actor = 'Harrison Ford';
```

### Películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente:

```sql
SELECT * FROM peliculas WHERE anio_estreno BETWEEN 1990 AND 1999 ORDER BY titulo ASC;
```

### Mostrar los títulos con su longitud, nombrado como “longitud_titulo”:

```sql
SELECT titulo, LENGTH(titulo) AS longitud_titulo FROM peliculas ORDER BY longitud_titulo DESC FETCH FIRST 20 ROWS ONLY;
```

### Consultar cual es la longitud más grande entre todos los títulos de las películas:

```sql
SELECT titulo, LENGTH(titulo) AS longitud_titulo FROM peliculas ORDER BY longitud_titulo DESC FETCH FIRST 20 ROWS ONLY;
```

### Consultar cual es la longitud más grande entre todos los títulos de las películas:

```sql
SELECT MAX(LENGTH(titulo)) FROM peliculas;
```

### Título de la película con la longitud más grande:

```sql
SELECT titulo, LENGTH(titulo) AS longitud_titulo FROM peliculas ORDER BY longitud_titulo DESC FETCH FIRST 1 ROWS ONLY;
```
