<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
    <head>
        <title>删除用户</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css"></link>
        <style type="text/css">
        a { 
            text-decoration : none;
        }
        
        h1,i {
            color:red;
        }
        
        h1 {
            padding-left:10px;
        }
        
        ul {
            list-style: none;
        }
        </style>
    </head>
    <body style="padding:20px;">
        <h1>删除用户<br><br><a class="btn btn-success btn-lg" href="${pageContext.request.contextPath}/demo">回导航页</a> <a class="btn btn-info btn-lg" href="${pageContext.request.contextPath}/user/index">用户主页</a> <a class="btn btn-danger btn-lg" href="logout">退出系统</a></h1>
    </body>
</html>