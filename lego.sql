DROP DATABASE lego;
CREATE DATABASE IF NOT EXISTS lego;

USE lego;

CREATE TABLE IF NOT EXISTS parts(
  part_num VARCHAR(200),
  name TEXT,
  part_cat_id INT,
  PRIMARY KEY(part_num)
);

CREATE TABLE IF NOT EXISTS themes(
  id INT,
  name TEXT,
  parent_id INT,
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS part_categories(
  id INT,
  name TEXT,
  PRIMARY KEY(id)
);


CREATE TABLE IF NOT EXISTS colors(
  id INT NOT NULL,
  name TEXT,
  rgb TEXT,
  is_trans TEXT,
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS sets(
  set_num VARCHAR(200),
  name TEXT,
  year INT,
  theme_id INT,
  num_parts INT,
  PRIMARY KEY(set_num),
  FOREIGN KEY(theme_id) REFERENCES themes(id)
);

CREATE TABLE IF NOT EXISTS inventories(
 id INT,
 version INT,
 set_num VARCHAR(200),
 PRIMARY KEY(id),
 FOREIGN KEY(set_num) REFERENCES sets(set_num)
);

CREATE TABLE IF NOT EXISTS inventory_parts(
  inventory_id INT,
  part_num VARCHAR(200),
  color_id INT,
  quantity INT,
  is_spare VARCHAR(2),
  PRIMARY KEY(inventory_id,part_num,color_id,quantity,is_spare),
  FOREIGN KEY(inventory_id) REFERENCES inventories(id),
  -- FOREIGN KEY(part_num) REFERENCES parts(part_num),
  FOREIGN KEY(color_id) REFERENCES colors(id)
);

CREATE TABLE IF NOT EXISTS inventory_sets(
  inventory_id INT,
  set_num VARCHAR(200),
  quantity INT,
  PRIMARY KEY(inventory_id, set_num, quantity),
  FOREIGN KEY(inventory_id) REFERENCES inventories(id),
  FOREIGN KEY(set_num) REFERENCES sets(set_num)
);
