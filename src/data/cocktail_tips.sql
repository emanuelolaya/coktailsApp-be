CREATE TABLE "APP_USER"."COCKTAIL_TIPS" (
  "ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER NOCYCLE NOKEEP NOSCALE NOT NULL ENABLE,
  "NAME" VARCHAR2(100 BYTE) COLLATE "USING_NLS_COMP",
  "DESCRIPTION" VARCHAR2(500 BYTE) COLLATE "USING_NLS_COMP",
  "IMG_URL" VARCHAR2(200 BYTE) COLLATE "USING_NLS_COMP",
  CONSTRAINT "COCKTAIL_TIPS_PK" PRIMARY KEY ("ID") USING INDEX PCTFREE 10 INITRANS 20 MAXTRANS 255 TABLESPACE "DATA" ENABLE
) DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION DEFERRED PCTFREE 10 PCTUSED 40 INITRANS 10 MAXTRANS 255 NOCOMPRESS LOGGING TABLESPACE "DATA";

