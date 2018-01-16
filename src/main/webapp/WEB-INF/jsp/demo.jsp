<%@page pageEncoding="UTF-8"%>
<html>
    <head>
        <title>首页</title>
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
        <h1>Shiro权限访问路径 </h1>
        <ul>
            <li>
                <h2><i class="glyphicon glyphicon-chevron-right"></i> <a href="${pageContext.request.contextPath}/login">登陆页面</a></h2>
            </li>
            <li>
                <h2><i class="glyphicon glyphicon-chevron-right"></i> <a href="${pageContext.request.contextPath}/guest/index">访客主页面(无需认证和授权)</a></h2>
            </li>
            <li>
                <h2><i class="glyphicon glyphicon-chevron-right"></i> <a href="${pageContext.request.contextPath}/user/index">用户主页面(需认证且admin角色可访问)</a></h2>
            </li>
        </ul>
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/jquery/jquery-3.2.1.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript"></script>
    </body>
</html>