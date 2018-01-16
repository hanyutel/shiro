<%@page pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Shiro 权限框架</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css"></link>
        <style type="text/css">
        a, a:hover { 
            text-decoration : none;
            cursor:pointer;
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
        
		.modal-backdrop.in {
		    filter: alpha(opacity=70);
		    opacity: .7;
		}
		img {
            border: 1px solid #ddd;
            border-radius: 4px;
		}
        </style>
    </head>
    <body style="overflow: hidden;">
        <h1>Shiro 权限框架 </h1>
        <ul>
            <li>
                <h2><i class="glyphicon glyphicon-chevron-right"></i> <a data-toggle="modal" data-target="#remarkModal">简介</a></h2>
            </li>
            <li>
                <h2><i class="glyphicon glyphicon-chevron-right"></i> <a data-toggle="modal" data-target="#ideaModal">核心概念</a></h2>
            </li>
            <li>
                <h2><i class="glyphicon glyphicon-chevron-right"></i> <a data-toggle="modal" data-target="#principleModal">实现原理</a></h2>
            </li>
            <li>
                <h2><i class="glyphicon glyphicon-chevron-right"></i> <a href="${pageContext.request.contextPath}/demo">功能演示</a></h2>
            </li>
            <li>
                <h2><i class="glyphicon glyphicon-chevron-right"></i> <a onclick="tipMsg()">源码解读</a></h2>
            </li>
        </ul>
        <div id="principleModal" class="modal fade" role="dialog" data-backdrop="static" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Shiro 实现原理</h4>
                    </div>
                    <div class="modal-body" style="height:430px;overflow-y:auto; ">
                        <img src="${pageContext.request.contextPath}/assets/img/flow.png">
                        <ol>
                            <li>
                                <h4>用户登录时，将登陆信息封装为认证令牌（特殊的卡片）</h4>
                            </li>
                            <li>
                                <h4>构建当前系统认证主体（用户），用户拿着令牌去认证中心（安全管理器）进行验证。</h4>
                                <h4><span class="label label-danger">Shiro框架所谓的验证，其实是验证令牌的合法性和权限</span></h4>
                            </li>
                            <li>
                                <h4>框架认证中心在指定范围（Realm）内验证用户的认证状态（<b>Auth<font color="red">entic</font>ation</b>）及权限（<b>Auth<font color="red">oriz</font>ation</b>）</h4>
                            </li>
                            <li>
                                <h4>框架认证中心根据验证结果对不同的访问路径进行处理。</h4>
                            </li>
                        </ol>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
                    </div>
                </div>
            </div>
        </div>
        <div id="remarkModal" class="modal fade" role="dialog" data-backdrop="static" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Shiro 框架简介</h4>
	                </div>
	                <div class="modal-body">
	                    <h3 style="color:red;">Apache Shiro是一个强大且易用的基于RBAC权限模型的Java安全框架。</h3>
	                    <h3>通过相应的API可以执行身份验证、授权和会话管理等操作，适用于任何的应用程序。</h3>
	                    <h3>相对于其他的权限框架，Shiro的学习成本较低，更容易上手。</h3>
	                </div>
	                <div class="modal-footer">
	                    <button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
	                </div>
	            </div>
            </div>
        </div>
        <div id="ideaModal" class="modal fade" role="dialog" data-backdrop="static" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Shiro 核心概念</h4>
                    </div>
                    <div class="modal-body" style="height:430px;overflow-y:auto; ">
                        <ul>
                            <li>
                                <h4><b><i class="glyphicon glyphicon-text-background"></i> Subject(主体)</b></h4>
                                <h4>系统中需进行认证授权的主体，可以简单的理解为当前“用户”。</h4>
                                <h4>之所以不将它存粹的理解为用户，那是因为在Shiro框架中，不仅仅是用户需要认证授权，可能第三方进程，软件等其他事物也可能需要认证授权。</h4>
                                <h4>所以这里将需要认证授权的东西统称为认证主体（Subject）</h4>
                            </li>
                            <li>
                                <h4><b><i class="glyphicon glyphicon-text-background"></i> SecurityManager(安全管理器)</b></h4>
                                <h4>Shiro通过SecurityManager来管理内部组件实例，并通过它来提供安全管理的各种服务。是Shiro框架的核心。类似于Spring框架中的ApplicationContext对象。</h4>
                                <h4>Shiro本身已经实现了所有的细节，可以完全把它当做一个黑盒来使用。</h4>
                            </li>
                            <li>
                                <h4><b><i class="glyphicon glyphicon-text-background"></i> Realm(领域，范围)</b></h4>
                                <h4>当对用户执行认证（登录）和授权（访问控制）验证时，Shiro会从应用配置的Realm中查找用户及其权限信息，在不同的范围中进行权限验证。</h4>
                                <h4>简单的理解就是，当Shiro框架对主体认证和授权验证时，会执行Realm中相应的验证方法，具体的验证规则应该由我们自己完成，所以，Realm至少指定一个且最好由我们自己实现。</h4>
                            </li>
                        </ul>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/jquery/jquery-3.2.1.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/layer/layer.js"></script>
        <script type="text/javascript">
        function tipMsg() {
        	layer.msg("点什么点，看源码去！", {time:2000, icon:5, shift:6});
        }
        </script>
    </body>
</html>