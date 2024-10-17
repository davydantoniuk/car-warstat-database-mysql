SELECT s.marka, s.model, AVG(w.cena) AS sredni_koszt_obslugi
FROM Wizyta w
JOIN Klient k ON w.id_klienta = k.id_klienta
JOIN Samochod s ON k.id_samochodu = s.id
GROUP BY s.id, s.marka, s.model
order by sredni_koszt_obslugi DEsc
LIMIT 8;

