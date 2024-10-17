SELECT m.imie, m.nazwisko, COUNT(w.id_wizyty) AS liczba_wizyt
FROM Mechanik m
JOIN Wizyta w ON m.id_mechanika = w.id_mechanika
GROUP BY m.id_mechanika
ORDER BY liczba_wizyt DESC;
