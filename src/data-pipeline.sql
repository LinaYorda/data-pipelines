USE berlin;

# Create table city table

CREATE TABLE city(
	city_id INT AUTO_INCREMENT, 
	city VARCHAR(255), 
	PRIMARY KEY (city_id)
);

SELECT * FROM city;


# Create population table


CREATE TABLE population(
    population_id INT AUTO_INCREMENT, 
    city_id INT, 
    population FLOAT,
    population_density_in_km2 FLOAT,
    age_16_64_years_old_percentage INT,
    GDP_per_capita FLOAT,
    year_data_retrieved INT, 
    PRIMARY KEY (population_id), 
    FOREIGN KEY (city_id) REFERENCES city(city_id)
);
SELECT * FROM population;



# Create table weather

CREATE TABLE weather(
    weather_id INT AUTO_INCREMENT, 
    dt_txt  DATETIME, 
    temperature FLOAT,
    temp_min FLOAT,
    temp_max FLOAT,
    city VARCHAR(255),
    city_id INT,
    weather VARCHAR(255), 
    PRIMARY KEY (weather_id), 
    FOREIGN KEY (city_id) REFERENCES city(city_id)
);

SELECT * FROM weather;

# Table airport


CREATE TABLE airport(
    city VARCHAR(255),
    arrival_airport_icao VARCHAR(4) PRIMARY KEY
);

SELECT * FROM airport;


# Table flights

CREATE TABLE flights(
    number VARCHAR(255),
    status VARCHAR(255), 
    departure_airport_icao VARCHAR(4), 
    departure_airport VARCHAR(255),
    arrival_time DATETIME,
    arrival_airport_icao VARCHAR(4),
    FOREIGN KEY (arrival_airport_icao) REFERENCES airport(arrival_airport_icao)
);

SELECT * FROM flights;

ALTER TABLE weather
ADD CONSTRAINT fk_weather_airports
FOREIGN KEY (city)
REFERENCES airport(city);


CREATE INDEX idx_city ON airport(city);

SELECT * FROM airport;

ALTER TABLE weather
ADD CONSTRAINT fk_weather_airport
FOREIGN KEY (city)
REFERENCES airport(city);

SELECT * FROM weather;

ALTER TABLE city
ADD CONSTRAINT fk_city_airport
FOREIGN KEY (city)
REFERENCES airport(city);









