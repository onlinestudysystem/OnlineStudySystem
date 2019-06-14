<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: 86137
  Date: 2019/6/11
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery -->
<script src="http://code.jquery.com/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>今日发布界面</title>
</head>

<style>
    #secondSection{
        margin-top: 52px;
        margin-left: 80px;
        margin-right: 100px;

    }
</style>
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

<section id="secondSection">
    <div class="page-header">
        <h1>今日文章<small style="margin-left: 30px">当前时间:<fmt:formatDate value="<%= new Date()%>" pattern="yyyy年MM月dd日"></fmt:formatDate></small></h1>
    </div>
    <div style="margin-top: 10px">
        <div  class="container-fluid">
            <div class="row">
                <div class="col-md-2" style="margin-top: 10px">
                    <div class="list-group">
                        <a href="/papper/todayPapper" class="list-group-item active" >
                            全部文章
                        </a>
                        <a href="/papper/todayPapper/互联网" class="list-group-item">互联网</a>
                        <a href="/papper/todayPapper/热点新闻" class="list-group-item">热点新闻</a>
                        <a href="/papper/todayPapper/小说" class="list-group-item">小说</a>
                        <a href="/papper/todayPapper/短文" class="list-group-item">短文</a>
                        <a href="/papper/todayPapper/散文" class="list-group-item">散文</a>
                        <a href="/papper/todayPapper/健康养生" class="list-group-item">健康养生</a>
                        <a href="/papper/todayPapper/其他" class="list-group-item">其他</a>
                    </div>
                </div>
                <div class="col-md-10" >
                    <div class="row">
                        <c:forEach var="item" items="${pappers}">
                            <a href="/papper/queryPapperById/${item.papperId}" style="color:#000000">
                                <div class="col-md-5" style="border: 1px solid #e7e7e7;margin-left: 20px;margin-top: 10px">
                                    <p style="font-weight: bold;font-size: 21px;padding-top:10px">${item.title}</p>
                                    <div style="line-height:30px;overflow: hidden;font-size: 15px;height:88px;text-overflow:ellipsis;" class="text-muted">
                                        <span style="font-size: 20px;font-weight: bold; ">简介:</span>
                                        ${item.papperProfile}
                                    </div>
                                    <div class="row" style="margin-top: 10px">
                                        <span class="text-muted" style="font-size: 15px;margin-left: 17px">发布日期:<fmt:formatDate pattern="yyyy年MM月dd日" value="${item.submitDate}"></fmt:formatDate></span>
                                        <div class="pull-right">
                                            <img style="width: 30px;height:  30px;margin-top: 2px;" src="/static/images/commonPic/heart.png"><span class="text-muted" style="padding-top: 10px;margin-right: 10px;font-size: 18px ;">${item.enshrineNumber}人</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

    </div>
</section>
</body>
</html>
