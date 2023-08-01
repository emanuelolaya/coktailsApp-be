CREATE TABLE "APP_USER"."COCKTAIL_RESOURCE" (
  "ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER NOCYCLE NOKEEP NOSCALE NOT NULL ENABLE,
  "NAME" VARCHAR2(100 BYTE) COLLATE "USING_NLS_COMP" NOT NULL ENABLE,
  "SHORT_DESCRIPTION" VARCHAR2(500 BYTE) COLLATE "USING_NLS_COMP",
  "DESCRIPTION" VARCHAR2(2000 BYTE) COLLATE "USING_NLS_COMP",
  "IMG_URL" VARCHAR2(2000 BYTE) COLLATE "USING_NLS_COMP" NOT NULL ENABLE,
  "ALCOHOL_PERCENTAGE" NUMBER NOT NULL ENABLE,
  "TYPE" NUMBER NOT NULL ENABLE,
  CONSTRAINT "INGREDIENT_PK" PRIMARY KEY ("ID") USING INDEX PCTFREE 10 INITRANS 20 MAXTRANS 255 STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT) TABLESPACE "DATA" ENABLE,
  CONSTRAINT "MAX_ALCOHOL_PERCENTAGE" CHECK (ALCOHOL_PERCENTAGE >= 0 OR ALCOHOL_PERCENTAGE <= 100) ENABLE,
  CONSTRAINT "COCKTAIL_RESOURCE_FK1" FOREIGN KEY ("TYPE") REFERENCES "APP_USER"."COCKTAIL_RESOURCE_TYPE" ("ID") ENABLE
) DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION IMMEDIATE PCTFREE 10 PCTUSED 40 INITRANS 10 MAXTRANS 255 NOCOMPRESS LOGGING STORAGE(
  INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT
) TABLESPACE "DATA";

INSERT INTO "APP_USER"."COCKTAIL_RESOURCE" (NAME, SHORT_DESCRIPTION, DESCRIPTION, IMG_URL, ALCOHOL_PERCENTAGE, TYPE)
VALUES ('Bar Spoon', 'Stirring and layering', 'The bar spoon is a long-handled spoon used in cocktail mixing. It is designed to reach the bottom of tall glasses and is essential for stirring cocktails and layering ingredients.', '123', '0', 1);

INSERT INTO "APP_USER"."COCKTAIL_RESOURCE" (NAME, SHORT_DESCRIPTION, DESCRIPTION, IMG_URL, ALCOHOL_PERCENTAGE, TYPE)
VALUES ('Blender', 'Smooth and quick mixing', 'The blender is an essential tool for making blended cocktails like Piña Colada, Margaritas, and other frozen drinks. It quickly mixes and crushes ice and other ingredients to create a smooth, icy beverage.', '123', '0', 1);

INSERT INTO "APP_USER"."COCKTAIL_RESOURCE" (NAME, SHORT_DESCRIPTION, DESCRIPTION, IMG_URL, ALCOHOL_PERCENTAGE, TYPE)
VALUES ('Cocktail Shaker', 'Shake it up!', 'The cocktail shaker is used for mixing cocktails that require shaking to combine ingredients and chill the drink. It typically consists of a metal or glass container with a strainer top.', '123', '0', 1);

INSERT INTO "APP_USER"."COCKTAIL_RESOURCE" (NAME, SHORT_DESCRIPTION, DESCRIPTION, IMG_URL, ALCOHOL_PERCENTAGE, TYPE)
VALUES ('Cocktail Strainer', 'Straining made easy', 'The cocktail strainer is used in combination with the cocktail shaker to strain out ice and solid ingredients from the liquid, ensuring a smooth and clean cocktail.', '123', '0', 1);

INSERT INTO "APP_USER"."COCKTAIL_RESOURCE" (NAME, SHORT_DESCRIPTION, DESCRIPTION, IMG_URL, ALCOHOL_PERCENTAGE, TYPE)
VALUES ('Jigger', 'Accurate measurements', 'The jigger is a small measuring tool with two different-sized cups used by bartenders to accurately measure and pour the right amount of liquid ingredients into cocktails.', '123', '0', 1);

INSERT INTO "APP_USER"."COCKTAIL_RESOURCE" (NAME, SHORT_DESCRIPTION, DESCRIPTION, IMG_URL, ALCOHOL_PERCENTAGE, TYPE)
VALUES ('Mixing Glass', 'Stirred, not shaken', 'The mixing glass is a large, clear glass used for stirring cocktails instead of shaking. It allows the bartender to see the ingredients as they mix together.', '123', '0', 1);

INSERT INTO "APP_USER"."COCKTAIL_RESOURCE" (NAME, SHORT_DESCRIPTION, DESCRIPTION, IMG_URL, ALCOHOL_PERCENTAGE, TYPE)
VALUES ('Muddler', 'Crush and extract flavors', 'The muddler is a long pestle-like tool used to crush and muddle herbs, fruits, and other ingredients in the bottom of a glass or cocktail shaker to release their flavors.', '123', '0', 1);

INSERT INTO "APP_USER"."COCKTAIL_RESOURCE" (NAME, SHORT_DESCRIPTION, DESCRIPTION, IMG_URL, ALCOHOL_PERCENTAGE, TYPE)
VALUES ('Straws', 'Sipping made easy', 'Straws are used to drink cocktails comfortably. They come in various materials, including plastic, paper, or metal, and can be straight or bendy, depending on the preference and sustainability goals.', '123', '0', 1);

-- Agregar registro para "Bar Spoon with Masher" en la tabla "Equipments"
INSERT INTO "APP_USER"."COCKTAIL_RESOURCE" (NAME, SHORT_DESCRIPTION, DESCRIPTION, IMG_URL, ALCOHOL_PERCENTAGE, TYPE)
VALUES ('Bar Spoon with Masher', 'Stirring and muddling', 'The bar spoon with masher combines the functionality of a bar spoon and a muddler, making it convenient for stirring and muddling ingredients in cocktails.', '123', '0', 1);

-- Agregar registro para "Hawthorne Strainer" en la tabla "COCKTAIL_RESOURCE"
INSERT INTO "APP_USER"."COCKTAIL_RESOURCE" (NAME, SHORT_DESCRIPTION, DESCRIPTION, IMG_URL, ALCOHOL_PERCENTAGE, TYPE)
VALUES ('Hawthorne Strainer', 'Ideal for cocktail shakers', 'The Hawthorne strainer is a type of cocktail strainer used specifically with the cocktail shaker. It has a spring-like coil that fits over the top of the shaker to strain out ice and solid ingredients.', '123', '0', 1);

INSERT INTO "APP_USER"."COCKTAIL_RESOURCE" (NAME, SHORT_DESCRIPTION, DESCRIPTION, IMG_URL, ALCOHOL_PERCENTAGE, TYPE)
VALUES ('Fine Mesh Strainer', 'Straining with precision', 'The fine mesh strainer is used for straining cocktails to remove fine particles and achieve a smoother texture. It is particularly useful for drinks that include fresh fruit or herbs.', '123', '0', 1);

INSERT INTO "APP_USER"."COCKTAIL_RESOURCE" (NAME, SHORT_DESCRIPTION, DESCRIPTION, IMG_URL, ALCOHOL_PERCENTAGE, TYPE)
VALUES ('Citrus Juicer', 'Freshly squeezed citrus', 'The citrus juicer is used for extracting juice from citrus fruits like lemons, limes, and oranges, providing fresh and flavorful juice for cocktails.', '123', '0', 1);

INSERT INTO "APP_USER"."COCKTAIL_RESOURCE" (NAME, SHORT_DESCRIPTION, DESCRIPTION, IMG_URL, ALCOHOL_PERCENTAGE, TYPE)
VALUES ('Bar Blade', 'Opening bottles with style', 'The bar blade, also known as a speed opener, is used to quickly and efficiently open beer bottles and some types of capped bottles in a bar setting.', '123', '0', 1);

INSERT INTO "APP_USER"."COCKTAIL_RESOURCE" (NAME, SHORT_DESCRIPTION, DESCRIPTION, IMG_URL, ALCOHOL_PERCENTAGE, TYPE)
VALUES ('Cocktail Picks', 'Garnishing and serving', 'Cocktail picks, also called drink skewers or cocktail sticks, are used to garnish and serve cocktails with fruits, olives, cherries, or other decorative elements.', '123', '0', 1);

INSERT INTO "APP_USER"."COCKTAIL_RESOURCE" (NAME, SHORT_DESCRIPTION, DESCRIPTION, IMG_URL, ALCOHOL_PERCENTAGE, TYPE)
VALUES ('Ice Mallet', 'Crushing ice in style', 'The ice mallet is a tool used for crushing ice, often used in Tiki bars to create crushed ice for tropical and frozen cocktails.', '123', '0', 1);

INSERT INTO "APP_USER"."COCKTAIL_RESOURCE" (NAME, SHORT_DESCRIPTION, DESCRIPTION)
VALUES ('Ice Crusher', 'Crushing ice with ease', 'The ice crusher is an electric or manual device used for crushing ice cubes into smaller, more manageable pieces for use in cocktails and other chilled drinks.', '123', '0', 1);

INSERT INTO "APP_USER"."COCKTAIL_RESOURCE" (NAME, SHORT_DESCRIPTION, DESCRIPTION)
VALUES ('Garnish Tray', 'Organized garnishing', 'The garnish tray is a container used for holding and organizing various cocktail garnishes, such as citrus slices, cherries, olives, and other decorative elements.', '123', '0', 1);

INSERT INTO "APP_USER"."COCKTAIL_RESOURCE" (NAME, SHORT_DESCRIPTION, DESCRIPTION)
VALUES ('Wine Opener', 'Uncorking wine bottles', 'The wine opener, also known as a corkscrew, is used for removing corks from wine bottles, allowing for the easy serving of wine-based cocktails and other drinks.', '123', '0', 1);
