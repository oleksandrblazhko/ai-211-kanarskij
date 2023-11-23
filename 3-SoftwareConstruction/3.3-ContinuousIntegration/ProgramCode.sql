CREATE OR REPLACE FUNCTION GetTemperature (user IN T_USERS, region IN VARCHAR2) RETURN INTEGER IS
    VResult INTEGER := 1;
    VTemperatureState VARCHAR2(25);
BEGIN
    FOR TempRow IN (SELECT W.WEATHERSTATE
                     FROM WINDY W
                     WHERE W.REGION = P_REGION) 
    LOOP
        VTemperatureState := TempRow.WEATHERSTATE;
        EXIT;
    END LOOP;

    IF P_USER_NAME IS NULL THEN
        VResult := -1; 
    ELSIF P_REGION IS NULL THEN
        VResult := -1; 
    ELSIF REGEXP_LIKE(P_REGION, '[[:digit:][:punct:]]') THEN
        VResult := -1; 
    ELSIF LENGTH(P_REGION) > 25 THEN
        VResult := -1; 
    ELSE
        VResult := 1;
        DBMS_OUTPUT.PUT_LINE('Today in ' || P_REGION || ' is a good temperature of ' || VTemperatureState || ' degrees Celsius');
    END IF;

    RETURN VResult; 
END GetTemperature;
