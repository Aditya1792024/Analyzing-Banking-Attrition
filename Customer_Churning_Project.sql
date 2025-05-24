use SQL_project;

select * from Churn_Modelling;

select distinct Geography from Churn_Modelling;

SELECT COUNT(*) AS column_count
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Churn_Modelling';

-- Data Profiling

-- 1) Finding the column with null values

select count(*) as Total_rows from Churn_Modelling;
select count(distinct CustomerId) as Total_unique_values from Churn_Modelling;

-- No column contains NULL Values 

-- 2) Finding duplicate values in RowNumber & CustomerId columns
select 
count(1) as Total_Rows, 
count(distinct RowNumber) as RowNumber, 
count(distinct CustomerId) as CustomerId 
from Churn_Modelling;

-- There are some duplicate values in CustomerId column.
with A as
(select 
RowNumber, 
CustomerId, 
ROW_NUMBER() over (partition by CustomerId order by RowNumber asc) as ranking 
from Churn_Modelling)
delete from Churn_Modelling
where RowNumber in (select RowNumber from A where ranking > 1);

-- Identifying outliers using z-score method

select * 
from
(select EstimatedSalary, 
((select avg(EstimatedSalary*1.0) from Churn_Modelling) - EstimatedSalary)/(select STDEVP(EstimatedSalary) from Churn_Modelling) as z_score
from Churn_Modelling) B
order by EstimatedSalary;

-- Estimated Salary column have no outliers

select EstimatedSalary from Churn_Modelling order by EstimatedSalary;


-- 3) Finding Data Inconsistencies
select distinct Geography from Churn_Modelling;

update Churn_Modelling 
set Geography = 
case when Geography = 'Spaine' then 'Spain'
when Geography = 'Spen' then 'Spain'
when Geography = 'Gremany' then 'Germany'
when Geography = 'Germani' then 'Germany'
when Geography = 'Germeny' then 'Germany'
else Geography end;

-- 4) Adding Age Group column to the dataset
select min(Age) as min_age, max(Age) as max_age from Churn_Modelling;

--alter table Churn_Modelling
--add Age_Group nvarchar(15);

update Churn_Modelling
set Age_Group = case 
when Age >= 18 and Age < 26 then 'Young'
when Age >= 26 and Age < 41 then 'Adult'
when Age >= 41 and Age < 61 then 'Senior Adult'
else 'Senior Citizen' end;

-- Adding new column Tenure_Group

alter table Churn_Modelling
add Tenure_Group nvarchar(30);

update Churn_Modelling
set Tenure_Group = case
when Tenure between 0 and 1 then 'New Customers'
when Tenure between 2 and 4 then 'Established Customers'
when Tenure between 5 and 7 then 'Loyal Customers'
else 'Veteran Customers' end;

--Adding salary group column
alter table Churn_Modelling
add Salary_Group nvarchar(30);

update Churn_Modelling
set Salary_Group = case 
when EstimatedSalary < 20000 then 'Low'
when EstimatedSalary between 20000 and 100000 then 'Medium'
when EstimatedSalary > 100000 then 'High'
else 'N/A' end;

--Adding CreditScore_Group
alter table Churn_Modelling
add CS_Group nvarchar(20);

update Churn_Modelling
set CS_Group = case 
when CreditScore < 580 then 'Poor'
when CreditScore between 580 and 669 then 'Fair'
when CreditScore between 670 and 749 then 'Good'
else 'Excellent' end;


select 
sum(case when Exited = 1 then 1 else 0 end)*100.0/count(1) as Churn_Rate,
sum(case when Exited = 1 and IsActiveMember = 1 then 1 else 0 end)*100.0/sum(case when IsActiveMember = 1 then 1 else 0 end) 
as Active_Churn_Rate,
sum(case when Exited = 1 and IsActiveMember = 0 then 1 else 0 end)*100.0/sum(case when IsActiveMember = 0 then 1 else 0 end) 
as Inactive_Churn_Rate
from Churn_Modelling where Balance = 0;



-- 5) Understanding the data and indentifying churn rate across different categories

-- Total Number and percentage of churned customers
select count(1) as Churned_Customers, 
count(1)*100.0/(select count(1) 
from Churn_Modelling) as Churn_Percentage
from Churn_Modelling where Exited = 1;

select max(tenure) as max_tenure, min(tenure) as min_tenure from Churn_Modelling;


-- Count of Male and Female Customers
-- Gender-wise percent share and churn rate

select 
Gender, 
count(1)*100.0/(select count(1) from Churn_Modelling) as Percent_Share,
sum(case when Exited = 1 then 1 else 0 end)*100.0/count(1)
as Churn_Rate,
sum(case when IsActiveMember = 0 then 1 else 0 end)*100.0/count(1) 
as Inactive_Member_Percent
from Churn_Modelling group by Gender;


-- Churning among Active and Inactive members
select Total_Customers,
Active_Members,
Inactive_Members,
ChurnedActiveMembers*100.0/Active_Members as Churn_rate_active,
ChurnedInactiveMembers*100.0/Inactive_Members as Churn_rate_inactive
from
(select count(1) as Total_Customers,
sum(case when IsActiveMember = 1 then 1 else 0 end)
as Active_Members,
sum(case when IsActiveMember = 0 then 1 else 0 end)
as Inactive_Members,
sum(case when IsActiveMember = 1 and Exited =1 then
1 else 0 end) as ChurnedActiveMembers,
sum(case when IsActiveMember = 0 and Exited =1 then
1 else 0 end) as ChurnedInactiveMembers
from Churn_Modelling) A


-- Age Group wise customer count and churn rate
select 
Age_Group, 
count(1)*100.0/(select count(1) from Churn_Modelling) 
as Percent_Share,
sum(case when Exited = 1 then 1 else 0 end)*100.0/count(1)
as Churn_Rate,
sum(case when IsActiveMember = 0 then 1 else 0 end)*100.0/count(1) 
as Inactive_Member_Percent
from Churn_Modelling group by Age_Group;


-- Tenure Group wise customer count and churn rate
select Tenure_Group, 
count(1) as Total_Customers,
sum(case when Exited = 1 then 1 else 0 end)*100.0/count(1) as Churn_Rate
from Churn_Modelling
group by Tenure_Group order by Total_Customers desc;
 
--select min(EstimatedSalary) as min_salary, max(EstimatedSalary) as max_salary from Churn_Modelling;

-- Country wise customer count
select Geography, count(1) as Total_Customers from Churn_Modelling group by Geography;

-- Female customers are having higher churn rate of 25%

-- Senior Adult (41-60) and Senior Citizen (>60) are having higher Churn rate


-- Gender-wise churning among Senior Adult Customers
select 
Age_Group, Gender, 
sum(
case 
when Exited = 1 then 1 else 0 
end
)*100.0/count(1) as Churn_Rate
from Churn_Modelling
where Age_Group = 'Senior Adult'
group by Age_Group, Gender;


-- Country wise churn rate
select 
Geography, 
sum(case when Exited = 1 then 1 else 0 end)*100.0/count(1) 
as Churn_Rate,
sum(case when IsActiveMember = 0 then 1 else 0 end)*100.0/count(1) 
as Inactive_Customers
from Churn_Modelling group by Geography;

select Geography, Gender, sum(case when Exited = 1 then 1 else 0 end)*100.0/count(1) as Churn_Rate
from Churn_Modelling
where Gender = 'Female'
group by Geography, Gender;

-- Germany is having Highest Churning of 32%

-- Salary wise churn rate

select Salary_Group, sum(case when Exited = 1 then 1 else 0 end)*100.0/count(1) as Churn_Rate 
from Churn_Modelling group by Salary_Group;

-- Low income and High income group having similar churn rate, High income group is slightly higher.
-- Medium income group is having minimum churn but difference is not much.

-- Credit Score wise Churn Rate

select CS_Group, 
count(1) as Customer_Count,
sum(case when Exited = 1 then 1 else 0 end)*100.0/count(1) as Churn_Rate,
sum(case when IsActiveMember = 1 then 1 else 0 end)*100.0/count(1) as Active_Members_percent
from Churn_Modelling group by CS_Group;

-- As expected, customers with poor credit score having highest churning.

--Churning among active and inactive members
select 
sum(case when IsActiveMember = 1 and Exited = 1 then 1 else 0 end)*100.0/(select count(1) from Churn_Modelling where IsActiveMember = 1)
as Active_Member_ChurnRate,
sum(case when IsActiveMember = 0 and Exited = 1 then 1 else 0 end)*100.0/(select count(1) from Churn_Modelling where IsActiveMember = 0)
as Inactive_Member_ChurnRate
from Churn_Modelling

-- Inactive members are having greater churning.

select 
Gender, 
Age_Group, 
sum(case when Exited = 1 then 1 else 0 end)*100.0/count(1) as Churn_Rate,
sum(case when IsActiveMember = 1 then 1 else 0 end)*100.0/count(1) as Active_Members_Percent,
sum(case when HasCrCard = 1 then 1 else 0 end)*100.0/count(1) as Card_Holder_Percent,
round(avg(NumOfProducts*1.0), 0) as Avg_Products,
round(avg(CreditScore*1.0), 2) as Avg_CreditScore
from Churn_Modelling group by Gender, Age_Group order by Gender;

-- Churning across gender and credit score groups
select
Gender,
CS_Group,
sum(case when Exited = 1 then 1 else 0 end)*100.0/count(1) as Churn_Rate
from Churn_Modelling group by Gender, CS_Group order by Gender;



-- 0 balance customers
select CS_Group, 
count(1) as customers, 
sum(case when Exited = 1 then 1 else 0 end)*100.0/count(1) as Churn_Rate,
sum(case when IsActiveMember = 1 then 1 else 0 end)*100.0/count(1) as Active_Members_Percent
from Churn_Modelling
where Balance < 10000
group by CS_Group


--Age-Group wise Churning among customers who invest in more than 2 products 
select Age_Group, 
count(1) as Total_Customers,
sum(case when NumOfProducts in (3, 4) then 1 else 0 end) as Total_Numbers,
sum(case when NumOfProducts in (3, 4) then 1 else 0 end)*100.0/count(1) as Percentage,
sum(case when Exited = 1 and NumOfProducts in (3, 4) then 1 else 0 end)*100.0/sum(case when NumOfProducts in (3, 4) then 1 else 0 end) 
as Churn_Rate,
sum(case when Exited = 1 and NumOfProducts in (3, 4) then 1 else 0 end) as churned
from Churn_Modelling
group by Age_Group;

select 
CS_Group, Gender,
count(1)*100.0/(select count(1) from Churn_Modelling) 
as Percent_share,
sum(case when Exited = 1 then 1 else 0 end)*100.0/count(1) as Churn_Rate
from Churn_Modelling
group by CS_Group, Gender order by CS_Group;


-- Churn rate by number of products customer invest in.
select NumOfProducts as No_of_Products, 
count(1) as Total_Customers,
sum(case when Exited = 1 then 1 else 0 end) as Churned_Customers,
sum(case when Exited = 1 then 1 else 0 end)*100.0/count(1)
as Churn_Rate
from Churn_Modelling
group by NumOfProducts
order by NumOfProducts;


--Churning among credit card holders
with A as
(select 
sum(case when HasCrCard = 1 then 1 else 0 end) as CrCardHolders,
sum(case when HasCrCard = 1 and IsActiveMember = 0 then 1 else 0 end) 
as InactiveMembers,
sum(case when HasCrCard = 1 and IsActiveMember = 0 and Exited = 1 then 1 else 0 end) 
as ChurnedInactiveCardHolders,
sum(case when HasCrCard = 1 and IsActiveMember = 1 then 1 else 0 end) 
as ActiveMembers,
sum(case when HasCrCard = 1 and IsActiveMember = 1 and Exited = 1 then 1 else 0 end) 
as ChurnedActiveCardHolders
from Churn_Modelling)
select CrCardHolders, InactiveMembers, ActiveMembers,
ChurnedActiveCardHolders*100.0/ActiveMembers as ChurnRate_active,
ChurnedInactiveCardHolders*100.0/InactiveMembers as ChurnRate_inactive
from A;


-- Percent of inactive members across salary groups
select Salary_Group,
count(1) as Total_Customers,
sum(case when IsActiveMember = 0 and HasCrCard = 1 then 1 else 0 end) as InactiveCardHolders,
sum(case when IsActiveMember = 0 and HasCrCard = 1 then 1 else 0 end)*100.0/count(1) as Percentage
from Churn_Modelling
group by Salary_Group;


-- Comparing Credit card holders with those who are without card based on multiple attributes
select 
'CreditCard Holder' as Customer_type,
sum(case when HasCrCard = 1 then 1 else 0 end) as Total_Customers,
sum(case when HasCrCard = 1 and IsActiveMember = 0 then 1 else 0 end) as Inactive,
sum(case when HasCrCard = 1 and IsActiveMember = 1 then 1 else 0 end) as Active,
sum(case when HasCrCard = 1 and IsActiveMember = 0 and Exited = 1 then 1 else 0 end)*100.0/
sum(case when HasCrCard = 1 and IsActiveMember = 0 then 1 else 0 end) as Churn_Rate_among_inactive,
sum(case when HasCrCard = 1 and IsActiveMember = 1 and Exited = 1 then 1 else 0 end)*100.0/
sum(case when HasCrCard = 1 and IsActiveMember = 1 then 1 else 0 end) as Churn_Rate_among_active
from Churn_Modelling
union all
select 'Not CreditCard Holder' as Customer_type,
sum(case when HasCrCard = 0 then 1 else 0 end) as Total_Customers,
sum(case when HasCrCard = 0 and IsActiveMember = 0 then 1 else 0 end) as Inactive,
sum(case when HasCrCard = 0 and IsActiveMember = 1 then 1 else 0 end) as Active,
sum(case when HasCrCard = 0 and IsActiveMember = 0 and Exited = 1 then 1 else 0 end)*100.0/
sum(case when HasCrCard = 0 and IsActiveMember = 0 then 1 else 0 end) as Churn_Rate,
sum(case when HasCrCard = 0 and IsActiveMember = 1 and Exited = 1 then 1 else 0 end)*100.0/
sum(case when HasCrCard = 0 and IsActiveMember = 1 then 1 else 0 end) as Churn_Rate2
from Churn_Modelling;



select Age_Group, 
(select count(1) from Churn_Modelling where Age_Group = c.Age_Group) as Total_Customers,
count(1) as Total_Customers_with_products,
sum(case when Exited = 1 then 1 else 0 end) as Churned_Customers,
sum(case when Exited = 1 then 1 else 0 end)*100.0/count(1) as Churn_rate
from Churn_Modelling c
where NumOfProducts in (3,4)
group by Age_Group;


select Tenure_Group, 
(select count(1) from Churn_Modelling where Tenure_Group = c.Tenure_Group) as Total_Customers,
count(1) as Total_Customers_with_products,
sum(case when Exited = 1 then 1 else 0 end) as Churned_Customers,
sum(case when Exited = 1 then 1 else 0 end)*100.0/count(1) as Churn_rate
from Churn_Modelling c
where NumOfProducts in (3,4)
group by Tenure_Group;


select Age_Group,
sum(case when NumOfProducts in (3, 4) then 1 else 0 end)*100.0/count(1) as Percent_share
from Churn_Modelling
group by Age_Group;












