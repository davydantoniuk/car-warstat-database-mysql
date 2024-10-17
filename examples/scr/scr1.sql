SELECT k.imie, k.nazwisko, s.marka, s.model,s.przebieg
FROM Klient k
JOIN Samochod s ON k.id_samochodu = s.id
WHERE s.przebieg > 70000;

