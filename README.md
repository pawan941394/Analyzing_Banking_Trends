# Analyzing Banking Trends
Analyzing Banking Trends: Customer Transactions and Regional Impact

# Overview
This repository contains a Data Analysis project that demonstrates the use of various technologies, including Python, SQL, MySQL, Tableau, and Power BI, to analyze and visualize data. The project focuses on [ briefly describe the main objective or theme of your analysis ].

# Technologies Used

  * Python: Python was used for data preprocessing, analysis, and visualization. Libraries such as Pandas, NumPy, and Matplotlib were utilized for these tasks.

  * SQL: SQL queries were employed to extract and manipulate data from the MySQL database, which serves as the primary data source.

  * MySQL: MySQL was used to store and manage the structured data, making it accessible for analysis and reporting.

  * Tableau: Tableau was utilized to create interactive and insightful data visualizations, allowing for a better understanding of the analyzed data.

  * Power BI: Power BI was used to generate interactive reports and dashboards, enabling stakeholders to explore the project's findings.

# Project Highlights

  * Data Preparation: Describe any significant data preprocessing steps, such as data cleaning, transformation, or feature engineering.
  
  * SQL Queries: Highlight key SQL queries or operations performed on the MySQL database.
  
  * Visualization: Mention the main visualizations created using Tableau and Power BI, and how they contribute to the project's objectives.
  
  * Insights: Summarize the key insights or findings derived from the analysis.

# Folder Structure

  * DataBase : This folder contain the banking data.

  * Power BI : This folder contains the 'POWER BI' works for visualizations.

  * Python_Work : This folder contains the 'PYTHON WORK' for cleaning the DataBase.

  * SQL WORKSHEET : This folder contains the 'SQL WORK' .

  * Tableau : This folder contans the 'TABLEAU WORK' for visualizations.


#SQL WORKS (Some of Sql Queries) -- 

  1.  No of user region wise
  
  *  Query : ```select r.region_name  as region_name, count(distinct  n.consumer_id) as num_users
from world_regions r
left join 
user_nodes n
on r.region_id = n.region_id
group by r.region_name
;```

  2.  Find the user who made the largest deposit amount and the transaction type for that deposit.

  * Query : ```select consumer_id , transaction_type ,transaction_amount from user_transactions
where  transaction_amount = (select max(transaction_amount) from user_transactions )
and transaction_type = 'deposit'```

  3.  Calculate the total amount deposited for each user in the "Europe" region.

  * Query : ```SELECT u.consumer_id, SUM(t.transaction_amount) AS total_deposited_amount
FROM user_nodes u
JOIN user_transactions t ON u.consumer_id = t.consumer_id
WHERE u.region_id = 2
AND t.transaction_type = 'Deposit'
GROUP BY u.consumer_id;```

  4. Calculate the total number of transactions made by each user in the "United States" region.

  *  Query : ```select consumer_id,count(consumer_id) as num_transactions 
from user_transactions
group by consumer_id 
having 5 < count(consumer_id);```


  5. Find the regions with the highest number of nodes assigned to them.

  * Query : ```select w.region_name , count(n.node_id) as num_nodes 
                from world_regions w
                inner join 
                user_nodes n
                on w.region_id = n.region_id
                group by 
                n.region_id , w.region_name
                having 0< count(n.node_id);```

  6. Find the user who made the largest deposit amount in the "Australia" region.

  * Query : ```select top 1 c.consumer_id,c.transaction_amount
from user_transactions c
join 
user_nodes n
on 
c.consumer_id= n.consumer_id
where n.region_id=3
and c.transaction_type='deposit'
order by c.transaction_amount desc
;```

  7.  Calculate the total amount deposited by each user in each region.

  *  Query : ```select  u.consumer_id,
w.region_name as region_name,
sum(u.transaction_amount) as total_deposit_amount
from user_transactions u
inner join 
user_nodes un
on un.consumer_id =  u.consumer_id
inner join 
world_regions w
on w.region_id = un.region_id
where u.transaction_type = 'deposit'
group by un.region_id,w.region_name, u.consumer_id```

  8.  Retrieve the total number of transactions for each region

  * Query :  ```
select  w.region_name,count(u.transaction_amount) as  total_transactions
from user_transactions u
inner join 
user_nodes un
on un.consumer_id =  u.consumer_id
inner join 
world_regions w
on w.region_id = un.region_id
group by un.region_id,w.region_name```

  9. Write a query to find the total deposit amount for each region (region_name) in the user_transaction table. Consider only those transactions where the consumer_id is associated with a valid region in the user_nodes table.

  *  Query : ``` select  w.region_name,sum(u.transaction_amount) as  total_transactions
from user_transactions u
inner join 
user_nodes un
on un.consumer_id =  u.consumer_id
inner join 
world_regions w
on w.region_id = un.region_id
where u.transaction_type= 'deposit'
group by un.region_id,w.region_name```

  10.  Write a query to find the top 5 consumers who have made the highest total transaction amount (sum of all their deposit transactions) in the user_transaction table.

  * Query : ``` select top 5 c.consumer_id,sum(c.transaction_amount) as total_transaction_amount
              from user_transactions c
              where c.transaction_type='deposit'
              group by c.consumer_id order by sum(c.transaction_amount) desc;```

  11.  How many consumers are allocated to each region?

  * Query : ```select un.region_id as  region_id ,  wr.region_name as region_name,count(distinct ut.consumer_id)  as snum_of_customers
  from  user_transactions ut
  inner join 
  user_nodes un
  on ut.consumer_id=un.consumer_id
  inner join world_regions wr
  on wr.region_id=un.region_id
  group by un.region_id, wr.region_name```

  12.  What is the unique count and total amount for each transaction type?

  * Query : ```select 
transaction_type as    txn_type, count(distinct consumer_id) as unique_count,
sum(transaction_amount) as total_amount
from user_transactions
group by transaction_type
;```

  13.  What are the average deposit counts and amounts for each transaction type ('deposit') across all customers, grouped by transaction type?

  * Query : ```select transaction_type as   txn_type, ceiling((count(transaction_amount)*1.0) / (count(distinct consumer_id) *1.0))as avg_deposit_count,
ceiling((sum(transaction_amount)*1.0) / (count(distinct consumer_id) *1.0))
as avg_deposit_amount
from user_transactions
where transaction_type = 'deposit'
group by transaction_type
;```

  14.  How many transactions were made by consumers from each region?

  * Query : ```select wr.region_name,count(ut.transaction_type) as num_transactions
from user_transactions ut
inner join user_nodes un
on un.consumer_id = ut.consumer_id
inner join 
world_regions wr
on wr.region_id = un.region_id
group by region_name;```


# Creating Visualizations 

  *   Tableau DashBoard :
![tableau dashboard](https://github.com/pawan941394/Analyzing_Banking_Trends/assets/63099276/8b431aee-ac94-4033-b4bd-9cb5632235ff)
  
  Note :  It's dynamic dashboard .

  * Power BI Dashboard
    ![Power Bi](https://github.com/pawan941394/Analyzing_Banking_Trends/assets/63099276/3c2ae01c-cd62-4410-9c4c-90bc2b3cdcb8)

  Note :  It's dynamic dashboard .


# Contributions
  
Contributions and feedback are welcome. If you'd like to contribute to this project or report issues, please follow GitHub's standard procedures for pull requests and issue tracking.


# Note :

Feel free to customize this project description to match the specific details and objectives of your Data Analysis project. Once you've created your GitHub repository, you can add this description to the repository's README.md file for clear documentation.
