-- Triggers and procedures use "DELIMETER" command which is not a part of MySQL but rather MySQL CLI.
-- If you want to execute it from within some other tool, you might need to chane that!

-- Helper procedures - to reduce code duplication and make it easier to update in one place
DROP PROCEDURE IF EXISTS `help_verify_positive`;
DELIMITER $$
CREATE PROCEDURE `help_verify_positive` (IN _num DEC)
BEGIN
   IF _num < 0
  THEN
   SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'ERROR: Value has to be positive!';
  END IF;
END
$$
DELIMITER ;


DROP PROCEDURE IF EXISTS `help_verify_date`;
DELIMITER $$
CREATE PROCEDURE `help_verify_date` (IN _date DATE)
BEGIN
   IF _date > current_date
  THEN
   SIGNAL SQLSTATE '02001' SET MESSAGE_TEXT = 'ERROR: Date cannot be from the future!';
  END IF;
END
$$
DELIMITER ;


DROP PROCEDURE IF EXISTS `help_verify_age`;
DELIMITER $$
CREATE PROCEDURE `help_verify_age` (IN _pesel char(11))
BEGIN
  SIGNAL SQLSTATE '02002' SET MESSAGE_TEXT = 'ERROR: help_verify_age NOT IMPLEMENTED!!!!';
   IF YEAR(current_date - _pesel) < 18 -- TODO: Change to use the PESEL!!!
  THEN
   SIGNAL SQLSTATE '02002' SET MESSAGE_TEXT = 'ERROR: User need to be at least 18 years old!';
  END IF;
END
$$
DELIMITER ;


DROP PROCEDURE IF EXISTS `help_verify_occupied`;
DELIMITER $$
CREATE PROCEDURE `help_verify_occupied` (IN _old_status varchar(20), IN _new_status varchar(20))
BEGIN
   IF _old_status != 'WOLNY' and _new_status like 'ZAJETY'
  THEN
   SIGNAL SQLSTATE '02003' SET MESSAGE_TEXT = 'ERROR: Car needs to be free to change its status to occupied!';
  END IF;
END
$$
DELIMITER ;

DROP PROCEDURE IF EXISTS `help_verify_can_rent`;
DELIMITER $$
CREATE PROCEDURE `help_verify_can_rent` (IN _konto_id int(11))
BEGIN
  DECLARE balance int(11);
  SELECT Srodki INTO balance FROM Konto WHERE Konto_ID like _konto_id;
   IF balance <= 0
  THEN
   SIGNAL SQLSTATE '02004' SET MESSAGE_TEXT = 'ERROR: Not enough balance to rent a car!';
  END IF;
END
$$
DELIMITER ;


-- Actuall triggers
-- Hand-made triggers

-- Auto-generated triggers

DROP TRIGGER IF EXISTS verify_positive_Cennik_before_insert;
DELIMITER $$
CREATE DEFINER = CURRENT_USER
TRIGGER verify_positive_Cennik_before_insert
BEFORE INSERT ON Cennik
FOR EACH ROW
BEGIN
CALL help_verify_positive(NEW.PLN_za_km);
CALL help_verify_positive(NEW.PLN_za_minute);
CALL help_verify_positive(NEW.PLN_za_godzine);
CALL help_verify_positive(NEW.PLN_za_dobe);
CALL help_verify_positive(NEW.PLN_za_postoj);
END $$
DELIMITER ;


DROP TRIGGER IF EXISTS verify_positive_Cennik_before_update;
DELIMITER $$
CREATE DEFINER = CURRENT_USER
TRIGGER verify_positive_Cennik_before_update
BEFORE UPDATE ON Cennik
FOR EACH ROW
BEGIN
CALL help_verify_positive(NEW.PLN_za_km);
CALL help_verify_positive(NEW.PLN_za_minute);
CALL help_verify_positive(NEW.PLN_za_godzine);
CALL help_verify_positive(NEW.PLN_za_dobe);
CALL help_verify_positive(NEW.PLN_za_postoj);
END $$
DELIMITER ;





DROP TRIGGER IF EXISTS verify_positive_Przeglad_before_insert;
DELIMITER $$
CREATE DEFINER = CURRENT_USER
TRIGGER verify_positive_Przeglad_before_insert
BEFORE INSERT ON Przeglad
FOR EACH ROW
BEGIN
CALL help_verify_positive(NEW.Koszt);
END $$
DELIMITER ;


DROP TRIGGER IF EXISTS verify_positive_Przeglad_before_update;
DELIMITER $$
CREATE DEFINER = CURRENT_USER
TRIGGER verify_positive_Przeglad_before_update
BEFORE UPDATE ON Przeglad
FOR EACH ROW
BEGIN
CALL help_verify_positive(NEW.Koszt);
END $$
DELIMITER ;





DROP TRIGGER IF EXISTS verify_positive_Transakcja_before_insert;
DELIMITER $$
CREATE DEFINER = CURRENT_USER
TRIGGER verify_positive_Transakcja_before_insert
BEFORE INSERT ON Transakcja
FOR EACH ROW
BEGIN
CALL help_verify_positive(NEW.Kwota);
CALL help_verify_positive(NEW.KosztaDodatkowe);
END $$
DELIMITER ;


DROP TRIGGER IF EXISTS verify_positive_Transakcja_before_update;
DELIMITER $$
CREATE DEFINER = CURRENT_USER
TRIGGER verify_positive_Transakcja_before_update
BEFORE UPDATE ON Transakcja
FOR EACH ROW
BEGIN
CALL help_verify_positive(NEW.Kwota);
CALL help_verify_positive(NEW.KosztaDodatkowe);
END $$
DELIMITER ;





DROP TRIGGER IF EXISTS verify_positive_ModelSamochodu_before_insert;
DELIMITER $$
CREATE DEFINER = CURRENT_USER
TRIGGER verify_positive_ModelSamochodu_before_insert
BEFORE INSERT ON ModelSamochodu
FOR EACH ROW
BEGIN
CALL help_verify_positive(NEW.Spalanie);
END $$
DELIMITER ;


DROP TRIGGER IF EXISTS verify_positive_ModelSamochodu_before_update;
DELIMITER $$
CREATE DEFINER = CURRENT_USER
TRIGGER verify_positive_ModelSamochodu_before_update
BEFORE UPDATE ON ModelSamochodu
FOR EACH ROW
BEGIN
CALL help_verify_positive(NEW.Spalanie);
END $$
DELIMITER ;





DROP TRIGGER IF EXISTS verify_positive_Samochod_before_insert;
DELIMITER $$
CREATE DEFINER = CURRENT_USER
TRIGGER verify_positive_Samochod_before_insert
BEFORE INSERT ON Samochod
FOR EACH ROW
BEGIN
CALL help_verify_positive(NEW.Przebieg);
END $$
DELIMITER ;


DROP TRIGGER IF EXISTS verify_positive_Samochod_before_update;
DELIMITER $$
CREATE DEFINER = CURRENT_USER
TRIGGER verify_positive_Samochod_before_update
BEFORE UPDATE ON Samochod
FOR EACH ROW
BEGIN
CALL help_verify_positive(NEW.Przebieg);
END $$
DELIMITER ;








DROP TRIGGER IF EXISTS verify_date_Wypozyczenie_before_insert;
DELIMITER $$
CREATE DEFINER = CURRENT_USER
TRIGGER verify_date_Wypozyczenie_before_insert
BEFORE INSERT ON Wypozyczenie
FOR EACH ROW
BEGIN
CALL help_verify_date(NEW.DataWypozyczenia);
END $$
DELIMITER ;


DROP TRIGGER IF EXISTS verify_date_Wypozyczenie_before_update;
DELIMITER $$
CREATE DEFINER = CURRENT_USER
TRIGGER verify_date_Wypozyczenie_before_update
BEFORE UPDATE ON Wypozyczenie
FOR EACH ROW
BEGIN
CALL help_verify_date(NEW.DataWypozyczenia);
END $$
DELIMITER ;





DROP TRIGGER IF EXISTS verify_date_Przeglad_before_insert;
DELIMITER $$
CREATE DEFINER = CURRENT_USER
TRIGGER verify_date_Przeglad_before_insert
BEFORE INSERT ON Przeglad
FOR EACH ROW
BEGIN
CALL help_verify_date(NEW.DataPrzegladu);
END $$
DELIMITER ;


DROP TRIGGER IF EXISTS verify_date_Przeglad_before_update;
DELIMITER $$
CREATE DEFINER = CURRENT_USER
TRIGGER verify_date_Przeglad_before_update
BEFORE UPDATE ON Przeglad
FOR EACH ROW
BEGIN
CALL help_verify_date(NEW.DataPrzegladu);
END $$
DELIMITER ;








-- DROP TRIGGER IF EXISTS verify_age_Uzytkownik_before_insert;
-- DELIMITER $$
-- CREATE DEFINER = CURRENT_USER
-- TRIGGER verify_age_Uzytkownik_before_insert
-- BEFORE INSERT ON Uzytkownik
-- FOR EACH ROW
-- BEGIN
-- CALL help_verify_age(NEW.Pesel);
-- END $$
-- DELIMITER ;
--
--
-- DROP TRIGGER IF EXISTS verify_age_Uzytkownik_before_update;
-- DELIMITER $$
-- CREATE DEFINER = CURRENT_USER
-- TRIGGER verify_age_Uzytkownik_before_update
-- BEFORE UPDATE ON Uzytkownik
-- FOR EACH ROW
-- BEGIN
-- CALL help_verify_age(NEW.Pesel);
-- END $$
-- DELIMITER ;








DROP TRIGGER IF EXISTS verify_occupied_Samochod_before_update;
DELIMITER $$
CREATE DEFINER = CURRENT_USER
TRIGGER verify_occupied_Samochod_before_update
BEFORE UPDATE ON Samochod
FOR EACH ROW
BEGIN
CALL help_verify_occupied(OLD.Dostepnosc, NEW.Dostepnosc);
END $$
DELIMITER ;








DROP TRIGGER IF EXISTS verify_can_rent_Wypozyczenie_before_insert;
DELIMITER $$
CREATE DEFINER = CURRENT_USER
TRIGGER verify_can_rent_Wypozyczenie_before_insert
BEFORE INSERT ON Wypozyczenie
FOR EACH ROW
BEGIN
CALL help_verify_can_rent(NEW.Konto_ID);
END $$
DELIMITER ;
