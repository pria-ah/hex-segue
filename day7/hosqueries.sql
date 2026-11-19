use hospitaldb;
-- 1. display patient names with their treatment details
select p.patient_name, t.*
from patients p
inner join treatments t
on p.patient_id = t.patient_id;


-- 2. display all treatments with patient details
select t.*, p.*
from treatments t
inner join patients p
on t.patient_id = p.patient_id;


-- 3. display patient names and the names of patients who referred them
select p1.patient_name as patient_name,
       p2.patient_name as referred_by
from patients p1
left join patients p2
on p1.referred_by = p2.patient_id;


-- 4. display every possible combination of patients and treatments
select *
from patients
cross join treatments;
-- 5. count treatments received by each patient
select p.patient_name, count(t.treatment_id) as total_treatments
from patients p
left join treatments t
on p.patient_id = t.patient_id
group by p.patient_id, p.patient_name;


-- 6. display diseases having more than 2 patients
select disease, count(*) as total_patients
from patients
group by disease
having count(*) > 2;


-- 7. display patients who have received more than 2 treatments
select p.patient_name, count(t.treatment_id) as total_treatments
from patients p
inner join treatments t
on p.patient_id = t.patient_id
group by p.patient_id, p.patient_name
having count(t.treatment_id) > 2;
-- 1. identify patients who have spent more than 10000 on treatments
select p.patient_name, sum(t.treatment_cost) as total_spent
from patients p
inner join treatments t
on p.patient_id = t.patient_id
group by p.patient_id, p.patient_name
having sum(t.treatment_cost) > 10000;


-- 2. find the doctor who has generated the highest total revenue
select doctor_name, sum(treatment_cost) as total_revenue
from treatments
group by doctor_name
order by total_revenue desc
limit 1;


-- 3. find patients who have received both blood test and insulin therapy
select p.patient_name
from patients p
inner join treatments t
on p.patient_id = t.patient_id
where t.treatment_name in ('Blood Test', 'Insulin Therapy')
group by p.patient_id, p.patient_name
having count(distinct t.treatment_name) = 2;


-- 4. display patients admitted in january 2026 but treated in february 2026
select distinct p.patient_name
from patients p
inner join treatments t
on p.patient_id = t.patient_id
where p.admission_date >= '2026-01-01'
and p.admission_date < '2026-02-01'
and t.treatment_date >= '2026-02-01'
and t.treatment_date < '2026-03-01';


-- 5. find the second-highest treatment cost
select max(treatment_cost) as second_highest_cost
from treatments
where treatment_cost < (
    select max(treatment_cost)
    from treatments
);


-- 6. display the top 3 diseases based on the number of patients
select disease, count(*) as total_patients
from patients
group by disease
order by total_patients desc
limit 3;


-- 7. find doctors who have treated more than 2 different patients
select doctor_name, count(distinct patient_id) as total_patients
from treatments
group by doctor_name
having count(distinct patient_id) > 2;


-- 8. display patients who have referred at least 2 other patients
select p.patient_name, count(r.patient_id) as total_referrals
from patients p
inner join patients r
on p.patient_id = r.referred_by
group by p.patient_id, p.patient_name
having count(r.patient_id) >= 2;