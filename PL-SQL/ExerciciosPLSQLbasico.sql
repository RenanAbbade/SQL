col spool_name new_value spname noprint
set serveroutput on
set echo on
set linesize 150 pagesize 150
set serveroutput on size 4000


SELECT replace((sys_context ('USERENV', 'OS_USER')),'MACKLABS','') spool_name 
                                              FROM sys.dual;

spool c:\temp\&spname._lab05_Bloco.txt

--

-- Nome   :  


-- Numero : 


SELECT sys_context ('USERENV', 'IP_ADDRESS')  FROM sys.dual;
SELECT sys_context ('USERENV', 'HOST')        FROM sys.dual;
SELECT sys_context ('USERENV', 'OS_USER') , 
  to_char(sysdate, 'dd-mon-yyyy hh24:mi:ss')  FROM sys.dual;


ACCEPT p_salario  PROMPT 'ENTRE COM O SALARIO  '
ACCEPT p_comissao PROMPT 'ENTRE COM A COMISSAO '
ACCEPT p_nome     PROMPT 'ENTRE COM O NOME     '
DECLARE
  v_sal        number(9, 2) := &p_salario;       -- 
  v_com        number(5, 2) := &p_comissao;      --
  v_calc       number(9, 2) := 0.0;
  v_nome       varchar2(50) := '&p_nome';
  v_OutputStr  varchar2(200) := '';
BEGIN
  v_OutputStr := 'Laboratorio 05 de Bloco Anonimo ';
  DBMS_OUTPUT.PUT_LINE(v_OutputStr);
  v_calc := (v_sal + ((v_sal * v_com)/100));
  v_OutputStr := 'Nome       '||v_nome;
  DBMS_OUTPUT.PUT_LINE(v_OutputStr);
  v_OutputStr := 'Salario    '||v_sal;
  DBMS_OUTPUT.PUT_LINE(v_OutputStr);
  v_OutputStr := 'Comissao   '||v_com;
  DBMS_OUTPUT.PUT_LINE(v_OutputStr);
  v_OutputStr := 'Calculado  '||v_calc;
  DBMS_OUTPUT.PUT_LINE(v_OutputStr);

END;
/
--select * from cliente where codigo = &codigo_cliente;
--
-- questao 1
--
ACCEPT p_cod_func PROMPT 'ENTRE COM O CODIGO FUNCIONARIO  '
DECLARE
v_cod_func   funcionario.cod_func%type := &p_cod_func;
v_salario    funcionario.salario%type;
v_nome_func  funcionario.nome_func%type;
v_OutputStr  varchar2(200) := '';
BEGIN
select nome_func, salario into v_nome_func, v_salario
from funcionario
where cod_func = v_cod_func;
v_OutputStr := 'Nome          '||v_nome_func;
DBMS_OUTPUT.PUT_LINE(v_OutputStr);
v_OutputStr := 'Salario       '|| v_salario;
DBMS_OUTPUT.PUT_LINE(v_OutputStr);
IF (v_salario >= 800 AND v_salario <=2000) THEN
v_salario := v_salario * 1.5;
ELSIF (v_salario <= 3000) THEN
v_salario := v_salario * 1.4;
ELSE
v_salario := v_salario * 1.1;
END IF;
UPDATE Funcionario SET salario = v_salario
where cod_func = v_cod_func;
v_OutputStr := 'Salario novo  '|| v_salario;
DBMS_OUTPUT.PUT_LINE(v_OutputStr);
rollback;
END;
/



   

spool off

exit
