use employeedb;

select * from employee;

update employee set department='admin' where employeeId=3;

update employee set salary=6000 where employeeId=3;

update employee set salary=5700, department='ict' 
where employeeId=2;

-- update employee set salary=round(salary*1.1, 2); -- where missing

update employee set salary=3000, department='marketing'
where lastname='River';

-- update employee set salary=4000; -- where missing

-- delete from employee where lastname='Smith';

-- delete from employee where firstname='Mary' or firstname='Matt';
-- delete from employee where firstname in('Mary','Matt');
-- delete from employee; --where missing, removes all rows!
