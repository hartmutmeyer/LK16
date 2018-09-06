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
#SELECT * FROM tier;
# 3B
#SELECT name, tierart FROM tier;
# 3C
#SELECT name, tierart FROM tier ORDER BY name, tierart ASC;
# 3D
#SELECT geburtstag FROM tier GROUP BY geburtstag;
# 3E
#SELECT name, tierart FROM tier WHERE lebendig='ja';
# 3F
#SELECT name FROM tier WHERE geburtstag<'2004-01-01' AND todestag IS NULL ORDER BY name DESC;
# 3G
#SELECT * FROM tier WHERE tierart<>'Hund' AND tierart<>'Katze';
# 3H
#SELECT name, geburtstag FROM tier WHERE todestag IS NULL;
# 3I
#SELECT COUNT(*) FROM tier WHERE geburtstag>'2003-01-01';
# 3J
#SELECT COUNT(*), tierart FROM tier GROUP BY tierart;
# 3K
#SELECT tierart FROM tier GROUP BY tierart HAVING COUNT(*)>1;
# 3L
#SELECT COUNT(DISTINCT tierart) FROM tier;

# Übung 2, Aufgabe 1

CREATE TABLE besitzer
(
	besitzer_id INT AUTO_INCREMENT,
	anrede ENUM('Herr', 'Frau', 'Firma') DEFAULT 'Herr',
	vorname VARCHAR(20),
	nachname VARCHAR(20) NOT NULL,
	straße VARCHAR(30),
	plz INT,
	ort VARCHAR(30),
	telefonnr VARCHAR(20),
	PRIMARY KEY (besitzer_id)
);

ALTER TABLE tier 
	ADD COLUMN (tier_besitzer_id INT),
	ADD FOREIGN KEY (tier_besitzer_id) REFERENCES besitzer (besitzer_id)
;

# Übung 3, Aufgabe 1

INSERT INTO besitzer VALUES
(NULL, 'Firma', NULL,    'Zoo Lilliput', 'Obernstraße 54', 20012, 'Hamburg', '0721/343412'),
(NULL, 'Frau', 'Sandra', 'Sandelmann', 'Kullerweg 12',     28205, 'Bremen', NULL),
(NULL, 'Herr', 'Mirco',  'Sandelmann', 'Unterstraße 17',   28232, 'Bremen', '0421/123456');

INSERT INTO besitzer (vorname, nachname) VALUES
('Tobias', 'Winkelmann');

INSERT INTO besitzer (anrede, vorname, nachname) VALUES
('Frau', 'Sandra', 'Anderson');

UPDATE tier SET tier_besitzer_id=1 WHERE name='Bello';
UPDATE tier SET tier_besitzer_id=1 WHERE name='Lassie';
UPDATE tier SET tier_besitzer_id=2 WHERE name='Daisy' AND tierart='Kanarienvogel';
UPDATE tier SET tier_besitzer_id=3 WHERE name='Mausi';
UPDATE tier SET tier_besitzer_id=3 WHERE name='Blacky';
UPDATE tier SET tier_besitzer_id=3 WHERE name='Harald';
UPDATE tier SET tier_besitzer_id=4 WHERE name='Daisy' AND tierart='Schildkröte';
UPDATE tier SET tier_besitzer_id=4 WHERE name='Hasso';
UPDATE tier SET tier_besitzer_id=5 WHERE name='Maja';

# Übung 3, Aufgabe 2

UPDATE besitzer SET straße='Wilhelminenweg 42', plz=28315, ort='Bremen' WHERE nachname='Anderson';

# Übung 3, Aufgabe 3

# 3A


# 3B


# 3C


# 3D


# 3E


# 3F


# 3G


# 3H


# 3I


