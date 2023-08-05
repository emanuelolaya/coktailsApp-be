CREATE OR REPLACE PROCEDURE GET_COCKTAILS (
  COCKTAIL_CURSOR OUT SYS_REFCURSOR
) AS
BEGIN
  OPEN COCKTAIL_CURSOR FOR
    SELECT
      C.ID                                                   AS ID_COCKTAIL,
      C.NAME                                                 AS NAME_COCKTAIL,
      C.IMG_URL                                              AS IMG_URL,
      C.ALCOHOL_PERCENTAGE                                   AS ALCOHOL_PERCENTAGE,
      C.ID_AUTHOR                                            AS AUTHOR_ID,
      MU.NAME                                                AS AUTHOR_NAME,
      C.DESCRIPCION                                          AS COCKTAIL_DESCRIPTION,
      C.PREPARACION                                          AS COCKTAIL_PREPARATION,
      CG.ID                                                  AS COCKTAIL_GLASS_ID,
      CG.NAME                                                AS COCKTAIL_GLASS_NAME,
      C.TASTE                                                AS COCKTAIL_TASTE,
      C.COLOR                                                AS COCKTAIL_COLOR,
      CASE
        WHEN FC.COCKTAIL_ID IS NOT NULL
          THEN 1
          ELSE 0
      END AS IS_FAVORITE
    FROM
      COCKTAIL C
      INNER JOIN COCKTAIL_GLASSES CG ON CG.ID = C.ID_GLASS
      LEFT JOIN MAIN_USER MU ON MU.ID = C.ID_AUTHOR
      LEFT JOIN FAVORITE_COCKTAILS FC ON FC.COCKTAIL_ID = C.ID;
END GET_COCKTAILS;