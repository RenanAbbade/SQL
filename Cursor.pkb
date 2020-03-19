
--
-- questao 1
--
--Criar uma procedure, utilizando cursor, para exibir o resultado da consulta que:
--Retorne o nome de cada aluno que j? tenha cursado disciplinas, e para cada aluno, 
--a sua nota m?dia (considerando todas as disciplinas cursadas). 
--

select a.nome_aluno, avg(ad.nota) MEDIA
from aluno a inner join aluno_disc ad
on a.matricula = ad.matricula
group by a.nome_aluno
;

CREATE OR REPLACE PROCEDURE consulta_media
IS
CURSOR aluno_media IS
select a.nome_aluno, avg(ad.nota) as "MEDIA"
from aluno a inner join aluno_disc ad
on a.matricula = ad.matricula
group by a.nome_aluno;
reg_aluno_media  aluno_media%rowtype;
BEGIN
FOR reg_aluno_media IN aluno_media LOOP
DBMS_OUTPUT.PUT_LINE(TO_CHAR(reg_aluno_media.nome_aluno)||' '||
reg_aluno_media.media);
END LOOP;
END consulta_media;

EXECUTE consulta_media;


/*2)Criar uma procedure, utilizando cursor, para exibir o resultado da consulta que:
Retorne o nome de todos os alunos da universidade (mesmo daqueles que ainda não finalizaram
nenhuma disciplina), os nomes das disciplinas e as notas de cada uma das disciplinas que os alunos
cursaram.*/
SELECT * FROM ALUNO;
SELECT * FROM DISCIPLINA;
SELECT * FROM ALUNO_DISC;

SELECT A.NOME_ALUNO, B.NOME_DISCIPLINA, C.NOTA
FROM ALUNO A LEFT JOIN DISCIPLINA B ON A.COD_CURSO = B.COD_CURSO
LEFT JOIN ALUNO_DISC C ON A.MATRICULA = C.MATRICULA;

CREATE OR REPLACE PROCEDURE exibe_alunos
IS
CURSOR alunos IS
SELECT A.NOME_ALUNO, B.NOME_DISCIPLINA, C.NOTA
FROM ALUNO A LEFT JOIN DISCIPLINA B ON A.COD_CURSO = B.COD_CURSO
LEFT JOIN ALUNO_DISC C ON A.MATRICULA = C.MATRICULA;
reg_alunos  alunos%rowtype;
BEGIN
FOR reg_alunos IN alunos LOOP
DBMS_OUTPUT.PUT_LINE(TO_CHAR(reg_alunos.NOME_ALUNO)||' '||
reg_alunos.NOME_DISCIPLINA||' '||reg_alunos.NOTA);
END LOOP;
END exibe_alunos;

EXECUTE exibe_alunos;
