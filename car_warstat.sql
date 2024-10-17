CREATE TABLE Adres (
    id_adresu MEDIUMINT PRIMARY KEY,
    ulica VARCHAR(99),
    numer_domu SMALLINT,
    numer_mieszkania SMALLINT,
    kod_pocztowy CHAR(6),
    miasto VARCHAR(99)
);

CREATE TABLE Klient (
    id_klienta MEDIUMINT PRIMARY KEY,
    imie VARCHAR(20),
    nazwisko VARCHAR(50),
    PESEL VARCHAR(11),
    login VARCHAR(50),
    haslo VARCHAR(20),
    id_adresu MEDIUMINT,
    nr_telefonu VARCHAR(9),
    id_samochodu MEDIUMINT PRIMARY KEY,
    FOREIGN KEY (id_adresu) REFERENCES Adres(id_adresu)
);

CREATE TABLE Mechanik (
    id_mechanika MEDIUMINT PRIMARY KEY,
    imie VARCHAR(20),
    nazwisko VARCHAR(50),
    PESEL CHAR(11),
    login VARCHAR(50),
    haslo VARCHAR(20),
    data_zatrudnienia DATETIME,
    wynagrodzenie DECIMAL(10,2),
    id_adresu MEDIUMINT,
    nr_telefonu CHAR(9),
    FOREIGN KEY (id_adresu) REFERENCES Adres(id_adresu)
);

CREATE TABLE Samochod (
	id MEDIUMINT PRIMARY KEY,
    marka VARCHAR(20),
    model VARCHAR(20),
    nr_rejestracyjny CHAR(6),
    nr_VIN CHAR(17),
    przebieg MEDIUMINT,
    FOREIGN KEY (id) REFERENCES Klient(id_samochodu)
);

CREATE TABLE Wizyta (
    id_wizyty MEDIUMINT PRIMARY KEY,
    data DATETIME,
    status VARCHAR(50),
    id_klienta MEDIUMINT,
    opis TEXT,
    czesci VARCHAR(99),
    cena MEDIUMINT,
    czas_pracownikow TINYINT,
    id_mechanika MEDIUMINT,
    id_sprzet MEDIUMINT,
    id_czesci MEDIUMINT,
    FOREIGN KEY (id_klienta) REFERENCES Klient(id_klienta)
);

CREATE TABLE Sprzet (
    id MEDIUMINT PRIMARY KEY,
    nazwa_sprzetu VARCHAR(150),
    status VARCHAR(50),
    opis VARCHAR(250),
    data_przegladu DATETIME,
    FOREIGN KEY (id) REFERENCES Wizyta(id_sprzet)
);

CREATE TABLE Czesci (
    id MEDIUMINT PRIMARY KEY,
    nazwa VARCHAR(50),
    cena_w_hurtowni SMALLINT,
    FOREIGN KEY (id) REFERENCES Wizyta(id_czesci)
);

CREATE TABLE Wykonuje (
	id_wykonuje MEDIUMINT PRIMARY KEY,
    id_wizyty MEDIUMINT,
    id_mechanika MEDIUMINT,
    FOREIGN KEY (id_wizyty) REFERENCES Wizyta(id_wizyty),
    FOREIGN KEY (id_mechanika) REFERENCES Mechanik(id_mechanika)
);