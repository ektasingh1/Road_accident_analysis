
-- SQL QUERIES FOR ROAD ACCIDENT ANALYSIS

-- CY casualties

SELECT sum(number_of_casualties) as CY_casualties
FROM road_accident_data1
where year ="2022";

-- CY accidents

SELECT count(distinct Accident_Index) as CY_accidents
FROM road_accident_data1
where year ="2022";

-- CY Fatal_casualties

SELECT sum(number_of_casualties) as CY_Fatal_casualties
FROM road_accident_data1
where accident_severity ='Fatal' and year ="2022";

-- CY Serious_casualties

SELECT sum(number_of_casualties) as CY_Serious_casualties
FROM road_accident_data1
where accident_severity ='Serious' and year ="2022"; 

-- CY Slight_casualties

SELECT sum(number_of_casualties) as CY_Slight_casualties
FROM road_accident_data1
where accident_severity ='Slight' and year ="2022";

-- Grouping Vehicles and finding the no.of casualties

select 
case 
when vehicle_type in ('Agricultural vehicle') then 'Agricultural'
when vehicle_type in ('car','Taxi/Private hire car') then 'Cars'
when vehicle_type in ('Motorcycle over 500cc','Motorcycle over 125cc and up to 500cc','Motorcycle 50cc and under','Motorcycle 125cc and under') then 'Bike'
when vehicle_type in ('Bus or coach (17 or more pass seats)','Minibus (8 - 16 passenger seats)') then 'Bus'
when vehicle_type in ('Goods 7.5 tonnes mgw and over','Goods over 3.5t. and under 7.5t','Van / Goods 3.5 tonnes mgw or under') then 'Van'
else 'other'
End as vehicle_group,

sum(number_of_casualties) as CY_casualties
from road_accident_data1

Group by 
case
when vehicle_type in ('Agricultural vehicle') then 'Agricultural'
when vehicle_type in ('car','Taxi/Private hire car') then 'Cars'
when vehicle_type in ('Motorcycle over 500cc','Motorcycle over 125cc and up to 500cc','Motorcycle 50cc and under','Motorcycle 125cc and under') then 'Bike'
when vehicle_type in ('Bus or coach (17 or more pass seats)','Minibus (8 - 16 passenger seats)') then 'Bus'
when vehicle_type in ('Goods 7.5 tonnes mgw and over','Goods over 3.5t. and under 7.5t','Van / Goods 3.5 tonnes mgw or under') then 'Van'
else 'other'
end;

-- CY casualties by Monthly trend

select month, sum(number_of_casualties) as CY_casualties
from road_accident_data1
where year ='2022'
group by month;

-- CY casualties by Road_type

select Road_type, sum(number_of_casualties) as CY_casualties
from road_accident_data1
where year ='2022'
group by Road_type;

-- CY casualties by urban_or_rural_area

select urban_or_rural_area, sum(number_of_casualties) as CY_casualties
from road_accident_data1
where year ='2022'
group by urban_or_rural_area;

-- CY casualties by light_conditions

select 
case 
when light_conditions in ('Daylight') then 'Day'
when light_conditions in ('Darkness - lights lit','Darkness - lights unlit','Darkness - no lighting','Darkness - lighting unknown') then 'Dark'
end as light_conditions,

sum(number_of_casualties) as CY_casualties
from road_accident_data1

Group by 
case
when light_conditions in ('Daylight') then 'Day'
when light_conditions in ('Darkness - lights lit','Darkness - lights unlit','Darkness - no lighting','Darkness - lighting unknown') then 'Dark'
end;
















 

