-- WRITE YOUR QUERIES HERE
-- What 3 towns have the highest population of citizens that are 65 years and older?
SELECT town FROM town_health_records WHERE town != 'Massachusetts Total' ORDER BY age_65_in_2005 DESC LIMIT 3;

town
-------------
Boston
Worcester
Springfield
-- What 3 towns have the highest population of citizens that are 19 years and younger?

SELECT town FROM town_health_records WHERE town != 'Massachusetts Total' ORDER BY age_0_to_19_in_2005 DESC LIMIT 3;

town
-------------
Boston
Worcester
Springfield


-- What 5 towns have the lowest per capita income?

SELECT town FROM town_health_records WHERE town != 'Massachusetts Total' ORDER BY per_capita_incom_2000 LIMIT 5;

town
-------------
Monroe
Lawrence
Chelsea
Springfield
Gosnold

-- Omitting Boston, Becket, and Beverly, what town has the highest percentage of teen births?

SELECT town FROM town_health_records WHERE town != 'Massachusetts Total' AND town != 'Boston' AND town != 'Becket' AND town != 'Beverly'
ORDER BY percent_teen_births_2005_2008 DESC LIMIT 1;

town
---------
Holyoke

-- Omitting Boston, what town has the highest number of infant mortalities?

SELECT town from town_health_records WHERE town != 'Boston' AND town != 'Massachusetts Total' ORDER BY number_infant_deaths DESC LIMIT 1;

town
-----------
Worcester
