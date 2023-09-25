select * from	user_transactions
select * from world_regions
select * from user_nodes;

-- no of user region wise 
select r.region_name  as region_name, count(distinct  n.consumer_id) as num_users
from world_regions r
left join 
user_nodes n
on r.region_id = n.region_id
group by r.region_name
;

--  Find the user who made the largest deposit amount and the transaction type for that deposit.

select consumer_id , transaction_type ,transaction_amount from user_transactions
where  transaction_amount = (select max(transaction_amount) from user_transactions )
and transaction_type = 'deposit'





------------ Calculate the total amount deposited for each user in the "Europe" region.



SELECT u.consumer_id, SUM(t.transaction_amount) AS total_deposited_amount
FROM user_nodes u
JOIN user_transactions t ON u.consumer_id = t.consumer_id
WHERE u.region_id = 2
AND t.transaction_type = 'Deposit'
GROUP BY u.consumer_id;


------- Calculate the total number of transactions made by each user in the "United States" region.
select consumer_id,count(consumer_id) as num_transactions 
from user_transactions

group by consumer_id 
having 5 < count(consumer_id)

;

--pending -- 
-- Find the regions with the highest number of nodes assigned to them.
select w.region_name , count(n.node_id) as num_nodes 
from world_regions w
inner join 
user_nodes n
on w.region_id = n.region_id
group by 
n.region_id , w.region_name
having 0< count(n.node_id);




--- Find the user who made the largest deposit amount in the "Australia" region.

select top 1 c.consumer_id,c.transaction_amount
from user_transactions c
join 
user_nodes n
on 
c.consumer_id= n.consumer_id
where n.region_id=3
and c.transaction_type='deposit'
order by c.transaction_amount desc
;



----------Calculate the total amount deposited by each user in each region.
select  u.consumer_id,
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
group by un.region_id,w.region_name, u.consumer_id






-------- Retrieve the total number of transactions for each region


select  w.region_name,count(u.transaction_amount) as  total_transactions
from user_transactions u
inner join 
user_nodes un
on un.consumer_id =  u.consumer_id
inner join 
world_regions w
on w.region_id = un.region_id
group by un.region_id,w.region_name



-- Write a query to find the total deposit amount for each region (region_name) in the user_transaction table. Consider only those transactions where the consumer_id is associated with a valid region in the user_nodes table.



select  w.region_name,sum(u.transaction_amount) as  total_transactions
from user_transactions u
inner join 
user_nodes un
on un.consumer_id =  u.consumer_id
inner join 
world_regions w
on w.region_id = un.region_id
where u.transaction_type= 'deposit'
group by un.region_id,w.region_name

-- Write a query to find the top 5 consumers who have made the highest total transaction amount (sum of all their deposit transactions) in the user_transaction table.

select top 5 c.consumer_id,sum(c.transaction_amount) as total_transaction_amount
from user_transactions c

where c.transaction_type='deposit'

group by c.consumer_id
order by sum(c.transaction_amount) desc
;


-------How many consumers are allocated to each region?
select un.region_id as  region_id ,  wr.region_name as region_name,count(distinct ut.consumer_id)  as snum_of_customers
from  user_transactions ut
inner join 
user_nodes un


on ut.consumer_id=un.consumer_id
inner join world_regions wr
on wr.region_id=un.region_id

group by un.region_id, wr.region_name


-- What is the unique count and total amount for each transaction type?
select 
transaction_type as    txn_type, count(distinct consumer_id) as unique_count,
sum(transaction_amount) as total_amount
from user_transactions
group by transaction_type
;


-- What are the average deposit counts and amounts for each transaction type ('deposit') across all customers, grouped by transaction type?


select 
transaction_type as    txn_type, 
ceiling((count(transaction_amount)*1.0) / 
(count(distinct consumer_id) *1.0))as avg_deposit_count,

ceiling((sum(transaction_amount)*1.0) / (count(distinct consumer_id) *1.0))
as avg_deposit_amount
from user_transactions
where transaction_type = 'deposit'
group by transaction_type
;


--- How many transactions were made by consumers from each region?
select wr.region_name,count(ut.transaction_type) as num_transactions
from user_transactions ut
inner join user_nodes un
on un.consumer_id = ut.consumer_id
inner join 
world_regions wr
on wr.region_id = un.region_id
group by region_name

;
