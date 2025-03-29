
-- Find all the work orders where the repair cost is greater than $300
SELECT * FROM WorkOrder AS wo WHERE pothole_id 
    IN (SELECT pothole_id FROM Pothole
            WHERE wo.cost > 300);

-- Find names of reporters whose potholes have been repaired 
SELECT r.reporter_name FROM Reporter as r 
    JOIN PropertyDamageReport as pdr ON r.reporter_id = pdr.reporter_id 
    JOIN Pothole as p ON p.pothole_id = pdr.pothole_id 
    JOIN WorkOrder as wo ON wo.pothole_id = p.pothole_id 
WHERE wo.pothole_status = 'REPAIRED';

-- Find the number of potholes per district
SELECT district, COUNT(*) AS pothole_count
FROM Pothole
GROUP BY district;

-- Find total cost of work orders by district
SELECT p.district, SUM(w.cost) AS total_cost
FROM WorkOrder w
JOIN Pothole p ON w.pothole_id = p.pothole_id
GROUP BY p.district;

-- Identify the most common damage type caused by potholes
SELECT damage_type, COUNT(*) AS damage_count
FROM PropertyDamageReport
GROUP BY damage_type;

-- Get the cost of repairs by equipment type (per hour)
SELECT e.equipment_category, SUM(e.equipment_cost_per_hr) AS total_cost
FROM RentedEquipment r
JOIN Equipment e ON r.equipment_id = e.equipment_id
GROUP BY e.equipment_category;

-- Find crews whose pothole status is not 'REPAIRED'
SELECT c.crew_name FROM Crew AS c 
    JOIN WorkOrder AS wo ON c.crew_id = wo.crew_id 
WHERE wo.pothole_status != 'REPAIRED';

-- Find the average rental cost per equipment type
SELECT e.equipment_category, AVG(e.equipment_cost_per_hr) 
AS avg_rental_cost 
GROUP BY e.equipment_category FROM Equipment e