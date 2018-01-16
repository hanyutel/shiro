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
<h1>服务器繁忙，请稍后访问</h1>
<h1><a class="btn btn-info btn-lg" href="${pageContext.request.contextPath}/demo">回导航页</a> <a class="btn btn-danger btn-lg" href="logout">退出系统</a></h1>
</body>