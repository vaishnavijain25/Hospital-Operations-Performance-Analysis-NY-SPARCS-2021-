select * from Hospital_Ops

--Q1: How many patients were admitted in total?

select count(*) as Total_Patient_Count
from Hospital_Ops 

--Insights: With nearly 100,000 inpatient admissions, hospital operations must focus on capacity planning and resource optimization to manage patient flow effectively.

--Q: What is the total cost incurred by all patients?

select sum(Total_Costs) as Total_Cost_incurred_patients_$
from Hospital_Ops

--Insights: The total costs incureed by patients are $2.4Billion+, suggests samall improvements in length of stay, discharge efficiency, resource usage.

--Q: Average length of stay and average cost per patient?

select AVG(Length_of_Stay) as Avg_LOS, AVG(Total_Costs) as Avg_cost_patient
from Hospital_Ops

--Insights:
--Average LOS per patient is 6 impacts bed availability.
-- Average cost per patient is $24K wshows high treament per patient.

--Q: Which patients had the shortest and longest stays?

select min(Length_of_Stay) as minimum_LOS,
max(Length_of_Stay) as maximum_LOS
from Hospital_Ops

--Insight:
--	Minimum LOS  is 1 which shows quick treament for less severe cases.

--Q: How many patients per hospital or per admission type?

select Facility_Name, Type_of_Admission, COUNT(*) as count_patient
from Hospital_Ops
GROUP BY  Type_of_Admission ,  Facility_Name
order by count_patient desc


--Insight:
--Montefiore Medical Center - Henry & Lucy Moses Div, New York - Presbyterian/Queens, New York - Presbyterian Brooklyn Methodist Hospital,NYU Langone HospitalsStrong Memorial Hospital have more Emergency patients indicating Emergenvy hubs.
--Mount Sinai Hospital, NYU Langone Hospital-Long Island, NYU Langone Hospitals are significant hubs for Newborn admission
--Emergency type have higher frequency shows hospitals must invest more in Emergency departments like beds, staff, equipment.

--Q: Which hospitals have the highest patient load?

select Facility_Name,  COUNT(*) as patient_count
FROM Hospital_Ops
GROUP BY Facility_Name
ORDER BY  patient_count DESC

--Insight:
--Mount Sinai Hospital,NYU Langone Hospitals,Montefiore Medical Center - Henry & Lucy Moses Div, NYU Langone Hospital-Long Island, New York - Presbyterian/Queens are busiest hospitals in dataset needs more staff planning & capacity planning.

--Q1: Count emergency patients
--Q2: List patients with LOS > 10

select  * from Hospital_Ops

select count(*) as count_patient_emergency
from 
Hospital_Ops 
where Type_of_Admission = 'Emergency'

--Insight:
--Most patients are admitted through Energency admission so Hospitals must have beds , staffs, doctors availability. Indicates Emergency is under constant pressure.

select * from Hospital_Ops 
where Length_of_Stay > 10

--151743 patient have LOS> 10 which increase total costs for treament and beds shortage.

--Q: Categorize LOS into Short / Medium / Long stays
select * from Hospital_Ops

SELECT COUNT(*) AS patients_count,	
   CASE
     WHEN Length_of_Stay < 5 THEN 'Short'
     WHEN Length_of_Stay BETWEEN 5 AND 10 THEN 'Medium'
     WHEN Length_of_Stay > 10 THEN 'Long'
   END AS LOS_category
from Hospital_Ops
GROUP BY 
   CASE
     WHEN Length_of_Stay < 5 THEN 'Short'
     WHEN Length_of_Stay BETWEEN 5 AND 10 THEN 'Medium'
     WHEN Length_of_Stay > 10 THEN 'Long'
   END 

--Insights:
--Short LOS :  less severe case i.e 60360
--Medium : normal treament and time i.e 24111
--Long :  few but takes more time, costs, beds i.e 15173

--Q: How many unique hospitals?

SELECT count(distinct(Facility_Name)) as count_unique_hospital 
from Hospital_Ops

--Insights:
-- 75 unique hospital means there insights of performance, patient load & operations across Hospitals

--Q1: Top 5 busiest hospitals/highest patient load
--Q2: Top 5 most expensive patients

select * from Hospital_Ops

select top 5 Facility_Name , count(*) as patient_count
from Hospital_Ops 
group by Facility_Name
Order by  patient_count desc

--Insights:
--Montefiore Medical Center - Henry & Lucy Moses Div, NYU Langone Hospital-Long Island, New York - Presbyterian/Queens are busiest hospital in dataset indicating needs more staff planning , more beds, effiecient patient flow to avoid overcrowding.

select top 5 Facility_Name,Total_costs 
from Hospital_Ops
Order by Total_Costs desc

--Insights:
--Managment should monitor this high cost cases to optimise resourse , unnecessary expenses, and proper insurance coverage

--Q: Hospitals with more than 1000 patients in the dataset

select Facility_Name, count(*) as count_patient
from 
Hospital_Ops
GROUP BY Facility_Name 
HAVING count(*) > 1000
order by count_patient desc

--Insight:
--Mount Sinai Hospital, NYU Langone Hospitals, Montefiore Medical Center - Henry & Lucy Moses Div have the highest patient count indicates they need more capacity , staff, beds planning & cost control.

select distinct(Facility_Name) from Hospital_Ops

create table Hospital_Capacity(
  Facility_Name NVARCHAR(200), 
  Bed_Capacity INT)

 
 insert into Hospital_Capacity(Facility_Name, Bed_Capacity) values 
 ('Soldiers and Sailors Memorial Hospital of Yates County', 50),
 ('Geneva General Hospital' , 80),
 ('Our Lady of Lourdes Memorial Hospital', 100),
('Corning Hospital', 75),
('Auburn Community Hospital', 60),
('Kingsbrook Jewish Medical Center', 120),
('St. Peter''s Hospital', 40),
('New York - Presbyterian Brooklyn Methodist Hospital', 300),
('Kings County Hospital Center', 500),
('Glens Falls Hospital', 90),
('Brooklyn Hospital Center - Downtown Campus', 250),
('Albany Medical Center Hospital', 400),
('A.O. Fox Memorial Hospital', 110),
('Ellis Hospital - Bellevue Woman''s Care Center Division', 150),
('Hospital for Special Surgery', 200),
('Elmhurst Hospital Center', 350),
('NYU Langone Hospitals', 600),
('F.F. Thompson Hospital', 100),
('O''Connor Hospital', 80),
('Highland Hospital', 200),
('Montefiore Medical Center-Wakefield Hospital', 450),
('Montefiore Med Center - Jack D Weiler Hosp of A Einstein College Div', 500),
('North Central Bronx Hospital', 300),
('Mount Sinai West', 400),
('Columbia Memorial Hospital', 120),
('Woodhull Medical & Mental Health Center', 350),
('Garnet Health Medical Center - Catskills - G. Hermann Site', 90),
('Gouverneur Hospital', 200),
('Mount Sinai Morningside', 300),
('NYU Langone Hospital-Long Island', 250),
('Garnet Health Medical Center', 180),
('New York - Presbyterian/Queens', 500),
('NYU Langone Orthopedic Hospital', 150),
('Mary Imogene Bassett Hospital', 200),
('Queens Hospital Center', 400),
('New York Community Hospital of Brooklyn, Inc', 120),
('Metropolitan Hospital Center', 350),
('Faxton-St Lukes Healthcare St Lukes Division', 90),
('Jacobi Medical Center', 400),
('Phelps Hospital', 100),
('Coney Island Hospital', 200),
('NewYork-Presbyterian/Hudson Valley Hospital', 250),
('Mount Sinai Beth Israel', 300),
('Strong Memorial Hospital', 350),
('St Elizabeth Medical Center', 100),
('Montefiore Medical Center - Henry & Lucy Moses Div', 450),
('Henry J. Carter Specialty Hospital', 150),
('Lewis County General Hospital', 60),
('Nassau University Medical Center', 350),
('University Hospital of Brooklyn', 250),
('St. Joseph''s MC-St. Vincent''s Westchester Division', 100),
('River Hospital, Inc.', 50),
('Blythedale Children''s Hospital', 80),
('NYU Langone Hospital-Brooklyn', 300),
('Crouse Hospital - Commonwealth Division', 200),
('Harlem Hospital Center', 250),
('Helen Hayes Hospital', 60),
('Crouse Hospital', 220),
('Guthrie Cortland Medical Center', 80),
('SJRH - Dobbs Ferry Pavillion', 50),
('BronxCare Hospital Center', 400),
('Lincoln Medical & Mental Health Center', 300),
('Community Memorial Hospital Inc', 90),
('Memorial Hosp of Wm F & Gertrude F Jones A/K/A Jones Memorial Hosp', 70),
('Montefiore New Rochelle Hospital', 150),
('Montefiore Nyack', 100),
('Bellevue Hospital Center', 450),
('Montefiore Mount Vernon Hospital', 100),
('Maimonides Medical Center', 300),
('Mount Sinai Hospital', 500),
('Ellis Hospital', 150),
('Erie County Medical Center', 300),
('Mount Sinai Brooklyn', 250),
('Garnet Health Medical Center - Catskills', 90),
('Winifred Masterson Burke Rehabilitation Hospital', 80)

select * from Hospital_Capacity 
order by Bed_Capacity desc

--Q: Which hospitals are exceeding capacity if you have another table?

select H.Facility_Name, COUNT(*) as count_patient , C.Bed_Capacity
from 
Hospital_Ops as H
left join Hospital_Capacity as C
ON H.Facility_Name = C.Facility_Name
GROUP BY H.Facility_Name , C.Bed_Capacity
HAVING COUNT(*) > C.Bed_Capacity
ORDER BY COUNT(*)  DESC

--Insights:
--Most hospital have patient count greater than its bed capacity indicates Overcrowding and strained medical staff.


