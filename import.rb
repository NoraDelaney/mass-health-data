require 'csv'
require 'pg'
require 'pry'

def db_connection
  begin
    connection = PG.connect(dbname: "mass_health")
    yield(connection)
  ensure
    connection.close
  end
end

town_health_data = []

CSV.foreach("mass-chip-data.csv", headers: true, header_converters: :symbol) do |row|
  town = row[:town]
  pop = row[:population]
  pop.delete!(',')
  kids = row[:age_0_to_19_in_2005]
  kids.delete!(',')
  elderly = row[:age_65_in_2005]
  elderly.delete!(',')
  income = row[:per_capita_incom_2000]
  income.delete!('$,')
  poverty = row[:below_200percent_povery_line_2000]
  poverty.delete!(',')
  poverty_percent = row[:percent_below_200percent_povery_line_2000]
  poverty_percent.delete!(',')
  prenatal = row[:percent_adequacy_prenatal_care]
  prenatal.delete!(',')
  c_section = row[:percent_c_section_deliveries_2005_2008]
  c_section.delete!(',')
  infant_deaths = row[:number_infant_deaths]
  infant_deaths.delete!(',')
  infant_mortality = row[:infant_mortality_rate_2005_2008]
  infant_mortality.delete!(',')
  low_birth_rate = row[:percent_low_birthweight_2005_2008]
  low_birth_rate.delete!(',')
  multi_births = row[:percent_multiple_births_2005_2008]
  multi_births.delete!(',')
  pub_financed = row[:percent_pub_financed_prenatal_2005_2008]
  pub_financed.delete!(',')
  teen_births = row[:percent_teen_births_2005_2008]
  teen_births.delete!(',')

  town_health_data << [
    town, pop.to_i, kids.to_i, elderly.to_i, income.to_f, poverty.to_f, poverty_percent.to_f, prenatal.to_f, c_section.to_f,
    infant_deaths.to_f, infant_mortality.to_f, low_birth_rate.to_f, multi_births.to_f, pub_financed.to_f, teen_births.to_f
  ]
end

town_health_data.each do |element|


db_connection do |conn|
  conn.exec_params("INSERT INTO town_health_records
  (town,
  population,
  age_0_to_19_in_2005,
  age_65_in_2005,
  per_capita_incom_2000,
  below_200percent_povery_line_2000,
  percent_below_200percent_povery_line_2000,
  percent_adequacy_prenatal_care,
  percent_c_section_deliveries_2005_2008,
  number_infant_deaths,
  infant_mortality_rate_2005_2008,
  percent_low_birthweight_2005_2008,
  percent_multiple_births_2005_2008,
  percent_pub_financed_prenatal_2005_2008,
  percent_teen_births_2005_2008
  )
   VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15)", element)
   end
 end
