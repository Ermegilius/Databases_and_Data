drop user if exists 'zeke'@'localhost';
create user 'zeke'@'localhost' identified by 'secret';

grant all privileges on employeedb.* to 'zeke'@'localhost';
-- mysql -u zeke -p

create user if not exists 'administrator'@'localhost';
set password for 'administrator'@'localhost'=password('hardtoguesspassphrase');

grant all privileges on *.* to 'administrator'@'localhost' with grant option;

-- mysql -u administrator -p
