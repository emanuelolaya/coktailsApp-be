CREATE OR REPLACE PROCEDURE get_my_bar (
  user_id IN NUMBER,
  my_bar_cursor OUT SYS_REFCURSOR
) AS
BEGIN
  OPEN my_bar_cursor FOR
    SELECT
      B.MAIN_USER_ID,
      B.COCKTAIL_RESOURCE_ID,
      CR.NAME,
      CR.TYPE,
      CR.ALCOHOL_PERCENTAGE,
      B.HAVE_IT,
      B.WANT_IT
    FROM
      BAR B
      INNER JOIN COCKTAIL_RESOURCE CR
      ON B.COCKTAIL_RESOURCE_ID = CR.ID
    WHERE
      B.MAIN_USER_ID = user_id;
END get_my_bar;
