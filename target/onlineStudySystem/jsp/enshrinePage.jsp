<%--
  Created by IntelliJ IDEA.
  User: 86137
  Date: 2019/6/10
  Time: 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery -->
<script src="http://code.jquery.com/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>收藏夹</title>
</head>
<body>
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

<section id="secondSection" style="margin-top: 40px;margin-left: 70px">

    <div class="container-fluid" >
        <div class="page-header" >
            <h1>我的收藏夹</h1>
        </div>
        <div class="row">
            <div class="col-md-10" style="padding:15px">
                <c:forEach var="item" items="${enshrines}">
                    <a href="/papper/queryPapperById/${item.papperId}" style="color:#000000">
                        <div class="col-md-5" style="border: 1px solid #e7e7e7;margin-left: 20px;margin-top: 10px">
                            <p style="font-weight: bold;font-size: 21px;padding-top:10px">${item.title}</p>
                            <div style="line-height:30px;overflow: hidden;font-size: 15px;height:88px;text-overflow:ellipsis;" class="text-muted">
                                <span style="font-size: 20px;font-weight: bold; ">简介:</span>
                                ${item.papperProfile}
                            </div>
                            <div class="row text-center" style="margin-top: 5px">
                                <a href="/enshrine/delete/${item.papperId}/${item.userId}"  style="width: 150px;" class="btn btn-warning btn-danger btn-lg text-center">取消收藏</a>
                                <a href="/papper/queryPapperById/${item.papperId}" style="width: 150px;" class="btn btn-warning btn-danger btn-lg text-center">查看收藏文章</a>
                            </div>
                        </div>
                    </a>
                </c:forEach>
            </div>
        </div>
    </div>
</section>

</body>
</html>
