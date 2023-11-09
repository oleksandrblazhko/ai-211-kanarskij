DECLARE
  -- Створення об'єкта користувача
  user1 T_User := T_User('A', 'A@mail.com', 'Aland', '+111111111');
  region VARCHAR(255):= user1.region
  windy T_Windy := T_Windy(region,'')
BEGIN
  windy.getTemperature(user1, region));
END;

