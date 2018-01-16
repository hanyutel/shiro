<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css"></link>
        <style type="text/css">
        input {
            margin-bottom:10px;
        }
        </style>
    </head>
    <body style="padding:20px;">
        <form id="loginForm" class="form-inline">
            登陆账号：<input class="form-control" type="text" name="loginacct" value="admin"><br>
            登陆密码：<input class="form-control" type="password" name="userpswd" value="admin"><br>
			  <div class="checkbox">
			    <label>
			      <input type="checkbox" name="rememberMe" value="1"> 两周内登陆有效
			    </label>
			  </div><br>
             <input id="loginBtn" class="btn btn-success btn-lg" type="button" value="登陆系统">
             <a class="btn btn-danger btn-lg" href="${pageContext.request.contextPath}/demo">回导航页</a>
        </form>
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/layer/layer.js"></script>
        <script type="text/javascript">
            $("#loginBtn").click(function(){
            	
            	var loadingIndex = -1;
            	$.ajax({
            		url : "${pageContext.request.contextPath}/dologin",
            		type : "post",
            		data : $("#loginForm").serialize(),
            		beforeSend : function() {
            			loadingIndex = layer.load(2, {time: 1500});
            		},
            		success : function( result ) {
                		layer.close(loadingIndex);
                		if ( result.success ) {
                			<c:if test="${empty param.redirect_url}">
                			window.location.href = "${pageContext.request.contextPath}/user/index";	
                			</c:if>
                			<c:if test="${not empty param.redirect_url}">
                			window.location.href = "${param.redirect_url}";	
                			</c:if>
                		} else {
                			var msg = "登陆失败，请重新操作";
                			if ( result.errorMsg ) {
                				msg = result.errorMsg;
                			}
                			layer.msg(msg, {time:1000, icon:5, shift:6});
                		}
            		}
            	});
            });
        </script>
    </body>
</html>