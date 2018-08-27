DROP SCHEMA IF EXISTS haustier;

# Übung 1, Aufgabe 1

CREATE SCHEMA haustier DEFAULT CHARACTER SET utf8;
USE haustier;
CREATE TABLE tier
(
	name VARCHAR(20) NOT NULL,
	tierart VARCHAR(20) NOT NULL,
	lebendig ENUM('ja','nein') DEFAULT 'ja',
	geschlecht ENUM('weiblich','männlich') DEFAULT 'weiblich',
	geburtstag DATE,
	todestag DATE
);
#DESCRIBE tier;

# Übung 1, Aufgabe 2
# 2A
INSERT INTO tier VALUES
('Bello', 'Hund',          'ja',   'männlich', '2003-05-01', NULL),
('Daisy', 'Kanarienvogel', 'nein', 'weiblich', '1996-12-06', '2004-08-17'),
('Mausi', 'Katze',         'ja',   'weiblich', '2002-11-17', NULL);
# 2B
INSERT INTO tier (name, tierart) VALUES
('Daisy',  'Schildkröte'),
('Lassie', 'Hund'),
('Maja',   'Hund');
# 2C
INSERT INTO tier (name, tierart, geschlecht) VALUES
('Hasso',  'Hund',    'männlich'),
('Blacky', 'Katze',   'männlich'),
('Harald', 'Hamster', 'männlich');
# 2D
UPDATE tier SET geburtstag='2003-12-06' WHERE tierart='Schildkröte';
UPDATE tier SET geburtstag='2004-04-23' WHERE geburtstag IS NULL;
UPDATE tier SET geburtstag='2001-07-29', todestag='2003-09-15', lebendig='nein' WHERE name='Harald';

# Übung 1, Aufgabe 3
# 3A


# 3B


# 3C


# 3D


# 3E


# 3F


# 3G


# 3H


# 3I


# 3J


# 3K


# 3L


