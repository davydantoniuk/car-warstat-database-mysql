SELECT opis, COUNT(*) AS liczba_wystapien
FROM Wizyta
GROUP BY opis
ORDER BY liczba_wystapien DESC;

