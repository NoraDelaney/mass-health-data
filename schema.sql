-- DEFINE YOUR DATABASE SCHEMA HERE
DROP TABLE town_health_records;

CREATE TABLE town_health_records(
  id SERIAL PRIMARY KEY,
  town VARCHAR(255),
  population INTEGER,
  age_0_to_19_in_2005 INTEGER,
  age_65_in_2005 INTEGER,
  per_capita_incom_2000 NUMERIC,
  below_200percent_povery_line_2000 NUMERIC,
  percent_below_200percent_povery_line_2000 NUMERIC,
  percent_adequacy_prenatal_care NUMERIC,
  percent_c_section_deliveries_2005_2008 NUMERIC,
  number_infant_deaths NUMERIC,
  infant_mortality_rate_2005_2008 NUMERIC,
  percent_low_birthweight_2005_2008 NUMERIC,
  percent_multiple_births_2005_2008 NUMERIC,
  percent_pub_financed_prenatal_2005_2008 NUMERIC,
  percent_teen_births_2005_2008 NUMERIC
);
