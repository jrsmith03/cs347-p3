SELECT aws_s3.table_import_from_s3('Crew', 
'crew_name, crew_size',
'(format csv, header true)', 
aws_commons.create_s3_uri('p3-csv', 'csv/crew.csv', 'us-east-2'), aws_commons.create_aws_credentials('AKIA4MJZJNRKRPTJYA54', '34RxWgYMNZfU4THvDzskfupY6jFO28TujSGc/iOf', ''));

SELECT aws_s3.table_import_from_s3('Pothole', 
'pothole_size, address, pothole_location, district, priority',
'(format csv, header true)', 
aws_commons.create_s3_uri('p3-csv', 'csv/pothole.csv', 'us-east-2'), aws_commons.create_aws_credentials('AKIA4MJZJNRKRPTJYA54', '34RxWgYMNZfU4THvDzskfupY6jFO28TujSGc/iOf', ''));

SELECT aws_s3.table_import_from_s3('WorkOrder', 
'pothole_id, crew_id, pothole_status, cost',
'(format csv, header true)', 
aws_commons.create_s3_uri('p3-csv', 'csv/workorder.csv', 'us-east-2'), aws_commons.create_aws_credentials('AKIA4MJZJNRKRPTJYA54', '34RxWgYMNZfU4THvDzskfupY6jFO28TujSGc/iOf', ''));

SELECT aws_s3.table_import_from_s3('Equipment', 
'equipment_name, equipment_category, equipment_cost_per_hr',
'(format csv, header true)', 
aws_commons.create_s3_uri('p3-csv', 'csv/equipment.csv', 'us-east-2'), aws_commons.create_aws_credentials('AKIA4MJZJNRKRPTJYA54', '34RxWgYMNZfU4THvDzskfupY6jFO28TujSGc/iOf', ''));


SELECT aws_s3.table_import_from_s3('RentedEquipment', 
'rental_start_date, rental_end_date, equipment_id, crew_id, workorder_id',
'(format csv, header true)', 
aws_commons.create_s3_uri('p3-csv', 'csv/rentedequipment.csv', 'us-east-2'), aws_commons.create_aws_credentials('AKIA4MJZJNRKRPTJYA54', '34RxWgYMNZfU4THvDzskfupY6jFO28TujSGc/iOf', ''));

SELECT aws_s3.table_import_from_s3('Reporter', 
'reporter_name, reporter_phone, reporter_address',
'(format csv, header true)', 
aws_commons.create_s3_uri('p3-csv', 'csv/reporter.csv', 'us-east-2'), aws_commons.create_aws_credentials('AKIA4MJZJNRKRPTJYA54', '34RxWgYMNZfU4THvDzskfupY6jFO28TujSGc/iOf', ''));

SELECT aws_s3.table_import_from_s3('PropertyDamageReport', 
'estimated_damage_cost, damage_type, reporter_id, pothole_id',
'(format csv, header true)', 
aws_commons.create_s3_uri('p3-csv', 'csv/propertydamagereport.csv', 'us-east-2'), aws_commons.create_aws_credentials('AKIA4MJZJNRKRPTJYA54', '34RxWgYMNZfU4THvDzskfupY6jFO28TujSGc/iOf', ''));