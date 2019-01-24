DROP TABLE cakes;
DROP TABLE manufacturers;

CREATE TABLE manufacturers (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) not null,
  location VARCHAR(255),
  manager_name VARCHAR(255),
  minimum_order INT2
);

CREATE TABLE cakes (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) not null,
  category VARCHAR(255),
  quantity INT2,
  buying_cost INT2,
  selling_price INT2,
  manufacturer_id INT8 REFERENCES manufacturers(id)
);
