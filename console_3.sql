# DCL操作：
# 1.用户管理
#     create user '用户名'@'主机名' identified by '密码';
#     alter user '用户名'@'主机名' identified with mysql_native_password by '密码';
#     drop user '用户名'@'主机名';
# 2.权限控制
#     create 权限列表 on 数据库名.表名 to '用户名'@'主机名';
#     revoke 权限列表 on 数据库名.表名 to '用户名'@'主机名';


create user 'Lntano'@'localhost' identified by '123456';

create user 'Lntano1'@'%' identified by '123456';

alter user 'Lntano1'@'%' identified with mysql_native_password by '1234';

drop user 'Lntano'@'localhost';

create user 'Lntano'@'localhost' identified by '123456';

show grants  for 'Lntano1'@'%';

grant all on Lntano.* to 'Lntano1'@'%';

revoke all on Lntano.* from 'Lntano1'@'%';