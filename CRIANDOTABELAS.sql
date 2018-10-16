CREATE TABLE TBL_FUNCIONARIO (
	id_func int NOT NULL,
	nome VARCHAR(30),
	salario numeric(6,2),
	id_depto numeric(6,2),
	PRIMARY KEY (id_func),
	);

CREATE TABLE TBL_DEPTO (
	id_depto numeric(6,2),
	nome VARCHAR(30),
	ramal int,
	PRIMARY KEY (id_depto)
);

/*New Query */

INSERT INTO TBL_FUNCIONARIO (id_func,nome,salario,id_depto)
	values (1,'Diego',2500,345),
		   (2,'Maria',5500,456),
		   (3,'João',4000,567),
		   (4,'José',8000,123),
		   (5,'Marcos',4500,567),
		   (6,'Cristina',1000,null);

INSERT INTO TBL_DEPTO (id_depto, nome, ramal)
	values (123,'Diretoria',9999),
			(456,'Gerência',8888),
			(345,'T.I.',5555),
			(567,'Comercial',6666),
			(987,'Vendas',1111);
	


SELECT * FROM TBL_FUNCIONARIO

SELECT * FROM TBL_DEPTO

/* New Query - Criando nova coluna tipo_cargo */

SELECT nome, salario,
	case when salario between 1 and 3000 then 'analista jr'
		 when salario between 3001 and 5000 then 'analista pl'
		 when salario between 5001 and 8000 then 'analista sr'
	else 'Demais cargos'
	end as tipo_cargo
 FROM TBL_FUNCIONARIO
 
 /*Modificando valores de uma tabela com UPDATE */
 
SELECT nome, salario FROM TBL_FUNCIONARIO
UPDATE TBL_FUNCIONARIO
SET salario = salario*1.10
WHERE salario <3000;

/*Ordenar as tabelas */
SELECT nome, salario FROM TBL_FUNCIONARIO
ORDER BY salario DESC /*asc*/

/*INNER JOIN - cria uma intersecção entre as informações das duas tabelas*/

SELECT f.nome, f.salario, d.nome as depto
FROM TBL_FUNCIONARIO as f
INNER JOIN TBL_DEPTO as d on f.id_depto = d.id_depto
ORDER BY d.nome asc, f.nome asc;


/*LEFT JOIN - Acrescenta as informações da tabela direita na esquerda*/
SELECT f.nome, f.salario, d.nome as depto
FROM TBL_FUNCIONARIO as f
LEFT JOIN TBL_DEPTO as d on f.id_depto = d.id_depto
ORDER BY d.nome asc, f.nome asc;
