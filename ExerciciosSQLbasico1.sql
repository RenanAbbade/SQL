
/*Retorne o nome de cada aluno que já tenha cursado disciplinas, e para cada aluno, a sua nota média
(considerando todas as disciplinas cursadas).*/
SELECT A.Nome_Aluno, AVG(B.Nota) AS NOTA_MEDIA FROM Aluno A, Aluno_Disc B 
WHERE A.Matricula = B.Matricula
GROUP BY Nome_Aluno;

/*Retorne o nome de todos os cursos (mesmo daqueles que não tenham disciplinas cadastradas) e a quantidade
de disciplinas de cada curso.*/
SELECT a.Nome_Curso, count(b.Nome_Disciplina) AS QUANTIDADE_DISC
FROM Curso a LEFT JOIN  Disciplina b
ON (a.Cod_curso = b.Cod_Curso)
GROUP BY Nome_Curso;

/*Retorne o nome de todos os alunos (mesmo daqueles que ainda não finalizaram nenhuma disciplina) e, para
cada aluno, o número de disciplinas cursadas.
*/
SELECT a.Nome_Aluno, count(b.Nome_Disciplina) AS NUM_DISC 
FROM Aluno a LEFT JOIN Aluno_Disc c ON (a.Matricula = c.Matricula)
LEFT JOIN Disciplina b ON (c.Cod_Disciplina = b.Cod_Disciplina)
GROUP BY Nome_Aluno; 

/*Retorne o nome de todos os alunos da universidade (mesmo daqueles que ainda não finalizaram nenhuma
disciplina), os nomes das disciplinas e as notas de cada uma das disciplinas que os alunos cursaram.*/
SELECT a.Nome_Aluno, b.Nome_Disciplina, c.Nota 
FROM Aluno a LEFT JOIN Disciplina b 
ON (  a.Cod_curso = b.Cod_curso) 
LEFT JOIN Aluno_Disc c 
ON ( c.Cod_Disciplina = b.Cod_Disciplina)
GROUP BY Nome_Aluno, Nome_Disciplina, Nota;

/*(nesta questão utilize LEFT JOIN e RIGHT JOIN) Retorne o nome de todos os professores da
universidade (mesmo aqueles que não estão ministrando disciplinas), e os nomes das disciplinas que eles ministram.*/


SELECT A.Nome_Professor, B.Nome_Disciplina 
FROM  Prof_Disc C RIGHT JOIN  Professor A
ON ( A.Cod_Professor = C.Cod_Professor)
LEFT JOIN Disciplina B 
ON ( B.Cod_Disciplina = C.Cod_Disciplina)
GROUP BY Nome_Professor, Nome_Disciplina;
