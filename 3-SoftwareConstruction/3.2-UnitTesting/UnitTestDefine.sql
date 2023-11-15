DECLARE
  user1 T_Users := T_Users('Anatoliy', 'anatoliy@mail.com', 'Odessa', '+111111111');
  result INTEGER;

  PROCEDURE run_test_case(user IN T_Users, region IN VARCHAR2, expected_result IN INTEGER, description IN VARCHAR2) IS
    actual_result INTEGER;
  BEGIN
    actual_result := getTemperature(user, region);

    IF actual_result = expected_result THEN
      DBMS_OUTPUT.PUT_LINE('Test Case: ' || description || ' - Passed');
    ELSE
      DBMS_OUTPUT.PUT_LINE('Test Case: ' || description || ' - Failed. Expected ' || expected_result || ', but got ' || actual_result);
    END IF;
  END run_test_case;

BEGIN
  -- Test Case 1.1
  run_test_case(user1, 'Odessa', 1, 'User is "Anatoliy" and region is "Odessa"');

  -- Test Case 1.2
  run_test_case(NULL, 'Odessa', -1, 'Empty user and region is "Odessa"');

  -- Test Case 1.3
  run_test_case(user1, '', -1, 'User is "Anatoliy" and empty region');

  -- Test Case 1.4
  run_test_case(user1, 'Odessa 2+2=4', -1, 'User is "Anatoliy" and region is "Odessa 2+2=4"');

  -- Test Case 1.5
  run_test_case(user1, 'I love chicken with sauce and you', -1, 'User is "Anatoliy" and region is "I love chicken with sauce and you"');
END;
/
