--
-- Class Discount as table shop_discounts
--

CREATE TABLE "shop_discounts" (
  "id" serial,
  "discountPrice" double precision NOT NULL,
  "startDate" timestamp without time zone NOT NULL,
  "dueDate" timestamp without time zone NOT NULL,
  "message" text NOT NULL
);

ALTER TABLE ONLY "shop_discounts"
  ADD CONSTRAINT shop_discounts_pkey PRIMARY KEY (id);


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


--
-- Class SlideAd as table shop_slide_ads
--

CREATE TABLE "shop_slide_ads" (
  "id" serial,
  "title" text,
  "description" text,
  "image" text
);

ALTER TABLE ONLY "shop_slide_ads"
  ADD CONSTRAINT shop_slide_ads_pkey PRIMARY KEY (id);


