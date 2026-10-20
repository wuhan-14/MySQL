#非空约束：not null
#唯一约束：unique
#主键约束：primary key 自增：auto_increment
#默认约束：default
#检查约束：check
#外键约束：foreign key

create table user(
    id int primary key auto_increment comment '主键',
    name varchar(10) not null unique comment '姓名',
    age int check ( age>0&&age<=120 ) comment '年龄',
    status char(1) default '1' comment '状态',
    gender char(1) comment '性别'
)comment '用户表';


insert into user( name, age, status, gender) values ('Tom1','19','1','男'),('Tom2','25','0','男');
insert into user( name, age, status, gender) values ('Tom3','19','1','男');

insert into user( name, age, status, gender) values (null,'19','1','男');
insert into user( name, age, status, gender) values ('Tom3','19','1','男');

insert into user( name, age, status, gender) values ('Tom4','80','1','男');
insert into user( name, age, status, gender) values ('Tom5','-1','1','男');
insert into user( name, age, status, gender) values ('Tom5','121','1','男');

insert into user( name, age, gender) values ('Tom5','120','男');


create table dept(
    id int auto_increment comment 'ID' primary key ,
    name varchar(50) not null comment '部门名称'
)comment '部门表';
insert into dept(id, name) VALUES (1,'研发部'),(2,'市场部'),(3,'财务部'),(4,'销售部'),(5,'总经办');

create table emp2(
    id int auto_increment comment  'ID' primary key ,
    name varchar(50) not null comment '姓名',
    age int comment '年龄',
    job varchar(20) comment '职位',
    salary int comment '薪资',
    entrydate date comment '入职时间',
    managerid int comment '直属领导ID',
    dept_id int comment '部门ID'
)comment '员工表';

insert into emp2(id, name, age, job, salary, entrydate, managerid, dept_id)
    values
    (1,'金庸',66,'总裁',20000,'2000-01-01',null,5),
    (2,'张无忌',20,'项目经理',12500,'2005-12-05',1,1),
    (3,'杨逍',33,'开发',8400,'2000-11-03',2,1),
    (4,'韦一笑',48,'开发',11000,'2002-02-05',2,1),
    (5,'常遇春',43,'开发',10500,'2004-09-07',3,1),
    (6,'小昭',19,'程序员鼓励师',6600,'2004-10-12',2,1);

alter table emp2 add constraint fk_emp2_dept_id foreign key (dept_id) references dept(id);

alter table emp2 drop foreign key fk_emp2_dept_id;

#cascade:父表被删除/更新对应记录时，首先检查是否有对于外键，如果有，删除/更新子表的记录（会删除子表所有相关信息）
alter table emp2 add constraint fk_emp2_dept_id foreign key (dept_id) references dept(id) on update cascade on delete cascade ;
#set null:父表被删除对应记录时，首先检查是否有对于外键，如果有，删除子表的记录（删除的子表外键会被设置为null）
alter table emp2 add constraint fk_emp2_dept_id foreign key (dept_id) references dept(id) on update set null on delete set null ;
#no action/restrict:父表被删除/更新对应记录时，首先检查是否有对于外键，如果有，不允许删除/更新