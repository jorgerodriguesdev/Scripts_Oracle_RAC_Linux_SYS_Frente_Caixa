PL/SQL Developer Test script 3.0
20
declare 
  v VARCHAR2(2000);
  i pls_integer;
  v_Aux VARCHAR2(1);
begin
  v := NULL;
  FOR rec in (SELECT PR_NOM, PR_NOM_REDUZ FROM PRDUTO) LOOP    
    FOR i IN 1..LENGTH(rec.PR_NOM) LOOP
      v_Aux := substr(rec.PR_NOM || rec.PR_NOM_REDUZ, i, 1);
      IF instr('ASDFGHJKLQWERTYUIOPZXCVBNM',v_Aux) = 0 AND
         instr('0123456789',v_Aux) = 0 AND
         (v IS NULL OR instr(v,v_Aux) = 0)THEN
        --
        v := v || v_Aux;
        --
      END IF;
    END LOOP;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(v);
end;
0
