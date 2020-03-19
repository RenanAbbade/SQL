/*
1) Obtenha o nome de cada empregado e o nome do seu respectivo supervisor.

*/

select e1.nome as empregado , e2.nome as supervisor
from empregados e1 , empregados e2
where e1.cod_emp_superv = e2.cod_emp;

/*
2) Obtenha o nome do supervisor do empregado de nome ‘Jose’.
*/

SELECT A.Nome AS Supervidora_do_Jose FROM Empregados A
WHERE A.Cod_emp = (SELECT A.Cod_emp_superv FROM Empregados A WHERE A.Nome = 'Jose');

/*
3) Obtenha a quantidade de empregados que a ‘Ana’ supervisiona.
*/

SELECT COUNT(A.Nome) AS SupervisionadosAna FROM Empregados A
WHERE A.Cod_emp_superv LIKE (SELECT A.Cod_emp FROM Empregados A WHERE A.Nome = 'Ana');

/*

4) Obtenha o nome de cada empregado e a quantidade de dependentes que cada um tem, mas desde que
essa quantidade seja maior ou igual a 2 dependentes.
*/
SELECT * FROM Empregados;
SELECT * FROM Dependentes;

SELECT A.Nome AS NOME_EMPREGADO, COUNT(B.Nome_Dep) AS NUM_DEPENDENTES 
FROM Empregados A INNER JOIN Dependentes B 
ON A.Cod_emp = B.Cod_emp
GROUP BY A.Nome
HAVING COUNT(B.Nome_Dep) >= 2;



/*

5) Obtenha o nome das máquinas que o empregado ‘Joao’ utilizou nos projetos ‘ProdutoY’ ou
‘Reorganizacao’
*/

select m.nome_maq AS Maquina_utilizada_pelo_Joao
from empregados e,
     utiliza u,
     projetos p,
     maquinas m
where u.cod_proj = p.cod_proj
and   m.cod_maq = u.cod_maq
and  u.cod_emp = e.cod_emp
and  e.nome like 'Joao%'
and  p.nome_proj = 'ProdutoY'
;
