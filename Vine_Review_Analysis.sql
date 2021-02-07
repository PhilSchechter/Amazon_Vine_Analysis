CREATE TABLE vine_data(
	review_id TEXT PRIMARY KEY,
	star_rating INT,
	helpful_votes INT,
	total_votes INT,
	vine TEXT,
	verified_purchase TEXT);
SELECT * FROM vine_data
LIMIT 5;



-- step 0 : total rows in raw date
SELECT COUNT (*) as "AllReviews"
FROM vine_data;  -- counts 960872 rows of data

-- step 1
SELECT COUNT (*) as "Over20"
FROM vine_data
WHERE (total_votes)>19;  -- counts 9631 rows

-- step 2
SELECT COUNT (*) as "helpful"
FROM vine_data
WHERE (total_votes)>19
AND (CAST (helpful_votes AS float))/(CAST(total_votes AS float)) >=0.5;  -- counts 8409 rows


-- step 3
SELECT COUNT (*) as "Paid"
FROM vine_data
WHERE ((total_votes)>19)
AND CAST(helpful_votes AS float)/CAST(total_votes AS float) >=0.5
AND (vine)='Y'; -- counts 47 rows

-- step 4
SELECT COUNT (*) as "UnPaid"
FROM vine_data
WHERE ((total_votes)>19)
AND CAST(helpful_votes AS float)/CAST(total_votes AS float) >=0.5
AND (vine)='N'; -- counts 8362 rows

--step 5
SELECT COUNT (*) as "Paid5"
FROM vine_data
WHERE ((total_votes)>19)
AND CAST(helpful_votes AS float)/CAST(total_votes AS float) >=0.5
AND (vine)='Y'
AND (star_rating)=5; -- counts 15

SELECT COUNT (*) as "UnPaid5"
FROM vine_data
WHERE ((total_votes)>19)
AND CAST(helpful_votes AS float)/CAST(total_votes AS float) >=0.5
AND (vine)='N'
AND (star_rating)=5; -- counts 4332






