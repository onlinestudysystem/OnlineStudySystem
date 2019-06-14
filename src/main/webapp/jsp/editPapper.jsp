<%--
  Created by IntelliJ IDEA.
  User: 86137
  Date: 2019/6/11
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery -->
<script src="http://code.jquery.com/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<script src="/js/jquery.form.js"></script>
<html>
<head>
    <title>修改文章界面</title>
</head>
<style>
    #second_section{
        margin-top: 30px;
        margin-left: 80px;
        margin-right: 100px;
    }
</style>

<body>
<c:if test="${msg!=null}">
    <c:choose>
        <c:when test="${msg=='更新成功！'}">
            <script>
                alert("更新成功！");
            </script>
        </c:when>
        <c:otherwise>
            <script>
                alert("更新失败，请检重试！");
            </script>
        </c:otherwise>
    </c:choose>

</c:if>

<section id="header_section">
    <nav  class="navbar navbar-default navbar-static-top">
        <div class="container" style="margin-left:70px">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#qh_navbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="#" class="navbar-brand"><i class="iconfont icon-ship"></i>BSDN</a>
            </div>
            <div id="qh_navbar" class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="/papper/homePage">首页</a>
                    </li>
                    <li>
                        <a href="/papper/todayPapper">今日发布</a>
                    </li>
                    <li>
                        <a href="/enshrine/queryEnshrinePage/${sessionScope.userInfo.userId}">我的收藏</a>
                    </li>
                    <li>
                        <a href="/footPrint/queryAllFootPrint">我的足迹</a>
                    </li>

                    <c:if test="${sessionScope.userInfo!=null}">
                        <li>
                            <a href="/papper/queryManagePapperForm/${sessionScope.userInfo.userId}">管理文章</a>
                        </li>
                    </c:if>
                </ul>
                <ul class="nav navbar-nav pull-right" style="margin-left: 50px" >
                    <c:if test="${sessionScope.userInfo!=null}">
                        <li><a href="/user/logout" style="font-size: 15px;"><span class="glyphicon glyphicon-off" style="margin-right: 10px"></span>注销</a></li>
                    </c:if>

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" style="height:45px" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            <c:choose>
                                <c:when test="${sessionScope.userInfo!=null}">
                                    <img src="${sessionScope.userInfo.photo}" style="width: 45px;height: 45px;margin-top: -13px" alt="用户头像" class="img-circle"/>
                                </c:when>
                                <c:otherwise>
                                    <img src="/static/images/userLogo/disOnlineUser.png" style="width: 45px;height: 45px;margin-top: -13px" class="img-circle"/>
                                </c:otherwise>
                            </c:choose>

                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="/user/personalInfo">个人信息</a></li>
                            <li><a href="#">账号安全</a></li>
                        </ul>
                    </li>
                    <li>
                        <c:if test="${sessionScope.userInfo==null}">
                            <a href="/user/login">登录/注册</a>
                        </c:if>
                    </li>
                </ul>
                <div class="navbar-form navbar-right hidden-sm">
                    <form  action="/papper/queryPapperByTitle" method="post">
                        <div class="input-group ">
                            <input type="text" name="title" class="form-control" placeholder="输入文章名称..." />
                            <span class="input-group-btn">
                 					 <button type="submit"  class="btn btn-primary btn-md"><span class="glyphicon glyphicon-search"></span></button>
                            </span>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </nav>
</section>

<section id="second_section">
    <div class="container-fluid">
        <div class="page-header">
            <h1>编辑文章</h1>
        </div>
        <div class="row">
            <sf:form action="/papper/edit/${papper.papperId}" method="post" commandName="papper">

                <div class="form-group">
                    <label for="title">文章标题:</label>
                    <sf:input type="text" path="title" class="form-control"  name="title" id="title" placeholder="文章标题，小于50字"/>
                </div>
                <div class="form-group">
                    <label for="papperProfile">文章简介:</label>
                    <sf:textarea class="form-control" path="papperProfile" id="papperProfile" name="papperProfile" rows="3" placeholder="文章简介小于100字"></sf:textarea>
                </div>
                <div class="form-group">
                    <label for="papperText">文章内容</label>
                    <sf:textarea class="form-control" id="papperText"  name="papperText" rows="30" path="papperText"></sf:textarea>
                </div>

                <div class="row text-center" >
                    <button type="reset" style="width: 150px;"  class="btn  btn-default btn-lg">清空</button>
                    <button type="submit" id="update_btn" style="width: 150px;" class="btn btn-warning btn-danger btn-lg text-center">提交修改</button>
                </div>
            </sf:form>
        </div>
    </div>
</section>

</body>
</html>