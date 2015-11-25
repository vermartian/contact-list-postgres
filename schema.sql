-- If you want to run this schema repeatedly you'll need to drop
-- the table before re-creating it. Note that you'll lose any
-- data if you drop and add a table:

DROP TABLE IF EXISTS contacts CASCADE;
DROP TABLE IF EXISTS skills CASCADE;
-- Define your schema here:

CREATE TABLE contacts (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE skills (
  id SERIAL PRIMARY KEY,
  description VARCHAR(255),
  contact_id INT REFERENCES contacts
);
