DROP TABLE IF EXISTS Transakcja;
DROP TABLE IF EXISTS Wypozyczenie;
DROP TABLE IF EXISTS PakietOchronny;
DROP TABLE IF EXISTS Konto;
DROP TABLE IF EXISTS Uzytkownik;
DROP TABLE IF EXISTS Przeglad;
DROP TABLE IF EXISTS Warsztat;
DROP TABLE IF EXISTS Samochod;
DROP TABLE IF EXISTS ModelSamochodu;
DROP TABLE IF EXISTS Cennik;


/* Cennik */
CREATE TABLE IF NOT EXISTS Cennik(
		Cena_ID					INTEGER 		NOT NULL AUTO_INCREMENT PRIMARY KEY,
		PLN_za_km				INTEGER 		NOT NULL,
		PLN_za_minute			INTEGER 		NOT NULL,
		PLN_za_godzine			INTEGER 		NOT NULL,
		PLN_za_dobe				INTEGER 		NOT NULL,
		PLN_za_postoj			INTEGER 		NOT NULL
);



/* ModelSamochodu */
CREATE TABLE IF NOT EXISTS ModelSamochodu(
		Model_ID				INTEGER 		NOT NULL AUTO_INCREMENT PRIMARY KEY,
		Cena_ID					INTEGER 		NOT NULL,
		MarkaSamochodu			varchar(255) 	NOT NULL,
		Model					varchar(255) 	NOT NULL,
		KlasaSamochodu			varchar(2) 		NOT NULL,
		Spalanie				decimal(4,2) 	NOT NULL,
		Automat					char(1) 		NOT NULL,
		Naped					varchar(255) 	NOT NULL
);

ALTER TABLE ModelSamochodu ADD CONSTRAINT cena_fk FOREIGN KEY(Cena_ID) REFERENCES Cennik(Cena_ID);



/* Samochod */
CREATE TABLE IF NOT EXISTS Samochod(
		NrRejestracyjny			varchar(8) 		NOT NULL PRIMARY KEY,
		Model_ID				INTEGER 		NOT NULL,
		Przebieg				decimal(7,1)	NOT NULL,
		Dostepnosc				varchar(20) 	NOT NULL
);

ALTER TABLE Samochod ADD CONSTRAINT model_fk FOREIGN KEY(Model_ID) REFERENCES ModelSamochodu(Model_ID);



/* Warsztat */
CREATE TABLE IF NOT EXISTS Warsztat(
		Warsztat_ID				INTEGER 		NOT NULL AUTO_INCREMENT PRIMARY KEY,
		Nazwa					varchar(255) 	NOT NULL,
		KodPocztowy				char(6) 		NOT NULL,
		Adres					varchar(255) 	NOT NULL
);



/* Przeglad */
CREATE TABLE IF NOT EXISTS Przeglad(
		Przeglad_ID				INTEGER 		AUTO_INCREMENT PRIMARY KEY,
		NrRejestracyjny			varchar(8) 		NOT NULL,
		Warsztat_ID				INTEGER			,
		Koszt					INTEGER 		NOT NULL,
		DataPrzegladu			date
);

ALTER TABLE Przeglad ADD CONSTRAINT samochod_fk FOREIGN KEY(NrRejestracyjny) REFERENCES Samochod(NrRejestracyjny);
ALTER TABLE Przeglad ADD CONSTRAINT warsztat_fk FOREIGN KEY(Warsztat_ID) REFERENCES Warsztat(Warsztat_ID);



/* Uzytkownik */
CREATE TABLE IF NOT EXISTS Uzytkownik(
		Uzytkownik_ID			INTEGER 		NOT NULL AUTO_INCREMENT PRIMARY KEY,
		Imie					varchar(255) 	NOT NULL,
		Nazwisko				varchar(255) 	NOT NULL,
		Pesel					char(11) 		NOT NULL,
		NrTelefonu				char(9)
);



/* Konto */
CREATE TABLE IF NOT EXISTS Konto(
		Konto_ID				INTEGER 		NOT NULL AUTO_INCREMENT PRIMARY KEY,
		Uzytkownik_ID			INTEGER 		UNIQUE NOT NULL,
		Srodki					INTEGER 		NOT NULL,
		Login					char(255) 		UNIQUE NOT NULL,
		Haslo					char(255) 		NOT NULL,
		AdresEmail				char(255) 		UNIQUE NOT NULL
);

ALTER TABLE Konto ADD CONSTRAINT uzytkownik_fk FOREIGN KEY(Uzytkownik_ID) REFERENCES Uzytkownik(Uzytkownik_ID);



/* PakietOchronny */
CREATE TABLE IF NOT EXISTS PakietOchronny(
		PakietOchronny_ID		INTEGER 		NOT NULL AUTO_INCREMENT PRIMARY KEY,
		Konto_ID				INTEGER			,
		DataWaznosci			date 			NOT NULL
);

ALTER TABLE PakietOchronny ADD CONSTRAINT konto_fk FOREIGN KEY(Konto_ID) REFERENCES Konto(Konto_ID);



/* Wypozyczenie */
CREATE TABLE IF NOT EXISTS Wypozyczenie(
		Wypozyczenie_ID			INTEGER 		NOT NULL AUTO_INCREMENT PRIMARY KEY,
		Konto_ID				INTEGER			,
		NrRejestracyjny			varchar(8)		,
		DataWypozyczenia		date 			NOT NULL,
		Status					varchar(255) 	NOT NULL
);

ALTER TABLE Wypozyczenie ADD CONSTRAINT konto_uzytkownika_fk FOREIGN KEY(Konto_ID) REFERENCES Konto(Konto_ID);
ALTER TABLE Wypozyczenie ADD CONSTRAINT samochodu_fk FOREIGN KEY(NrRejestracyjny) REFERENCES Samochod(NrRejestracyjny);



/* Transakcja */
CREATE TABLE IF NOT EXISTS Transakcja(
		Transakcja_ID			INTEGER 		NOT NULL AUTO_INCREMENT PRIMARY KEY,
		Wypozyczenie_ID			INTEGER 		UNIQUE NOT NULL,
		Kwota					INTEGER 		NOT NULL,
		CzasWypozyczenia		TIME 			NOT NULL,
		CzasPostoju				TIME 			NOT NULL,
		KosztaDodatkowe			INTEGER 		NOT NULL
);

ALTER TABLE Transakcja ADD CONSTRAINT wypozyczenie_fk FOREIGN KEY(Wypozyczenie_ID) REFERENCES Wypozyczenie(Wypozyczenie_ID);

-- select * from Transakcja;
-- select * from Wypozyczenie;
-- select * from PakietOchronny;
-- select * from Konto;
-- select * from Uzytkownik;
-- select * from Przeglad;
-- select * from Warsztat;
-- select * from Samochod;
-- select * from ModelSamochodu;
-- select * from Cennik;
