# Two Tables Design Recipe Template (blog)

## 1. Extract nouns from the user stories or specification

```
# USER STORY:

As a blogger
So I can write interesting stuff
I want to write posts having a title.

As a blogger
So I can write interesting stuff
I want to write posts having a content.

As a blogger
So I can let people comment on interesting stuff
I want to allow comments on my posts.

As a blogger
So I can let people comment on interesting stuff
I want the comments to have a content.

As a blogger
So I can let people comment on interesting stuff
I want the author to include their name in comments.
```

```
Nouns:

post, title, content, comment, comment content, name (author of comment)
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties             |
| --------------------- | ---------------------- |
| post                  | title, content         |
| comment               | content, name, post_id |

1. Name of the first table (always plural): `posts`

    Column names: `title`, `content`

2. Name of the second table (always plural): `comments`

    Column names: `content`, `name`, `post_id`

## 3. Decide the column types.

```
Table: posts
id: SERIAL
title: text
content: text

Table: comments
id: SERIAL
content: text
name: text
post_id: int
```

## 4. Decide on The Tables Relationship

One-to-Many

Many comments on one post. Comments Table has foreign key.

## 4. Write the SQL.

```sql
-- file: blog.sql

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title text,
  content text
);

-- Then the table with the foreign key first.
CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  content text,
  name text,
  post_id text,
  constraint fk_post foreign key(post_id)
    references posts(id)
    on delete cascade
);

```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 blog < blog.sql
```
