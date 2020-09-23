<%--
  Created by IntelliJ IDEA.
  User: weiqisen
  Date: 17/12/2019
  Time: 12:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../fore/head.jsp" %>
<html>
<head>
    <title>发布失物信息</title>
</head>
<body>


<div class="containBox">
    <div class="wap-container">
        <div class="container ui-sortable">
            <div class="panel panel-default mt-20">
                <div class="panel-header">发布失物信息</div>
                <div class="panel-body">
                    <form name="form" action="addLost" enctype="multipart/form-data" method="post">
                        <table align="center" width=400px cellspacing=0 cellpadding=3 border=1 height=180px>
                            <tr>
                                <td>标题:失物种类</td>
                                <td><input type="text" name="kind"/></td>
                            </tr>
                            <tr>
                                <td>具体描述:</td>
                                <td><textarea name="content" id="" cols="30" rows="10"></textarea></td>
                            </tr>

                            <tr>
                                <td>上传图片:</td>
                                <td><input type="file" name="image" accept="image/*"/></td>
                            </tr>
                            <tr>
                                <td colspan="3" align="center"><input type="submit" value="添加"/>
                                    <input type="button" value="清空"/></td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
