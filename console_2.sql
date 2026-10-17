# 1.DDL-数据库操作：
#     show databases ;
#     create database 数据库名;
#     use 数据库名;
#     select database();
#     drop database 数据库名;

# 2.DDL-表操作：
#     show tables ;
#     create table 表名(字段 字段类型 ,字段 字段类型)
#     desc 表名;
#     show create table 表名;
#     alter table 表名 add/modify/change/drop/remove to...;
#     drop table 表名;

# DML操作：
# 1.添加数据
#     insert into 表名(字段1,字段2,...) values(值1,值2,...)[(值1,值2,...),...];
# 2.修改数据
#     update 表名 set 字段1=值1,字段2=值2[where 条件];
# 3.删除数据
#     delete from 表名 [where 条件];

# DQL操作：
# select
#     字段列表---->[as] 别名
# from
#     表名
# where
#     条件列表---->(>,>=,<,<=,=,<>,like,between...and,in,and,or)
# group by
#     分组字段列表
# having
#     分组后条件列表---->分组之后过滤
# order by
#     排序字段列表---->升序asc,降序desc
# limit
#     分页参数---->起始索引(从0开始),每页展示记录数

create table emp(
    id int comment  '编号',
    workno varchar(10) comment '工号',
    name varchar(10) comment '姓名',
    gender char(1) comment '性别',
    age tinyint unsigned comment '年龄',
    idcard char(18) comment '身份证号',
    workaddress varchar(50) comment '工作地址',
    entrydate date comment '入职时间'
)comment '员工表';

insert into emp(id, workno, name, gender, age, idcard, workaddress, entrydate)
values (1,'1','柳岩','女',20,'123456789012345601','北京','2000-01-01'),
       (2,'2','张无忌','男',18,'123456789012345602','北京','2005-09-01'),
       (3,'3','韦一笑','男',38,'123456789012345603','上海','2000-08-01'),
       (4,'4','赵敏','女',18,'123456789012345604','北京','2009-12-01'),
       (5,'5','小昭','女',16,'123456789012345605','上海','2007-07-01'),
       (6,'6','杨逍','男',28,'123456789012345606','北京','2006-01-01'),
       (7,'7','范瑶','男',40,'123456789012345607','北京','2005-05-01'),
       (8,'8','黛绮丝','女',38,'123456789012345608','天津','2015-05-01'),
       (9,'9','范凉凉','女',45,'123456789012345609','北京','2010-04-01'),
       (10,'10','陈友谅','男',53,'123456789012345610','上海','2011-01-01'),
       (11,'11','张士诚','男',55,'123456789012345611','江苏','2015-05-01'),
       (12,'12','常遇春','男',32,'123456789012345612','北京','2004-02-01'),
       (13,'13','张三丰','男',88,'123456789012345613','江苏','2020-11-01'),
       (14,'14','灭绝','女',65,'123456789012345614','西安','2019-05-01'),
       (15,'15','胡青牛','男',70,'123456789012345615','西安','2018-04-01'),
       (16,'16','周芷若','女',18,null,'北京','2012-06-01');

select  name,workno,age from emp;

select id, workno, name, gender, age, idcard, workaddress, entrydate from emp;

select * from emp;

select workaddress as '工作地址' from emp;
select workaddress '工作地址' from emp;

select distinct workaddress '工作地址' from emp;

select * from emp where age=88;

select * from emp where age<20;

select * from emp where age<=20;

select * from emp where idcard is null ;

select * from emp where idcard is not null ;

select * from emp where age != 88;
select * from emp where age <> 88;

select * from emp where age >=15 && age<=20;
select * from emp where age >=15 and age<=20;
select * from emp where age between 15 and 20;

select * from emp where gender='女' and age<25;

select * from emp where age=18 or age=28 or age=40;
select * from emp where age in (18,28,40);

select * from emp where  name like '__';
select * from emp where  name like '___';

select * from emp where idcard like '%6';

select count(*) from emp;
select count(idcard) from emp;

select avg(age) from emp;

select max(age) from emp;

select min(age) from emp;

select sum(age) from emp where workaddress='西安';

select gender,count(*) from  emp group by gender;

select gender,avg(age) from  emp group by gender;

select workaddress,count(*) from emp where age<45 group by workaddress having count(*)>=3;

select * from emp order by age asc;

select * from emp order by entrydate desc;

select * from emp order by age asc ,entrydate asc;

select * from emp limit 0,10;
select * from emp limit 10;
select * from emp limit 10,10;

select * from emp where age in(20,21,22,23) and gender='女';

select * from emp where gender='男' and age between 20 and 40 and name like '___';

select gender,count(*) from emp where age<60 group by gender;

select name,age from emp where age<=35 order by age asc ,entrydate desc;

select * from emp where gender='男' and age between 20 and 40 order by age asc ,entrydate asc limit 5;

#执行顺序：from->where->group by->having->select->order by->limit
select e.name ename,e.age eage from emp e where e.age>15 order by eage asc;

