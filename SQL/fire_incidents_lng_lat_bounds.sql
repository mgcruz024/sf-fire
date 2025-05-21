

-- SELECT
-- 	INC.*
-- FROM
-- 	PUBLIC."openSfFireIncident" INC
-- 	JOIN (
-- 		SELECT
-- 			MAX("longitude") AS "max_lng"
-- 		FROM
-- 			FACTGEOINCIDENT
-- 	) G ON G."max_lng" = SPLIT_PART(
-- 		TRIM(
-- 			BOTH ')'
-- 			FROM
-- 				SPLIT_PART(INC."point", '(', 2)
-- 		),
-- 		' ',
-- 		1
-- 	)::FLOAT


/*
Expected Lat/Lng bounds for SF 

Latitude -> expected range 37
Longitude -> expected range - 122

Note: all longitudes should be NEGATIVE because it lies in the Western Hemisphere

"POINT (-122.40452 37.792697)" -> POINT(lng, lat)

*/
WITH geoBoundaries AS 

(

SELECT 
MAX("longitude") AS "boundary",
'max_lng' AS "geo_type"
FROM factGeoIncident
WHERE "longitude" < 0 -- longitude can't be positive

UNION ALL

SELECT 
MIN("longitude") AS "boundary",
'min_lng' AS "geo_type"
FROM factGeoIncident
WHERE "longitude" < 0 -- longitude can't be positive

UNION ALL

SELECT
MAX("latitude") AS "boundary",
'max_lat' AS "geo_type"
FROM factGeoIncident
WHERE "latitude" > 0


UNION ALL

SELECT
MIN("latitude") AS "boundary",
'min_lat' AS "geo_type"
FROM factGeoIncident
WHERE "latitude" > 0

)

SELECT 
"boundary",
"geo_type"
FROM geoBoundaries
ORDER BY "boundary" ASC

/*

SF Geo boundaries based on fire incident feed:

min lat, min lng, max lat, max lng
37.70,-122.52,37.83,-122.35

*/

