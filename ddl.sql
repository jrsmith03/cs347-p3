
-- CREATE TYPE elocation AS ENUM ('MIDDLE', 'CURB', 'TOP', 'BOTTOM');
-- CREATE TYPE epriority AS ENUM ('LOW', 'MEDIUM', 'HIGH');
-- CREATE TYPE eequipment_category AS ENUM('HEAVY_MACHINERY', 'VEHICLE', 'HAND_TOOL');
-- CREATE TYPE epotstat AS ENUM('IN_PROGRESS', 'REPAIRED', 'NOT_REPAIRED');
-- CREATE TYPE edamage AS ENUM('VEHICLE', 'PROPERTY', 'PERSONAL');

CREATE TABLE Pothole (
	pothole_id SERIAL PRIMARY KEY, 
	pothole_size INT NOT NULL,
	address VARCHAR(255) NOT NULL,
	pothole_location elocation,
	district VARCHAR(255) NOT NULL,
	priority epriority
); 

CREATE TABLE Crew(
	crew_id SERIAL PRIMARY KEY,
	crew_name VARCHAR(255) NOT NULL,
	crew_size INT NOT NULL
);
CREATE TABLE WorkOrder (
	workorder_id SERIAL PRIMARY KEY, 
	pothole_id INT,
	crew_id INT,
	FOREIGN KEY (pothole_id) REFERENCES Pothole(pothole_id),
	FOREIGN KEY (crew_id) REFERENCES Crew(crew_id),
	pothole_status epotstat,
	cost FLOAT
);
CREATE TABLE Equipment(
	equipment_id SERIAL PRIMARY KEY,
	equipment_name VARCHAR(255) NOT NULL,
	equipment_category eequipment_category NOT NULL,
	equipment_cost_per_hr DECIMAL(10,2) NOT NULL
);

CREATE TABLE RentedEquipment(
	rentedEquipment_id SERIAL PRIMARY KEY,
	rental_start_date DATE NOT NULL,
	rental_end_date DATE NOT NULL,
	equipment_id INT,
	crew_id INT,
	workorder_id INT,
	FOREIGN KEY (equipment_id) REFERENCES Equipment(equipment_id),
	FOREIGN KEY (crew_id) REFERENCES Crew(crew_id),
	FOREIGN KEY (workorder_id) REFERENCES WorkOrder(workorder_id)
);


CREATE TABLE Reporter (
	reporter_id SERIAL PRIMARY KEY,
	reporter_name VARCHAR(255) NOT NULL,
	reporter_phone VARCHAR(255) NOT NULL,
	reporter_address VARCHAR(255) NOT NULL
);

CREATE TABLE PropertyDamageReport(
	property_damage_report_id SERIAL PRIMARY KEY,
	estimated_damage_cost DECIMAL(10,2) NOT NULL,
	damage_type edamage,
	reporter_id INT,
	pothole_id INT,
	FOREIGN KEY (reporter_id) REFERENCES Reporter(reporter_id),
	FOREIGN KEY (pothole_id) REFERENCES Pothole(pothole_id)
);

