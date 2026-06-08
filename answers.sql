--CORE SQL
--1. Highest salary employee per department

SELECT users.name,max(users.salary),departments.name from users
join departments 
on users.department_id=departments.id
GROUP by departments.name
order by departments.name

--2. Users without orders
select users.* from orders
right join users 
on orders.user_id=users.id
where user_id is NULL

--3. Products never ordered
select products.* from products
left join order_items
on products.id=order_items.product_id
where order_id is null

--4. Top customer by revenue

select SUM(total_amount),user_id,name from orders
inner join users
on orders.user_id=users.id
group by user_id
order by total_amount desc

--5. Monthly revenue aggregation
select sum(total_amount),substr(created_at,6,2) as month from orders
where status='COMPLETED'
group by month

--6. Second highest salary
select * from users 
order by salary desc
LIMIT 1 OFFSET 1



