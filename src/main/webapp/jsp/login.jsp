<%--
  Created by IntelliJ IDEA.
  User: 86137
  Date: 2019/6/8
  Time: 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>会员登录首页</title>

    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

    <link href="../font/iconfont.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="/css/main.css">
    <link rel="stylesheet" type="text/css" href="/css/login.css">


</head>
<style>
    a:focus {
        outline:none;
    }
    label{
        font-size: 23px;
    }
    #loginFormSection{
        margin-left: 150px;
    }
</style>
<body>
<c:if test="${msg!=null}">
    <script>
        alert("注销成功!");
    </script>
</c:if>



<section id="header_section" style="margin-bottom: 50px">
    <nav id="main_nav" class="navbar navbar-default navbar-static-top">
        <div class="container" style=" margin-left:70px">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#qh_navbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="#" class="navbar-brand">BSDN</a>
            </div>
            <div id="qh_navbar" class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="/papper/homePage">首页</a>
                    </li>
                    <li>
                        <a href="/papper/todayPapper">今日发布</a>
                    </li>
                </ul>
                <div class="navbar-form navbar-right hidden-sm">
                    <form  action="/papper/queryPapperByTitle">
                        <div class="input-group ">
                            <input type="text" name="input_title" class="form-control" placeholder="文章名称..." />
                            <span class="input-group-btn">
                 					 <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span></button>
								</span>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </nav>
</section>

<section id="loginFormSection">
    <sf:errors path="*" cssClass="text-center" cssStyle="color: red;font-size: 20px" element="div"/>
    <div id="loginhtml" class="container">
        <div class="row">
            <div class="col-md-7 col-sm-6 col-xs-5"></div>
            <div class="col-md-10 col-sm-12 col-xs-14 login-col">
                <ul class="nav nav-tabs">
                    <li class="col-md-6 active"><a  href="#loginform" data-toggle="tab" style="font-size: 20px;">登录账号</a></li>
                    <li class="col-md-6"><a  href="#regform" data-toggle="tab"  style="font-size: 20px;" >注册账号</a></li>
                </ul>
                <div class="tab-content" style="margin-top: 50px">
                    <div id="loginform" class="tab-pane fade in active">
                        <c:if test="${login_msg!=null}">
                            <span style="color:red;font-size: 18px">${login_msg}</span>
                        </c:if>

                        <sf:form commandName="userInfo" action="/user/login"  method="post">

                            <div class="form-group">
                                <label >账号:</label>
                                <sf:input type="text" name="username" class="form-control" style="font-size: 18px;padding: 10px;height: 45px" placeholder="邮箱/手机/用户名" path="username"/>
                            </div>
                            <div class="form-group">
                                <label>密码:</label>
                                <sf:input type="password" name="password" class="form-control"  style="font-size: 18px;padding: 10px;height: 45px" path="password"  placeholder="密码"/>
                            </div>
                            <div class="checkbox pull-right" >
                                <label style="font-size: 18px"><input type="checkbox" name="rememberme">10天内自动登录</label>
                            </div>
                            <div class="form-group">
                                <input type="submit" class="form-control btn btn-primary" style="height: 50px;padding: 10px;font-size: 20px;font-weight: bold" value="登录"/>
                            </div>
                        </sf:form>
                        <div class="form-group">
                            <p><a href="#">找回密码</a> | 还没有账号? <a href="#">注册账号</a></p>
                            <p style="text-align: right;">使用第三方账号登录:
                            </p>
                            <p style="text-align: right;">
                                <a href="#"><span class="iconfont icon-weixin"></span></a>
                                <a href="#"><span class="iconfont icon-qq"></span></a>
                            </p>
                        </div>
                    </div>
                    <div id="regform" class="tab-pane fade">
                        <sf:form action="/user/regist" commandName="userInfo" method="post">

                            <div class="form-group">
                                <label>用户名:</label>
                                <sf:input type="text" name="username"  style="font-size: 18px;padding: 10px;height: 45px" class="form-control" placeholder="用户名长度最少3个字符" path="username"/>
                            </div>
                            <div class="form-group">
                                <label>密码:</label>
                                <sf:input type="password" name="password"  style="font-size: 18px;padding: 10px;height: 45px" class="form-control" placeholder="密码"  path="password" />
                            </div>
                            <div class="form-group">
                                <label>邮箱:</label>
                                <sf:input type="text" name="email"  style="font-size: 18px;padding: 10px;height: 45px" class="form-control" placeholder="常用的手机号码" path="email"/>
                            </div>
                            <div class="form-group" >
                                <label>姓名:</label>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <sf:input type="text" name="name"  style="font-size: 18px;padding: 10px;height: 45px" class="form-control" placeholder="输入名字"  path="name"/>
                                    </div>
                                </div>

                                <div class="form-group" style="margin-top: 20px" >

                                    <div class="row">
                                        <label style="margin-left: 10px">性别:</label>
                                        <sf:radiobutton path="sex" value="man" checked="true"/><span style="font-size: 22px;margin-left: 10px" class="text-muted">男</span>
                                        <sf:radiobutton path="sex" value="woman"/><span  style="font-size: 22px;margin-left: 10px" class="text-muted">女</span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group" style="margin-top: 30px; margin-bottom: 20px;">
                                <input type="submit" class="form-control btn btn-primary btn-lg"  style="height: 50px;padding: 10px;font-size: 20px;font-weight: bold" value="提交注册"/>
                            </div>

                        </sf:form>
                    </div>
                </div>
            </div>
            <div class="col-md-7 col-sm-6 col-xs-5"></div>
        </div>
    </div>
</section>
</body>
</html>
