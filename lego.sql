CREATE DATABASE IF NOT EXISTS lego;

USE lego;
CREATE TABLE IF NOT EXISTS inventory_parts(
  inventory_id INT,
  par_num VARCHAR(40),
  color_id INT,
  quantity INT,
  is_spare VARCHAR(2),
  PRIMARY KEY(inventory_id)
  -- FOREIGN KEY(inventory_id) REFERENCES inventories(id);
);

CREATE TABLE IF NOT EXISTS colors(
  id INT NOT NULL,
  name VARCHAR(40),
  rgb VARCHAR(40),
  is_trans VARCHAR(2),
  PRIMARY KEY(id)
  -- FOREIGN KEY(id) REFERENCES inventory_parts(color_id)
);

CREATE TABLE IF NOT EXISTS inventories(
 id INT,
 version INT,
 set_num VARCHAR(20),
 PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS inventory_sets(
  inventory_id INT,
  set_num VARCHAR(20),
  quantity INT,
  PRIMARY KEY(inventory_id, set_num, quantity)
);

CREATE TABLE IF NOT EXISTS parts(
  part_num VARCHAR(20),
  name TEXT,
  part_cat_id INT,
  PRIMARY KEY(part_num)
);

CREATE TABLE IF NOT EXISTS sets(
  set_num VARCHAR(20),
  name TEXT,
  year INT,
  theme_id INT,
  num_parts INT,
  PRIMARY KEY(set_num)
);

CREATE TABLE IF NOT EXISTS themes(
  id INT,
  name VARCHAR(50),
  parent_id INT,
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS part_categories(
  id INT,
  name TEXT,
  PRIMARY KEY(id)
);
