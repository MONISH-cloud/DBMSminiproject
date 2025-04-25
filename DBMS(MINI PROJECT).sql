CREATE DATABASE COSMIC;
USE COSMIC;

CREATE TABLE Galaxies (
    Galaxy_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Type VARCHAR(50),
    Distance_From_Earth FLOAT, -- In light-years
    Number_Of_Stars INT,
    Discovery_Date DATE
);


CREATE TABLE Stars (
    Star_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Galaxy_ID INT,
    Type VARCHAR(50),
    Mass FLOAT, -- In solar masses
    Luminosity FLOAT,
    Temperature FLOAT, -- In Kelvin
    Age FLOAT, -- In million years
    FOREIGN KEY (Galaxy_ID) REFERENCES Galaxies(Galaxy_ID)
);


CREATE TABLE Planets (
    Planet_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Star_ID INT,
    Type VARCHAR(50), -- E.g., Terrestrial, Gas Giant
    Atmosphere BOOLEAN,
    Distance_From_Star FLOAT, -- In AU
    Orbital_Period FLOAT, -- In days
    Surface_Temperature FLOAT, -- In Kelvin
    FOREIGN KEY (Star_ID) REFERENCES Stars(Star_ID)
);


CREATE TABLE Moons (
    Moon_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Planet_ID INT,
    Diameter FLOAT, -- In km
    Distance_From_Planet FLOAT, -- In km
    Orbital_Period FLOAT, -- In days
    FOREIGN KEY (Planet_ID) REFERENCES Planets(Planet_ID)
);
 SELECT 
        planets.Planet_ID, 
        planets.Name AS Planet_Name, 
        moons.Name AS Moon_Name,
        moons.Diameter AS Moon_Diameter,
        moons.Distance_From_Planet AS Moon_Distance_From_Planet,
        moons.Orbital_Period AS Moon_Orbital_Period
    FROM planets
    LEFT JOIN moons ON planets.Planet_ID = moons.Planet_ID;


CREATE TABLE Asteroids (
    Asteroid_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Galaxy_ID INT,
    Composition VARCHAR(50), -- E.g., Metal, Rock
    Diameter FLOAT, -- In km
    Velocity FLOAT, -- In km/s
    Closest_Approach_To_Earth FLOAT, -- In km
    FOREIGN KEY (Galaxy_ID) REFERENCES Galaxies(Galaxy_ID)
);


CREATE TABLE Satellites (
    Satellite_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Type VARCHAR(50), -- E.g., Communication, GPS
    Launch_Date DATE,
    Orbit_Type VARCHAR(50), -- E.g., Low Earth, Geostationary
    Operator VARCHAR(50), -- E.g., NASA, ISRO
    Status VARCHAR(20) -- E.g., Active, Decommissioned
);


CREATE TABLE Comets (
    Comet_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Orbit_Type VARCHAR(50), -- E.g., Short-Period, Long-Period
    Composition VARCHAR(50), -- E.g., Ice, Rock
    Closest_Approach_To_Sun FLOAT, -- In AU
    Tail_Length FLOAT -- In km
);





CREATE TABLE SpaceStations (
    Station_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Operational_Status VARCHAR(20), -- E.g., Active, Decommissioned
    Orbit_Type VARCHAR(50), -- E.g., Low Earth, Geostationary
    Crew_Capacity INT,
    First_Operational_Date DATE
);


CREATE TABLE StarSystems (
    System_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Galaxy_ID INT,
    Number_Of_Stars INT,
    Central_Star_ID INT,
    FOREIGN KEY (Galaxy_ID) REFERENCES Galaxies(Galaxy_ID),
    FOREIGN KEY (Central_Star_ID) REFERENCES Stars(Star_ID)
);

USE COSMIC;
ALTER TABLE Galaxies MODIFY COLUMN Number_Of_Stars BIGINT;

-- Galaxies Data (20 entries)
INSERT INTO Galaxies (Galaxy_ID, Name, Type, Distance_From_Earth, Number_Of_Stars, Discovery_Date) VALUES
(1, 'Milky Way', 'Spiral', 0.026, 100000000000, '1610-01-01'),
(2, 'Andromeda', 'Spiral', 2.537, 1000000000000, '0964-01-01'),
(3, 'Triangulum', 'Spiral', 2.73, 40000000000, '1764-08-29'),
(4, 'Large Magellanic Cloud', 'Irregular', 0.158, 30000000000, '1521-01-01'),
(5, 'Small Magellanic Cloud', 'Irregular', 0.200, 3000000000, '1521-01-01'),
(6, 'Messier 87', 'Elliptical', 53.5, 10000000000000, '1781-03-18'),
(7, 'Sombrero Galaxy', 'Spiral', 29.35, 100000000000, '1781-05-11'),
(8, 'Whirlpool Galaxy', 'Spiral', 31, 100000000000, '1773-10-13'),
(9, 'Pinwheel Galaxy', 'Spiral', 21, 100000000000, '1781-03-27'),
(10, 'Centaurus A', 'Elliptical', 13, 100000000000, '1826-08-04'),
(11, 'Sculptor Galaxy', 'Spiral', 11.4, 10000000000, '1783-09-23'),
(12, 'Bodes Galaxy', 'Spiral', 12, 100000000000, '1774-12-31'),
(13, 'Cigar Galaxy', 'Starburst', 12, 30000000000, '1774-12-31'),
(14, 'Sunflower Galaxy', 'Spiral', 27, 100000000000, '1779-01-01'),
(15, 'Black Eye Galaxy', 'Spiral', 17, 40000000000, '1779-03-15'),
(16, 'Hoags Object', 'Ring', 600, 1000000000, '1950-01-01'),
(17, 'Cartwheel Galaxy', 'Ring', 500, 10000000000, '1941-01-01'),
(18, 'Antennae Galaxies', 'Interacting', 45, 100000000000, '1785-01-01'),
(19, 'Tadpole Galaxy', 'Spiral', 420, 100000000000, '1995-01-01'),
(20, 'IC 1101', 'Elliptical', 1045, 100000000000000, '1790-01-01');

-- Stars Data (20 entries)



-- Planets Data (20 entries)
INSERT INTO Planets (Planet_ID, Name, Star_ID, Type, Atmosphere, Distance_From_Star, Orbital_Period, Surface_Temperature) VALUES
(1, 'Earth', 1, 'Terrestrial', TRUE, 1.0, 365.25, 288),
(2, 'Mars', 1, 'Terrestrial', TRUE, 1.52, 687, 210),
(3, 'Jupiter', 1, 'Gas Giant', TRUE, 5.2, 4331, 165),
(4, 'Kepler-186f', 1, 'Terrestrial', TRUE, 0.43, 129.9, 185),
(5, '51 Pegasi b', 1, 'Hot Jupiter', TRUE, 0.05, 4.23, 1200),
(6, 'HD 209458 b', 1, 'Hot Jupiter', TRUE, 0.047, 3.52, 1400),
(7, 'TRAPPIST-1d', 1, 'Terrestrial', TRUE, 0.021, 4.05, 288),
(8, 'TRAPPIST-1e', 1, 'Terrestrial', TRUE, 0.028, 6.1, 251),
(9, 'TRAPPIST-1f', 1, 'Terrestrial', TRUE, 0.037, 9.2, 219),
(10, 'TRAPPIST-1g', 1, 'Terrestrial', TRUE, 0.045, 12.35, 199),
(11, 'TRAPPIST-1h', 1, 'Ice Giant', TRUE, 0.063, 18.77, 168),
(12, 'Gliese 581g', 1, 'Terrestrial', TRUE, 0.146, 36.6, 236),
(13, 'Kepler-22b', 1, 'Super-Earth', TRUE, 0.85, 289.86, 262),
(14, 'HD 85512 b', 1, 'Super-Earth', TRUE, 0.19, 58.4, 298),
(15, 'Gliese 667Cc', 1, 'Super-Earth', TRUE, 0.12, 28.15, 277),
(16, 'Proxima Centauri b', 7, 'Terrestrial', TRUE, 0.049, 11.2, 234),
(17, '55 Cancri e', 1, 'Super-Earth', TRUE, 0.015, 0.74, 2060),
(18, 'CoRoT-7b', 1, 'Super-Earth', TRUE, 0.017, 0.85, 2500),
(19, 'TOI 700 d', 1, 'Terrestrial', TRUE, 0.16, 37.4, 283),
(20, 'LHS 1140 b', 1, 'Terrestrial', TRUE, 0.087, 24.7, 235);

-- Moons Data (20 entries)
INSERT INTO Moons (Moon_ID, Name, Planet_ID, Diameter, Distance_From_Planet, Orbital_Period) VALUES
(1, 'Moon', 1, 3475, 384400, 27.3),
(2, 'Phobos', 2, 22.2, 9377, 0.32),
(3, 'Deimos', 2, 12.4, 23460, 1.26),
(4, 'Io', 3, 3643, 421700, 1.77),
(5, 'Europa', 3, 3122, 671034, 3.55),
(6, 'Ganymede', 3, 5268, 1070400, 7.15),
(7, 'Callisto', 3, 4821, 1882700, 16.69),
(8, 'Titan', 3, 5150, 1221870, 15.95),
(9, 'Rhea', 3, 1528, 527108, 4.52),
(10, 'Iapetus', 3, 1470, 3560820, 79.33),
(11, 'Dione', 3, 1123, 377400, 2.74),
(12, 'Triton', 3, 2707, 354759, 5.88),
(13, 'Charon', 3, 1212, 19570, 6.39),
(14, 'Miranda', 3, 471, 129390, 1.41),
(15, 'Ariel', 3, 1158, 190900, 2.52),
(16, 'Umbriel', 3, 1169, 266000, 4.14),
(17, 'Titania', 3, 1578, 436300, 8.71),
(18, 'Oberon', 3, 1523, 583500, 13.46),
(19, 'Nereid', 3, 340, 5513400, 360.13),
(20, 'Proteus', 3, 420, 117647, 1.12);

-- Asteroids Data (20 entries)
INSERT INTO Asteroids (Asteroid_ID, Name, Galaxy_ID, Composition, Diameter, Velocity, Closest_Approach_To_Earth) VALUES
(1, 'Ceres', 1, 'Rock/Ice', 946, 17.9, 262000000),
(2, 'Vesta', 1, 'Rock', 525, 19.3, 177000000),
(3, 'Pallas', 1, 'Rock', 512, 17.2, 204000000),
(4, 'Hygiea', 1, 'Carbonaceous', 431, 16.5, 290000000),
(5, 'Interamnia', 1, 'Carbonaceous', 332, 16.7, 310000000),
(6, 'Davida', 1, 'Carbonaceous', 326, 17.4, 330000000),
(7, 'Europa', 1, 'Carbonaceous', 315, 16.9, 300000000),
(8, 'Sylvia', 1, 'Carbonaceous', 286, 17.1, 280000000),
(9, 'Cybele', 1, 'Carbonaceous', 280, 17.3, 275000000),
(10, 'Eunomia', 1, 'Rock', 268, 18.1, 250000000),
(11, 'Juno', 1, 'Rock', 234, 18.6, 220000000),
(12, 'Amphitrite', 1, 'Rock', 212, 19.0, 210000000),
(13, 'Thisbe', 1, 'Carbonaceous', 209, 17.6, 260000000),
(14, 'Fortuna', 1, 'Carbonaceous', 200, 17.8, 240000000),
(15, 'Hektor', 1, 'D-type', 225, 13.1, 627000000),
(16, 'Patroclus', 1, 'P-type', 140, 13.4, 628000000),
(17, 'Ida', 1, 'S-type', 56, 17.7, 108000000),
(18, 'Mathilde', 1, 'C-type', 66, 13.5, 343000000),
(19, 'Eros', 1, 'S-type', 16.8, 24.3, 22000000),
(20, 'Itokawa', 1, 'S-type', 0.535, 19.0, 2000000);
ALTER TABLE Satellites
ADD COLUMN Planet_ID INT,
ADD CONSTRAINT FK_Satellite_Planet FOREIGN KEY (Planet_ID) REFERENCES Planets(Planet_ID);

ALTER TABLE SpaceStations
ADD COLUMN Planet_ID INT,
ADD CONSTRAINT FK_SpaceStation_Planet FOREIGN KEY (Planet_ID) REFERENCES Planets(Planet_ID);

-- Satellites Data (20 entries)
INSERT INTO Satellites (Satellite_ID, Name, Type, Launch_Date, Orbit_Type, Operator, Status, Planet_ID) VALUES
(1, 'Sputnik 1', 'Scientific', '1957-10-04', 'Low Earth Orbit', 'USSR', 'Decommissioned', 1),
(2, 'Explorer 1', 'Scientific', '1958-02-01', 'Low Earth Orbit', 'USA', 'Decommissioned', 1),
(3, 'Telstar 1', 'Communication', '1962-07-10', 'Medium Earth Orbit', 'USA', 'Decommissioned', 1),
(4, 'Intelsat I', 'Communication', '1965-04-06', 'Geostationary Orbit', 'Intelsat', 'Decommissioned', 1),
(5, 'GPS-1', 'Navigation', '1978-02-22', 'Medium Earth Orbit', 'USA', 'Active', 1),
(6, 'Hubble Space Telescope', 'Scientific', '1990-04-24', 'Low Earth Orbit', 'NASA/ESA', 'Active', 1),
(7, 'International Space Station', 'Space Station', '1998-11-20', 'Low Earth Orbit', 'International', 'Active', 1),
(8, 'Iridium 1', 'Communication', '1997-05-05', 'Low Earth Orbit', 'Iridium', 'Active', 1),
(9, 'Landsat 1', 'Earth Observation', '1972-07-23', 'Low Earth Orbit', 'USA', 'Decommissioned', 1),
(10, 'GOES 1', 'Weather', '1975-10-16', 'Geostationary Orbit', 'USA', 'Decommissioned', 1),
(11, 'SPOT 1', 'Earth Observation', '1986-02-22', 'Low Earth Orbit', 'France', 'Decommissioned', 1),
(12, 'ERS 1', 'Earth Observation', '1991-07-17', 'Low Earth Orbit', 'ESA', 'Decommissioned', 1),
(13, 'Envisat', 'Earth Observation', '2002-03-01', 'Sun-synchronous orbit', 'ESA', 'Decommissioned', 1),
(14, 'Terra', 'Earth Observation', '1999-12-18', 'Sun-synchronous orbit', 'NASA', 'Active', 1),
(15, 'Aqua', 'Earth Observation', '2002-05-04', 'Sun-synchronous orbit', 'NASA', 'Active', 1),
(16, 'Jason-1', 'Oceanography', '2001-12-07', 'Low Earth Orbit', 'NASA/CNES', 'Decommissioned', 1),
(17, 'CryoSat-2', 'Earth Observation', '2010-04-08', 'Low Earth Orbit', 'ESA', 'Active', 1),
(18, 'Sentinel-1A', 'Earth Observation', '2014-04-03', 'Sun-synchronous orbit', 'ESA', 'Active', 1),
(19, 'Starlink-1', 'Communication', '2019-05-24', 'Low Earth Orbit', 'SpaceX', 'Active', 1),
(20, 'OneWeb-1', 'Communication', '2019-02-28', 'Low Earth Orbit', 'OneWeb', 'Active', 1);



ALTER TABLE Comets
ADD COLUMN Galaxy_ID INT,
ADD CONSTRAINT FK_Comet_Galaxy FOREIGN KEY (Galaxy_ID) REFERENCES Galaxies(Galaxy_ID);
UPDATE Comets
SET Name = 'Updated Comet Name',
    Orbit_Type = 'Updated Orbit Type',
    Composition = 'Updated Composition',
    Closest_Approach_To_Sun = 1.2,
    Tail_Length = 6000000,
    Galaxy_ID = 1
WHERE Comet_ID = 1;


-- Comets Data (20 entries)
INSERT INTO Comets (Comet_ID, Name, Orbit_Type, Composition, Closest_Approach_To_Sun, Tail_Length, Galaxy_ID) VALUES
(1, 'Halley', 'Short-Period', 'Ice/Dust', 0.587, 80000000, 1),
(2, 'Hale-Bopp', 'Long-Period', 'Ice/Dust', 0.914, 50000000, 1),
(3, 'Hyakutake', 'Long-Period', 'Ice/Dust', 0.23, 200000000, 1),
(4, 'Wild 2', 'Short-Period', 'Ice/Dust', 1.59, 100000, 1),
(5, 'Tempel 1', 'Short-Period', 'Ice/Dust', 1.51, 14000, 1),
(6, 'Borrelly', 'Short-Period', 'Ice/Dust', 1.36, 80000, 1),
(7, 'Encke', 'Short-Period', 'Ice/Dust', 0.339, 10000, 1),
(8, 'Swift-Tuttle', 'Long-Period', 'Ice/Dust', 0.96, 30000000, 1),
(9, 'Shoemaker-Levy 9', 'Short-Period', 'Ice/Dust', 0.672, NULL, 1),
(10, 'ISON', 'Long-Period', 'Ice/Dust', 0.0124, 1000000, 1),
(11, 'Lovejoy (C/2011 W3)', 'Long-Period', 'Ice/Dust', 0.0055, 1000000, 1),
(12, 'McNaught (C/2006 P1)', 'Long-Period', 'Ice/Dust', 0.17, 10000000, 1),
(13, 'Holmes (17P)', 'Short-Period', 'Ice/Dust', 2.05, 1000000, 1),
(14, 'LINEAR (C/1999 S4)', 'Long-Period', 'Ice/Dust', 0.76, 200000, 1),
(15, 'Hale-Bopp (C/1995 O1)', 'Long-Period', 'Ice/Dust', 0.914, 50000000, 1),
(16, 'Hyakutake (C/1996 B2)', 'Long-Period', 'Ice/Dust', 0.23, 200000000, 1),
(17, 'Shoemaker-Levy 9 (D/1993 E1)', 'Short-Period', 'Ice/Dust', 0.672, NULL, 1),
(18, 'Tempel 1 (9P)', 'Short-Period', 'Ice/Dust', 1.51, 14000, 1),
(19, 'Wild 2 (81P)', 'Short-Period', 'Ice/Dust', 1.59, 100000, 1),
(20, 'Borrelly (19P)', 'Short-Period', 'Ice/Dust', 1.36, 80000, 1);

-- SpaceStations Data (20 entries)
INSERT INTO SpaceStations (Station_ID, Name, Operational_Status, Orbit_Type, Crew_Capacity, First_Operational_Date) VALUES
(1, 'Salyut 1', 'Decommissioned', 'Low Earth Orbit', 3, '1971-04-19'),
(2, 'Skylab', 'Decommissioned', 'Low Earth Orbit', 3, '1973-05-14'),
(3, 'Mir', 'Decommissioned', 'Low Earth Orbit', 3, '1986-02-20'),
(4, 'International Space Station', 'Active', 'Low Earth Orbit', 7, '1998-11-20'),
(5, 'Tiangong-1', 'Decommissioned', 'Low Earth Orbit', 3, '2011-09-29'),
(6, 'Tiangong-2', 'Decommissioned', 'Low Earth Orbit', 3, '2016-09-15'),
(7, 'Tiangong Space Station', 'Active', 'Low Earth Orbit', 3, '2021-04-29'),
(8, 'Almaz 1', 'Decommissioned', 'Low Earth Orbit', 2, '1969-04-03'),
(9, 'Almaz 2', 'Decommissioned', 'Low Earth Orbit', 2, '1976-06-22'),
(10, 'Salyut 2', 'Decommissioned', 'Low Earth Orbit', 2, '1973-04-03'),
(11, 'Salyut 3', 'Decommissioned', 'Low Earth Orbit', 2, '1974-06-25'),
(12, 'Salyut 4', 'Decommissioned', 'Low Earth Orbit', 2, '1974-12-26'),
(13, 'Salyut 5', 'Decommissioned', 'Low Earth Orbit', 2, '1976-06-22'),
(14, 'Salyut 6', 'Decommissioned', 'Low Earth Orbit', 2, '1977-09-29'),
(15, 'Salyut 7', 'Decommissioned', 'Low Earth Orbit', 2, '1982-04-19'),
(16, 'Space Station Freedom', 'Decommissioned', 'Low Earth Orbit', 8, '1984-01-25'),
(17, 'Columbus Orbital Facility', 'Active', 'Low Earth Orbit', 10, '2008-02-11'),
(18, 'Zvezda Service Module', 'Active', 'Low Earth Orbit', 10, '2000-07-12'),
(19, 'Zarya Functional Cargo Block', 'Active', 'Low Earth Orbit', 10, '1998-11-20'),
(20, 'Unity Node 1', 'Active', 'Low Earth Orbit', 10, '1998-12-07');
-- StarSystems Data (20 entries)
INSERT INTO StarSystems (System_ID, Name, Galaxy_ID, Number_Of_Stars, Central_Star_ID) VALUES
(1, 'Sol', 1, 1, 1),
(2, 'Alpha Centauri', 1, 3, 3),
(3, 'Sirius', 1, 2, 2),
(4, 'Proxima Centauri', 1, 1, 7),
(5, 'Vega', 1, 1, 5),
(6, 'Betelgeuse System', 1, 1, 4),
(7, 'Rigel System', 1, 1, 6),
(8, 'Arcturus System', 1, 1, 8),
(9, 'Pollux System', 1, 1, 9),
(10, 'Altair System', 1, 1, 10),
(11, 'Deneb System', 1, 1, 11),
(12, 'Antares System', 1, 1, 12),
(13, 'Fomalhaut System', 1, 1, 13),
(14, 'Canopus System', 1, 1, 14),
(15, 'Achernar System', 1, 1, 15),
(16, 'Spica System', 1, 1, 16),
(17, 'Mimosa System', 1, 1,17),
(18, 'Regulus System', 1, 1, 18),
(19, 'Acrux System', 1, 1, 19),
(20, 'Gacrux System', 1, 1, 20);
USE COSMIC;
SHOW TABLES;
USE COSMIC;

SELECT * FROM Galaxies;
SELECT * FROM Stars;
SELECT * FROM Planets;
SELECT * FROM Moons;
SELECT * FROM Asteroids;
SELECT * FROM Satellites;

SELECT * FROM Comets;
SELECT * FROM SpaceStations;
SELECT * FROM StarSystems;
SELECT * FROM Galaxies WHERE Name LIKE '%Milky Way%';
SELECT * FROM Galaxies WHERE Name LIKE '%Andromeda%';
SELECT * FROM Galaxies WHERE Name LIKE '%Triangulum%';
SELECT * FROM Galaxies WHERE Name LIKE '%Large Magellanic Cloud%';
SELECT * FROM Galaxies WHERE Name LIKE '%Small Magellanic Cloud%';
SELECT * FROM Galaxies WHERE Name LIKE '%Messier 87%';
SELECT * FROM Galaxies WHERE Name LIKE '%Sombrero Galaxy%';
SELECT * FROM Galaxies WHERE Name LIKE '%Whirlpool Galaxy%';
SELECT * FROM Galaxies WHERE Name LIKE '%Pinwheel Galaxy%';
SELECT * FROM Galaxies WHERE Name LIKE '%Centaurus A%';
SELECT * FROM Galaxies WHERE Name LIKE '%Sculptor Galaxy%';
SELECT * FROM Galaxies WHERE Name LIKE '%Bodes Galaxy%';
SELECT * FROM Galaxies WHERE Name LIKE '%Cigar Galaxy%';
SELECT * FROM Galaxies WHERE Name LIKE '%Sunflower Galaxy%';
SELECT * FROM Galaxies WHERE Name LIKE '%Black Eye Galaxy%';
SELECT * FROM Galaxies WHERE Name LIKE '%Hoags Object%';
SELECT * FROM Galaxies WHERE Name LIKE '%Cartwheel Galaxy%';
SELECT * FROM Galaxies WHERE Name LIKE '%Antennae Galaxies%';
SELECT * FROM Galaxies WHERE Name LIKE '%Tadpole Galaxy%';
SELECT * FROM Galaxies WHERE Name LIKE '%IC 1101%';
SELECT * FROM Galaxies WHERE Type LIKE '%Spiral%';
SELECT * FROM Galaxies WHERE Type LIKE '%Irregular%';
SELECT * FROM Galaxies WHERE Type LIKE '%Elliptical%';
SELECT * FROM Galaxies WHERE Type LIKE '%Starburst%';
SELECT * FROM Galaxies WHERE Type LIKE '%Ring%';
SELECT * FROM Galaxies WHERE Type LIKE '%Interacting%';
SELECT * FROM Galaxies WHERE Distance_From_Earth BETWEEN 0.0 AND 10.0;
SELECT * FROM Galaxies WHERE Distance_From_Earth BETWEEN 10.0 AND 100.0;
SELECT * FROM Galaxies WHERE Distance_From_Earth BETWEEN 100.0 AND 500.0;
-- Adjust ranges based on your requirements
SELECT * FROM Stars WHERE Name LIKE '%Sun%';
SELECT * FROM Stars WHERE Name LIKE '%Sirius A%';
SELECT * FROM Stars WHERE Name LIKE '%Alpha Centauri A%';
SELECT * FROM Stars WHERE Name LIKE '%Betelgeuse%';
SELECT * FROM Stars WHERE Name LIKE '%Vega%';
SELECT * FROM Stars WHERE Name LIKE '%Rigel%';
SELECT * FROM Stars WHERE Name LIKE '%Proxima Centauri%';
SELECT * FROM Stars WHERE Name LIKE '%Arcturus%';
SELECT * FROM Stars WHERE Name LIKE '%Pollux%';
SELECT * FROM Stars WHERE Name LIKE '%Altair%';
SELECT * FROM Stars WHERE Name LIKE '%Deneb%';
SELECT * FROM Stars WHERE Name LIKE '%Antares%';
SELECT * FROM Stars WHERE Name LIKE '%Fomalhaut%';
SELECT * FROM Stars WHERE Name LIKE '%Canopus%';
SELECT * FROM Stars WHERE Name LIKE '%Achernar%';
SELECT * FROM Stars WHERE Name LIKE '%Spica%';
SELECT * FROM Stars WHERE Name LIKE '%Mimosa%';
SELECT * FROM Stars WHERE Name LIKE '%Regulus%';
SELECT * FROM Stars WHERE Name LIKE '%Acrux%';
SELECT * FROM Stars WHERE Name LIKE '%Gacrux%';
SELECT * FROM Stars WHERE Type LIKE '%G2V%';
SELECT * FROM Stars WHERE Type LIKE '%A1V%';
SELECT * FROM Stars WHERE Type LIKE '%G2V%';
SELECT * FROM Stars WHERE Type LIKE '%M2Iab%';
SELECT * FROM Stars WHERE Type LIKE '%A0V%';
SELECT * FROM Stars WHERE Type LIKE '%B8Ia%';
SELECT * FROM Stars WHERE Type LIKE '%M5.5Ve%';
SELECT * FROM Stars WHERE Type LIKE '%K1.5III%';
SELECT * FROM Stars WHERE Type LIKE '%K0III%';
SELECT * FROM Stars WHERE Type LIKE '%A7V%';
SELECT * FROM Stars WHERE Type LIKE '%A2Ia%';
SELECT * FROM Stars WHERE Type LIKE '%M1.5Iab-Ib%';
SELECT * FROM Stars WHERE Type LIKE '%A3V%';
SELECT * FROM Stars WHERE Type LIKE '%F0Ib%';
SELECT * FROM Stars WHERE Type LIKE '%B6Ve%';
SELECT * FROM Stars WHERE Type LIKE '%B1V%';
SELECT * FROM Stars WHERE Type LIKE '%B0.5III%';
SELECT * FROM Stars WHERE Type LIKE '%B7V%';
SELECT * FROM Stars WHERE Type LIKE '%B0.5IV%';
SELECT * FROM Stars WHERE Type LIKE '%M3.5III%';
SELECT * FROM Stars WHERE Age = 4600;
SELECT * FROM Stars WHERE Age = 230;
SELECT * FROM Stars WHERE Age = 6000;
SELECT * FROM Stars WHERE Age = 8;
SELECT * FROM Stars WHERE Age = 455;
SELECT * FROM Stars WHERE Age = 8;
SELECT * FROM Stars WHERE Age = 4850;
SELECT * FROM Stars WHERE Age = 7100;
SELECT * FROM Stars WHERE Age = 724;
SELECT * FROM Stars WHERE Age = 1200;
SELECT * FROM Stars WHERE Age = 10;
SELECT * FROM Stars WHERE Age = 12;
SELECT * FROM Stars WHERE Age = 440;
SELECT * FROM Stars WHERE Age = 25;
SELECT * FROM Stars WHERE Age = 63;
SELECT * FROM Stars WHERE Age = 20;
SELECT * FROM Stars WHERE Age = 12;
SELECT * FROM Stars WHERE Age = 1000;
SELECT * FROM Stars WHERE Age = 8;
SELECT * FROM Stars WHERE Age = 390;
SELECT * FROM Planets WHERE Name = 'Earth';
SELECT * FROM Planets WHERE Name = 'Mars';
SELECT * FROM Planets WHERE Name = 'Jupiter';
SELECT * FROM Planets WHERE Name = 'Kepler-186f';
SELECT * FROM Planets WHERE Name = '51 Pegasi b';
SELECT * FROM Planets WHERE Name = 'HD 209458 b';
SELECT * FROM Planets WHERE Name = 'TRAPPIST-1d';
SELECT * FROM Planets WHERE Name = 'TRAPPIST-1e';
SELECT * FROM Planets WHERE Name = 'TRAPPIST-1f';
SELECT * FROM Planets WHERE Name = 'TRAPPIST-1g';
SELECT * FROM Planets WHERE Name = 'TRAPPIST-1h';
SELECT * FROM Planets WHERE Name = 'Gliese 581g';
SELECT * FROM Planets WHERE Name = 'Kepler-22b';
SELECT * FROM Planets WHERE Name = 'HD 85512 b';
SELECT * FROM Planets WHERE Name = 'Gliese 667Cc';
SELECT * FROM Planets WHERE Name = 'Proxima Centauri b';
SELECT * FROM Planets WHERE Name = '55 Cancri e';
SELECT * FROM Planets WHERE Name = 'CoRoT-7b';
SELECT * FROM Planets WHERE Name = 'TOI 700 d';
SELECT * FROM Planets WHERE Name = 'LHS 1140 b';
SELECT * FROM Planets WHERE Type = 'Terrestrial';
SELECT * FROM Planets WHERE Type = 'Gas Giant';
SELECT * FROM Planets WHERE Type = 'Hot Jupiter';
SELECT * FROM Planets WHERE Type = 'Ice Giant';
SELECT * FROM Planets WHERE Type = 'Super-Earth';
SELECT * FROM Planets WHERE Distance_From_Star = 1.0;
SELECT * FROM Planets WHERE Distance_From_Star = 1.52;
SELECT * FROM Planets WHERE Distance_From_Star = 5.2;
SELECT * FROM Planets WHERE Distance_From_Star = 0.43;
SELECT * FROM Planets WHERE Distance_From_Star = 0.05;
SELECT * FROM Planets WHERE Distance_From_Star = 0.047;
SELECT * FROM Planets WHERE Distance_From_Star = 0.021;
SELECT * FROM Planets WHERE Distance_From_Star = 0.028;
SELECT * FROM Planets WHERE Distance_From_Star = 0.037;
SELECT * FROM Planets WHERE Distance_From_Star = 0.045;
SELECT * FROM Planets WHERE Distance_From_Star = 0.063;
SELECT * FROM Planets WHERE Distance_From_Star = 0.146;
SELECT * FROM Planets WHERE Distance_From_Star = 0.85;
SELECT * FROM Planets WHERE Distance_From_Star = 0.19;
SELECT * FROM Planets WHERE Distance_From_Star = 0.12;
SELECT * FROM Planets WHERE Distance_From_Star = 0.049;
SELECT * FROM Planets WHERE Distance_From_Star = 0.015;
SELECT * FROM Planets WHERE Distance_From_Star = 0.017;
SELECT * FROM Planets WHERE Distance_From_Star = 0.16;
SELECT * FROM Planets WHERE Distance_From_Star = 0.087;
SELECT * FROM Planets WHERE Orbital_Period = 365.25;
SELECT * FROM Planets WHERE Orbital_Period = 687;
SELECT * FROM Planets WHERE Orbital_Period = 4331;
SELECT * FROM Planets WHERE Orbital_Period = 129.9;
SELECT * FROM Planets WHERE Orbital_Period = 4.23;
SELECT * FROM Planets WHERE Orbital_Period = 3.52;
SELECT * FROM Planets WHERE Orbital_Period = 4.05;
SELECT * FROM Planets WHERE Orbital_Period = 6.1;
SELECT * FROM Planets WHERE Orbital_Period = 9.2;
SELECT * FROM Planets WHERE Orbital_Period = 12.35;
SELECT * FROM Planets WHERE Orbital_Period = 18.77;
SELECT * FROM Planets WHERE Orbital_Period = 36.6;
SELECT * FROM Planets WHERE Orbital_Period = 289.86;
SELECT * FROM Planets WHERE Orbital_Period = 58.4;
SELECT * FROM Planets WHERE Orbital_Period = 28.15;
SELECT * FROM Planets WHERE Orbital_Period = 11.2;
SELECT * FROM Planets WHERE Orbital_Period = 0.74;
SELECT * FROM Planets WHERE Orbital_Period = 0.85;
SELECT * FROM Planets WHERE Orbital_Period = 37.4;
SELECT * FROM Planets WHERE Orbital_Period = 24.7;
SELECT * FROM Planets WHERE Surface_Temperature = 288;
SELECT * FROM Planets WHERE Surface_Temperature = 210;
SELECT * FROM Planets WHERE Surface_Temperature = 165;
SELECT * FROM Planets WHERE Surface_Temperature = 185;
SELECT * FROM Planets WHERE Surface_Temperature = 1200;
SELECT * FROM Planets WHERE Surface_Temperature = 1400;
SELECT * FROM Planets WHERE Surface_Temperature = 288;
SELECT * FROM Planets WHERE Surface_Temperature = 251;
SELECT * FROM Planets WHERE Surface_Temperature = 219;
SELECT * FROM Planets WHERE Surface_Temperature = 199;
SELECT * FROM Planets WHERE Surface_Temperature = 168;
SELECT * FROM Planets WHERE Surface_Temperature = 236;
SELECT * FROM Planets WHERE Surface_Temperature = 262;
SELECT * FROM Planets WHERE Surface_Temperature = 298;
SELECT * FROM Planets WHERE Surface_Temperature = 277;
SELECT * FROM Planets WHERE Surface_Temperature = 234;
SELECT * FROM Planets WHERE Surface_Temperature = 2060;
SELECT * FROM Planets WHERE Surface_Temperature = 2500;
SELECT * FROM Planets WHERE Surface_Temperature = 283;
SELECT * FROM Planets WHERE Surface_Temperature = 235;

SELECT * FROM Moons WHERE Name = 'Moon';
SELECT * FROM Moons WHERE Name = 'Phobos';
SELECT * FROM Moons WHERE Name = 'Deimos';
SELECT * FROM Moons WHERE Name = 'Io';
SELECT * FROM Moons WHERE Name = 'Europa';
SELECT * FROM Moons WHERE Name = 'Ganymede';
SELECT * FROM Moons WHERE Name = 'Callisto';
SELECT * FROM Moons WHERE Name = 'Titan';
SELECT * FROM Moons WHERE Name = 'Rhea';
SELECT * FROM Moons WHERE Name = 'Iapetus';
SELECT * FROM Moons WHERE Name = 'Dione';
SELECT * FROM Moons WHERE Name = 'Triton';
SELECT * FROM Moons WHERE Name = 'Charon';
SELECT * FROM Moons WHERE Name = 'Miranda';
SELECT * FROM Moons WHERE Name = 'Ariel';
SELECT * FROM Moons WHERE Name = 'Umbriel';
SELECT * FROM Moons WHERE Name = 'Titania';
SELECT * FROM Moons WHERE Name = 'Oberon';
SELECT * FROM Moons WHERE Name = 'Nereid';
SELECT * FROM Moons WHERE Name = 'Proteus';
SELECT * FROM Moons WHERE Diameter = 3475;
SELECT * FROM Moons WHERE Diameter = 22.2;
SELECT * FROM Moons WHERE Diameter = 12.4;
SELECT * FROM Moons WHERE Diameter = 3643;
SELECT * FROM Moons WHERE Diameter = 3122;
SELECT * FROM Moons WHERE Diameter = 5268;
SELECT * FROM Moons WHERE Diameter = 4821;
SELECT * FROM Moons WHERE Diameter = 5150;
SELECT * FROM Moons WHERE Diameter = 1528;
SELECT * FROM Moons WHERE Diameter = 1470;
SELECT * FROM Moons WHERE Diameter = 1123;
SELECT * FROM Moons WHERE Diameter = 2707;
SELECT * FROM Moons WHERE Diameter = 1212;
SELECT * FROM Moons WHERE Diameter = 471;
SELECT * FROM Moons WHERE Diameter = 1158;
SELECT * FROM Moons WHERE Diameter = 1169;
SELECT * FROM Moons WHERE Diameter = 1578;
SELECT * FROM Moons WHERE Diameter = 1523;
SELECT * FROM Moons WHERE Diameter = 340;
SELECT * FROM Moons WHERE Diameter = 420;
SELECT * FROM Moons WHERE Distance_From_Planet = 384400;
SELECT * FROM Moons WHERE Distance_From_Planet = 9377;
SELECT * FROM Moons WHERE Distance_From_Planet = 23460;
SELECT * FROM Moons WHERE Distance_From_Planet = 421700;
SELECT * FROM Moons WHERE Distance_From_Planet = 671034;
SELECT * FROM Moons WHERE Distance_From_Planet = 1070400;
SELECT * FROM Moons WHERE Distance_From_Planet = 1882700;
SELECT * FROM Moons WHERE Distance_From_Planet = 1221870;
SELECT * FROM Moons WHERE Distance_From_Planet = 527108;
SELECT * FROM Moons WHERE Distance_From_Planet = 3560820;
SELECT * FROM Moons WHERE Distance_From_Planet = 377400;
SELECT * FROM Moons WHERE Distance_From_Planet = 354759;
SELECT * FROM Moons WHERE Distance_From_Planet = 19570;
SELECT * FROM Moons WHERE Distance_From_Planet = 129390;
SELECT * FROM Moons WHERE Distance_From_Planet = 190900;
SELECT * FROM Moons WHERE Distance_From_Planet = 266000;
SELECT * FROM Moons WHERE Distance_From_Planet = 436300;
SELECT * FROM Moons WHERE Distance_From_Planet = 583500;
SELECT * FROM Moons WHERE Distance_From_Planet = 5513400;
SELECT * FROM Moons WHERE Distance_From_Planet = 117647;
SELECT * FROM Moons WHERE Orbital_Period = 27.3;
SELECT * FROM Moons WHERE Orbital_Period = 0.32;
SELECT * FROM Moons WHERE Orbital_Period = 1.26;
SELECT * FROM Moons WHERE Orbital_Period = 1.77;
SELECT * FROM Moons WHERE Orbital_Period = 3.55;
SELECT * FROM Moons WHERE Orbital_Period = 7.15;
SELECT * FROM Moons WHERE Orbital_Period = 16.69;
SELECT * FROM Moons WHERE Orbital_Period = 15.95;
SELECT * FROM Moons WHERE Orbital_Period = 4.52;
SELECT * FROM Moons WHERE Orbital_Period = 79.33;
SELECT * FROM Moons WHERE Orbital_Period = 2.74;
SELECT * FROM Moons WHERE Orbital_Period = 5.88;
SELECT * FROM Moons WHERE Orbital_Period = 6.39;
SELECT * FROM Moons WHERE Orbital_Period = 1.41;
SELECT * FROM Moons WHERE Orbital_Period = 2.52;
SELECT * FROM Moons WHERE Orbital_Period = 4.14;
SELECT * FROM Moons WHERE Orbital_Period = 8.71;
SELECT * FROM Moons WHERE Orbital_Period = 13.46;
SELECT * FROM Moons WHERE Orbital_Period = 360.13;
SELECT * FROM Moons WHERE Orbital_Period = 1.12;
SELECT * FROM Asteroids WHERE Name = 'Ceres';
SELECT * FROM Asteroids WHERE Name = 'Vesta';
SELECT * FROM Asteroids WHERE Name = 'Pallas';
SELECT * FROM Asteroids WHERE Name = 'Hygiea';
SELECT * FROM Asteroids WHERE Name = 'Interamnia';
SELECT * FROM Asteroids WHERE Name = 'Davida';
SELECT * FROM Asteroids WHERE Name = 'Europa';
SELECT * FROM Asteroids WHERE Name = 'Sylvia';
SELECT * FROM Asteroids WHERE Name = 'Cybele';
SELECT * FROM Asteroids WHERE Name = 'Eunomia';
SELECT * FROM Asteroids WHERE Name = 'Juno';
SELECT * FROM Asteroids WHERE Name = 'Amphitrite';
SELECT * FROM Asteroids WHERE Name = 'Thisbe';
SELECT * FROM Asteroids WHERE Name = 'Fortuna';
SELECT * FROM Asteroids WHERE Name = 'Hektor';
SELECT * FROM Asteroids WHERE Name = 'Patroclus';
SELECT * FROM Asteroids WHERE Name = 'Ida';
SELECT * FROM Asteroids WHERE Name = 'Mathilde';
SELECT * FROM Asteroids WHERE Name = 'Eros';
SELECT * FROM Asteroids WHERE Name = 'Itokawa';
SELECT * FROM Asteroids WHERE Composition = 'Rock/Ice';
SELECT * FROM Asteroids WHERE Composition = 'Rock';
SELECT * FROM Asteroids WHERE Composition = 'Carbonaceous';
SELECT * FROM Asteroids WHERE Composition = 'D-type';
SELECT * FROM Asteroids WHERE Composition = 'P-type';
SELECT * FROM Asteroids WHERE Composition = 'S-type';
SELECT * FROM Asteroids WHERE Composition = 'C-type';
SELECT * FROM Asteroids WHERE Diameter = 946;
SELECT * FROM Asteroids WHERE Diameter = 525;
SELECT * FROM Asteroids WHERE Diameter = 512;
SELECT * FROM Asteroids WHERE Diameter = 431;
SELECT * FROM Asteroids WHERE Diameter = 332;
SELECT * FROM Asteroids WHERE Diameter = 326;
SELECT * FROM Asteroids WHERE Diameter = 315;
SELECT * FROM Asteroids WHERE Diameter = 286;
SELECT * FROM Asteroids WHERE Diameter = 280;
SELECT * FROM Asteroids WHERE Diameter = 268;
SELECT * FROM Asteroids WHERE Diameter = 234;
SELECT * FROM Asteroids WHERE Diameter = 212;
SELECT * FROM Asteroids WHERE Diameter = 209;
SELECT * FROM Asteroids WHERE Diameter = 200;
SELECT * FROM Asteroids WHERE Diameter = 225;
SELECT * FROM Asteroids WHERE Diameter = 140;
SELECT * FROM Asteroids WHERE Diameter = 56;
SELECT * FROM Asteroids WHERE Diameter = 66;
SELECT * FROM Asteroids WHERE Diameter = 16.8;
SELECT * FROM Asteroids WHERE Diameter = 0.535;
SELECT * FROM Asteroids WHERE Velocity = 17.9;
SELECT * FROM Asteroids WHERE Velocity = 19.3;
SELECT * FROM Asteroids WHERE Velocity = 17.2;
SELECT * FROM Asteroids WHERE Velocity = 16.5;
SELECT * FROM Asteroids WHERE Velocity = 16.7;
SELECT * FROM Asteroids WHERE Velocity = 17.4;
SELECT * FROM Asteroids WHERE Velocity = 16.9;
SELECT * FROM Asteroids WHERE Velocity = 17.1;
SELECT * FROM Asteroids WHERE Velocity = 17.3;
SELECT * FROM Asteroids WHERE Velocity = 18.1;
SELECT * FROM Asteroids WHERE Velocity = 18.6;
SELECT * FROM Asteroids WHERE Velocity = 19.0;
SELECT * FROM Asteroids WHERE Velocity = 17.6;
SELECT * FROM Asteroids WHERE Velocity = 17.8;
SELECT * FROM Asteroids WHERE Velocity = 13.1;
SELECT * FROM Asteroids WHERE Velocity = 13.4;
SELECT * FROM Asteroids WHERE Velocity = 17.7;
SELECT * FROM Asteroids WHERE Velocity = 13.5;
SELECT * FROM Asteroids WHERE Velocity = 24.3;
SELECT * FROM Asteroids WHERE Velocity = 19.0;
SELECT * FROM Asteroids WHERE Closest_Approach_To_Earth = 262000000;
SELECT * FROM Asteroids WHERE Closest_Approach_To_Earth = 177000000;
SELECT * FROM Asteroids WHERE Closest_Approach_To_Earth = 204000000;
SELECT * FROM Asteroids WHERE Closest_Approach_To_Earth = 290000000;
SELECT * FROM Asteroids WHERE Closest_Approach_To_Earth = 310000000;
SELECT * FROM Asteroids WHERE Closest_Approach_To_Earth = 330000000;
SELECT * FROM Asteroids WHERE Closest_Approach_To_Earth = 300000000;
SELECT * FROM Asteroids WHERE Closest_Approach_To_Earth = 280000000;
SELECT * FROM Asteroids WHERE Closest_Approach_To_Earth = 275000000;
SELECT * FROM Asteroids WHERE Closest_Approach_To_Earth = 250000000;
SELECT * FROM Asteroids WHERE Closest_Approach_To_Earth = 220000000;
SELECT * FROM Asteroids WHERE Closest_Approach_To_Earth = 210000000;
SELECT * FROM Asteroids WHERE Closest_Approach_To_Earth = 260000000;
SELECT * FROM Asteroids WHERE Closest_Approach_To_Earth = 240000000;
SELECT * FROM Asteroids WHERE Closest_Approach_To_Earth = 627000000;
SELECT * FROM Asteroids WHERE Closest_Approach_To_Earth = 628000000;
SELECT * FROM Asteroids WHERE Closest_Approach_To_Earth = 108000000;
SELECT * FROM Asteroids WHERE Closest_Approach_To_Earth = 343000000;
SELECT * FROM Asteroids WHERE Closest_Approach_To_Earth = 22000000;
SELECT * FROM Asteroids WHERE Closest_Approach_To_Earth = 2000000;
SELECT * FROM Satellites WHERE Launch_Date = '1957-10-04';
SELECT * FROM Satellites WHERE Launch_Date = '1958-02-01';
SELECT * FROM Satellites WHERE Launch_Date = '1962-07-10';
SELECT * FROM Satellites WHERE Launch_Date = '1965-04-06';
SELECT * FROM Satellites WHERE Launch_Date = '1978-02-22';
SELECT * FROM Satellites WHERE Launch_Date = '1990-04-24';
SELECT * FROM Satellites WHERE Launch_Date = '1998-11-20';
SELECT * FROM Satellites WHERE Launch_Date = '1997-05-05';
SELECT * FROM Satellites WHERE Launch_Date = '1972-07-23';
SELECT * FROM Satellites WHERE Launch_Date = '1975-10-16';
SELECT * FROM Satellites WHERE Launch_Date = '1986-02-22';
SELECT * FROM Satellites WHERE Launch_Date = '1991-07-17';
SELECT * FROM Satellites WHERE Launch_Date = '2002-03-01';
SELECT * FROM Satellites WHERE Launch_Date = '1999-12-18';
SELECT * FROM Satellites WHERE Launch_Date = '2002-05-04';
SELECT * FROM Satellites WHERE Launch_Date = '2001-12-07';
SELECT * FROM Satellites WHERE Launch_Date = '2010-04-08';
SELECT * FROM Satellites WHERE Launch_Date = '2014-04-03';
SELECT * FROM Satellites WHERE Launch_Date = '2019-05-24';
SELECT * FROM Satellites WHERE Launch_Date = '2019-02-28';
SELECT * FROM Satellites WHERE Name = 'Sputnik 1';
SELECT * FROM Satellites WHERE Name = 'Explorer 1';
SELECT * FROM Satellites WHERE Name = 'Telstar 1';
SELECT * FROM Satellites WHERE Name = 'Intelsat I';
SELECT * FROM Satellites WHERE Name = 'GPS-1';
SELECT * FROM Satellites WHERE Name = 'Hubble Space Telescope';
SELECT * FROM Satellites WHERE Name = 'International Space Station';
SELECT * FROM Satellites WHERE Name = 'Iridium 1';
SELECT * FROM Satellites WHERE Name = 'Landsat 1';
SELECT * FROM Satellites WHERE Name = 'GOES 1';
SELECT * FROM Satellites WHERE Name = 'SPOT 1';
SELECT * FROM Satellites WHERE Name = 'ERS 1';
SELECT * FROM Satellites WHERE Name = 'Envisat';
SELECT * FROM Satellites WHERE Name = 'Terra';
SELECT * FROM Satellites WHERE Name = 'Aqua';
SELECT * FROM Satellites WHERE Name = 'Jason-1';
SELECT * FROM Satellites WHERE Name = 'CryoSat-2';
SELECT * FROM Satellites WHERE Name = 'Sentinel-1A';
SELECT * FROM Satellites WHERE Name = 'Starlink-1';
SELECT * FROM Satellites WHERE Name = 'OneWeb-1';
SELECT * FROM Satellites WHERE Type = 'Scientific';
SELECT * FROM Satellites WHERE Type = 'Communication';
SELECT * FROM Satellites WHERE Type = 'Navigation';
SELECT * FROM Satellites WHERE Type = 'Space Station';
SELECT * FROM Satellites WHERE Type = 'Earth Observation';
SELECT * FROM Satellites WHERE Type = 'Weather';
SELECT * FROM Satellites WHERE Type = 'Oceanography';
SELECT * FROM Satellites WHERE Orbit_Type = 'Low Earth Orbit';
SELECT * FROM Satellites WHERE Orbit_Type = 'Medium Earth Orbit';
SELECT * FROM Satellites WHERE Orbit_Type = 'Geostationary Orbit';
SELECT * FROM Satellites WHERE Orbit_Type = 'Sun-synchronous orbit';
SELECT * FROM Satellites WHERE Operator = 'USSR';
SELECT * FROM Satellites WHERE Operator = 'USA';
SELECT * FROM Satellites WHERE Operator = 'Intelsat';
SELECT * FROM Satellites WHERE Operator = 'NASA/ESA';
SELECT * FROM Satellites WHERE Operator = 'International';
SELECT * FROM Satellites WHERE Operator = 'Iridium';
SELECT * FROM Satellites WHERE Operator = 'France';
SELECT * FROM Satellites WHERE Operator = 'ESA';
SELECT * FROM Satellites WHERE Operator = 'SpaceX';
SELECT * FROM Satellites WHERE Operator = 'OneWeb';
SELECT * FROM Satellites WHERE Status = 'Decommissioned';
SELECT * FROM Satellites WHERE Status = 'Active';
SELECT * FROM Comets WHERE Name LIKE '%Halley%';
SELECT * FROM Comets WHERE Name LIKE '%Hale-Bopp%';
SELECT * FROM Comets WHERE Name LIKE '%Hyakutake%';
SELECT * FROM Comets WHERE Name LIKE '%Wild 2%';
SELECT * FROM Comets WHERE Name LIKE '%Tempel 1%';
SELECT * FROM Comets WHERE Name LIKE '%Borrelly%';
SELECT * FROM Comets WHERE Name LIKE '%Encke%';
SELECT * FROM Comets WHERE Name LIKE '%Swift-Tuttle%';
SELECT * FROM Comets WHERE Name LIKE '%Shoemaker-Levy 9%';
SELECT * FROM Comets WHERE Name LIKE '%ISON%';
SELECT * FROM Comets WHERE Name LIKE '%Lovejoy%';
SELECT * FROM Comets WHERE Name LIKE '%McNaught%';
SELECT * FROM Comets WHERE Name LIKE '%Holmes%';
SELECT * FROM Comets WHERE Name LIKE '%LINEAR%';
SELECT * FROM Comets WHERE Name LIKE '%C/1995 O1%'; -- for 'Hale-Bopp (C/1995 O1)'
SELECT * FROM Comets WHERE Name LIKE '%C/1996 B2%'; -- for 'Hyakutake (C/1996 B2)'
SELECT * FROM Comets WHERE Name LIKE '%D/1993 E1%'; -- for 'Shoemaker-Levy 9 (D/1993 E1)'
SELECT * FROM Comets WHERE Name LIKE '%9P%';        -- for 'Tempel 1 (9P)'
SELECT * FROM Comets WHERE Name LIKE '%81P%';       -- for 'Wild 2 (81P)'
SELECT * FROM Comets WHERE Name LIKE '%19P%';       -- for 'Borrelly (19P)'
SELECT * FROM SpaceStations WHERE Name LIKE '%Salyut 1%';
SELECT * FROM SpaceStations WHERE Name LIKE '%Skylab%';
SELECT * FROM SpaceStations WHERE Name LIKE '%Mir%';
SELECT * FROM SpaceStations WHERE Name LIKE '%International Space Station%';
SELECT * FROM SpaceStations WHERE Name LIKE '%Tiangong-1%';
SELECT * FROM SpaceStations WHERE Name LIKE '%Tiangong-2%';
SELECT * FROM SpaceStations WHERE Name LIKE '%Tiangong Space Station%';
SELECT * FROM SpaceStations WHERE Name LIKE '%Almaz 1%';
SELECT * FROM SpaceStations WHERE Name LIKE '%Almaz 2%';
SELECT * FROM SpaceStations WHERE Name LIKE '%Salyut 2%';
SELECT * FROM SpaceStations WHERE Name LIKE '%Salyut 3%';
SELECT * FROM SpaceStations WHERE Name LIKE '%Salyut 4%';
SELECT * FROM SpaceStations WHERE Name LIKE '%Salyut 5%';
SELECT * FROM SpaceStations WHERE Name LIKE '%Salyut 6%';
SELECT * FROM SpaceStations WHERE Name LIKE '%Salyut 7%';
SELECT * FROM SpaceStations WHERE Name LIKE '%Space Station Freedom%';
SELECT * FROM SpaceStations WHERE Name LIKE '%Columbus Orbital Facility%';
SELECT * FROM SpaceStations WHERE Name LIKE '%Zvezda Service Module%';
SELECT * FROM SpaceStations WHERE Name LIKE '%Zarya Functional Cargo Block%';
SELECT * FROM SpaceStations WHERE Name LIKE '%Unity Node 1%';
SELECT * FROM StarSystems WHERE Name LIKE '%Sol%';
SELECT * FROM StarSystems WHERE Name LIKE '%Alpha Centauri%';
SELECT * FROM StarSystems WHERE Name LIKE '%Sirius%';
SELECT * FROM StarSystems WHERE Name LIKE '%Proxima Centauri%';
SELECT * FROM StarSystems WHERE Name LIKE '%Vega%';
SELECT * FROM StarSystems WHERE Name LIKE '%Betelgeuse System%';
SELECT * FROM StarSystems WHERE Name LIKE '%Rigel System%';
SELECT * FROM StarSystems WHERE Name LIKE '%Arcturus System%';
SELECT * FROM StarSystems WHERE Name LIKE '%Pollux System%';
SELECT * FROM StarSystems WHERE Name LIKE '%Altair System%';
SELECT * FROM StarSystems WHERE Name LIKE '%Deneb System%';
SELECT * FROM StarSystems WHERE Name LIKE '%Antares System%';
SELECT * FROM StarSystems WHERE Name LIKE '%Fomalhaut System%';
SELECT * FROM StarSystems WHERE Name LIKE '%Canopus System%';
SELECT * FROM StarSystems WHERE Name LIKE '%Achernar System%';
SELECT * FROM StarSystems WHERE Name LIKE '%Spica System%';
SELECT * FROM StarSystems WHERE Name LIKE '%Mimosa System%';
SELECT * FROM StarSystems WHERE Name LIKE '%Regulus System%';
SELECT * FROM StarSystems WHERE Name LIKE '%Acrux System%';
SELECT * FROM StarSystems WHERE Name LIKE '%Gacrux System%';
use COSMIC;
SELECT 
    Moons.Name AS Moon_Name,
    Planets.Name AS Planet_Name
FROM 
    Moons
JOIN 
    Planets ON Moons.Planet_ID = Planets.Planet_ID;
    
    INSERT INTO Planets (Planet_ID, Name, Star_ID, Type, Atmosphere, Distance_From_Star, Orbital_Period, Surface_Temperature) VALUES
(21, 'Mercury', 1, 'Terrestrial', FALSE, 0.39, 88, 440),
(22, 'Venus', 1, 'Terrestrial', TRUE, 0.72, 224.7, 737),
(23, 'Saturn', 1, 'Gas Giant', TRUE, 9.58, 10759, 134),
(24, 'Uranus', 1, 'Ice Giant', TRUE, 19.2, 30685, 76),
(25, 'Neptune', 1, 'Ice Giant', TRUE, 30.1, 60190, 72);
INSERT INTO Galaxies (Galaxy_ID, Name, Type, Distance_From_Earth, Number_Of_Stars, Discovery_Date) VALUES
(21, 'NGC 253', 'Spiral', 3.9, 10000000000, '1783-01-01'),
(22, 'NGC 224', 'Spiral', 2.537, 1000000000000, '1784-01-01'),
(23, 'NGC 1300', 'Barred Spiral', 6.1, 40000000000, '1835-10-10'),
(24, 'NGC 6946', 'Spiral', 5.0, 10000000000, '1826-07-10'),
(25, 'NGC 3031', 'Spiral', 2.5, 80000000000, '1771-01-01'),
(26, 'NGC 1365', 'Barred Spiral', 5.0, 30000000000, '1835-02-14'),
(27, 'NGC 4631', 'Spiral', 7.0, 20000000000, '1787-04-22'),
(28, 'NGC 4565', 'Edge-on Spiral', 3.6, 15000000000, '1829-04-15'),
(29, 'NGC 3256', 'Interacting', 35, 20000000000, '1994-06-07'),
(30, 'NGC 925', 'Spiral', 8.0, 50000000000, '1880-01-01'),
(31, 'NGC 6744', 'Spiral', 8.0, 40000000000, '1826-02-01'),
(32, 'NGC 2237', 'Emission Nebula', 2.6, 3000000000, '1785-12-01'),
(33, 'NGC 4395', 'Spiral', 7.0, 20000000000, '1800-01-01'),
(34, 'NGC 3370', 'Spiral', 9.5, 15000000000, '1780-01-01'),
(35, 'NGC 7626', 'Elliptical', 15.2, 10000000000, '1820-06-15'),
(36, 'NGC 660', 'Elliptical', 3.2, 1000000000, '1828-01-01'),
(37, 'NGC 1097', 'Barred Spiral', 6.5, 15000000000, '1851-05-17'),
(38, 'NGC 3359', 'Spiral', 7.0, 50000000000, '1793-09-10'),
(39, 'NGC 4100', 'Spiral', 12.0, 25000000000, '1790-12-01'),
(40, 'NGC 4656', 'Spiral', 10.5, 10000000000, '1782-08-29');
INSERT INTO Galaxies (Galaxy_ID, Name, Type, Distance_From_Earth, Number_Of_Stars, Discovery_Date) VALUES
(41, 'NGC 5585', 'Spiral', 8.3, 10000000000, '1788-06-20'),
(42, 'NGC 5643', 'Spiral', 9.0, 12000000000, '1825-02-15'),
(43, 'NGC 6907', 'Barred Spiral', 12.0, 20000000000, '1780-01-01'),
(44, 'NGC 2841', 'Spiral', 4.0, 90000000000, '1780-10-10'),
(45, 'NGC 7321', 'Spiral', 13.0, 80000000000, '1826-09-12'),
(46, 'NGC 5597', 'Barred Spiral', 15.0, 10000000000, '1812-04-09'),
(47, 'NGC 7591', 'Spiral', 9.0, 15000000000, '1785-05-12'),
(48, 'NGC 4438', 'Spiral', 6.2, 40000000000, '1790-07-20'),
(49, 'NGC 5457', 'Spiral', 6.3, 10000000000, '1794-08-11'),
(50, 'NGC 7720', 'Elliptical', 11.0, 1000000000, '1830-09-15'),
(51, 'NGC 7768', 'Elliptical', 12.5, 10000000000, '1821-07-20'),
(52, 'NGC 1169', 'Spiral', 7.0, 40000000000, '1810-01-01'),
(53, 'NGC 3198', 'Spiral', 8.2, 20000000000, '1795-06-05'),
(54, 'NGC 3190', 'Spiral', 9.2, 15000000000, '1789-09-03'),
(55, 'NGC 5371', 'Spiral', 6.5, 50000000000, '1791-12-11'),
(56, 'NGC 5333', 'Spiral', 5.4, 25000000000, '1824-02-21'),
(57, 'NGC 4657', 'Irregular', 10.5, 3000000000, '1873-05-09'),
(58, 'NGC 7070', 'Spiral', 9.5, 10000000000, '1860-03-12'),
(59, 'NGC 3504', 'Spiral', 8.2, 60000000000, '1792-06-17'),
(60, 'NGC 4945', 'Spiral', 4.0, 12000000000, '1786-07-21');
INSERT INTO Stars (Star_ID, Name, Galaxy_ID, Type, Mass, Luminosity, Temperature, Age) VALUES
(21, 'Alpha Centauri B', 2, 'K1V', 0.93, 0.5, 5260, 6400),
(22, 'Sirius B', 2, 'DA2', 1.0, 0.025, 25000, 120),
(23, 'Procyon A', 2, 'F5IV-V', 1.497, 6.0, 6500, 2200),
(24, 'Altair', 2, 'A7V', 1.79, 10.6, 8500, 1200),
(25, 'Arcturus', 3, 'K1.5III', 1.08, 170, 4286, 7100),
(26, 'Betelgeuse', 3, 'M2Iab', 11.6, 126000, 3500, 8),
(27, 'Capella', 3, 'G8III', 2.56, 77, 4800, 650),
(28, 'Aldebaran', 3, 'K5III', 1.5, 430, 4260, 6500),
(29, 'Rigel', 4, 'B8Ia', 23, 120000, 12100, 8),
(30, 'Spica', 4, 'B1V', 11, 20500, 22400, 20),
(31, 'Canopus', 5, 'F0Ib', 8, 10700, 7350, 25),
(32, 'Achernar', 5, 'B6Ve', 6.7, 3150, 15000, 63),
(33, 'Fomalhaut', 6, 'A3V', 1.92, 16.6, 8590, 440),
(34, 'Deneb', 6, 'A2Ia', 19, 196000, 8525, 10),
(35, 'Antares', 7, 'M1.5Iab-Ib', 12.4, 57500, 3570, 12),
(36, 'Mimosa', 7, 'B0.5III', 16, 34000, 25000, 12),
(37, 'Regulus', 8, 'B7V', 3.5, 140, 12460, 1000),
(38, 'Acrux', 8, 'B0.5IV', 18, 25000, 28000, 8),
(39, 'Gacrux', 9, 'M3.5III', 1.5, 1500, 3626, 390),
(40, 'Alnair', 9, 'B8III', 6.4, 10000, 20000, 120),
(41, 'Mirfak', 10, 'F5Ib', 7.5, 10000, 5000, 1300),
(42, 'Alfirk', 10, 'B3IV', 4.0, 670, 21000, 170),
(43, 'Zeta Tauri', 11, 'G8III', 2.4, 5.0, 5180, 4000),
(44, 'Beta Centauri', 11, 'B1IV', 10, 12000, 23500, 80),
(45, 'Phecda', 12, 'G3III', 2.7, 4.5, 4600, 7000),
(46, 'Alsephina', 12, 'A1V', 3.5, 22.0, 14500, 700),
(47, 'Kappa Ceti', 13, 'K2III', 2.3, 29, 4550, 9000),
(48, 'Delta Cygni', 13, 'G6IV', 2.0, 0.8, 5430, 1200),
(49, 'Algedi', 14, 'G8III', 2.4, 24.5, 4850, 4200),
(50, 'Epsilon Lyrae', 14, 'A0V', 3.2, 22.5, 8600, 450),
(51, 'Kappa Andromedae', 15, 'A5V', 1.9, 8.0, 8700, 3000),
(52, 'Lambda Serpentis', 15, 'K0III', 1.5, 2.5, 4820, 2000),
(53, 'Omega Centauri', 16, 'G3III', 3.0, 9.5, 5050, 900),
(54, 'Alpha Leo', 16, 'B2IV', 4.5, 11.3, 15000, 130),
(55, 'Kappa Arietis', 17, 'F0V', 2.7, 22, 7750, 1800),
(56, 'Gamma Leporis', 17, 'G8III', 2.6, 5.0, 5200, 1000),
(57, 'Rho Cassiopeiae', 18, 'M5Ia', 15.3, 35000, 3100, 5),
(58, 'Beta Crateris', 18, 'A9III', 1.3, 20, 7100, 2100),
(59, 'Sigma Octantis', 19, 'G3III', 2.2, 3.0, 4950, 4000),
(60, 'Tau Ceti', 19, 'G8V', 0.78, 0.53, 5200, 7000),
(61, 'Delta Eridani', 20, 'K3III', 2.2, 8.4, 4800, 1600),
(62, 'Zeta Horologii', 20, 'F8V', 2.8, 19.0, 6600, 2600),
(63, 'Theta Canis Majoris', 21, 'G2III', 1.1, 22.0, 5700, 4000),
(64, 'Upsilon Cassiopeiae', 21, 'A3V', 2.3, 13.6, 10200, 2300),
(65, 'Alpha Scorpii', 22, 'B2IV', 10.5, 46000, 22000, 80),
(66, 'Beta Hydri', 22, 'F5V', 1.5, 8.0, 6300, 1300),
(67, 'Gamma Pegasi', 23, 'B2V', 5.0, 45000, 24000, 90),
(68, 'Delta Cancri', 23, 'G7V', 1.0, 0.5, 5800, 5200),
(69, 'Omega Leonis', 24, 'M2III', 3.1, 7.6, 3500, 2500),
(70, 'Epsilon Virginis', 24, 'G8III', 2.5, 16.8, 4800, 3400),
(71, 'Nu Draconis', 25, 'F2V', 3.0, 25.4, 7150, 2000),
(72, 'Mu Aquilae', 25, 'K3III', 2.3, 18.4, 4550, 3600),
(73, 'Zeta Lyrae', 26, 'A4V', 2.6, 27.0, 9300, 1300),
(74, 'Sigma Tauri', 26, 'F1V', 1.7, 6.5, 7800, 2900),
(75, 'Iota Geminorum', 27, 'A0V', 3.3, 31.0, 10500, 700),
(76, 'Kappa Persei', 27, 'B5V', 6.1, 23.5, 13500, 120),
(77, 'Delta Lyrae', 28, 'K5III', 1.2, 5.0, 4200, 3700),
(78, 'Alpha Aurigae', 28, 'B1III', 11.0, 30000, 23000, 40),
(79, 'Gamma Bootis', 29, 'A2V', 2.8, 16.8, 10200, 1500),
(80, 'Lambda Corvi', 29, 'M5.5III', 2.3, 19.5, 3300, 2500),
(81, 'Eta Lyrae', 30, 'G8III', 1.9, 5.8, 4750, 3700),
(82, 'Beta Ceti', 30, 'F0V', 1.4, 8.9, 6800, 2700),
(83, 'Zeta Pavonis', 31, 'B1IV', 8.0, 6000, 13000, 50),
(84, 'Theta Sagittarii', 31, 'A1V', 3.5, 18.0, 10200, 1200),
(85, 'Rho Cygni', 32, 'F5V', 1.9, 8.3, 6150, 2100),
(86, 'Xi Orionis', 32, 'K0III', 2.7, 15.0, 4850, 4200),
(87, 'Lambda Arae', 33, 'B9V', 4.0, 35000, 25000, 100),
(88, 'Theta Eridani', 33, 'A4III', 2.5, 15.5, 8800, 3200),
(89, 'Mu Centauri', 34, 'G5III', 2.0, 2.3, 5500, 2700),
(90, 'Delta Ursa Majoris', 34, 'F6V', 2.3, 12.3, 6700, 1900),
(91, 'Gamma Cephei', 35, 'G5V', 1.5, 2.4, 5850, 4500),
(92, 'Zeta Andromedae', 35, 'F9V', 2.8, 19.7, 7200, 2300),
(93, 'Tau Scorpii', 36, 'K4III', 3.2, 18.0, 4100, 3900),
(94, 'Beta Delphini', 36, 'A6V', 2.0, 10.5, 7600, 1600),
(95, 'Alpha Lupi', 37, 'F4V', 1.3, 8.9, 7100, 2600),
(96, 'Gamma Leonis', 37, 'M3III', 1.5, 0.6, 3800, 5100),
(97, 'Zeta Hydrae', 38, 'A7V', 3.6, 5.6, 8500, 1200),
(98, 'Kappa Pegasi', 38, 'B3V', 5.3, 35000, 22000, 90),
(99, 'Rho Hydrae', 39, 'G3V', 1.0, 3.1, 5600, 3700),
(100, 'Nu Geminorum', 39, 'F9V', 1.1, 4.2, 6700, 4100);
select *from galaxies;
INSERT INTO Galaxies (Galaxy_ID, Name, Type, Distance_From_Earth, Number_Of_Stars, Discovery_Date) VALUES
(61, 'NGC 1300', 'Barred Spiral', 6.1, 40000000000, '1835-10-10'),
(62, 'NGC 4647', 'Spiral', 9.5, 50000000000, '1824-05-09'),
(63, 'NGC 5055', 'Spiral', 10.5, 60000000000, '1833-03-05'),
(64, 'NGC 604', 'H II Region', 1.6, 3000000000, '1825-09-12'),
(65, 'NGC 2537', 'Irregular', 8.5, 10000000000, '1875-01-01'),
(66, 'NGC 6946', 'Spiral', 22.6, 70000000000, '1826-01-01'),
(67, 'NGC 1068', 'Spiral', 47.0, 40000000000, '1780-01-01'),
(68, 'NGC 7331', 'Spiral', 40.5, 20000000000, '1787-01-01'),
(69, 'NGC 2451', 'Spiral', 19.2, 10000000000, '1824-02-10'),
(70, 'NGC 1060', 'Elliptical', 10.3, 2000000000, '1820-03-04'),
(71, 'NGC 6240', 'Interacting', 450, 40000000000, '1947-01-01'),
(72, 'NGC 7320', 'Spiral', 10.1, 50000000000, '1826-07-14'),
(73, 'NGC 4594', 'Spiral', 28.0, 100000000000, '1798-12-14'),
(74, 'NGC 7009', 'Spiral', 13.3, 70000000000, '1846-01-01'),
(75, 'NGC 1055', 'Elliptical', 52.6, 5000000000, '1791-01-01'),
(76, 'NGC 5266', 'Spiral', 11.4, 15000000000, '1850-01-01'),
(77, 'NGC 4622', 'Barred Spiral', 12.3, 30000000000, '1793-12-22'),
(78, 'NGC 4233', 'Spiral', 15.8, 50000000000, '1815-01-01'),
(79, 'NGC 612', 'Spiral', 19.4, 10000000000, '1783-01-01'),
(80, 'NGC 1700', 'Elliptical', 25.7, 4000000000, '1796-01-01'),
(81, 'NGC 4562', 'Elliptical', 22.8, 10000000000, '1790-01-01'),
(82, 'NGC 5139', 'Spiral', 17.6, 20000000000, '1820-01-01'),
(83, 'NGC 5347', 'Spiral', 14.3, 30000000000, '1833-03-07'),
(84, 'NGC 3031', 'Spiral', 2.5, 80000000000, '1771-01-01'),
(85, 'NGC 2835', 'Spiral', 22.8, 60000000000, '1822-01-01'),
(86, 'NGC 7000', 'Emission Nebula', 1.5, 3000000000, '1786-02-10'),
(87, 'NGC 2525', 'Spiral', 15.3, 50000000000, '1800-01-01'),
(88, 'NGC 4596', 'Spiral', 10.2, 40000000000, '1821-06-01'),
(89, 'NGC 5005', 'Spiral', 30.8, 30000000000, '1840-01-01'),
(90, 'NGC 4725', 'Barred Spiral', 15.6, 40000000000, '1792-01-01'),
(91, 'NGC 3242', 'Planetary Nebula', 1.5, 1000000000, '1780-01-01'),
(92, 'NGC 5485', 'Spiral', 16.3, 20000000000, '1815-03-14'),
(93, 'NGC 5311', 'Spiral', 20.0, 50000000000, '1794-10-10'),
(94, 'NGC 1345', 'Spiral', 20.8, 15000000000, '1799-01-02'),
(95, 'NGC 2220', 'Elliptical', 18.1, 1000000000, '1791-01-01'),
(96, 'NGC 2146', 'Spiral', 27.5, 10000000000, '1799-11-10'),
(97, 'NGC 3825', 'Spiral', 14.0, 40000000000, '1804-01-01'),
(98, 'NGC 4111', 'Spiral', 11.2, 50000000000, '1822-04-11'),
(99, 'NGC 147', 'Elliptical', 2.5, 1000000000, '1825-01-01'),
(100, 'NGC 5170', 'Spiral', 10.3, 20000000000, '1805-01-01');
INSERT INTO Galaxies (Galaxy_ID, Name, Type, Distance_From_Earth, Number_Of_Stars, Discovery_Date) VALUES
(101, 'NGC 5033', 'Spiral', 19.1, 80000000000, '1799-01-01'),
(102, 'NGC 4437', 'Spiral', 8.6, 30000000000, '1827-03-01'),
(103, 'NGC 5134', 'Spiral', 13.8, 40000000000, '1807-05-12'),
(104, 'NGC 4065', 'Spiral', 16.1, 30000000000, '1816-01-01'),
(105, 'NGC 5486', 'Spiral', 14.5, 20000000000, '1829-01-01'),
(106, 'NGC 4676', 'Interacting', 45.6, 10000000000, '1951-01-01'),
(107, 'NGC 6703', 'Spiral', 12.4, 60000000000, '1823-06-15'),
(108, 'NGC 6791', 'Spiral', 8.5, 10000000000, '1811-01-01'),
(109, 'NGC 3992', 'Spiral', 6.7, 70000000000, '1793-02-05'),
(110, 'NGC 4851', 'Elliptical', 40.2, 1000000000, '1840-01-01'),
(111, 'NGC 4461', 'Elliptical', 15.8, 2000000000, '1795-01-01'),
(112, 'NGC 4258', 'Spiral', 7.4, 80000000000, '1780-01-01'),
(113, 'NGC 4151', 'Spiral', 15.0, 10000000000, '1786-07-20'),
(114, 'NGC 2539', 'Spiral', 8.7, 60000000000, '1788-03-02'),
(115, 'NGC 3147', 'Spiral', 12.3, 50000000000, '1824-01-18'),
(116, 'NGC 2276', 'Spiral', 6.5, 30000000000, '1821-05-05'),
(117, 'NGC 3597', 'Spiral', 8.0, 40000000000, '1790-02-14'),
(118, 'NGC 6166', 'Elliptical', 47.2, 10000000000, '1829-01-05'),
(119, 'NGC 5084', 'Elliptical', 41.7, 2000000000, '1814-02-10'),
(120, 'NGC 6340', 'Spiral', 20.0, 60000000000, '1792-07-03'),
(121, 'NGC 3379', 'Elliptical', 11.5, 3000000000, '1783-09-21'),
(122, 'NGC 4321', 'Spiral', 15.7, 70000000000, '1801-06-15'),
(123, 'NGC 5731', 'Elliptical', 39.5, 2000000000, '1812-10-12'),
(124, 'NGC 5548', 'Spiral', 18.3, 50000000000, '1793-01-01'),
(125, 'NGC 3034', 'Spiral', 7.5, 40000000000, '1834-03-02'),
(126, 'NGC 5898', 'Spiral', 10.0, 60000000000, '1835-04-01'),
(127, 'NGC 4377', 'Spiral', 17.2, 70000000000, '1789-12-07'),
(128, 'NGC 5529', 'Spiral', 12.8, 30000000000, '1798-11-29'),
(129, 'NGC 5474', 'Irregular', 3.5, 20000000000, '1791-10-16'),
(130, 'NGC 5660', 'Spiral', 10.7, 50000000000, '1797-02-10'),
(131, 'NGC 4117', 'Spiral', 8.2, 30000000000, '1824-06-17'),
(132, 'NGC 5044', 'Spiral', 6.5, 50000000000, '1799-11-14'),
(133, 'NGC 3893', 'Spiral', 5.3, 20000000000, '1826-04-01'),
(134, 'NGC 5363', 'Spiral', 20.3, 70000000000, '1811-06-11'),
(135, 'NGC 4536', 'Spiral', 10.5, 40000000000, '1796-01-01'),
(136, 'NGC 4373', 'Spiral', 17.1, 30000000000, '1809-12-01'),
(137, 'NGC 4700', 'Spiral', 14.0, 50000000000, '1820-03-25'),
(138, 'NGC 5410', 'Spiral', 22.0, 10000000000, '1785-09-15'),
(139, 'NGC 6411', 'Elliptical', 19.5, 2000000000, '1828-11-04'),
(140, 'NGC 6771', 'Elliptical', 21.4, 1000000000, '1807-10-22'),
(141, 'NGC 3593', 'Spiral', 15.5, 40000000000, '1825-03-12'),
(142, 'NGC 5560', 'Spiral', 19.0, 50000000000, '1789-11-12'),
(143, 'NGC 3289', 'Spiral', 18.2, 20000000000, '1820-05-14'),
(144, 'NGC 4936', 'Spiral', 14.9, 60000000000, '1800-07-01'),
(145, 'NGC 5189', 'Planetary Nebula', 2.4, 1000000000, '1793-09-01'),
(146, 'NGC 4900', 'Elliptical', 17.6, 1000000000, '1817-04-15'),
(147, 'NGC 5506', 'Spiral', 10.2, 70000000000, '1792-12-08'),
(148, 'NGC 4636', 'Elliptical', 23.3, 10000000000, '1824-06-15'),
(149, 'NGC 4178', 'Spiral', 9.4, 40000000000, '1809-04-12'),
(150, 'NGC 3455', 'Spiral', 7.3, 20000000000, '1820-09-23'),
(151, 'NGC 5866', 'Spiral', 12.5, 60000000000, '1785-03-04'),
(152, 'NGC 3190', 'Spiral', 8.8, 40000000000, '1792-06-16'),
(153, 'NGC 3546', 'Spiral', 14.4, 50000000000, '1807-08-12'),
(154, 'NGC 4725', 'Barred Spiral', 9.3, 30000000000, '1795-02-11'),
(155, 'NGC 6496', 'Spiral', 12.9, 10000000000, '1796-11-23'),
(156, 'NGC 5383', 'Spiral', 17.1, 40000000000, '1825-04-01'),
(157, 'NGC 3169', 'Spiral', 8.7, 30000000000, '1819-01-20'),
(158, 'NGC 4504', 'Spiral', 10.1, 20000000000, '1799-02-12'),
(159, 'NGC 3351', 'Spiral', 11.2, 50000000000, '1827-03-03'),
(160, 'NGC 4945', 'Spiral', 13.3, 30000000000, '1820-10-10'),
(161, 'NGC 5662', 'Spiral', 15.1, 40000000000, '1833-05-14'),
(162, 'NGC 5030', 'Spiral', 10.8, 60000000000, '1827-11-10'),
(163, 'NGC 5829', 'Spiral', 16.6, 50000000000, '1812-01-14'),
(164, 'NGC 5426', 'Spiral', 11.4, 70000000000, '1787-01-14'),
(165, 'NGC 3377', 'Elliptical', 17.3, 10000000000, '1812-05-14'),
(166, 'NGC 3576', 'Spiral', 8.6, 30000000000, '1808-03-02'),
(167, 'NGC 4062', 'Spiral', 12.2, 40000000000, '1821-02-14'),
(168, 'NGC 6800', 'Spiral', 13.4, 60000000000, '1793-03-10'),
(169, 'NGC 4826', 'Spiral', 7.1, 80000000000, '1827-07-15'),
(170, 'NGC 6064', 'Spiral', 14.2, 50000000000, '1798-05-10'),
(171, 'NGC 3443', 'Elliptical', 18.7, 1000000000, '1797-04-10'),
(172, 'NGC 4169', 'Spiral', 12.8, 30000000000, '1801-09-01'),
(173, 'NGC 3344', 'Spiral', 10.9, 40000000000, '1829-06-04'),
(174, 'NGC 6221', 'Spiral', 9.7, 30000000000, '1825-04-03'),
(175, 'NGC 6637', 'Spiral', 12.9, 20000000000, '1795-09-07'),
(176, 'NGC 5557', 'Spiral', 16.0, 60000000000, '1831-06-12'),
(177, 'NGC 3423', 'Spiral', 18.9, 40000000000, '1793-02-03'),
(178, 'NGC 4736', 'Spiral', 15.7, 30000000000, '1811-10-16'),
(179, 'NGC 5519', 'Spiral', 14.3, 20000000000, '1824-09-15'),
(180, 'NGC 3480', 'Spiral', 13.2, 50000000000, '1805-08-04'),
(181, 'NGC 4204', 'Spiral', 11.7, 40000000000, '1827-01-03'),
(182, 'NGC 5559', 'Spiral', 7.8, 60000000000, '1800-07-21'),
(183, 'NGC 6155', 'Spiral', 9.5, 30000000000, '1819-09-14'),
(184, 'NGC 6400', 'Spiral', 12.1, 50000000000, '1796-01-18'),
(185, 'NGC 6792', 'Elliptical', 19.7, 10000000000, '1801-12-10'),
(186, 'NGC 3195', 'Elliptical', 10.2, 1000000000, '1792-04-10'),
(187, 'NGC 5535', 'Spiral', 18.1, 70000000000, '1830-06-06'),
(188, 'NGC 4839', 'Spiral', 14.7, 20000000000, '1821-08-11'),
(189, 'NGC 5005', 'Spiral', 15.6, 50000000000, '1830-04-02'),
(190, 'NGC 3744', 'Spiral', 7.2, 30000000000, '1820-12-13'),
(191, 'NGC 6822', 'Irregular', 1.6, 20000000000, '1836-01-01'),
(192, 'NGC 5279', 'Spiral', 12.0, 60000000000, '1798-11-12'),
(193, 'NGC 5937', 'Spiral', 17.3, 50000000000, '1822-07-19'),
(194, 'NGC 3368', 'Spiral', 20.6, 20000000000, '1810-11-11'),
(195, 'NGC 6140', 'Spiral', 18.0, 30000000000, '1797-12-03'),
(196, 'NGC 5011', 'Elliptical', 25.2, 10000000000, '1811-10-11'),
(197, 'NGC 5068', 'Spiral', 21.3, 50000000000, '1794-01-01'),
(198, 'NGC 4610', 'Spiral', 9.5, 30000000000, '1822-11-19'),
(199, 'NGC 4762', 'Spiral', 11.0, 40000000000, '1793-04-08'),
(200, 'NGC 5596', 'Spiral', 16.4, 50000000000, '1819-05-17');
INSERT INTO Stars (Star_ID, Name, Galaxy_ID, Type, Mass, Luminosity, Temperature, Age) VALUES
(101, 'Beta Orionis', 40, 'B8Ia', 21, 100000, 12600, 8),
(102, 'Gamma Ursa Majoris', 40, 'B8III', 5.0, 46000, 20000, 120),
(103, 'Delta Pegasi', 41, 'A0IV', 2.0, 15.0, 9700, 1500),
(104, 'Epsilon Orionis', 41, 'B1Ia', 25, 150000, 22000, 10),
(105, 'Alpha Capricorni', 42, 'F0V', 1.4, 11.0, 7000, 3000),
(106, 'Beta Lyrae', 42, 'A5V', 2.5, 22.0, 10500, 700),
(107, 'Kappa Pegasi', 43, 'G9V', 0.95, 0.5, 5300, 5100),
(108, 'Lambda Virginis', 43, 'A3IV', 1.9, 18.0, 8500, 2100),
(109, 'Mu Ceti', 44, 'F9V', 2.8, 17.0, 6900, 3300),
(110, 'Eta Scorpii', 44, 'B2IV', 6.0, 16000, 15000, 90),
(111, 'Phi Serpentis', 45, 'K1III', 1.3, 7.0, 4600, 5500),
(112, 'Theta Hydrae', 45, 'G6III', 1.8, 14.0, 5100, 4000),
(113, 'Alpha Tucanae', 46, 'B8V', 5.6, 20000, 14000, 100),
(114, 'Beta Leporis', 46, 'A3V', 3.4, 35.0, 9700, 1300),
(115, 'Delta Canis Majoris', 47, 'A2V', 3.2, 18.0, 10200, 2500),
(116, 'Alpha Draconis', 47, 'F7V', 1.2, 8.0, 5900, 3800),
(117, 'Gamma Tauri', 48, 'M5III', 1.6, 10.0, 3800, 3200),
(118, 'Zeta Lyrae', 48, 'F5V', 1.7, 8.6, 6300, 2200),
(119, 'Alpha Ceti', 49, 'F2V', 2.6, 19.0, 7500, 2900),
(120, 'Beta Arietis', 49, 'B5IV', 4.7, 48000, 28000, 120),
(121, 'Sigma Ophiuchi', 50, 'B3IV', 5.8, 53000, 22000, 70),
(122, 'Zeta Velorum', 52, 'G0V', 1.2, 1.1, 5750, 3000),
(123, 'Epsilon Canis Majoris', 53, 'A0V', 2.0, 17.5, 10200, 2500),
(124, 'Delta Scorpii', 53, 'F7V', 1.3, 6.8, 5800, 4200),
(125, 'Alpha Tucanae', 54, 'B1V', 5.8, 30000, 24000, 100),
(126, 'Beta Canis Majoris', 54, 'G5V', 1.0, 0.8, 5500, 4500),
(127, 'Gamma Lupi', 55, 'A3V', 2.4, 19.0, 8500, 2000),
(128, 'Delta Ophiuchi', 55, 'K5III', 1.3, 11.0, 4300, 5500),
(129, 'Zeta Cancri', 56, 'F2V', 1.8, 12.0, 7150, 2200),
(130, 'Eta Aurigae', 56, 'B2III', 10.1, 45000, 24000, 80),
(131, 'Alpha Piscis Austrini', 57, 'M4III', 1.8, 5.0, 3700, 2900),
(132, 'Beta Volantis', 57, 'A7V', 3.2, 19.0, 8300, 1800),
(133, 'Gamma Apodis', 58, 'F0V', 2.2, 15.0, 7400, 2600),
(134, 'Theta Hydrae', 58, 'B7IV', 6.0, 30000, 17500, 110),
(135, 'Xi Herculis', 59, 'F0IV', 3.0, 16.4, 7300, 2800),
(136, 'Lambda Scorpii', 59, 'K5III', 2.2, 14.0, 4100, 4500),
(137, 'Alpha Capricornus', 60, 'A0V', 3.3, 35.0, 9400, 1200),
(138, 'Beta Librae', 60, 'G7V', 1.1, 0.9, 5700, 5100),
(139, 'Delta Aquarii', 61, 'K0III', 2.6, 20.5, 4900, 4600),
(140, 'Gamma Hydrae', 61, 'B3V', 5.0, 48000, 21000, 80),
(141, 'Alpha Leporis', 62, 'G6V', 1.2, 1.2, 5450, 3700),
(142, 'Beta Hydrae', 62, 'A5IV', 2.4, 18.0, 10500, 1500),
(143, 'Omega Centauri', 63, 'M0III', 1.9, 9.0, 4000, 3200),
(144, 'Sigma Delphini', 63, 'B2IV', 7.0, 45000, 22500, 50),
(145, 'Alpha Pictoris', 64, 'A2V', 3.2, 22.0, 9500, 1800),
(146, 'Beta Ophiuchi', 64, 'K4V', 1.0, 0.5, 5300, 4500),
(147, 'Alpha Centauri B', 65, 'K1V', 0.93, 0.5, 5100, 6600),
(148, 'Beta Andromedae', 65, 'G5V', 0.96, 0.7, 5800, 5000),
(149, 'Gamma Lyrae', 66, 'M5III', 2.0, 3.4, 3500, 3600),
(150, 'Delta Centauri', 66, 'B8IV', 5.4, 40000, 21000, 70),
(151, 'Epsilon Tau', 67, 'F7V', 1.9, 6.0, 6200, 3200),
(152, 'Alpha Gruis', 67, 'G8V', 1.0, 0.9, 5100, 4100),
(153, 'Beta Hydrae', 68, 'A7V', 2.4, 18.2, 8000, 2000),
(154, 'Gamma Indus', 68, 'B0III', 4.8, 37000, 24000, 120),
(155, 'Delta Chamaeleon', 69, 'M3III', 2.5, 8.0, 3600, 4200),
(156, 'Alpha Comae Berenices', 69, 'F6V', 1.7, 9.0, 5700, 4000),
(157, 'Beta Canum Venaticorum', 70, 'G8V', 1.3, 1.1, 5900, 3300),
(158, 'Gamma Crateris', 70, 'B9V', 4.5, 30000, 22000, 100),
(159, 'Delta Lynx', 71, 'F0V', 2.5, 18.0, 6900, 2500),
(160, 'Sigma Corvi', 71, 'A2V', 3.4, 29.0, 9500, 1700),
(161, 'Alpha Hydra', 72, 'K3III', 1.2, 7.2, 4700, 5200),
(162, 'Beta Phoenicis', 72, 'F9V', 2.0, 12.5, 6000, 3100),
(163, 'Gamma Eridani', 73, 'B2IV', 7.6, 35000, 26000, 80),
(164, 'Delta Puppis', 73, 'G4V', 1.4, 10.0, 5100, 4500),
(165, 'Alpha Ursae Majoris', 74, 'K0III', 2.5, 15.0, 4500, 5500),
(166, 'Beta Pegasi', 74, 'M4III', 3.0, 12.0, 3900, 3700),
(167, 'Gamma Orionis', 75, 'A2V', 4.5, 40.0, 9500, 1500),
(168, 'Delta Lupi', 75, 'B6V', 6.0, 50000, 24000, 110),
(169, 'Sigma Capricornus', 76, 'G5III', 1.2, 9.0, 5600, 3300),
(170, 'Alpha Corvi', 76, 'F5V', 2.0, 16.0, 6700, 2500),
(171, 'Beta Sgr', 77, 'A0IV', 2.9, 25.0, 9700, 2200),
(172, 'Gamma Sextans', 77, 'M2III', 2.0, 5.0, 3800, 3400),
(173, 'Delta Aquilae', 78, 'B3IV', 7.5, 60000, 23000, 60),
(174, 'Sigma Ophiuchi', 78, 'A2V', 3.2, 18.0, 7500, 1600),
(175, 'Alpha Bootis', 79, 'G1III', 1.0, 7.8, 5500, 4900),
(176, 'Beta Centauri', 79, 'B1V', 7.0, 42000, 24000, 90),
(177, 'Gamma Canis Majoris', 80, 'B6V', 4.5, 35000, 20000, 130),
(178, 'Delta Apodis', 80, 'F4V', 3.3, 21.0, 7600, 2100),
(179, 'Alpha Velorum', 81, 'F7IV', 2.0, 10.0, 5900, 3300),
(180, 'Beta Aquarii', 81, 'K4V', 1.0, 0.6, 5300, 4200),
(181, 'Gamma Sagittarius', 82, 'B3IV', 6.2, 50000, 22000, 120),
(182, 'Delta Tucanae', 82, 'G9V', 0.95, 0.4, 5100, 4800),
(183, 'Zeta Draconis', 83, 'M6III', 2.2, 8.0, 3500, 4600),
(184, 'Alpha Crateris', 83, 'A7V', 2.9, 22.0, 9000, 2500),
(185, 'Beta Hydrae', 84, 'K3V', 1.1, 0.8, 5000, 4900),
(186, 'Gamma Boötis', 84, 'A0V', 3.5, 26.0, 10500, 1900),
(187, 'Delta Vulpeculae', 85, 'B9V', 4.3, 39000, 23000, 70),
(188, 'Alpha Pegasi', 85, 'K1III', 1.5, 9.5, 5000, 4500),
(189, 'Beta Columbae', 86, 'F4V', 1.8, 12.5, 6400, 2900),
(190, 'Gamma Monocerotis', 86, 'M4III', 1.4, 6.0, 3700, 3900),
(191, 'Delta Crateris', 87, 'A2V', 4.5, 35.0, 9500, 2100),
(192, 'Sigma Vela', 87, 'B1V', 6.8, 47000, 23000, 120),
(193, 'Alpha Lupi', 88, 'G0V', 1.0, 0.8, 5200, 4800),
(194, 'Beta Horologii', 88, 'M0III', 3.0, 11.0, 3800, 3700),
(195, 'Gamma Arietis', 89, 'F0V', 2.5, 18.0, 7100, 2800),
(196, 'Delta Serpentis', 89, 'A8IV', 3.1, 21.0, 9100, 1600),
(197, 'Sigma Leonis', 90, 'G2V', 1.2, 0.9, 5600, 4600),
(198, 'Alpha Scorpii', 90, 'F8IV', 1.3, 7.0, 5800, 4300),
(199, 'Beta Ophiuchi', 91, 'G7V', 0.9, 0.8, 5300, 5000),
(200, 'Gamma Equulei', 91, 'B9V', 4.5, 29000, 20000, 80);
SELECT *from stars;
use COSMIC;
DELETE FROM stars WHERE star_ID = 201;
select * from moons;
UPDATE Moons
SET Planet_ID = 26
WHERE Name = 'Charon';
SET SQL_SAFE_UPDATES = 0;
INSERT INTO Planets (Planet_ID, Name, Star_ID, Type, Atmosphere, Distance_From_Star, Orbital_Period, Surface_Temperature)
VALUES (26, 'Pluto', 1, 'Dwarf', 0, 39.48, 90560, 44);
INSERT INTO Moons (Moon_ID, Name, Planet_ID, Diameter, Distance_From_Planet, Orbital_Period)
VALUES
(21, 'Mimas', 23, 396, 185520, 0.94),
(22, 'Enceladus', 23, 504, 237948, 1.37);
INSERT INTO Moons (Moon_ID, Name, Planet_ID, Diameter, Distance_From_Planet, Orbital_Period)
VALUES
(23, 'Larissa', 25, 194, 73548, 0.55);

















    






