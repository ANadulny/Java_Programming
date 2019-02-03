ALTER USER 'root'@'localhost' IDENTIFIED BY 'samochod';
CREATE USER 'samochod'@'%' IDENTIFIED BY 'samochod';
CREATE DATABASE samochody;
GRANT ALL PRIVILEGES ON samochody.* TO 'samochod'@'%';
FLUSH PRIVILEGES;
SET GLOBAL log_bin_trust_function_creators = 1;