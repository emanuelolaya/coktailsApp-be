CREATE OR REPLACE PROCEDURE get_my_shopping_list (
  user_id IN NUMBER,
  my_shopping_list_cursor OUT SYS_REFCURSOR
) AS
BEGIN
  OPEN my_shopping_list_cursor FOR
    SELECT
      B.MAIN_USER_ID,
      B.COCKTAIL_RESOURCE_ID,
      CR.NAME,
      CR.SHORT_DESCRIPTION,
      CR.DESCRIPTION,
      CR.IMG_URL,
      CR.TYPE,
      CR.ALCOHOL_PERCENTAGE
    FROM
      BAR B
      INNER JOIN COCKTAIL_RESOURCE CR ON B.COCKTAIL_RESOURCE_ID = CR.ID
    WHERE
      B.MAIN_USER_ID = user_id
      AND B.WANT_IT = 1;
END get_my_shopping_list;