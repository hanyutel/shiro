<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
    <head>
        <title>访客主页</title>
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
    <body>
        <h1>
                          访客主页面 <a class="btn btn-success btn-lg" href="${pageContext.request.contextPath}/demo">回导航页</a>
            <shiro:authenticated><a class="btn btn-danger btn-lg" href="logout">退出系统</a></shiro:authenticated>
            <shiro:notAuthenticated><span class="label label-warning label-lg" >未登陆，无需退出系统</span></shiro:notAuthenticated>
        </h1>
        <script type="text/javascript" src="${pageContext.request.contextPath}"></script>
    </body>
</html>