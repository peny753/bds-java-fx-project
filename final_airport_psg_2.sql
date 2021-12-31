CREATE SCHEMA IF NOT EXISTS airport_sys;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** customer`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY

CREATE TABLE IF NOT EXISTS airport_sys.customer (
  id_customer SERIAL NOT NULL,
  given_name VARCHAR(20) NOT NULL,
  family_name VARCHAR(20) NOT NULL,
  date_of_birth DATE,
  username VARCHAR(20),
  pwd VARCHAR(100) NOT NULL,
  last_change timestamp DEFAULT (NOW()),
  PRIMARY KEY (id_customer));

CREATE OR REPLACE FUNCTION airport_sys.generate_username()
	RETURNS trigger
	language plpgsql AS
	
$$
BEGIN
	IF NEW.username IS null THEN UPDATE airport_sys.customer 
	SET username = lower(concat(id_customer, substring(given_name, 1, 1), substring(family_name,1,1)));
	END IF;
	RETURN NEW;
END;
$$;

CREATE TRIGGER set_username
	AFTER INSERT
	ON airport_sys.customer
	FOR EACH ROW
	EXECUTE PROCEDURE airport_sys.generate_username();




INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Adam', 'Fletcher', '1977-10-20', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Dan', 'Mills', '1970-06-30',  '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Sophie', 'Mackenzie', '1980-08-27', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Bella', 'Russell', '1963-02-08', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Una', 'Blake', '2018-03-29', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Jacob', 'Gill', '1998-10-28', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Vanessa', 'Rampling', '2017-09-05', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Karen', 'Lewis', '1963-05-22', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Kylie', 'Taylor', '2012-01-18', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Sophie', 'Payne', '1981-01-15', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Jane', 'Lawrence', '1949-07-21', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Thomas', 'Simpson', '2013-06-08', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Andrew', 'Alsop', '1949-10-03', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Harry', 'Alsop', '1986-05-23', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Joseph', 'Hughes', '1969-06-29', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Max', 'Hunter', '1960-01-05', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Justin', 'Timber', '1959-03-16', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Alexander', 'Poole', '1957-01-09', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Katherine', 'Rampling', '1981-10-17', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Stephanie', 'Randol', '1997-07-06', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Amanda', 'Buckland', '2004-11-27', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Dan', 'Chapman', '2016-05-03', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Jack', 'Wilson', '2015-02-20', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Sophie', 'Ross', '1956-01-23', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Gordon', 'Turner', '1983-06-01', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Carol', 'Jackson', '1993-12-26', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Evan', 'Kerr', '1984-02-16', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Lucas', 'Cařř', '1981-03-11', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('John', 'Hardacre', '1969-01-23', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Hannah', 'Johnston', '2015-06-11', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Jasmine', 'Král', '1983-04-20', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Melanie', 'Wilkins', '1965-09-16', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Tim', 'Quinn', '1994-08-26', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Stephen', 'Hemmings', '1947-12-29', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Bella', 'Morgan', '1949-06-13', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Andrew', 'Tucker', '1964-03-05', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Justin', 'King', '1960-12-28', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Carolyn', 'Coleman', '2012-01-14', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Eric', 'Hodges', '1958-02-20', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Matt', 'Glover', '1999-03-17', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('John', 'Gill', '1997-09-29', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Olivia', 'May', '1984-09-02', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Trevor', 'Reid', '1962-06-06', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Owen', 'Paige', '1949-01-05', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Irene', 'McGrath', '2016-10-31', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Lucas', 'Walker', '2014-05-19', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Benjamin', 'Martin', '1985-02-07', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Peter', 'Parker', '1983-06-04', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Adrian', 'Cervinka', '2010-02-14', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Jonathan', 'Turner', '2004-12-07', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');
INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES ('Teta', 'May', '1945-4-7', '$2a$10$7XA.K82L4o1xNvyRIu4cXO.4ANVZNnEo.Fly8.qj4NfmltX3D8TfK');



-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** contact`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS airport_sys.contact (
  id_contact SERIAL NOT NULL,
  contact_type VARCHAR(15) NOT NULL,
  contact_value VARCHAR(30) NOT NULL,
  id_customer INT NOT NULL,
  PRIMARY KEY (id_contact),
  CONSTRAINT fk_id_customer
    FOREIGN KEY (id_customer)
    REFERENCES airport_sys.customer (id_customer)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


INSERT INTO airport_sys.contact (contact_type, contact_value, id_customer) VALUES ('email', 'hart.adr@gmail.com', 49);
INSERT INTO airport_sys.contact (contact_type, contact_value, id_customer) VALUES ('email', 'spiderman@gmail.com', 48);
INSERT INTO airport_sys.contact (contact_type, contact_value, id_customer) VALUES ('mobile', '457 222 365', 47);
INSERT INTO airport_sys.contact (contact_type, contact_value, id_customer) VALUES ('mobile', '451 364 498', 46);
INSERT INTO airport_sys.contact (contact_type, contact_value, id_customer) VALUES ('mobile', '789 256 423', 45);
INSERT INTO airport_sys.contact (contact_type, contact_value, id_customer) VALUES ('email', 'paio@yahoo.com', 44);

-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** country`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS airport_sys.country (
  id_country SERIAL NOT NULL,
  country VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_country));


INSERT INTO airport_sys.country (country) VALUES ('Alabama');
INSERT INTO airport_sys.country (country) VALUES ('Texas');
INSERT INTO airport_sys.country (country) VALUES ('Poland');
INSERT INTO airport_sys.country (country) VALUES ('Germany');
INSERT INTO airport_sys.country (country) VALUES ('Austria');
INSERT INTO airport_sys.country (country) VALUES ('Slovakia');
INSERT INTO airport_sys.country (country) VALUES ('Canada');
INSERT INTO airport_sys.country (country) VALUES ('Norway');
INSERT INTO airport_sys.country (country) VALUES ('Czechia');
INSERT INTO airport_sys.country (country) VALUES ('Russia');


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** membership`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS airport_sys.membership (
  id_membership SERIAL NOT NULL,
  membership VARCHAR(10) NOT NULL,
  PRIMARY KEY (id_membership));



INSERT INTO airport_sys.membership (membership) VALUES ('silver');
INSERT INTO airport_sys.membership (membership) VALUES ('gold');
INSERT INTO airport_sys.membership (membership) VALUES ('platinum');



-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** address`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS airport_sys.address (
  id_address SERIAL NOT NULL,
  city VARCHAR(85) NOT NULL,
  street VARCHAR(45) NOT NULL,
  house_number VARCHAR(40) NOT NULL,
  zip_code VARCHAR(20) NOT NULL,
  id_country INT NOT NULL,
  PRIMARY KEY (id_address),
  CONSTRAINT fk_id_country
    FOREIGN KEY (id_country)
    REFERENCES airport_sys.country (id_country)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);




INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Mobile', 'Lonely Oak Drive', '1713 ', '36602', 1);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('MOODY', 'Cliffside Drive', '3931', '35004', 1);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Birmingham', 'Retreat Avenue', '1086', '35203', 1);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Dothan', 'Fleming Street', '435', '36303', 1);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Tuscaloosa', 'Broad Street', '4268', '35404', 1);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Birmingham', 'Maple Lane', '1873', '35203', 1);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Anniston', 'Ferry Street', '1147', '36207', 1);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Montgomery', 'Turkey Pen Lane', '2819', '36104', 1);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Birmingham', 'Wright Court', '318', '35205', 1);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Huntsville', 'Maple Lane', '3652', '35816', 1);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Galveston', 'Lynn Ogden Lane', '206', '77550', 2);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Beaumont', 'Lynn Ogden Lane', '1478', '77701', 2);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Kemah', 'Bird Spring Lane', '357', '77565', 2);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Houston', 'Brooke Street', '1800', '77087', 2);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Irving', 'Fancher Drive', '1301', '75062', 2);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('San Antonio', 'Crestview Terrace', '714', '78205', 2);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('El Paso', 'Ward Road', '4937', '79936', 2);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('AUSTIN', 'Brannon Street', '1016', '73301', 2);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Arlington', 'Sardis Sta', '4265', '76010', 2);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Dallas', 'Loving Acres Road', '3043', '75207', 2);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Houston', 'Patterson Street', '434', '77063', 2);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Kraków', 'Rynek Główny', '105', '31-042', 3);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Siemianowice Śląskie', 'Czeladzka', '41', '41-100', 3);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Warszawa', 'Olszynowa', '101', '01-934', 3);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Kraków', 'Kuklińskiego Ryszarda', '159', '30-720', 3);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Warszawa', 'Jana Pawła II', '111', '00-828', 3);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Seestermühe', 'Inge Beisheim Platz', '41', '25371', 4);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Bad Kreuznach Bosenheim', 'Neue Roßstr', '115', '55545', 4);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Nisterberg', 'Buelowstrasse', '109', '56472', 4);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Chemnitz', 'Gotthardstrasse', '83', '09126', 4);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('KLEINSCHLAG', 'Hütteldorfer Strasse', '101', '8250', 5);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('UTTENDORF', 'Schönaugasse', '17', '3385', 5);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('HÖF', 'Magdalenaweg', '21', '5582', 5);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('GARSTEN', 'Kalhamer Strasse', '41', '4451', 5);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('ST. MARGARETHEN', 'Zeppelinstrasse', '84', '9074', 5);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Trnava', 'Lomonosovova', '2797/6', '91708', 6);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Poprad', 'Šoltésovej', '33811/6', '05801', 6);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Surrey', 'Glover Road', '136', 'V3W 4N6', 7);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Tamworth', 'Reserve St', '2401', 'K0K 3G0', 7);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Toronto', 'Bay Street', '2900', 'M5J 2R8', 7);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('LILLEHAMMER', 'Klebervegen', '169', '2611', 8);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('ARENDAL', 'Industrivei II', '2040', '4848', 8);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('TØNSBERG', 'Kongleveien', '98', '3117', 8);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Úhretice', 'Jiráskova', '785', '538 32', 9);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Pozden', 'Hájecká', '264', '273 76', 9);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Rychnov na Morave', 'Tylova', '342', '569 34', 9);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Hrádek u Rokycan', 'Školní', '148', '338 42', 9);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Humpolec', 'Masarykova', '297', '396 01', 9);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Zlonice', 'Hájecká', '109', '273 71', 9);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Blovice', 'Nábřežní', '15043', '336 01', 9);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Bratsk', 'Kosmonavtov B-R', 'bld. 13, appt. 100', '	Irkutskaya oblast', 10);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('KHabarovsk', 'Znamenshchikova', 'Ul., bld. 53, appt. 69', 'KHabarovskiy kray', 10);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Brno', 'Letiště Brno-Tuřany', '904/1', '627 00', 9);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Dallas', 'Aviation Dr, DFW airport', '2400', '75261', 2);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Ożarowice', 'Wolności', '90', '42-625', 3);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES (' Bratislava', 'Ivanská cesta', '1', '820 01', 6);
INSERT INTO airport_sys.address (city, street, house_number, zip_code, id_country) VALUES ('Braunschweig', 'Lilienthalpl.', '5', '38108', 4);



-- -----------------------------------------------------
-- Table `airport_sys`.`luggage_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS airport_sys.luggage_type (
  id_luggage_type SERIAL NOT NULL,
  type VARCHAR(20) NOT NULL,
  PRIMARY KEY (id_luggage_type));



INSERT INTO airport_sys.luggage_type (type) VALUES ('CARRY_ON');
INSERT INTO airport_sys.luggage_type (type) VALUES ('SMALL');
INSERT INTO airport_sys.luggage_type (type) VALUES ('MEDUIM');
INSERT INTO airport_sys.luggage_type (type) VALUES ('LARGE');
INSERT INTO airport_sys.luggage_type (type) VALUES ('OVERSIZED');



-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** luggage`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS airport_sys.luggage (
  id_luggage SERIAL NOT NULL,
  luggage_type INT NOT NULL,
  id_customer INT NOT NULL,
  PRIMARY KEY (id_luggage),
  CONSTRAINT fk2_id_customer
    FOREIGN KEY (id_customer)
    REFERENCES airport_sys.customer (id_customer)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT FK_id_luggagge_type
    FOREIGN KEY (luggage_type)
    REFERENCES airport_sys.luggage_type (id_luggage_type)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



INSERT INTO airport_sys.luggage (luggage_type, id_customer) VALUES (3, 49);
INSERT INTO airport_sys.luggage (luggage_type, id_customer) VALUES (2, 44);
INSERT INTO airport_sys.luggage (luggage_type, id_customer) VALUES (1, 43);
INSERT INTO airport_sys.luggage (luggage_type, id_customer) VALUES (3, 40);
INSERT INTO airport_sys.luggage (luggage_type, id_customer) VALUES (5, 47);





-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** airport`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS airport_sys.airport (
  id_airport SERIAL NOT NULL,
  airport_name VARCHAR(50) NOT NULL,
  id_address INT NOT NULL,
  PRIMARY KEY (id_airport),
  CONSTRAINT fk_id_address
    FOREIGN KEY (id_address)
    REFERENCES airport_sys.address (id_address)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



INSERT INTO airport_sys.airport (airport_name, id_address) VALUES ('Dallas/Fort Worth International Airpor', 54);
INSERT INTO airport_sys.airport (airport_name, id_address) VALUES ('Airport Brno-Tuřany', 53);
INSERT INTO airport_sys.airport (airport_name, id_address) VALUES ('Katowice Airport', 55);
INSERT INTO airport_sys.airport (airport_name, id_address) VALUES ('Airport Bratislava', 56);
INSERT INTO airport_sys.airport (airport_name, id_address) VALUES ('Braunschweig Wolfsburg Airport', 57);



-- -----------------------------------------------------
-- Table airport_sys.planes
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS airport_sys.planes (
  id_planes SERIAL NOT NULL,
  brand VARCHAR(30) NOT NULL,
  type VARCHAR(30) NOT NULL,
  capacity INT NOT NULL,
  PRIMARY KEY (id_planes));

INSERT INTO airport_sys.planes (brand, type, capacity) VALUES ('Boeing', '737-800', 120);
INSERT INTO airport_sys.planes (brand, type, capacity) VALUES ('Airbus', 'A320', 200);
INSERT INTO airport_sys.planes (brand, type, capacity) VALUES ('Cessna', 'Skyhawk', 220);
INSERT INTO airport_sys.planes (brand, type, capacity) VALUES ('Airbus', 'A321', 88);
INSERT INTO airport_sys.planes (brand, type, capacity) VALUES ('Piper', 'Cherokee', 46);
INSERT INTO airport_sys.planes (brand, type, capacity) VALUES ('Boeing', '737-700', 186);

-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** plane`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS airport_sys.plane (
  id_plane SERIAL NOT NULL,
  plane_type INT NOT NULL,
  last_control DATE NOT NULL,
  PRIMARY KEY (id_plane),
  CONSTRAINT FK_plane_type
    FOREIGN KEY (plane_type)
    REFERENCES airport_sys.planes (id_planes)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



INSERT INTO airport_sys.plane (plane_type, last_control) VALUES (1, '2021-10-18');
INSERT INTO airport_sys.plane (plane_type, last_control) VALUES (1, '2021-10-11');
INSERT INTO airport_sys.plane (plane_type, last_control) VALUES (2, '2021-9-30');
INSERT INTO airport_sys.plane (plane_type, last_control) VALUES (3, '2021-10-6');
INSERT INTO airport_sys.plane (plane_type, last_control) VALUES (5, '2021-9-16');
INSERT INTO airport_sys.plane (plane_type, last_control) VALUES (4, '2021-10-15');



-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** flight`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS airport_sys.flight (
  id_flight SERIAL NOT NULL,
  departure_time TIMESTAMP NOT NULL,
  arrival_time TIMESTAMP NOT NULL,
  departue_airport INT NOT NULL,
  arrival_airport INT NOT NULL,
  plane_id_plane INT NOT NULL,
  PRIMARY KEY (id_flight),
  CONSTRAINT departue_airport
    FOREIGN KEY (departue_airport)
    REFERENCES airport_sys.airport (id_airport)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT arrival_airport
    FOREIGN KEY (arrival_airport)
    REFERENCES airport_sys.airport (id_airport)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_flight_plane1
    FOREIGN KEY (plane_id_plane)
    REFERENCES airport_sys.plane (id_plane)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

INSERT INTO airport_sys.flight (departure_time, arrival_time, departue_airport, arrival_airport, plane_id_plane) VALUES ('2021-10-17 19:20:00', '2021-10-17 22:00:00', 3, 2, 1);
INSERT INTO airport_sys.flight (departure_time, arrival_time, departue_airport, arrival_airport, plane_id_plane) VALUES ('2021-10-18 19:20:00', '2021-10-19 01:40:00', 1, 2, 3);
INSERT INTO airport_sys.flight (departure_time, arrival_time, departue_airport, arrival_airport, plane_id_plane) VALUES ('2021-10-18 6:00:00', '2021-10-18 9:45:00', 3, 4, 2);
INSERT INTO airport_sys.flight (departure_time, arrival_time, departue_airport, arrival_airport, plane_id_plane) VALUES ('2021-10-19 11:30:00', '2021-10-19 15:00:00', 4, 1, 4);
INSERT INTO airport_sys.flight (departure_time, arrival_time, departue_airport, arrival_airport, plane_id_plane) VALUES ('2021-10-21 20:00:00', '2021-10-21 23:30:00', 3, 5, 5);

-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** flight_has_luggage`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS airport_sys.flight_has_luggage (
  id_luggage INT NOT NULL,
  id_flight INT NOT NULL,
  PRIMARY KEY (id_luggage, id_flight),
  CONSTRAINT fk_id_luggage
    FOREIGN KEY (id_luggage)
    REFERENCES airport_sys.luggage (id_luggage)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_id_flight
    FOREIGN KEY (id_flight)
    REFERENCES airport_sys.flight (id_flight)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

INSERT INTO airport_sys.flight_has_luggage (id_luggage, id_flight) VALUES (1, 1);
INSERT INTO airport_sys.flight_has_luggage (id_luggage, id_flight) VALUES (2, 3);
INSERT INTO airport_sys.flight_has_luggage (id_luggage, id_flight) VALUES (2, 4);
INSERT INTO airport_sys.flight_has_luggage (id_luggage, id_flight) VALUES (3, 3);
INSERT INTO airport_sys.flight_has_luggage (id_luggage, id_flight) VALUES (4, 5);
INSERT INTO airport_sys.flight_has_luggage (id_luggage, id_flight) VALUES (5, 2);


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** customer_has_flight`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS airport_sys.customer_has_flight (
  customer_id_customer INT NOT NULL,
  flight_id_flight INT NOT NULL,
  PRIMARY KEY (customer_id_customer, flight_id_flight),
  CONSTRAINT fk_customer_has_flight_customer1
    FOREIGN KEY (customer_id_customer)
    REFERENCES airport_sys.customer (id_customer)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_customer_has_flight_flight1
    FOREIGN KEY (flight_id_flight)
    REFERENCES airport_sys.flight (id_flight)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

INSERT INTO airport_sys.customer_has_flight (customer_id_customer, flight_id_flight) VALUES (50, 1);
INSERT INTO airport_sys.customer_has_flight (customer_id_customer, flight_id_flight) VALUES (49, 1);
INSERT INTO airport_sys.customer_has_flight (customer_id_customer, flight_id_flight) VALUES (48, 1);
INSERT INTO airport_sys.customer_has_flight (customer_id_customer, flight_id_flight) VALUES (47, 2);
INSERT INTO airport_sys.customer_has_flight (customer_id_customer, flight_id_flight) VALUES (46, 2);
INSERT INTO airport_sys.customer_has_flight (customer_id_customer, flight_id_flight) VALUES (45, 2);
INSERT INTO airport_sys.customer_has_flight (customer_id_customer, flight_id_flight) VALUES (44, 3);
INSERT INTO airport_sys.customer_has_flight (customer_id_customer, flight_id_flight) VALUES (43, 3);
INSERT INTO airport_sys.customer_has_flight (customer_id_customer, flight_id_flight) VALUES (42, 3);
INSERT INTO airport_sys.customer_has_flight (customer_id_customer, flight_id_flight) VALUES (42, 4);
INSERT INTO airport_sys.customer_has_flight (customer_id_customer, flight_id_flight) VALUES (41, 4);
INSERT INTO airport_sys.customer_has_flight (customer_id_customer, flight_id_flight) VALUES (40, 5);
INSERT INTO airport_sys.customer_has_flight (customer_id_customer, flight_id_flight) VALUES (39, 5);
INSERT INTO airport_sys.customer_has_flight (customer_id_customer, flight_id_flight) VALUES (38, 5);
INSERT INTO airport_sys.customer_has_flight (customer_id_customer, flight_id_flight) VALUES (44, 4);

-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** customer_has_membership`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS airport_sys.customer_has_membership (
  id_customer INT NOT NULL,
  id_membership INT NOT NULL,
  expiration_date DATE NOT NULL,
  PRIMARY KEY (id_customer, id_membership),
  CONSTRAINT fk_customer_has_membership_customer1
    FOREIGN KEY (id_customer)
    REFERENCES airport_sys.customer (id_customer)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_customer_has_membership_membership1
    FOREIGN KEY (id_membership)
    REFERENCES airport_sys.membership (id_membership)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


INSERT INTO airport_sys.customer_has_membership (id_customer, id_membership, expiration_date) VALUES (39, 2, '2027-02-28');
INSERT INTO airport_sys.customer_has_membership (id_customer, id_membership, expiration_date) VALUES (14, 1, '2025-08-03');
INSERT INTO airport_sys.customer_has_membership (id_customer, id_membership, expiration_date) VALUES (18, 1, '2023-11-22');
INSERT INTO airport_sys.customer_has_membership (id_customer, id_membership, expiration_date) VALUES (42, 1, '2027-01-18');
INSERT INTO airport_sys.customer_has_membership (id_customer, id_membership, expiration_date) VALUES (3, 3, '2021-08-28');
INSERT INTO airport_sys.customer_has_membership (id_customer, id_membership, expiration_date) VALUES (8, 2, '2023-03-25');
INSERT INTO airport_sys.customer_has_membership (id_customer, id_membership, expiration_date) VALUES (9, 2, '2024-09-24');
INSERT INTO airport_sys.customer_has_membership (id_customer, id_membership, expiration_date) VALUES (11, 1, '2022-05-01');



-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** customer_has_address`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS airport_sys.customer_has_address (
  id_customer INT NOT NULL,
  id_address INT NOT NULL,
  address_type VARCHAR(20),
  PRIMARY KEY (id_customer, id_address),
  CONSTRAINT fk_customer_has_address_customer1
    FOREIGN KEY (id_customer)
    REFERENCES airport_sys.customer (id_customer)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_customer_has_address_address1
    FOREIGN KEY (id_address)
    REFERENCES airport_sys.address (id_address)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (1, 51, 'Correspondence');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (2, 50, 'Residential');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (3, 49, 'Residential');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (4, 48, 'Residential');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (5, 47, 'Residential');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (6, 46, 'Residential');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (7, 45, 'Residential');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (8, 44, 'Residential');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (9, 43, 'Correspondence');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (10, 42, 'Residential');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (11, 41, 'Correspondence');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (12, 40, 'Correspondence');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (13, 39, 'Residential');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (14, 38, 'Correspondence');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (15, 37, 'Correspondence');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (16, 36, 'Correspondence');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (17, 35, 'Residential');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (18, 34, 'Residential');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (19, 33, 'Residential');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (20, 32, 'Correspondence');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (21, 31, 'Residential');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (22, 30, 'Correspondence');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (23, 29, 'Residential');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (24, 28, 'Correspondence');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (25, 27, 'Correspondence');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (26, 26, 'Correspondence');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (27, 25, 'Residential');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (28, 24, 'Correspondence');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (29, 23, 'Residential');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (30, 22, 'Residential');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (31, 21, 'Residential');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (32, 20, 'Residential');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (33, 19, 'Residential');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (34, 18, 'Residential');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (35, 17, 'Residential');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (36, 16, 'Correspondence');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (37, 15, 'Residential');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (38, 14, 'Correspondence');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (39, 13, 'Residential');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (40, 12, 'Residential');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (41, 11, 'Residential');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (42, 10, 'Residential');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (43, 9, 'Residential');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (44, 8, 'Residential');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (45, 7, 'Residential');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (46, 6, 'Correspondence');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (47, 5, 'Correspondence');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (48, 4, 'Correspondence');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (49, 3, 'Residential');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (50, 2, 'Residential');
INSERT INTO airport_sys.customer_has_address (id_customer, id_address, address_type) VALUES (51, 1, 'Correspondence');



DROP ROLE IF EXISTS customer;
CREATE ROLE customer NOSUPERUSER LOGIN ENCRYPTED PASSWORD 'joker';
GRANT CONNECT ON DATABASE "airport" TO customer;
GRANT USAGE ON SCHEMA airport_sys TO customer;
GRANT SELECT, INSERT, UPDATE, DELETE on airport_sys.customer, airport_sys.address, airport_sys.customer_has_address TO customer; 


