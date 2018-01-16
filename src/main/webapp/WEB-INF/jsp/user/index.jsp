<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
    <head>
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
        <h1>用户<span class="label label-default"><shiro:principal /></span>主页面    <br><br><a class="btn btn-info btn-lg" href="${pageContext.request.contextPath}/demo">回导航页</a> <a class="btn btn-info btn-lg" href="logout">退出系统</a></h1>
        <ul>
            <li>
                <h2>
                    <i class="glyphicon glyphicon-chevron-right"></i>【需新增权限可看】 
                    <shiro:hasPermission name="user:insert">
                        <button onclick="window.location.href='${pageContext.request.contextPath}/user/add'" class="btn btn-success btn-lg">用户新增</button>
                    </shiro:hasPermission>
                </h2>
            </li>
            <li>
                <h2>
                    <i class="glyphicon glyphicon-chevron-right"></i>【需查看权限可看】
                    <shiro:hasPermission name="user:view">
                        <button onclick="window.location.href='${pageContext.request.contextPath}/user/detail'" class="btn btn-info btn-lg">用户详细</button>
                    </shiro:hasPermission>
                </h2>
            </li>
            <li>
                <h2>
                    <i class="glyphicon glyphicon-chevron-right"></i>【需修改权限可看】
                    <shiro:hasPermission name="user:edit">
                        <button onclick="window.location.href='${pageContext.request.contextPath}/user/edit'" class="btn btn-warning btn-lg">用户修改</button>
                    </shiro:hasPermission>
                </h2>
            </li>
            <li>
                <h2>
                    <i class="glyphicon glyphicon-chevron-right"></i>【需删除权限可看】
                    <shiro:hasPermission name="user:delete">
                        <button onclick="window.location.href='${pageContext.request.contextPath}/user/delete'" class="btn btn-danger btn-lg">用户删除</button>
                    </shiro:hasPermission>
                </h2>
            </li>
        </ul>
    </body>
</html>