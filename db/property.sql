-- psql -d property -f db/property.sql

DROP TABLE IF EXISTS property;

CREATE TABLE property(
  id SERIAL4 PRIMARY KEY,
  address VARCHAR(255),
  valuation INT8,
  rooms INT2,
  build VARCHAR(255)
)
