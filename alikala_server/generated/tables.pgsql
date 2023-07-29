--
-- Class Category as table categories
--

CREATE TABLE "categories" (
  "id" serial,
  "name" text NOT NULL,
  "parentId" integer,
  "productsCount" integer NOT NULL
);

ALTER TABLE ONLY "categories"
  ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Class Comment as table comments
--

CREATE TABLE "comments" (
  "id" serial,
  "title" text NOT NULL,
  "content" text NOT NULL,
  "createdAt" timestamp without time zone NOT NULL,
  "username" text NOT NULL,
  "userId" integer NOT NULL
);

ALTER TABLE ONLY "comments"
  ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Class Deal as table deals
--

CREATE TABLE "deals" (
  "id" serial,
  "title" text NOT NULL,
  "price" integer NOT NULL,
  "offPrice" integer,
  "dueDate" timestamp without time zone NOT NULL
);

ALTER TABLE ONLY "deals"
  ADD CONSTRAINT deals_pkey PRIMARY KEY (id);


--
-- Class Product as table products
--

CREATE TABLE "products" (
  "id" serial,
  "title" text NOT NULL,
  "price" integer NOT NULL,
  "offPrice" integer,
  "colorHex" integer,
  "colorName" text,
  "dueDate" timestamp without time zone NOT NULL
);

ALTER TABLE ONLY "products"
  ADD CONSTRAINT products_pkey PRIMARY KEY (id);


