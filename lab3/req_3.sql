SELECT count(*) FROM
	(SELECT Н_ЛЮДИ.ОТЧЕСТВО
		FROM "Н_ЛЮДИ" 
		GROUP BY Н_ЛЮДИ.ОТЧЕСТВО)
AS "Число ОТЧЕСТВ без повторений";