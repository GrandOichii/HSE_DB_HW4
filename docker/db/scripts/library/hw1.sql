CREATE SCHEMA "library";

CREATE TABLE "library"."book" (
  "isbn" SERIAL PRIMARY KEY,
  "name" varchar,
  "author" varchar,
  "published" date,
  "pageCount" int,
  "categories" int
);

CREATE TABLE "library"."category" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "parent" int
);

CREATE TABLE "library"."copy" (
  "isbn" int,
  "copyNumber" SERIAL PRIMARY KEY,
  "shelfPos" int
);

CREATE TABLE "library"."publisher" (
  "id" int,
  "name" varchar,
  "address" varchar,
  "books" int
);

CREATE TABLE "library"."reader" (
  "id" int,
  "FirstName" varchar,
  "SecondName" varchar,
  "books" int
);

CREATE TABLE "category_book" (
  "category_id" int NOT NULL,
  "book_categories" int NOT NULL,
  PRIMARY KEY ("category_id", "book_categories")
);

ALTER TABLE "category_book" ADD FOREIGN KEY ("category_id") REFERENCES "library"."category" ("id");

ALTER TABLE "category_book" ADD FOREIGN KEY ("book_categories") REFERENCES "library"."book" ("categories");


ALTER TABLE "library"."category" ADD FOREIGN KEY ("parent") REFERENCES "library"."category" ("id");

ALTER TABLE "library"."copy" ADD FOREIGN KEY ("isbn") REFERENCES "library"."book" ("isbn");

ALTER TABLE "library"."book" ADD FOREIGN KEY ("isbn") REFERENCES "library"."publisher" ("books");

ALTER TABLE "library"."book" ADD FOREIGN KEY ("isbn") REFERENCES "library"."reader" ("books");
