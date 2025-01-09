-- Question 1) Calculer le nombre d'actes criminels par année
select year,count( unique_key) as number_crime
from Chicago
group by year
order by number_crime desc;


-- Question 2) Quels sont les catégories d’actes criminel les plus observés
select  primary_type,count(unique_key) as number_crime
from Chicago
group by primary_type
order by number_crime desc;


--Question 3) Peut-on identifier les zones de Chicago où on observe moins de crime entre 2012 et 2022 ? ( A faire sur une carte
select block, ecart
from (
    select block, 
        ( 
            count(distinct case when strftime('%Y', date) = '2012' then unique_key else null end) 
            - 
            count(distinct case when strftime('%Y', date) = '2022' then unique_key else null end)
        ) as ecart
    from Chicago
    where strftime('%Y', date) BETWEEN '2012' AND '2022'
    group by block
)
where ecart > 0;


-- Question 4) Quels sont les périodes dans l’année où l’on observe le plus d’actes criminel
select strftime('%m', date) as month, count(unique_key) as number_crime
from Chicago
group by month
order by number_crime desc;


--Question 5)Quels sont les régions les plus affectées par les crimes en 2012 versus 2022 (A faire sur une carte)
--2012
select count(unique_key) as nbr_acte, block, strftime('%Y', date) AS year
from Chicago
where strftime('%Y', date) = '2012'
group by block, year
order by nbr_acte DESC;

--2022
select count(unique_key) as nbr_acte,block, strftime('%Y', date) as year
from Chicago
where strftime('%Y', date) = '2022'
group by block, year
order by nbr_acte desc;


-- Question 6)  Quels sont les catégories d’actes criminel les plus observés en T1 2022 par location_description
select primary_type, location_description, COUNT(unique_key) as number_crime
from Chicago
where CAST(strftime('%m', date) as INTEGER) between 1 and 3 and strftime('%Y', date) = '2022'
group by primary_type, location_description
order by number_crime desc;

