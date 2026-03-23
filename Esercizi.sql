ESERCIZIO 1
SELECT * FROM clienti 
WHERE nome = 'Mario'

ESERCIZIO 2
SELECT nome, cognome FROM clienti 
WHERE anno_di_nascita = 1982

ESERCIZIO 3
SELECT COUNT(*) FROM fatture
WHERE iva = 20

ESERCIZIO 4
SELECT * FROM prodotti
WHERE (in_produzione = true OR in_commercio = true) 
AND EXTRACT(YEAR FROM data_attivazione) = 2017

ESERCIZIO 5
SELECT * FROM fatture 
JOIN clienti 
on id_cliente = clienti.numero_cliente
WHERE importo < 1000

ESERCIZIO 6
SELECT numero_fattura, importo, iva, data_fattura, fornitori.denominazione FROM fatture 
JOIN fornitori 
on fatture.numero_fornitore = fornitori.numero_fornitore

ESERCIZIO 7
SELECT EXTRACT(YEAR FROM data_fattura) AS anno, COUNT(*) FROM fatture 
WHERE iva = 20
GROUP BY EXTRACT(YEAR FROM data_fattura) 

ESERCIZIO 8
SELECT EXTRACT(YEAR FROM data_fattura) AS anno, SUM(importo) AS importo_totale , COUNT(*) FROM fatture 
WHERE iva = 20
GROUP BY EXTRACT(YEAR FROM data_fattura) 

ESERCIZIO 9
SELECT EXTRACT(YEAR FROM data_fattura) AS anno FROM fatture 
WHERE tipologia = 'A'
GROUP BY EXTRACT(YEAR FROM data_fattura)
HAVING COUNT(*) > 2

ESERCIZIO 10
SELECT clienti.regione_residenza, SUM(importo) FROM fatture 
JOIN clienti on fatture.id_cliente = clienti.numero_cliente
GROUP BY clienti.regione_residenza

ESERCIZIO 11
SELECT COUNT(DISTINCT clienti.numero_cliente) FROM fatture 
JOIN clienti on fatture.id_cliente = clienti.numero_cliente
WHERE importo > 50 
AND anno_di_nascita = 1980
