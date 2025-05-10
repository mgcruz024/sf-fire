SELECT DISTINCT
"Incident Number", "Exposure Number", "ID", "Address", "Incident Date", "Call Number", "Alarm DtTm", "Arrival DtTm", "Close DtTm", "City", zipcode, "Battalion", "Station Area", "Box", "Suppression Units", "Suppression Personnel", "EMS Units", "EMS Personnel", "Other Units", "Other Personnel", "First Unit On Scene", "Estimated Property Loss", "Estimated Contents Loss", "Fire Fatalities", "Fire Injuries", "Civilian Fatalities", "Civilian Injuries", "Number of Alarms", "Primary Situation", "Mutual Aid", "Action Taken Primary", "Action Taken Secondary", "Action Taken Other", "Detector Alerted Occupants", "Property Use", "Area of Fire Origin", "Ignition Cause", "Ignition Factor Primary", "Ignition Factor Secondary", "Heat Source", "Item First Ignited", "Human Factors Associated with Ignition", "Structure Type", "Structure Status", "Floor of Fire Origin", "Fire Spread", "No Flame Spread", "Number of floors with minimum damage", "Number of floors with significant damage", "Number of floors with heavy damage", "Number of floors with extreme damage", "Detectors Present", "Detector Type", "Detector Operation", "Detector Effectiveness", "Detector Failure Reason", "Automatic Extinguishing System Present", "Automatic Extinguishing Sytem Type", "Automatic Extinguishing Sytem Perfomance", "Automatic Extinguishing Sytem Failure Reason", "Number of Sprinkler Heads Operating", "Supervisor District", neighborhood_district, point, data_as_of
FROM public.fire_incidents_raw
where "ID" = '030821350'


/*

Use column ID as the unique primary key. Have the ETL use the latest record for those
that match on ID.
	1. Use the latest data_loaded_at
	2. Join on ID 
	3. Hide data_loaded_at from the clean table
	4. The clean table should have a standardized naming convention

*/ 

/*

dimDistrict

SELECT DISTINCT neighborhood_district
from fire_incidents_raw
where neighborhood_district is not null


*/