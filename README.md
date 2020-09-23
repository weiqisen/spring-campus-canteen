# spring-campus-canteen
spring-campus-canteen是什么

`spring-campus-canteen`是基于SSM框架，集成前端点餐页面和后端多角色管理系统，满足校园日常点餐及后台管理，提高校园食堂点餐效率的软件，为本人2020年毕业设计。

### 开发环境  

- maven3.6.1
- jdk1.8
- IntelliJ IDEA 2018
- Mac OS

### supmen archetype技术选型

- DB  
  MySQL
- ORM  
  MyBatis
- Framework  
  Spring

### DONE

- [x] SpringMVC、Spring、MyBatis框架的整合
- [x] 统一异常的处理
- [x] log4j日志的配置
- [x] 前端使用Hui-admin，JSP
- [x] Mybatis
  - [x] 分页

### TODO

- [ ] 工具类的整合
- [ ] 分页插件的封装

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

- 3.修改db.properties配置文件

  修改数据库、密码、相应端口，默认用户名为`root`

  ```
  jdbc.driver=com.mysql.jdbc.Driver
  jdbc.url=jdbc:mysql://localhost:3306/sise?useUnicode=true&characterEncoding=utf8
  jdbc.username=root
  jdbc.password=helloworld01
  ```

- 4.在本地创建数据库"sise",并运行sise.sql数据库脚本

- 5.启动项目  
  添加Tomcat启动，默认端口为8080





附：[spring-campus-canteen工程地址](http://weiqisen.top/)

