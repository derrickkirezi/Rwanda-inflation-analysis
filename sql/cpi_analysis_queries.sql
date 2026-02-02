create database rwanda_cpi_data;

use rwanda_cpi_data;

create table cpi (
    id int auto_increment primary key,
    Category varchar(100),
    Weights decimal (6,2),
    Date DATE,
    cpi_value decimal(10,2),
    Year int,
    Month int
);

select *
from cpi;

--1. How has the overall cpi changed over time?

select Date, avg(cpi_value) as 'avg cpi'
from cpi
group by Date;

--2. Which CPI categories contribute most to inflation?

select Category, avg(cpi_value) as 'average cpi'
from cpi
group by Category
order by avg(cpi_value) desc;

--3. How does CPI vary by category over time?

select Category, cpi_value, Date
from cpi
order by Category, date;

--4. What was the year-over-year inflation trend?

select year(Date) as Year, avg(cpi_value) as 'avg cpi'
from cpi
group by year(Date)
order by year(Date);

--5.Which categories are the most volatile?

select Category, stddev(cpi_value) as volatility
from cpi
group by Category
order by Volatility desc;

--6. How categories influence inflation by weight

select distinct Category, Weights
from cpi
order by weights  desc;





