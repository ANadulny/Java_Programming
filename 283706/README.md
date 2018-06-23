# Task
Zbudować aplikację serwerową implementującą usługę sieciową RESTful na bazie JAX-RS i biblioteki Jersey. Zadaniem serwisu jest obliczanie średniego kursu wymiany walut z n-ostatnich notowań na podstawie danych publikowanych przez serwis NBP.
URL serwisu:
http://{hostName}:{portNumber}/{serviceName}/{table}/{code}/{topCount}   ,
gdzie {table} – typ tabeli (A, B lub C), {code} – trzyliterowy kod waluty (standard ISO 4217), {topCount} – liczba określająca maksymalną liczność zwracanej serii danych na podstawie, których wyliczana jest średnia.  Nazwa serwisu {serviceName} – powinna być w formacie {numer_indeksu}/exchangerates/rates
Przykład: 
http://localhost:8080/283706/exchangerates/rates/C/GBP/30

Funkcje usługi: a) implementuje polecenie GET protokołu HTTP, b) odbiera parametry przekazane w adresie URL (tabela kursów wymiany walut, kod waluty, liczba ostatnich notowań), c) woła usługę NBP,  która umożliwia pobieranie kursów walut w formacie XML oraz JSON – opis usługi dostępny jest pod adresem http://api.nbp.pl/, d) odpowiedź serwisu NBP w formacie XML zamienia na obiekt w Javie korzystając z mechanizmu marshallingu i biblioteki JAXB, e) oblicza i zwraca wartość średnią kursów sprzedaży w formatach: tekstowym, HTML, XML, JSON.
