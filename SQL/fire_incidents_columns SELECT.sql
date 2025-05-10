CREATE VIEW vw_fireIncidents AS
SELECT DISTINCT 
    "Incident Number",
    "Exposure Number",
    "ID",
    "Address",
    "Incident Date",
    "Call Number",
    "Alarm DtTm",
    "Arrival DtTm",
    "Close DtTm",
    "City",
    zipcode,
    "Battalion",
    "Station Area",
    "Box",

    -- Unit & Personnel Info
    "Suppression Units",
    "Suppression Personnel",
    "EMS Units",
    "EMS Personnel",
    "Other Units",
    "Other Personnel",
    "First Unit On Scene",

    -- Loss & Casualties
    "Estimated Property Loss",
    "Estimated Contents Loss",
    "Fire Fatalities",
    "Fire Injuries",
    "Civilian Fatalities",
    "Civilian Injuries",

    -- Incident Details
    "Number of Alarms",
    "Primary Situation",
    "Mutual Aid",
    "Action Taken Primary",
    "Action Taken Secondary",
    "Action Taken Other",

    -- Fire Detection
    "Detector Alerted Occupants",
    "Property Use",
    "Area of Fire Origin",
    "Ignition Cause",
    "Ignition Factor Primary",
    "Ignition Factor Secondary",
    "Heat Source",
    "Item First Ignited",
    "Human Factors Associated with Ignition",

    -- Structure Info
    "Structure Type",
    "Structure Status",
    "Floor of Fire Origin",
    "Fire Spread",
    "No Flame Spread",
    "Number of floors with minimum damage",
    "Number of floors with significant damage",
    "Number of floors with heavy damage",
    "Number of floors with extreme damage",

    -- Detectors
    "Detectors Present",
    "Detector Type",
    "Detector Operation",
    "Detector Effectiveness",
    "Detector Failure Reason",

    -- Automatic Extinguishing Systems
    "Automatic Extinguishing System Present",
    "Automatic Extinguishing Sytem Type",
    "Automatic Extinguishing Sytem Perfomance",
    "Automatic Extinguishing Sytem Failure Reason",
    "Number of Sprinkler Heads Operating",

    -- Location Metadata
    "Supervisor District",
    neighborhood_district,
    point,

    -- Audit Fields
    data_as_of
    -- data_loaded_at -- NOT SHOWING

FROM public.fire_incidents_raw;
