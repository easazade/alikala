--
-- Class Product as table shop_products
--

CREATE TABLE "shop_products" (
  "id" serial,
  "name" text NOT NULL,
  "description" text NOT NULL,
  "images" json
);

ALTER TABLE ONLY "shop_products"
  ADD CONSTRAINT shop_products_pkey PRIMARY KEY (id);


