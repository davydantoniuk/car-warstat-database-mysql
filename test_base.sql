CREATE TABLE Adres (
    id_adresu INT PRIMARY KEY,
    ulica VARCHAR(255),
    numer_domu VARCHAR(10),
    numer_mieszkania VARCHAR(10),
    kod_pocztowy VARCHAR(10),
    miasto VARCHAR(255)
);

CREATE TABLE Klient (
    id_klienta INT PRIMARY KEY,
    imie VARCHAR(255),
    nazwisko VARCHAR(255),
    PESEL VARCHAR(11),
    login VARCHAR(50),
    haslo VARCHAR(50),
    id_adresu INT,
    nr_telefonu VARCHAR(15),
    FOREIGN KEY (id_adresu) REFERENCES Adres(id_adresu)
);

CREATE TABLE Mechanik (
    id_mechanika INT PRIMARY KEY,
    imie VARCHAR(255),
    nazwisko VARCHAR(255),
    PESEL VARCHAR(11),
    login VARCHAR(50),
    haslo VARCHAR(50),
    data_zatrudnienia DATE,
    wynagrodzenie DECIMAL(10,2),
    id_adresu INT,
    nr_telefonu VARCHAR(15),
    FOREIGN KEY (id_adresu) REFERENCES Adres(id_adresu)
);

CREATE TABLE Samochod (
    marka VARCHAR(255),
    model VARCHAR(255),
    nr_rejestracyjny VARCHAR(20) PRIMARY KEY,
    nr_VIN VARCHAR(17),
    przebieg INT,
    id_klienta INT,
    FOREIGN KEY (id_klienta) REFERENCES Klient(id_klienta)
);

CREATE TABLE Wizyta (
    id_wizyty INT PRIMARY KEY,
    data DATE,
    status VARCHAR(50),
    id_klienta INT,
    opis TEXT,
    czesci TEXT,
    cena DECIMAL(10,2),
    czas_pracownikow INT,
    id_mechanika INT,
    FOREIGN KEY (id_klienta) REFERENCES Klient(id_klienta)
);

CREATE TABLE Sprzet (
    nazwa_sprzetu VARCHAR(255),
    status VARCHAR(50),
    opis TEXT,
    id_wizyty INT,
    data_przegladu DATE,
    FOREIGN KEY (id_wizyty) REFERENCES Wizyta(id_wizyty)
);

CREATE TABLE Czesci (
    id INT PRIMARY KEY,
    nazwa VARCHAR(255),
    cena_w_hurtowni DECIMAL(10,2),
    id_wizyty INT,
    FOREIGN KEY (id_wizyty) REFERENCES Wizyta(id_wizyty)
);

CREATE TABLE Wykonuje (
    id_wizyty INT,
    id_mechanika INT,
    FOREIGN KEY (id_wizyty) REFERENCES Wizyta(id_wizyty),
    FOREIGN KEY (id_mechanika) REFERENCES Mechanik(id_mechanika)
);