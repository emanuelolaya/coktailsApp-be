CREATE TABLE "APP_USER"."COCKTAIL__COCKTAIL_RESOURCE" (
  "COCKTAIL_ID" NUMBER NOT NULL ENABLE,
  "RESOURCE_ID" NUMBER NOT NULL ENABLE,
  "AMOUNT" NUMBER,
  "MEASUREMENT_UNIT_ID" NUMBER,
  CONSTRAINT "COCKTAIL__COCKTAIL_RESOURCE_FK1" FOREIGN KEY ("COCKTAIL_ID") REFERENCES "APP_USER"."COCKTAIL" ("ID") ENABLE,
  CONSTRAINT "COCKTAIL__COCKTAIL_RESOURCE_FK2" FOREIGN KEY ("RESOURCE_ID") REFERENCES "APP_USER"."COCKTAIL_RESOURCE" ("ID") ENABLE,
  CONSTRAINT "COCKTAIL__COCKTAIL_RESOURCE_FK3" FOREIGN KEY ("MEASUREMENT_UNIT_ID") REFERENCES "APP_USER"."MEASUREMENT_UNIT" ("ID") ENABLE
) DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION DEFERRED PCTFREE 10 PCTUSED 40 INITRANS 10 MAXTRANS 255 NOCOMPRESS LOGGING TABLESPACE "DATA";

