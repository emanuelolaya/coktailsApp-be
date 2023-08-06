CREATE TABLE "APP_USER"."BAR" (
  "MAIN_USER_ID" NUMBER NOT NULL ENABLE,
  "COCKTAIL_RESOURCE_ID" NUMBER NOT NULL ENABLE,
  "HAVE_IT" CHAR(1 BYTE) COLLATE "USING_NLS_COMP",
  "WANT_IT" CHAR(1 BYTE) COLLATE "USING_NLS_COMP",
  CONSTRAINT "BAR_CHK1" CHECK (WANT_IT IN ('1', '0')) ENABLE,
  CONSTRAINT "BAR_CHK2" CHECK (HAVE_IT IN ('1', '0')) ENABLE,
  CONSTRAINT "BAR_FK1" FOREIGN KEY ("MAIN_USER_ID") REFERENCES "APP_USER"."MAIN_USER" ("ID") ENABLE,
  CONSTRAINT "BAR_FK2" FOREIGN KEY ("COCKTAIL_RESOURCE_ID") REFERENCES "APP_USER"."COCKTAIL_RESOURCE" ("ID") ENABLE
) DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION DEFERRED PCTFREE 10 PCTUSED 40 INITRANS 10 MAXTRANS 255 NOCOMPRESS LOGGING TABLESPACE "DATA";
