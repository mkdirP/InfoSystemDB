explain analyse
SELECT Н_ЛЮДИ.ИМЯ, Н_ВЕДОМОСТИ.ДАТА FROM Н_ЛЮДИ
RIGHT JOIN Н_ВЕДОМОСТИ ON Н_ЛЮДИ.ИД = Н_ВЕДОМОСТИ.ЧЛВК_ИД
WHERE Н_ЛЮДИ.ИД > 100865
AND Н_ВЕДОМОСТИ.ЧЛВК_ИД < 117219

-- a) Индекс позволяет эффективно выбирать строки, основываясь на их положении в дереве, а также так как выражения в WHERE отбираются с использованием знака >.
CREATE INDEX ИНД_ИД ON Н_ЛЮДИ USING BTREE (ИД);
-- б) Индекс позволяет эффективно выбирать строки, основываясь на их положении в дереве, а также так как выражения в WHERE отбираются с использованием знака <.
CREATE INDEX ИНД_ЧЛВК_ИД ON Н_ВЕДОМОСТИ USING BTREE (ЧЛВК_ИД);
