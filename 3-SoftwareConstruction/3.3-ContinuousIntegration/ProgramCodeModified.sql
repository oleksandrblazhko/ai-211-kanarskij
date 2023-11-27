CREATE OR REPLACE FUNCTION getTemperature(User IN T_USERS, region IN VARCHAR2) 
RETURN INTEGER IS
  v_temperature_state VARCHAR2(10);
  v_result INTEGER := 1;
BEGIN

  FOR temp_row IN (SELECT w.WHEATHERSTATE
                   FROM WINDY w
                   WHERE w.REGION = region) 
  LOOP
    v_temperature_state := temp_row.WHEATHERSTATE;

    EXIT;
  END LOOP;

  IF user IS NULL THEN
    v_result := -1; 
  ELSIF region IS NULL THEN
    v_result := -1; 
  ELSIF REGEXP_LIKE(region, '[[:digit:][:punct:]]') THEN
    v_result := -1; 
  ELSIF LENGTH(region) > 25 THEN
    v_result := -1; 
  ELSE
    v_result := 1;
    DBMS_OUTPUT.PUT_LINE('Today in ' || region || ' is a good temperature of ' || v_temperature_state || ' degrees Celsius');
  END IF;

  RETURN v_result;

END getTemperature;
/
