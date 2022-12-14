# Single Table Design Recipe (movies_directory)


## 1. Extract nouns from the user stories or specification

```
# USER STORY:

As a person who loves movies,
So I can list all my favourite movies
I want to see a list of movies' titles.

As a person who loves movies,
So I can list all my favourite movies
I want to see a list of movies' genres.

As a person who loves movies,
So I can list all my favourite movies
I want to see a list of movies' release year.
```

```
Nouns:

movie, title, genre, release year
```

## 2. Infer the Table Name and Columns


| Record                | Properties                 |
| --------------------- | ---------------------------|
| movie                 | title, genre, release year |

Name of the table: `movies`

Column names: `title`, `genre`, `release_year`

## 3. Decide the column types.

```
id: SERIAL
title: text
genre: text
release_year: int
```

## 4. Write the SQL.

```sql
-- file: movies.sql

CREATE TABLE movies (
  id SERIAL PRIMARY KEY,
  title text,
  genre text,
  release_year int
);
```

## 5. Create the table.

```bash
psql -h 127.0.0.1 movies_directory < movies.sql
```
