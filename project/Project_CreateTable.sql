DROP TABLE rental_car;
DROP TABLE vehicle;
DROP TABLE vehicle_type;
DROP TABLE customer;

CREATE TABLE customer
(
	customer_id VARCHAR2(30)
		CONSTRAINT customer_customer_id_nn NOT NULL
		CONSTRAINT customer_pk PRIMARY KEY,
	first_name VARCHAR2(40)
		CONSTRAINT customer_first_name_nn NOT NULL,
	last_name VARCHAR2(40)
		CONSTRAINT customer_last_name_nn NOT NULL
);

CREATE TABLE vehicle_type
(
	type VARCHAR2(20)
		CONSTRAINT vehicle_type_type_nn NOT NULL
		CONSTRAINT vehicle_type_pk PRIMARY KEY
);

CREATE TABLE vehicle
(
	model VARCHAR2(30) -- Make changed to model to better align with Stage 2 project description
		CONSTRAINT vehicle_model_nn NOT NULL
		CONSTRAINT vehicle_pk PRIMARY KEY,
	description VARCHAR2(100)
		CONSTRAINT vehicle_description_nn NOT NULL,
	type VARCHAR2(20)
		CONSTRAINT vehicle_type_nn NOT NULL
		CONSTRAINT vehicle_type_fk REFERENCES vehicle_type(type)
);

CREATE TABLE rental_car
(
	license_plate VARCHAR2(12)
		CONSTRAINT rental_car_license_plate_nn NOT NULL
		CONSTRAINT rental_car_pk PRIMARY KEY,
	customer_id VARCHAR2(30)
		CONSTRAINT library_account_id_fk REFERENCES customer(customer_id),
	vehicle_model VARCHAR2(30)
		CONSTRAINT rental_car_vehicle_model_nn NOT NULL
		CONSTRAINT rental_car_vehicle_model_fk REFERENCES vehicle(model)
);


-- When you insert your customer into the customer table, specify your (Oracle) id in upper case.  E.g.	
INSERT INTO customer (customer_id, first_name, last_name) VALUES ('OLS655_191A04', 'Wayne', 'Bryan');
COMMIT;

INSERT INTO vehicle_type (type) VALUES ('Car - Small');
INSERT INTO vehicle_type (type) VALUES ('Car - Medium');
INSERT INTO vehicle_type (type) VALUES ('Car - Large');
INSERT INTO vehicle_type (type) VALUES ('Truck');
INSERT INTO vehicle_type (type) VALUES ('Van');
COMMIT;

-- Some vehicles have been provided for your convenience
INSERT INTO vehicle (description, type, model) VALUES ('2-Door Subcompact', 'Car - Small', 'Chevrolet Sonic');
INSERT INTO vehicle (description, type, model) VALUES ('4-Door Compact', 'Car - Small', 'Ford Focus');
INSERT INTO vehicle (description, type, model) VALUES ('8-Seat Minivan', 'Van', 'Chrysler Pacifica');
INSERT INTO vehicle (description, type, model) VALUES ('5-Seat AWD', 'Car - Large', 'Ford Taurus');
INSERT INTO vehicle (description, type, model) VALUES ('250HP with EcoBoost', 'Truck', 'Ford F-150');
INSERT INTO vehicle (description, type, model) VALUES ('Luxury 5-Seat Fuel Efficient', 'Car - Large', 'Lincoln MKZ Hybrid');
INSERT INTO vehicle (description, type, model) VALUES ('5-Seat AWD', 'Car - Medium', 'Subaru Legacy');
INSERT INTO vehicle (description, type, model) VALUES ('5-Seat CVT', 'Car - Medium', 'Nissan Sentra');
INSERT INTO vehicle (description, type, model) VALUES ('5-Seat Leather Seating', 'Car - Large', 'Toyota Avalon Limited');
INSERT INTO vehicle (description, type, model) VALUES ('5-Seat Internet Ready', 'Car - Large', 'Chevrolet Impala');
INSERT INTO vehicle (description, type, model) VALUES ('5-Seat Luxury', 'Car - Large', 'Volvo S90');
INSERT INTO vehicle (description, type, model) VALUES ('4-Door Subcompact Heated Seats', 'Car - Small', 'Kia Rio');
INSERT INTO vehicle (description, type, model) VALUES ('4-Door Subcompact with Sunroof', 'Car - Small', 'Hyundai Accent');
INSERT INTO vehicle (description, type, model) VALUES ('4Matic 7-Passenger SUV', 'Van', 'Mercedes-Benz GLS 450');
INSERT INTO vehicle (description, type, model) VALUES ('Leather-Trimmed Seating, ECVT', 'Car - Large', 'Toyota Camry Hybrid XLE');
INSERT INTO vehicle (description, type, model) VALUES ('10,000 lbs Towing Capacity', 'Truck', 'Toyota Tundra');
INSERT INTO vehicle (description, type, model) VALUES ('4-Door Subcompact', 'Car - Small', 'Honda Fit');
INSERT INTO vehicle (description, type, model) VALUES ('2-Door Sport Convertible', 'Car - Small', 'Audi A3 Cabriolet');
COMMIT;

INSERT INTO rental_car (license_plate, vehicle_model) VALUES ('ASLN447', 'Chevrolet Sonic');
INSERT INTO rental_car (license_plate, vehicle_model) VALUES ('ARTY281', 'Ford Focus');
INSERT INTO rental_car (license_plate, vehicle_model) VALUES ('BACC822', 'Chrysler Pacifica');
INSERT INTO rental_car (license_plate, vehicle_model) VALUES ('BBCR471', 'Ford Taurus');
INSERT INTO rental_car (license_plate, vehicle_model) VALUES ('ACCA675', 'Ford F-150');
INSERT INTO rental_car (license_plate, vehicle_model) VALUES ('ALOK824', 'Lincoln MKZ Hybrid');
INSERT INTO rental_car (license_plate, vehicle_model) VALUES ('AZZE922', 'Subaru Legacy');
INSERT INTO rental_car (license_plate, vehicle_model) VALUES ('BAAE754', 'Nissan Sentra');
INSERT INTO rental_car (license_plate, vehicle_model) VALUES ('ASET111', 'Toyota Avalon Limited');
INSERT INTO rental_car (license_plate, vehicle_model) VALUES ('ASRV413', 'Chevrolet Impala');
INSERT INTO rental_car (license_plate, vehicle_model) VALUES ('ATLK566', 'Volvo S90');
INSERT INTO rental_car (license_plate, vehicle_model) VALUES ('AMDP824', 'Kia Rio');
INSERT INTO rental_car (license_plate, vehicle_model) VALUES ('APLJ557', 'Hyundai Accent');
INSERT INTO rental_car (license_plate, vehicle_model) VALUES ('AVTH654', 'Mercedes-Benz GLS 450');
INSERT INTO rental_car (license_plate, vehicle_model) VALUES ('AXDF575', 'Lincoln MKZ Hybrid');
INSERT INTO rental_car (license_plate, vehicle_model) VALUES ('AWRR461', 'Chevrolet Impala');
INSERT INTO rental_car (license_plate, vehicle_model) VALUES ('AKJK125', 'Toyota Camry Hybrid XLE');
INSERT INTO rental_car (license_plate, vehicle_model) VALUES ('BART034', 'Kia Rio');
INSERT INTO rental_car (license_plate, vehicle_model) VALUES ('AEFD652', 'Chevrolet Sonic');
INSERT INTO rental_car (license_plate, vehicle_model) VALUES ('ARGG911', 'Lincoln MKZ Hybrid');
INSERT INTO rental_car (license_plate, vehicle_model) VALUES ('AWER994', 'Ford F-150');
INSERT INTO rental_car (license_plate, vehicle_model) VALUES ('BBER224', 'Nissan Sentra');
INSERT INTO rental_car (license_plate, vehicle_model) VALUES ('ASWS442', 'Ford Focus');
INSERT INTO rental_car (license_plate, vehicle_model) VALUES ('AGER814', 'Subaru Legacy');
INSERT INTO rental_car (license_plate, vehicle_model) VALUES ('ATFP927', 'Toyota Tundra');
INSERT INTO rental_car (license_plate, vehicle_model) VALUES ('AMMB646', 'Chevrolet Impala');
INSERT INTO rental_car (license_plate, vehicle_model) VALUES ('ATPL573', 'Toyota Camry Hybrid XLE');
INSERT INTO rental_car (license_plate, vehicle_model) VALUES ('AZSE764', 'Ford Focus');
INSERT INTO rental_car (license_plate, vehicle_model) VALUES ('AFET562', 'Nissan Sentra');
INSERT INTO rental_car (license_plate, vehicle_model) VALUES ('AGGR555', 'Subaru Legacy');
INSERT INTO rental_car (license_plate, vehicle_model) VALUES ('APLM231', 'Toyota Camry Hybrid XLE');
INSERT INTO rental_car (license_plate, vehicle_model) VALUES ('BAFE244', 'Ford Focus');
INSERT INTO rental_car (license_plate, vehicle_model) VALUES ('BDWS527', 'Audi A3 Cabriolet');
INSERT INTO rental_car (license_plate, vehicle_model) VALUES ('AVCZ114', 'Subaru Legacy');
COMMIT;
