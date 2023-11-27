CREATE TABLE Users (
  Userno INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  region VARCHAR(255) NOT NULL,
  phone_number VARCHAR(255) NOT NULL
);

CREATE TABLE TemperatureRequests (
  TemperatureRequestno INT NOT NULL,
  Userno INT NOT NULL, 
  region VARCHAR(255) NOT NULL,
  info VARCHAR(255) NOT NULL
);

CREATE TABLE TemperatureAnswers (
  TemperatureAnswerno INT NOT NULL,
  TemperatureRequestno INT NOT NULL,
  Windyno INT NOT NULL,
  answer INT NOT NULL,
  "date" VARCHAR(255) NOT NULL
);

CREATE TABLE Windy (
  Windyno INT NOT NULL,
  region VARCHAR(255) NOT NULL,
  WheatherState VARCHAR(255) NOT NULL
);

CREATE TABLE HealthConsultationRequests (
  HealthConsultationRequestno INT NOT NULL,
  Userno INT NOT NULL,
  "date" DATE NOT NULL,
  description VARCHAR(255) NOT NULL,
  userInfo VARCHAR(255) NOT NULL
);

CREATE TABLE Doctors (
  Doctorno INT NOT NULL,
  HealthConsultationRequestno INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  speciality VARCHAR(255) NOT NULL,
  phoneNumber VARCHAR(255) NOT NULL
);

/* Первинні ключі */
ALTER TABLE Users ADD CONSTRAINT user_pk
    PRIMARY KEY (Userno);
	
ALTER TABLE TemperatureRequests ADD CONSTRAINT TemperatureRequests_pk
    PRIMARY KEY (TemperatureRequestno);

ALTER TABLE TemperatureAnswers ADD CONSTRAINT TemperatureAnswers_pk
    PRIMARY KEY (TemperatureAnswerno);

ALTER TABLE Windy ADD CONSTRAINT Windy_pk
    PRIMARY KEY (Windyno);

ALTER TABLE Doctors ADD CONSTRAINT Doctors_pk
    PRIMARY KEY (Doctorno);

ALTER TABLE HealthConsultationRequests ADD CONSTRAINT HealthConsultationRequests_pk
    PRIMARY KEY (HealthConsultationRequestno);

/* Зовнішні ключі */
ALTER TABLE TemperatureRequests ADD CONSTRAINT Userno_fk
    FOREIGN KEY (Userno) REFERENCES Users(Userno);

ALTER TABLE TemperatureAnswers ADD CONSTRAINT TemperatureRequestno_fk
    FOREIGN KEY (TemperatureRequestno) REFERENCES TemperatureRequests(TemperatureRequestno);

ALTER TABLE TemperatureAnswers ADD CONSTRAINT Windyno_fk
    FOREIGN KEY (Windyno) REFERENCES Windy(Windyno);

ALTER TABLE HealthConsultationRequests ADD CONSTRAINT Userno_fk1
    FOREIGN KEY (Userno) REFERENCES Users(Userno);

ALTER TABLE Doctors ADD CONSTRAINT HealthConsultationRequestno_fk
    FOREIGN KEY (HealthConsultationRequestno) REFERENCES HealthConsultationRequests(HealthConsultationRequestno);

/* Обмеження змісту атрибутів таблиць */

ALTER TABLE Users
ADD CONSTRAINT valid_email_format
CHECK (REGEXP_LIKE(email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'));

ALTER TABLE Users
ADD CONSTRAINT valid_phone_format
CHECK (REGEXP_LIKE(phone_number, '^[0-9]{10}$'));

ALTER TABLE HealthConsultationRequests
ADD CONSTRAINT request_date_in_past
CHECK ("date" <= TRUNC(SYSDATE));



ALTER TABLE AirConditionStateRequests
ADD CONSTRAINT valid_location_format
CHECK (region ~* '^[A-Za-z ]+$');
ALTER TABLE Doctor ADD CONSTRAINT HealthConsultationRequestno_fk
    FOREIGN KEY (HealthConsultationRequestno) REFERENCES HealthConsultationRequests(HealthConsultationRequestno);
