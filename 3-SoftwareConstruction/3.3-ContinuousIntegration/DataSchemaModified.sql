CREATE TABLE Users (
    Userno INT PRIMARY KEY,
    UsersName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Region VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(255) NOT NULL
);

CREATE TABLE TemperatureRequests (
    TemperatureRequestno INT PRIMARY KEY,
    Userno INT NOT NULL,
    Region VARCHAR(255) NOT NULL,
    Info VARCHAR(255) NOT NULL,
    FOREIGN KEY (Userno) REFERENCES Users (Userno)
);

CREATE TABLE TemperatureAnswers (
    TemperatureAnswerno INT PRIMARY KEY,
    TemperatureRequestno INT NOT NULL,
    Windyno INT NOT NULL,
    Answer INT NOT NULL,
    AnswerDate DATE NOT NULL,
    FOREIGN KEY (TemperatureRequestno)
    REFERENCES TemperatureRequests (TemperatureRequestno),
    FOREIGN KEY (Windyno) REFERENCES Windy (Windyno)
);

CREATE TABLE Windy (
    Windyno INT PRIMARY KEY,
    Region VARCHAR(255) NOT NULL,
    WheatherState VARCHAR(255) NOT NULL
);

CREATE TABLE HealthConsultationRequests (
    HealthConsultationRequestno INT PRIMARY KEY,
    Userno INT NOT NULL,
    RequestDate DATE NOT NULL,
    Description VARCHAR(255) NOT NULL,
    UserInfo VARCHAR(255) NOT NULL,
    FOREIGN KEY (Userno) REFERENCES Users (Userno)
);

CREATE TABLE Doctors (
    Doctorno INT PRIMARY KEY,
    HealthConsultationRequestno INT NOT NULL,
    DoctorsName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Speciality VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(255) NOT NULL,
    FOREIGN KEY (HealthConsultationRequestno)
    REFERENCES HealthConsultationRequests (HealthConsultationRequestno)
);
