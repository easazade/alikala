--
-- Class Product as table products
--

CREATE TABLE "products" (
  "id" serial,
  "userId" integer NOT NULL,
  "name" text NOT NULL,
  "description" text NOT NULL,
  "images" json
);

ALTER TABLE ONLY "products"
  ADD CONSTRAINT products_pkey PRIMARY KEY (id);


