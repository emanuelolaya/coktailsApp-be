CREATE TABLE "APP_USER"."COCKTAIL_GLASSES" (
  "ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER NOCYCLE NOKEEP NOSCALE NOT NULL ENABLE,
  "NAME" VARCHAR2(100 BYTE) COLLATE "USING_NLS_COMP" NOT NULL ENABLE,
  "SHORT_DESCRIPTION" VARCHAR2(100 BYTE) COLLATE "USING_NLS_COMP" NOT NULL ENABLE,
  "DESCRIPTION" VARCHAR2(500 BYTE) COLLATE "USING_NLS_COMP",
  "ML_VOLUME" VARCHAR2(20 BYTE) COLLATE "USING_NLS_COMP" NOT NULL ENABLE,
  "IMG_URL" VARCHAR2(200 BYTE) COLLATE "USING_NLS_COMP",
  CONSTRAINT "COCKTAIL_GLASSES_PK" PRIMARY KEY ("ID") USING INDEX PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT) TABLESPACE "DATA" ENABLE
) DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION IMMEDIATE PCTFREE 10 PCTUSED 40 INITRANS 10 MAXTRANS 255 NOCOMPRESS LOGGING STORAGE(
  INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT
) TABLESPACE "DATA";

INSERT INTO "APP_USER"."COCKTAIL_GLASSES" (NAME, SHORT_DESCRIPTION, DESCRIPTION, ML_VOLUME, IMG_URL) 
VALUES ('Champagne Glass', 'Crystal Flutes', 'Drinking sparkling wine during celebratory occasions almost always calls for crystal flutes. You can fit more flutes on a tray than coupes or all-purpose wine glasses, which is ideal for serving larger groups.', '195', NULL)

INSERT INTO "APP_USER"."COCKTAIL_GLASSES" (NAME, SHORT_DESCRIPTION, DESCRIPTION, ML_VOLUME, IMG_URL)
VALUES ('Cocktail Glass', 'Versatile and elegant', 'The cocktail glass, also known as a Martini glass, is a classic choice for serving a variety of cocktails, including martinis, cosmopolitans, and daiquiris. Its long stem helps keep the drink cold, and its wide, conical bowl allows for the full appreciation of the cocktails aroma.', '180', NULL);

INSERT INTO "APP_USER"."COCKTAIL_GLASSES" (NAME, SHORT_DESCRIPTION, DESCRIPTION, ML_VOLUME, IMG_URL)
VALUES ('Collins Glass', 'Tall and slim', 'The Collins glass is a tall, narrow glass used for serving refreshing highball cocktails like the Tom Collins or the Mojito. Its long shape is perfect for maintaining the carbonation of drinks and presenting a visually appealing cocktail.', '350', NULL);

INSERT INTO "APP_USER"."COCKTAIL_GLASSES" (NAME, SHORT_DESCRIPTION, DESCRIPTION, ML_VOLUME, IMG_URL)
VALUES ('Copper Mug', 'Traditionally for Moscow Mule', 'The copper mug is iconic for serving the Moscow Mule cocktail. The metal helps keep the drink icy cold, and it adds a distinctive presentation to the cocktail. It is also used for other refreshing cocktails.', '400', NULL);

INSERT INTO "APP_USER"."COCKTAIL_GLASSES" (NAME, SHORT_DESCRIPTION, DESCRIPTION, ML_VOLUME, IMG_URL)
VALUES ('Coupe Glass', 'Classic champagne saucer', 'The coupe glass, also known as a champagne saucer, is a vintage glass with a broad, shallow bowl. It is used for serving champagne, sparkling wine, and classic cocktails like the Champagne cocktail. Its elegant appearance makes it a popular choice for sophisticated drinks.', '210', NULL);

INSERT INTO "APP_USER"."COCKTAIL_GLASSES" (NAME, SHORT_DESCRIPTION, DESCRIPTION, ML_VOLUME, IMG_URL)
VALUES ('Highball Glass', 'Versatile tall glass', 'The highball glass is a versatile glass used for a wide range of cocktails mixed with soda, tonic, or other mixers. It is perfect for drinks like the Gin and Tonic or the Cuba Libre.', '300', NULL);

INSERT INTO "APP_USER"."COCKTAIL_GLASSES" (NAME, SHORT_DESCRIPTION, DESCRIPTION, ML_VOLUME, IMG_URL)
VALUES ('Shot Glass', 'Small and potent', 'The shot glass is a small glass used for serving straight shots of spirits or small cocktails that are meant to be consumed quickly.', '50', NULL);

INSERT INTO "APP_USER"."COCKTAIL_GLASSES" (NAME, SHORT_DESCRIPTION, DESCRIPTION, ML_VOLUME, IMG_URL)
VALUES ('Margarita Glass', 'Iconic cocktail glass', 'The Margarita glass features a distinctive wide rim, perfect for holding salt. It is used for serving Margaritas and other frozen or shaken cocktails.', '250', NULL);

INSERT INTO "APP_USER"."COCKTAIL_GLASSES" (NAME, SHORT_DESCRIPTION, DESCRIPTION, ML_VOLUME, IMG_URL)
VALUES ('Tiki Mug', 'Exotic and fun', 'The Tiki mug is used for tropical and exotic cocktails, especially those with elaborate garnishes and colorful presentations. It adds a fun and festive touch to the drink.', '400', NULL);

INSERT INTO "APP_USER"."COCKTAIL_GLASSES" (NAME, SHORT_DESCRIPTION, DESCRIPTION, ML_VOLUME, IMG_URL)
VALUES ('Hurricane Glass', 'Tropical and curvy', 'The Hurricane glass has a distinct curvy shape and is used for serving tropical cocktails like the Hurricane. It often comes with colorful decorations and garnishes.', '450', NULL);

INSERT INTO "APP_USER"."COCKTAIL_GLASSES" (NAME, SHORT_DESCRIPTION, DESCRIPTION, ML_VOLUME, IMG_URL)
VALUES ('Pilsner Glass', 'For beer-based cocktails', 'The Pilsner glass is typically used for serving beer, but it is also used for beer-based cocktails like the Michelada or the Shandy.', '400', NULL);

INSERT INTO "APP_USER"."COCKTAIL_GLASSES" (NAME, SHORT_DESCRIPTION, DESCRIPTION, ML_VOLUME, IMG_URL)
VALUES ('Goblet Glass', 'Elegant and versatile', 'The goblet glass has a large bowl and a stem, making it suitable for a wide variety of cocktails, from wine-based drinks to elaborate cocktails with fancy presentations.', '350', NULL);

INSERT INTO "APP_USER"."COCKTAIL_GLASSES" (NAME, SHORT_DESCRIPTION, DESCRIPTION, ML_VOLUME, IMG_URL)
VALUES ('Wine Glass', 'For wine-based cocktails', 'The wine glass is used for wine-based cocktails and sophisticated drinks like the Kir Royale or the Sangria.', '250', NULL);

INSERT INTO "APP_USER"."COCKTAIL_GLASSES" (NAME, SHORT_DESCRIPTION, DESCRIPTION, ML_VOLUME, IMG_URL)
VALUES ('Pint Glass', 'Classic beer glass', 'The pint glass is a standard glass for serving beer and is also used for beer-based cocktails or large servings of drinks.', '568', NULL);

INSERT INTO "APP_USER"."COCKTAIL_GLASSES" (NAME, SHORT_DESCRIPTION, DESCRIPTION, ML_VOLUME, IMG_URL)
VALUES ('Beer Mug', 'Traditional beer container', 'The beer mug is a heavy glass mug with a handle, typically used for serving beer in pubs and bars.', '500', NULL);

INSERT INTO "APP_USER"."COCKTAIL_GLASSES" (NAME, SHORT_DESCRIPTION, DESCRIPTION, ML_VOLUME, IMG_URL)
VALUES ('Whiskey Tumbler', 'For sipping whiskey', 'The whiskey tumbler, also known as an old-fashioned glass, is used for serving whiskey neat or on the rocks.', '300', NULL);

INSERT INTO "APP_USER"."COCKTAIL_GLASSES" (NAME, SHORT_DESCRIPTION, DESCRIPTION, ML_VOLUME, IMG_URL)
VALUES ('Brandy Snifter', 'For savoring brandy', 'The brandy snifter is designed to concentrate the aroma of brandy or other aged spirits, enhancing the sipping experience.', '200', NULL);

INSERT INTO "APP_USER"."COCKTAIL_GLASSES" (NAME, SHORT_DESCRIPTION, DESCRIPTION, ML_VOLUME, IMG_URL)
VALUES ('Martini Coupette', 'Stylish and classic', 'The Martini coupette, also known as a saucer glass, is an alternative to the classic Martini glass, offering a vintage touch to the presentation of cocktails.', '180', NULL);

INSERT INTO "APP_USER"."COCKTAIL_GLASSES" (NAME, SHORT_DESCRIPTION, DESCRIPTION, ML_VOLUME, IMG_URL)
VALUES ('Nick and Nora Glass', 'Sophisticated and elegant', 'The Nick and Nora glass is a stemmed glass with a smaller capacity, ideal for serving vintage or stirred cocktails with a touch of elegance.', '150', NULL);

INSERT INTO "APP_USER"."COCKTAIL_GLASSES" (NAME, SHORT_DESCRIPTION, DESCRIPTION, ML_VOLUME, IMG_URL)
VALUES ('Mason Jar', 'Rustic and trendy', 'The Mason jar, popularized in recent years, is often used for serving craft cocktails and creative presentations.', '400', NULL);

INSERT INTO "APP_USER"."COCKTAIL_GLASSES" (NAME, SHORT_DESCRIPTION, DESCRIPTION, ML_VOLUME, IMG_URL)
VALUES ('Tulip Glass', 'Enhancing beer aromas', 'The tulip glass is used for serving aromatic beers, especially those with fruity or floral notes, as its shape helps concentrate the aromas.', '350', NULL);

INSERT INTO "APP_USER"."COCKTAIL_GLASSES" (NAME, SHORT_DESCRIPTION, DESCRIPTION, ML_VOLUME, IMG_URL)
VALUES ('Milkshake Glass', 'Classic diner style', 'The milkshake glass is used for serving milkshakes and creamy cocktails with a nostalgic diner feel.', '500', NULL);

INSERT INTO "APP_USER"."COCKTAIL_GLASSES" (NAME, SHORT_DESCRIPTION, DESCRIPTION, ML_VOLUME, IMG_URL)
VALUES ('Poco Grande Glass', 'Tropical and tall', 'The Poco Grande glass is similar to a hurricane glass but narrower. It is used for tall tropical cocktails like the Piña Colada or the Blue Hawaiian.', '450', NULL);

INSERT INTO "APP_USER"."COCKTAIL_GLASSES" (NAME, SHORT_DESCRIPTION, DESCRIPTION, ML_VOLUME, IMG_URL)
VALUES ('Punch Bowl', 'For serving punch', 'The punch bowl is a large bowl used for serving communal drinks like punch, often accompanied by ladles and cups for self-service.', '4000', NULL);

INSERT INTO "APP_USER"."COCKTAIL_GLASSES" (NAME, SHORT_DESCRIPTION, DESCRIPTION, ML_VOLUME, IMG_URL)
VALUES ('Chalice Glass', 'Elegant goblet-like glass', 'The chalice glass, also known as a goblet glass, is used for elegant cocktails and beer-based drinks, providing a sophisticated presentation.', '300', NULL);

INSERT INTO "APP_USER"."COCKTAIL_GLASSES" (NAME, SHORT_DESCRIPTION, DESCRIPTION, ML_VOLUME, IMG_URL)
VALUES ('Zombie Glass', 'Tiki-inspired design', 'The Zombie glass is used for serving the classic Tiki cocktail, the Zombie. It typically features a unique and vibrant design that complements the tropical and exotic nature of the drink.', '400', NULL);

INSERT INTO "APP_USER"."COCKTAIL_GLASSES" (NAME, SHORT_DESCRIPTION, DESCRIPTION, ML_VOLUME, IMG_URL)
VALUES ('Sour Glass', 'Short and sour', 'The Sour glass, also known as a Delmonico glass, is used for serving sour-style cocktails, like the Whiskey Sour or the Sidecar. Its small size is ideal for concentrated and flavorful drinks.', '180', NULL);