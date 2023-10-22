--
-- Class BannerAd as table shop_banner_ads
--

CREATE TABLE "shop_banner_ads" (
  "id" serial,
  "title" text,
  "description" text,
  "image" text
);

ALTER TABLE ONLY "shop_banner_ads"
  ADD CONSTRAINT shop_banner_ads_pkey PRIMARY KEY (id);


--
-- Class Cart as table shop_carts
--

CREATE TABLE "shop_carts" (
  "id" serial,
  "userId" integer NOT NULL,
  "dateCreated" timestamp without time zone NOT NULL
);

ALTER TABLE ONLY "shop_carts"
  ADD CONSTRAINT shop_carts_pkey PRIMARY KEY (id);


--
-- Class CartItem as table shop_cart_items
--

CREATE TABLE "shop_cart_items" (
  "id" serial,
  "cartId" integer NOT NULL,
  "productId" integer NOT NULL,
  "addedCount" integer NOT NULL
);

ALTER TABLE ONLY "shop_cart_items"
  ADD CONSTRAINT shop_cart_items_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "shop_cart_items"
  ADD CONSTRAINT shop_cart_items_fk_0
    FOREIGN KEY("cartId")
      REFERENCES shop_carts(id)
        ON DELETE CASCADE;

--
-- Class Category as table shop_categories
--

CREATE TABLE "shop_categories" (
  "id" serial,
  "parentId" integer,
  "name" text NOT NULL,
  "description" text NOT NULL,
  "image" text,
  "icon" text,
  "productsCount" integer
);

ALTER TABLE ONLY "shop_categories"
  ADD CONSTRAINT shop_categories_pkey PRIMARY KEY (id);


--
-- Class Offer as table shop_offers
--

CREATE TABLE "shop_offers" (
  "id" serial,
  "productId" integer NOT NULL,
  "discountId" integer NOT NULL,
  "expireAt" timestamp without time zone NOT NULL,
  "startedAt" timestamp without time zone NOT NULL
);

ALTER TABLE ONLY "shop_offers"
  ADD CONSTRAINT shop_offers_pkey PRIMARY KEY (id);


--
-- Class Product as table shop_products
--

CREATE TABLE "shop_products" (
  "id" serial,
  "name" text NOT NULL,
  "description" text NOT NULL,
  "price" integer NOT NULL,
  "images" json,
  "category" json NOT NULL
);

ALTER TABLE ONLY "shop_products"
  ADD CONSTRAINT shop_products_pkey PRIMARY KEY (id);


--
-- Class Discount as table shop_discounts
--

CREATE TABLE "shop_discounts" (
  "id" serial,
  "productId" integer NOT NULL,
  "discountPrice" integer NOT NULL,
  "startDate" timestamp without time zone NOT NULL,
  "dueDate" timestamp without time zone NOT NULL,
  "message" text NOT NULL
);

ALTER TABLE ONLY "shop_discounts"
  ADD CONSTRAINT shop_discounts_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "shop_discounts"
  ADD CONSTRAINT shop_discounts_fk_0
    FOREIGN KEY("productId")
      REFERENCES shop_products(id)
        ON DELETE CASCADE;

--
-- Class Profile as table shop_profiles
--

CREATE TABLE "shop_profiles" (
  "id" serial,
  "userId" integer NOT NULL,
  "favorites" json NOT NULL
);

ALTER TABLE ONLY "shop_profiles"
  ADD CONSTRAINT shop_profiles_pkey PRIMARY KEY (id);


