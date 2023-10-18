### Прототипи методів програмних класів

| FR    | Опис FR                                                                      | Назва класу              | Назва методу класу            |
|-------|------------------------------------------------------------------------------|--------------------------|-------------------------------|
| FR1.1 | Користувач, надсилає запит на отрмання інформації про температуру середовища | User                     | sendTemperatureRequest()      |
| FR1.2 | Користувач надсилає запит на консультацію щодо фіщичного здоров'я            | User                     | sendRequestForAConsultation() |
| FR2.1 | Надсилання запиту до Windy для отримання даних про температуру середовища    | AirConditionStateRequest | requestTemperature()          |
| FR3.1 | Надсилання відповіді щодо температури середовища                             | AirConditionStateAnswer  | sendAnswer()                  |
| FR4.1 | Зчитування даних про температуру з датчиків                                  | Windy                    | getTemperature()              |
| FR5.1 | Консультування користувача щодо фізичного здоров'я                           | Doctor                   | connactWithAUser()            |