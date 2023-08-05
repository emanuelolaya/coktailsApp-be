CREATE OR REPLACE PROCEDURE GET_ALL_COCKTAILS_DATA (
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
      CR.ID                                                  AS RESOURCE_ID,
      CR.NAME                                                AS RESOURCE_NAME,
      CR.DESCRIPTION                                         AS RESOURCE_DESCRIPTION,
      CR.ALCOHOL_PERCENTAGE                                  AS RESOURCE_ALCOHOL_PERCENTAGE,
      CR.TYPE                                                AS RESOURCE_TYPE_ID,
      CRT.NAME                                               AS RESOURCE_TYPE_NAME,
      CASE
        WHEN FC.COCKTAIL_ID IS NOT NULL
          THEN 1
          ELSE 0
      END AS IS_FAVORITE
    FROM
      COCKTAIL C
      INNER JOIN COCKTAIL__COCKTAIL_RESOURCE CCR ON CCR.COCKTAIL_ID = C.ID
      INNER JOIN COCKTAIL_RESOURCE CR ON CR.ID = CCR.RESOURCE_ID
      INNER JOIN COCKTAIL_RESOURCE_TYPE CRT ON CRT.ID = CR.TYPE
      INNER JOIN COCKTAIL_GLASSES CG ON CG.ID = C.ID_GLASS
      LEFT JOIN MAIN_USER MU ON MU.ID = C.ID_AUTHOR
      LEFT JOIN FAVORITE_COCKTAILS FC ON FC.COCKTAIL_ID = C.ID;
END GET_ALL_COCKTAILS_DATA;