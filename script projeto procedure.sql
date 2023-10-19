use company;
show indexes from dependent;

-- desafio 1:

alter table employee add index index_full_name (fname, mname, lname); -- a criação desse index é devido a alta quantidade de busca por essa informação

select count(e.dnumber) as contagem, dname from employee e, department d where d.dnumber = e.dnumber group by dname order by contagem desc limit 1;

select dname, dlocation from department d, department_locations l where d.dnumber = l.dnumber;

select count(e.dnumber) as contagem, dname from employee e, department d where d.dnumber = e.dnumber group by dname;

-- desafio 2:

use ecommerce;

delimiter ^^
create procedure procedure_ecommerce_product ( 
	in var int,
    in var1 varchar(100),
    in var2 varchar(100),
    in var3 varchar(100),
    in var4 varchar(100))
begin
	case var
    when 1 then 
	insert into product (productDescription, Price, Evaluation, Category) 
    values (var1,var2,var3,var4);
    when 2 then update product set price = var1 where idproduct = var2;
    when 3 then delete from product where idproduct = var1;
    end case;
end ^^
delimiter ;

call procedure_ecommerce_product(2, '699.90', '1', null, null);

delimiter ^^
create procedure procedure_university_subject ( 
	in var int,
    in var1 varchar(100),
    in var2 varchar(100),
    in var3 varchar(100),
    in var4 varchar(100))
begin
	case var
    when 1 then 
	insert into subject (namesub, idteacher, hours, classroom) 
    values (var1,var2,var3,var4);
    when 2 then update subject set classroom = var1 where idsub = var2;
    when 3 then delete from subject where idsub = var1;
    end case;
end ^^
delimiter ;

call procedure_ecommerce_product(2, 'lab3', '1', null, null);