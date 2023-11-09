## Функція: getTemperature()

### Опис функції:
Ця функція призначена для отримання інформації про температуру навколишнього середовища від системи Windy. Вона виконує запит до Windy і повертає дані про температуру.

### Вхідні параметри:

user (тип: User) - це об'єкт, який представляє користувача, який надсилає запит. Цей параметр використовується для ідентифікації користувача та його даних.

region (тип: String) - це рядок, який містить інформацію про регіон користивуча, для якого він хоче отримати дані про стан повітря.
### Вихідні параметри:

temperatureState (тип: String) - це значення, яке представляє температуру повітря в градусах Цельсія на момент отримання даних.

result (тип: Integer) - це числове значення (1 або -1), повертається 1 якщо функція відпрацювала коректно, -1 якщо функція завершила роботу з помилкою.

### Обмеження:

Параметр user не має бути порожнім.

Параметр region не має бути порожнім

Параметр region не має містити цифри та спеціальні символи.

Параметр region не має перевищувати 25 символів.

Функція повинна здійснювати відповідну аутентифікацію і авторизацію користувача перед надсиланням запиту до Windy.