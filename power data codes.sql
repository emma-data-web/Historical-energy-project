--- 1. resilience planning: create a comprehensive resilience plan outlining response procedures for various 
--- disruption ensuring business continuity.

--- 2. upgrade technology infrasture: identify technology gaps and implement infrastructure upgrades for improved operational 
--- efficiency.



select * from historical_energy_data;

select * from market_data;

select * from infrastructure_data;

select * from regulatory_data;

with energy as (
select `date/time`,`location/region`,`energy source`,`energy demand`,`Energy Consumption (kWh)`,`Energy Production (kWh)`
from historical_energy_data),
market_growth as(
select `date/time`,`location/region`,`energy source`,`energy demand`,
sum(`energy demand`)
over(partition by `location/region` order by `energy source`) as cumulative_sum 
from energy 
where `date/time` like "%2012")
select *  from market_growth;

with `power` as (
select `date/time`,`location/region`,`energy source`,`energy demand`,`Energy Consumption (kWh)`,`Energy Production (kWh)`
from historical_energy_data),
market_increase as(
select `date/time`,`location/region`,`energy source`,`Energy Consumption (kWh)`,
sum(`Energy Consumption (kWh)`)
over(partition by `location/region` order by `energy source`) as cumulative_sum 
from `power` 
where `date/time` like "%2012")
select *  from market_increase;

with utility as (
select `date/time`,`location/region`,`energy source`,`energy demand`,`Energy Consumption (kWh)`,`Energy Production (kWh)`
from historical_energy_data),
market_produce as(
select `date/time`,`location/region`,`energy source`,`Energy Production (kWh)`,
sum(`Energy Production (kWh)`)
over(partition by `location/region` order by `energy source`) as cumulative_sum 
from utility 
where `date/time` like "%2012")
select *  from market_produce;


with energy as (
select `date/time`,`location/region`,`energy source`,`energy demand`,`Energy Consumption (kWh)`,`Energy Production (kWh)`
from historical_energy_data),
market_growth as(
select `date/time`,`location/region`,`energy source`,`energy demand`,
sum(`energy demand`)
over(partition by `location/region` order by `energy source`) as cumulative_sum 
from energy 
where `date/time` like "%2013")
select *  from market_growth;


with `power` as (
select `date/time`,`location/region`,`energy source`,`energy demand`,`Energy Consumption (kWh)`,`Energy Production (kWh)`
from historical_energy_data),
market_increase as(
select `date/time`,`location/region`,`energy source`,`Energy Consumption (kWh)`,
sum(`Energy Consumption (kWh)`)
over(partition by `location/region` order by `energy source`) as cumulative_sum 
from `power` 
where `date/time` like "%2013")
select *  from market_increase;

with utility as (
select `date/time`,`location/region`,`energy source`,`energy demand`,`Energy Consumption (kWh)`,`Energy Production (kWh)`
from historical_energy_data),
market_produce as(
select `date/time`,`location/region`,`energy source`,`Energy Production (kWh)`,
sum(`Energy Production (kWh)`)
over(partition by `location/region` order by `energy source`) as cumulative_sum 
from utility 
where `date/time` like "%2013")
select *  from market_produce;

with energy as (
select `date/time`,`location/region`,`energy source`,`energy demand`,`Energy Consumption (kWh)`,`Energy Production (kWh)`
from historical_energy_data),
market_growth as(
select `date/time`,`location/region`,`energy source`,`energy demand`,
sum(`energy demand`)
over(partition by `location/region` order by `energy source`) as cumulative_sum 
from energy 
where `date/time` like "%2014")
select *  from market_growth;


with `power` as (
select `date/time`,`location/region`,`energy source`,`energy demand`,`Energy Consumption (kWh)`,`Energy Production (kWh)`
from historical_energy_data),
market_increase as(
select `date/time`,`location/region`,`energy source`,`Energy Consumption (kWh)`,
sum(`Energy Consumption (kWh)`)
over(partition by `location/region` order by `energy source`) as cumulative_sum 
from `power` 
where `date/time` like "%2014")
select *  from market_increase;

with utility as (
select `date/time`,`location/region`,`energy source`,`energy demand`,`Energy Consumption (kWh)`,`Energy Production (kWh)`
from historical_energy_data),
market_produce as(
select `date/time`,`location/region`,`energy source`,`Energy Production (kWh)`,
sum(`Energy Production (kWh)`)
over(partition by `location/region` order by `energy source`) as cumulative_sum 
from utility 
where `date/time` like "%2014")
select *  from market_produce;

create table energy_2012(
`year` int,
`location/region` varchar (50),
`demand` int,
`consumed` int,
`produced` int
);


alter table energy_2012
add column energy_source varchar(50);

alter table energy_2012
rename column `produced`to`energy_produced`;

select * from energy_2012;


insert into energy_2012 values
(2012,"Region A",2891922,1536983,1552596,"fossil fuel"),
(2012,"Region B",2400764,1082084,1073902,"fossil fuel"),
(2012,"Region C",3836025,1670842,1923530,"fossil fuel"),
(2012,"Region A",5980781,3129302,2939911,"Renewable energy"),
(2012,"Region B",5710113,2793420,2723954,"Renewable energy"),
(2012,"Region C",7021741,3308311,3709535,"Renewaable energy");

CREATE TABLE `energy_2013` (
  `year` int DEFAULT NULL,
  `location/region` varchar(50) DEFAULT NULL,
  `energy demand` int DEFAULT NULL,
  `energy consumed` int DEFAULT NULL,
  `energy produced` int DEFAULT NULL,
  `energy_source` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into `energy_2013` values
(2013,"Region A",3024384,1754905,1651872,"fossil fuel"),
(2013,"Region B",2998054,1254944,1426369,"fossil fuel"),
(2013,"Region C",3290245,1630146,1961779,"fossil fuel"),
(2013,"Region A",5639014,3096694,3065129,"Renewable energy"),
(2013,"Region B",5520435,2666774,2810570,"Renewable energy"),
(2013,"Region C",6346371,3048578,3738737,"Renewable energy");

select * from energy_2013;

CREATE TABLE `energy_2014` (
  `year` int DEFAULT NULL,
  `location/region` varchar(50) DEFAULT NULL,
  `energy demand` int DEFAULT NULL,
  `energy consumed` int DEFAULT NULL,
  `energy produced` int DEFAULT NULL,
  `energy_source` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into `energy_2014` values
(2014,"Region A",2602961,986720,1118187,"fossil fuel"),
(2014,"Region B",2089710,1091207,1152582,"fossil fuel"),
(2014,"Region C",2389044,1071542,1186859,"fossil fuel"),
(2014,"Region A",4601642,1923554,2037170,"Renewable energy"),
(2014,"Region B",3935888,2064644,2103626,"Renewable energy"),
(2014,"Region C",4580350,2218256,2373856,"Renewable energy");

select * from `energy_2014`;

--- over the years, its observed that the demand of fossil and renewable energy is not met and what is pushed into the 
--- market is below what is demanded , so getting back into markert, the production of the both fossil fuel and renewable
--- energy should be increased to meet up with the demand market.


select count(`infrastructure status`) as no_of_status, `infrastructure status` from infrastructure_data
group by `infrastructure status`;

select count(`Technology Limitations`),`Technology Limitations` from infrastructure_data
group by `Technology Limitations`;

select count(`maintenance activities`), `maintenance activities` from infrastructure_data
group by `maintenance activities`;


--- Because there is a high level of poor infrastructure which led to the high technology limitations, the maintenance
--- activities should be focused more on upgrades rather than routine maintenance and repairs .

















