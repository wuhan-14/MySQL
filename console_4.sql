# 函数：
# 1.字符串函数：
#     concat,lower,upper,lpad,rpad,trim,substring
# 2.数值函数：
#     ceil,floor,mod,rand,round
# 3.日期函数：
#     curdate,curtime,now,year,month,day,date_add,datediff
# 4.流程函数：
#     if,ifnull,case [...] when... then ... else ... end


select concat('Hello','MySQL');

select lower('Hello');

select upper('Hello');

select lpad('01','5','-');

select rpad('01','5','-');

select trim(' Hello MySQL ');

select substring('Hello MYSQL',1,5);

update emp set workno=lpad(workno,5,'0');

select ceil(1.1);

select floor(1.1);

select mod(7,4);

select rand()*10;

select round(4.49);
select round(4.51);

select lpad((rand()*10000),6,'0');

select curdate();

select curtime();

select now();

select YEAR(now());
select MONTH(now());
select DAY(now());

select date_add(now(),interval 70 YEAR );
select date_add(now(),interval 70 MONTH );
select date_add(now(),interval 70 DAY );

select datediff('2021-10-01','2012-12-1');

select name,datediff(curdate(),entrydate)as 'entrydays' from emp order by entrydays desc;

select if(false,'OK','Error');
select ifnull('','Default');
select ifnull(null,'Default');

select
    name,
    workaddress,
    (case workaddress when '北京' then '一线城市' when '上海' then '一线城市' else '二线城市' end ) as '工作地址'
from emp;

create table score(
    id int comment 'ID',
    name varchar(20) comment '姓名',
    math int comment '数学',
    english int comment '英语',
    chinese int comment '语文'
)comment '学员成绩表';

insert into  score(id, name, math, english, chinese)
    values
        (1,'Tom',67,88,95),
        (2,'Rose',23,66,90),
        (3,'Jack',56,98,76);

select
    id,
    name,
    (case when math>=85 then '优秀' when math>=60 then '及格' else '不及格' end)'数学',
    (case when english>=85 then '优秀' when english>=60 then '及格' else '不及格' end)'英语',
    (case when chinese>=85 then '优秀' when chinese>=60 then '及格' else '不及格' end)'语文'
from score;

