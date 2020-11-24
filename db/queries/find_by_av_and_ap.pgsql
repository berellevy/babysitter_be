
SET TIME ZONE UTC;


SELECT 
	*
FROM sitters AS s
INNER JOIN (
	SELECT 
		*, 
		(EXTRACT(epoch FROM '19:15' - av.start_time) / 60) AS query_start_minus_record_start,  
		('60' - av.duration_minutes) AS query_duration_minus_record_duration   
	FROM "availabilities" as av
) AS av
ON s.id = av.sitter_id
INNER JOIN (
	SELECT 
		*,
    start_time + (duration_minutes * interval '1 minute') AS end_time
	FROM appointments
) AS ap
ON s.id = ap.sitter_id
WHERE 
	(
		av.weekday = '3' AND
		av.query_start_minus_record_start >= 0 AND
		av.query_duration_minus_record_duration <= 0 AND
		av.query_start_minus_record_start + av.query_duration_minus_record_duration <= 0
	) AND (
		ap.start_time >= '2020-11-24T20:15:00+00:00' OR
		ap.end_time <= '2020-11-24T19:15:00+00:00'
	)

	

