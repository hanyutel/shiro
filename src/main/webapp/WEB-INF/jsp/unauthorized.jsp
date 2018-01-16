<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css"></link>
<style>
<!--
a {
    text-decoration: none;
}
h1 {
    color:red;
}
-->
</style>
<body style="padding:20px;">
<h1>
    <shiro:hasRole name="admin">您当前未分配相应的角色权限，请联系系统管理员</shiro:hasRole>
    <shiro:lacksRole name="admin">您当前未分配admin角色，请联系系统管理员</shiro:lacksRole>
</h1>
<h2><span class="label label-warning">请抱歉，由于您访问了未授权的系统资源您接下来的行为已经处于系统的监控中,请慎行！</span></h2>
<h1><a class="btn btn-info btn-lg" href="${pageContext.request.contextPath}/demo">回导航页</a> <a class="btn btn-danger btn-lg" href="logout">退出系统</a></h1>
</body>