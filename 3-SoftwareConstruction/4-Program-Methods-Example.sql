CREATE OR REPLACE FUNCTION getTemperature(user IN User, region IN VARCHAR2) RETURN INTEGER IS
  v_api_url VARCHAR2(255) := 'https://api.windy.com/data/temperature'; -- Приклад URL для отримання температурних даних
  v_api_key VARCHAR2(50) := 'your_api_key_here'; -- Замініть це на ваш ключ API від Windy
  v_temperature_state VARCHAR2(10);
  v_result INTEGER := 1; -- Початкове значення результату
  v_http_request UTL_HTTP.req;
  v_http_response UTL_HTTP.resp;
  v_response_text VARCHAR2(255);

BEGIN
  -- Перевірка, чи параметри не є порожніми або не містять цифри та спеціальні символи
  IF user IS NULL THEN
    DBMS_OUTPUT.PUT_LINE('Error: The user parameter cannot be empty.');
    v_result := -1; -- Помилка: параметр user порожній
  ELSIF region IS NULL OR REGEXP_LIKE(region, '[[:digit:][:punct:]]') THEN
    DBMS_OUTPUT.PUT_LINE('Error: The region parameter cannot be empty, cannot contain numbers and special characters.');
    v_result := -1; -- Помилка: параметр region порожній або містить цифри та спеціальні символи
  ELSIF LENGTH(region) > 25 THEN
    DBMS_OUTPUT.PUT_LINE('Error: The region parameter cannot exceed 25 characters.');
    v_result := -1; -- Помилка: параметр region перевищує 25 символів
  ELSE

    -- Здійснення запиту до Windy за допомогою UTL_HTTP
    v_http_request := UTL_HTTP.begin_request(url => v_api_url || '?key=' || v_api_key, method => 'GET');
    UTL_HTTP.set_header(v_http_request, 'User-Agent', 'Mozilla/4.0');
    v_http_response := UTL_HTTP.get_response(v_http_request);
    
    -- Отримання відповіді в текстовий рядок
    UTL_HTTP.read_text(v_http_response, v_response_text);
    
    -- Обробка отриманих даних
    v_temperature_state := REGEXP_SUBSTR(v_response_text, '"temperature":(\d+)', 1, 1, NULL, 1);

    DBMS_OUTPUT.PUT_LINE('Today in ' || region || 'is a good temperature of ' || v_temperature_state || 'degrees Celsius');
    
    -- Завершення HTTP запиту
    UTL_HTTP.end_response(v_http_response);
  END IF;

  -- Повертаємо результат функції
  RETURN v_result;
END getTemperature;
/
