/*
Criar as tabelas
Popular as tabelas
Criar a procedure
Criar a trigger
Executar select nas tabelas antes da execução da procedure
Executar a procedure
Executar select nas tabelas após a execução da procedure.
*/

CREATE TABLE LUTADORES_EQUIPE1(
    lutador_id int,
    nome VARCHAR(128),
    PRIMARY KEY(lutador_id)

);
CREATE TABLE LUTADORES_EQUIPE2(
    lutador_id int,
    nome VARCHAR(128),
    PRIMARY KEY(lutador_id)

);
CREATE TABLE HISTORICO_UPDAT(
    lutador_id int,
    NOME VARCHAR(128),
    PRIMARY KEY(lutador_id)

);
INSERT INTO LUTADORES_EQUIPE1 values (1, 'Jonnhy Mundo');
INSERT INTO LUTADORES_EQUIPE1 values (2, 'Adam Cole');
INSERT INTO LUTADORES_EQUIPE1 values (3, 'Jonny Gargano');
INSERT INTO LUTADORES_EQUIPE1 values (4, 'Hulk Hogan');
INSERT INTO LUTADORES_EQUIPE1 values (5, 'Becky Lynch');
INSERT INTO LUTADORES_EQUIPE1 values (6, 'Stone cold Steve Austin');
INSERT INTO LUTADORES_EQUIPE1 values (7, 'Rey Misterio');
INSERT INTO LUTADORES_EQUIPE1 values (8, 'Ronda Rousey');
INSERT INTO LUTADORES_EQUIPE1 values (9, 'Randy Savage');
INSERT INTO LUTADORES_EQUIPE1 values (10, 'Randy Orton');
INSERT INTO LUTADORES_EQUIPE1 values (90, 'Reymond');
INSERT INTO LUTADORES_EQUIPE1 values (80, 'Brock Lesnar');
INSERT INTO LUTADORES_EQUIPE1 values (70, 'Kenny Omega');

INSERT INTO LUTADORES_EQUIPE2 values (1, 'Anderson Silva');
INSERT INTO LUTADORES_EQUIPE2 values (2, 'John Cena');
INSERT INTO LUTADORES_EQUIPE2 values (3, 'The Undertaker');
INSERT INTO LUTADORES_EQUIPE2 values (4, 'Hulk Hogan');
INSERT INTO LUTADORES_EQUIPE2 values (5, 'The Rock');
INSERT INTO LUTADORES_EQUIPE2 values (6, 'Stone cold Steve Austin');
INSERT INTO LUTADORES_EQUIPE2 values (7, 'Rey Misterio');
INSERT INTO LUTADORES_EQUIPE2 values (8, 'Steve Boat');
INSERT INTO LUTADORES_EQUIPE2 values (9, 'Randy Savage');
INSERT INTO LUTADORES_EQUIPE2 values (10, 'Sting');
INSERT INTO LUTADORES_EQUIPE2 values (11, 'Alestler Black');
INSERT INTO LUTADORES_EQUIPE2 values (12, 'Finn Balor');
INSERT INTO LUTADORES_EQUIPE2 values (13, 'Shinsuke Nakamura');
INSERT INTO LUTADORES_EQUIPE2 values (14, 'Baron Corbin');
INSERT INTO LUTADORES_EQUIPE2 values (15, 'Chad Gable');
INSERT INTO LUTADORES_EQUIPE2 values (16, 'Renzie');
INSERT INTO LUTADORES_EQUIPE2 values (17, 'Sin Cara');
INSERT INTO LUTADORES_EQUIPE2 values (18, 'Daniel Bryan');
INSERT INTO LUTADORES_EQUIPE2 values (19, 'Roman Reings');
INSERT INTO LUTADORES_EQUIPE2 values (20, 'Seth Rollins');

--/
--/
--/
SELECT * FROM LUTADORES_EQUIPE1;
SELECT * FROM LUTADORES_EQUIPE2;
SELECT * FROM HISTORICO_UPDATE;

CREATE OR REPLACE TRIGGER LOGG
BEFORE UPDATE OR INSERT ON LUTADORES_EQUIPE2
FOR EACH ROW
BEGIN
INSERT INTO HISTORICO_UPDAT(lutador_id, NOME)
VALUES (:NEW.lutador_id,:NEW.NOME);
END;


CREATE OR REPLACE PROCEDURE EXE_MERGE
IS /*USING (SELECT employee_id, salary, department_id FROM employees WHERE department_id = 80) S */
BEGIN
    MERGE INTO LUTADORES_EQUIPE2 L1 USING LUTADORES_EQUIPE1 L2 ON (L1.LUTADOR_ID = L2.LUTADOR_ID) 
    
    WHEN MATCHED THEN UPDATE SET L1.NOME = L2.NOME
   
    WHEN NOT MATCHED THEN INSERT(LUTADOR_ID, NOME) VALUES (L2.LUTADOR_ID, L2.NOME)
    
   ;
END EXE_MERGE;

EXECUTE EXE_MERGE;
