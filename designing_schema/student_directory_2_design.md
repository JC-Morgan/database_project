# Two Tables Design Recipe Template (student_directory_2)

## 1. Extract nouns from the user stories or specification

```
# USER STORY:

As a coach
So I can get to know all students
I want to see a list of students' names.

As a coach
So I can get to know all students
I want to see a list of cohorts' names.

As a coach
So I can get to know all students
I want to see a list of cohorts' starting dates.

As a coach
So I can get to know all students
I want to see a list of students' cohorts.
```

```
Nouns:

student, name, cohort, starting_date
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties            |
| --------------------- | --------------------- |
| student               | name, cohort          |
| cohort                | cohort, starting_date |

1. Name of the first table (always plural): `students`

    Column names: `name`, `cohort`

2. Name of the second table (always plural): `cohorts`

    Column names: `cohort, starting_date`

## 3. Decide the column types.

```

Table: students
id: SERIAL
name: text
cohort_id: int

Table: cohorts
id: SERIAL
cohort: text
starting_date: date
```

## 4. Decide on The Tables Relationship

One-to-Many

Many students in one cohort. Students Table has foreign key.

## 4. Write the SQL.

```sql
-- file: student_directory.sql

CREATE TABLE cohorts (
  id SERIAL PRIMARY KEY,
  cohort text,
  starting_date date
);

-- Then the table with the foreign key first.
CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name text,
  cohort_id int,
  constraint fk_cohort foreign key(cohort_id)
    references cohorts(id)
    on delete cascade
);

```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 student_directory_2 < student_directory.sql
```
