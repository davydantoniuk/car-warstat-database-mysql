-- Średni przebieg samochodów na warsztatu.
SELECT AVG(przebieg) AS 'Średni przebieg' FROM Samochod;

-- Imiona, nazwiska, marki, modele i przebiegi klientów oraz informacje o ich samochodach, którzy posiadają samochody z przebiegiem większym niż 70,000, posortowane rosnąco według przebiegu.
SELECT k.imie AS 'Imie', k.nazwisko AS 'Nazwisko', s.marka AS 'Marka', s.model AS 'Model', s.przebieg AS 'Przebieg' 
FROM Klient k  
JOIN Samochod s ON k.id_samochodu = s.id  
WHERE s.przebieg > 70000 
ORDER BY s.przebieg;

-- Unikalne opisy wizyt wraz z odpowiadającą im liczbą wystąpień, ułożonych malejąco według liczby wystąpień.
SELECT opis AS 'Opis', COUNT(*) AS 'Liczba wystąpień'
FROM Wizyta
GROUP BY opis
ORDER BY COUNT(*) DESC;

-- Imię, nazwisko mechanika oraz odpowiadającą mu liczbę wizyt, ułożonych rosnąco według liczby wizyt.
SELECT m.imie AS 'Imie', m.nazwisko AS 'Nazwisko', COUNT(w.id_wizyty) AS 'Liczba wizyt'
FROM Mechanik m
JOIN Wizyta w ON m.id_mechanika = w.id_mechanika
GROUP BY m.id_mechanika
ORDER BY COUNT(w.id_wizyty);

-- Imię, nazwisko mechanika oraz odpowiadającą mu sumę zarobków, ułożonych malejąco według zarobków.
SELECT m.imie AS 'Imie', m.nazwisko AS 'Nazwisko', SUM(w.cena) AS 'Zarobki'
FROM Mechanik m
JOIN Wizyta w ON m.id_mechanika = w.id_mechanika
GROUP BY m.id_mechanika
ORDER BY SUM(w.cena) DESC;

-- Markę, model samochodu oraz średni koszt obsługi do 8 rekordów, posortowanych malejąco według średniego kosztu obsługi.
SELECT s.marka AS 'Marka', s.model AS 'Model', AVG(w.cena) AS 'Średni koszt obsługi'
FROM Wizyta w
JOIN Klient k ON w.id_klienta = k.id_klienta
JOIN Samochod s ON k.id_samochodu = s.id
GROUP BY s.id, s.marka, s.model
order by AVG(w.cena) DESC
LIMIT 8;

-- Opis wizyty oraz odpowiadający mu maksymalny czas pracowników,5 rekordów(6-10), posortowanych malejąco według maksymalnego czasu pracowników.
SELECT w.opis AS 'Opis', MAX(w.czas_pracownikow) AS 'Maksymalny czas pracowników'
FROM Wizyta w
GROUP BY w.opis
ORDER BY MAX(w.czas_pracownikow) DESC
LIMIT 5,5;


