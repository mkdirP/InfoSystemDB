SELECT Н_УЧЕНИКИ.ГРУППА AS "Группа",
       AVG(AGE(Н_ЛЮДИ.ДАТА_РОЖДЕНИЯ)) AS "Средний возраст"
FROM Н_УЧЕНИКИ
JOIN Н_ЛЮДИ on Н_УЧЕНИКИ.ЧЛВК_ИД = Н_ЛЮДИ.ИД
GROUP BY Н_УЧЕНИКИ.ГРУППА
HAVING AVG(AGE(Н_ЛЮДИ.ДАТА_РОЖДЕНИЯ)) > (
  SELECT MIN(AGE(Н_ЛЮДИ.ДАТА_РОЖДЕНИЯ))
  FROM Н_УЧЕНИКИ
  JOIN Н_ЛЮДИ on Н_УЧЕНИКИ.ЧЛВК_ИД = Н_ЛЮДИ.ИД
  WHERE Н_УЧЕНИКИ.ГРУППА = '3100'
);
