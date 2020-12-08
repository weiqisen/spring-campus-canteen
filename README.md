# spring-campus-canteen
spring-campus-canteen是什么

`spring-campus-canteen`是基于SSM框架，集成前端点餐页面和后端多角色管理系统，满足校园日常点餐及食堂后台管理，提高校园食堂点餐效率的软件，作为2020年毕业设计。

### 开发环境  

- maven3.6.1
- jdk1.8

### 技术选型

- DB  
  MySQL
- ORM  
  MyBatis
- Framework  
  Spring

### DONE

- [x] SpringMVC、Spring、MyBatis框架的整合
- [x] log4j日志的配置
- [x] 前端使用Hui-admin，Jsp

- [x] 分页插件的封装

### Quick Start【快速使用】

- 1.下载源码

  ```
  git clone git@github.com:weiqisen/spring-campus-canteen.git
  ```

- 2.运行如下命令

  ```
  mvn clean 
  mvn install
  ```

- 3.修改db.properties配置文件(注意：这里使用的mysql版本为8.x)

  修改数据库、密码、相应端口，默认用户名为`root`

  ```
  jdbc.driver=com.mysql.jdbc.Driver
  jdbc.url=jdbc:mysql://localhost:3306/siseuseSSL=false&useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC
  jdbc.username=root
  jdbc.password=123456
  ```

- 4.在本地创建数据库"sise",并运行sise.sql数据库脚本

- 5.启动项目  
  添加Tomcat启动，默认端口为8080





附：[spring-campus-canteen工程地址](http://weiqisen.top/)

