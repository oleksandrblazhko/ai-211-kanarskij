CREATE OR REPLACE TYPE T_Users AS OBJECT (
  name VARCHAR(255) NOT NULL := '',
  email VARCHAR(255) NOT NULL := '',
  region VARCHAR(255) NOT NULL := '',
  phone_number VARCHAR(255) NOT NULL := '',
  MEMBER PROCEDURE sendTemperatureRequest(p_region VARCHAR),
  MEMBER PROCEDURE sendRequestForAConsaltation(description VARCHAR)
);

CREATE OR REPLACE TYPE T_TemperatureRequests AS OBJECT (
  region VARCHAR(255) NOT NULL := '',
  info VARCHAR(255) NOT NULL := '',
  MEMBER PROCEDURE RequestTemperature(p_region VARCHAR)
);

CREATE OR REPLACE TYPE T_TemperatureAnswers AS OBJECT (
  answer INT NOT NULL := '',
  "date" VARCHAR(255) NOT NULL := '',
  MEMBER PROCEDURE RequestTemperature(p_answer VARCHAR)
);

CREATE OR REPLACE TYPE T_Windy AS OBJECT (
  region VARCHAR(255) NOT NULL := '',
  WeatherState VARCHAR(255) NOT NULL := '',
  MEMBER PROCEDURE getTemperature(p_region VARCHAR, user T_Users)
);

CREATE OR REPLACE TYPE T_HealthConsultationRequests AS OBJECT (
  "date" DATE NOT NULL := '',
  description VARCHAR(255) NOT NULL := '',
  userInfo VARCHAR(255) NOT NULL:= ''
);

CREATE OR REPLACE TYPE T_Doctors AS OBJECT (
  name VARCHAR(255) NOT NULL := '',
  email VARCHAR(255) NOT NULL := '',
  speciality VARCHAR(255) NOT NULL := '',
  phoneNumber VARCHAR(255) NOT NULL := '',
  MEMBER PROCEDURE connectWithAUser(user T_Users)
);