CREATE OR REPLACE TRIGGER Atualiza_Qtdade 
AFTER INSERT ON Func_Proj 
FOR EACH ROW 
BEGIN 
UPDATE Total_Horas 
SET Total = Total + :new.Horas_Trab 
WHERE (Cod_Func = :new.Cod_Func);
 UPDATE Qtdade_Func 
SET Qtdade = Qtdade + 1 
WHERE (Cod_Proj = :new.Cod_Proj); 
END;
