SELECT m.imie, m.nazwisko, SUM(w.cena) AS zarobki
FROM Mechanik m
JOIN Wizyta w ON m.id_mechanika = w.id_mechanika
GROUP BY m.id_mechanika
ORDER BY zarobki DESC;

