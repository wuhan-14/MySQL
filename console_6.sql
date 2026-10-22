# 1.多表关系
#     一对多：在多的一方设置外键，关联一的一方的主键
#     多对多：建立中间表，中间表包含两个外键，关联两张表的主键
#     一对一：用于表结构拆分，在其中任何一方设置外键 (unique)，关联另一方的主键
# 2. 多表查询
#     内连接
#         隐式：SELECT ... FROM 表 A, 表 B where 条件 ...
#         显式：SELECT ... FROM 表 A [inner] join 表 B ON 条件 ...
#     外连接
#         左外：SELECT ... FROM 表 A left [outer] join 表 B ON 条件 ...
#         右外：SELECT ... FROM 表 A right [outer] join 表 B ON 条件 ...
#     自连接
#         SELECT ... FROM 表 A 别名 1, 表 A 别名 2 where 条件 ...
#     子查询
#         标量子查询，列子查询，行子查询，表子查询


create table student(
    id int auto_increment primary key comment '主键ID',
    name varchar(10) comment '姓名',
    no varchar(10) comment '学号'
)comment '学生表';

insert into student values
    (null,'黛绮丝','2000100101'),
    (null,'谢逊','2000100102'),
    (null,'殷天正','2000100103'),
    (null,'韦一笑','2000100104');

create table course(
    id int auto_increment primary key comment '主键ID',
    name varchar(10) comment '课程名称'
)comment '课程表';

insert into course values
    (null,'Java'),
    (null,'PHP'),
    (null,'MySQL'),
    (null,'Hadoop');

create table student_course(
    id int auto_increment comment '主键ID' primary key,
    studentid int not null comment '学生ID',
    courseid int not null comment '课程ID',
    constraint fk_studentid foreign key (studentid) references student (id),
    constraint fk_courseid foreign key (courseid) references course (id)
)comment '学生课程中间表';

insert into student_course values
    (null,1,1),
    (null,1,2),
    (null,1,3),
    (null,2,2),
    (null,2,3),
    (null,3,4);

create table tb_user(
    id int auto_increment primary key comment '主键ID',
    name varchar(10) comment '姓名',
    age int comment '年龄',
    gender char(1) comment '1:男,2:女',
    phone char(11) comment '手机号'
)comment '用户基本信息表';

create table tb_user_edu(
    id int auto_increment primary key comment '主键ID',
    degree varchar(20) comment '学历',
    major varchar(50) comment '专业',
    primaryschool varchar(50) comment '小学',
    middleschool varchar(50) comment '中学',
    university varchar(50) comment '大学',
    userid int unique comment '用户ID',
    constraint fk_userid foreign key (userid) references tb_user(id)
)comment '用户教育信息表';

insert into tb_user(id, name, age, gender, phone) values
    (null,'黄渤',45,'1','18800001111'),
    (null,'冰冰',35,'2','18800002222'),
    (null,'码云',55,'1','18800008888'),
    (null,'李彦宏',50,'1','18800009999');

insert into tb_user_edu(id, degree, major, primaryschool, middleschool, university, userid) values
    (null,'本科','舞蹈','静安区第一小学','静安区第一中学','北京舞蹈学院',1),
    (null,'硕士','表演','朝阳区第一小学','朝阳区第一中学','北京电影学院',2),
    (null,'本科','英语','杭州市第一小学','杭州市第一中学','杭州师范大学',3),
    (null,'本科','应用数学','阳泉第一小学','阳泉区第一中学','清华大学',4);

select * from emp,dept;

select * from emp,dept where emp.dept_id=dept.id;

select emp.name,dept.name from emp,dept where emp.dept_id=dept.id;

select * from emp e,dept d where e.dept_id=d.id;

select e.name,d.name from emp e,dept d where e.dept_id=d.id;

select * from emp e inner join dept d on e.dept_id = d.id;


select e.*,d.name from emp e left outer join dept d on e.dept_id = d.id;

select d.*,e.* from emp e right outer join dept d on e.dept_id = d.id;

select d.*,e.* from dept d right outer join emp e on e.dept_id = d.id;


select a.name,b.name from emp a,emp b where a.managerid=b.id;

select a.name '员工',b.name '领导' from emp a left join emp b on a.managerid=b.id;


select * from emp where salary<5000
union
select * from emp where age>50;


select id from dept where name='销售部';

select *from emp where dept_id=(select id from dept where name='销售部');

select entrydate from emp where name='方东白';

select * from emp where entrydate>(select entrydate from emp where name='方东白');


select id from dept where name='销售部' or name='市场部';

select * from emp where dept_id in (select id from dept where name='销售部' or name='市场部');

select id from dept where name='财务部';

select salary from emp where dept_id=(select id from dept where name='财务部');

select * from emp where salary>all(select salary from emp where dept_id=(select id from dept where name='财务部'));

select salary from emp where dept_id=(select id from dept where name='研发部');

select * from emp where salary>any(select salary from emp where dept_id=(select id from dept where name='研发部'));
select * from emp where salary>some(select salary from emp where dept_id=(select id from dept where name='研发部'));


select salary,managerid from emp where name='张无忌';

select * from emp where salary=12500 and managerid=1;
select * from emp where (salary,managerid)=(12500,1);

select * from emp where (salary,managerid)=(select salary,managerid from emp where name='张无忌');


select job,salary from emp where name='鹿杖客' or name='宋远桥';

select * from emp where (job,salary) in (select job,salary from emp where name='鹿杖客' or name='宋远桥');

select * from emp where entrydate>'2006-01-01';

select e.*,d.* from (select * from emp where entrydate>'2006-01-01') e left join dept d on e.dept_id=d.id;