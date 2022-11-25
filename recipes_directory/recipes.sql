CREATE TABLE recipes (
  id SERIAL PRIMARY KEY,
  name text,
  cooking_time int,
  rating int
);

INSERT INTO recipes (name, cooking_time, rating) VALUES ('Spaghetti Bolognese', 110, 5);
INSERT INTO recipes (name, cooking_time, rating) VALUES ('Chickpea Curry', 50, 4);
INSERT INTO recipes (name, cooking_time, rating) VALUES ('Scrambled Tofu', 30, 2);
INSERT INTO recipes (name, cooking_time, rating) VALUES ('Ratatouille', 75, 4);
