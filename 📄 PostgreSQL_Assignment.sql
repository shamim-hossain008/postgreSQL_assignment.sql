
-- ******_Table Creation _*********

-- Table 1 rangers
CREATE Table rangers(
    ranger_id SERIAL PRIMARY key,
    name VARCHAR(50) NOT NULL,
    region VARCHAR(100) NOT NULL
);
select * from rangers;

-- Table 2 species 
CREATE TABLE species(
    species_id SERIAL PRIMARY key,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(100) NOT NULL,
    discovery_date DATE NOT null ,
    conservation_status VARCHAR(100) NOT NULL
);

select* FROM species;

-- Table 3 sightings

CREATE Table sightings(
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT REFERENCES rangers(ranger_id),
    species_id INT REFERENCES species(species_id),
    sighting_time TIMESTAMP not NULL,
    location VARCHAR(100) not NULL,
    notes TEXT
);
-- drop Table sightings;

SELECT* from sightings;

-- ****__Sample Data insertion for Table__****-- 
-- Rangers Table
INSERT INTO rangers (name, region) VALUES
('Alice Green','Northern Hills'),
('Bob White','River Delta '),
('Carol King','Mountain Range');

SELECT * from rangers;

-- Species Table 
INSERT INTO species(common_name,scientific_name,discovery_date,conservation_status ) VALUES
('Snow Leopard','Panthera uncia','1775-01-01','Endangered'),
('Bengal Tiger','Panthera tigris tigris','1758-01-01','Endangered'),
('Red Panda','Ailurus fulgens','1825-01-01','Vulnerable'),
('Asiatic Elephant',' Elephas maximus indicus','1758-01-01','Endangered');

select *from species;

-- Sightings
INSERT INTO sightings(species_id,ranger_id,location,sighting_time,notes) VALUES
('1','1',' Peak Ridge','2024-05-10 07:45:00','Camera trap image captured '),
('2','2','Bankwood Area','2024-05-12 16:20:00 ','Juvenile seen'),
('3','3','Bamboo Grove East','2024-05-15 09:10:00','Feeding observed  '),
('1','2','Snowfall Pass ','2024-05-18 18:30:00','NULL');

select * FROM sightings;

--******PostgreSQL Problems & Sample Outputs →--
-- Problem 1 Register a new ranger 
INSERT into rangers(name, region) VALUES
('Derek Fox','Coastal Plains')

--Problem 2  Count unique species ever sighted
    select COUNT(DISTINCT species_id) as unique_species_count
    FROM sightings;

-- Problem 3 Find all sightings where the location includes "Pass".
select * from sightings
WHERE location ILIKE '%Pass%';

-- problem 4 List each ranger's name and their total number of sightings
 
select r.name, count(s.sighting_id) as total_sightings
FROM rangers r 
LEFT OUTER JOIN sightings  s ON r.ranger_id= s.ranger_id
GROUP BY r.name;

-- Problem 5 List species that have never been sighted
SELECT  common_name
FROM species
WHERE species_id NOT in (SELECT DISTINCT species_id from sightings);

-- problem 6 Show the most recent 2 sightings.
SELECT sp.common_name, s.sighting_time,r.name
FROM sightings s
JOIN species sp ON s.species_id = sp.species_id
JOIN rangers r ON s.ranger_id = r.ranger_id
ORDER BY s.sighting_time DESC LIMIT 2;

-- problem 7 Update all species discovered before year 1800 to have status 'Historic'.

UPDATE species
SET conservation_status ='Historic'
WHERE discovery_date < '1800-01-01';

-- problem 8 Label each sighting's time of day as 'Morning', 'Afternoon', or 'Evening'.
SELECT* FROM sightings;

SELECT sighting_id,
CASE 
    WHEN EXTRACT(HOUR FROM sighting_time)< 12 THEN 'Morning' 
    WHEN EXTRACT(HOUR FROM sighting_time)BETWEEN 12 AND 17 THEN 'Afternoon' 
    ELSE  'Evening'
END as time_of_day
FROM sightings;

-- problem 9 Delete rangers who have never sighted any species
DELETE from rangers
WHERE ranger_id NOT IN(SELECT DISTINCT ranger_id FROM sightings);

