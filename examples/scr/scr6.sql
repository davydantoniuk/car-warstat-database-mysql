SELECT w.opis, MAX(w.czas_pracownikow) AS maks_czas_pracownikow
FROM Wizyta w
GROUP BY w.opis
ORDER BY maks_czas_pracownikow DESC
LIMIT 5;
