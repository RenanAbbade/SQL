
/*1) Obtenha o nome da ‘Esposa’ do empregado de nome ‘Jose’.*/ 

SELECT * FROM Dependentes;
SELECT * FROM Empregados;

SELECT A.Nome_Dep FROM Dependentes A
WHERE A.Grau_Parentesco = 'Esposa' AND A.Cod_emp = (SELECT B.Cod_emp FROM Empregados B
					WHERE B.Nome = 'Jose');

/*2) Obtenha a quantidade de empregados que a empregada 
‘Ana’ supervisiona.*/

SELECT count(A.Nome) AS Quantidade_de_Emp_que_Ana_supervisiona FROM Empregados A
WHERE Cod_emp_superv LIKE (SELECT A.Cod_emp FROM Empregados A
							WHERE A.Nome = 'Ana');

/*3) Obtenha o nome de cada departamento e a quantidade de 
projetos que cada um coordena, mas somente
para aqueles departamentos que coordenam mais projetos que o 
departamento ‘Central’.*/

SELECT * FROM Departamentos;
SELECT * FROM Projetos;

SELECT A.Nome_Depto AS DEPARTAMENTO, count(B.Nome_Proj) AS Quantidade_Projetos 
FROM Departamentos A, Projetos B 
WHERE A.Cod_depto = B.Cod_Depto
GROUP BY A.Nome_Depto
HAVING count(B.Nome_Proj) > (SELECT count(*) FROM Projetos B INNER JOIN Departamentos A ON A.Cod_depto = B.Cod_depto
							WHERE A.Nome_Depto = 'Central');


/*4) Obtenha o nome das máquinas que o empregado ‘Joao’ utilizou nos projetos ‘ProdutoY’ ou
‘Reorganizacao.*/

SELECT * FROM Empregados;
SELECT * FROM Projetos;
SELECT * FROM Maquinas;
SELECT * FROM Utiliza;

SELECT A.Nome_maq FROM Maquinas A RIGHT JOIN Utiliza C ON A.Cod_maq = C.Cod_maq
LEFT JOIN Empregados B ON C.Cod_emp = B.Cod_emp LEFT JOIN Projetos D ON D.Cod_proj = C.Cod_proj
WHERE D.Nome_proj = 'ProdutoY' OR D.Nome_proj = 'Reorganizacao' 
AND B.Nome LIKE (SELECT E.Nome FROM EMPREGADOS E WHERE E.Nome = 'Joao');



/*5) Aumente em 20% o salário dos empregados do departamento de ‘Pesquisa’.*/

UPDATE Empregados
SET Salario = (Salario * 1.20)
WHERE Cod_Depto LIKE (SELECT Cod_Depto FROM Departamentos WHERE Nome_Depto = 'Pesquisa');

/*6)Elimine da tabela Utiliza todos as informações referentes aos projetos e às máquinas que a empregada
‘Renata’ trabalhou.*/

DELETE FROM Utiliza
WHERE Cod_emp LIKE (SELECT Cod_emp FROM Empregados WHERE Nome = 'Renata');
