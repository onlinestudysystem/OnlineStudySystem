<%--
  Created by IntelliJ IDEA.
  User: 86137
  Date: 2019/6/8
  Time: 10:26
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
    <title>主页</title>
</head>
<style>
    #middle_section{
        margin-top: 50px;
        margin-left: 85px;
        margin-right: 80px;
        height: 500px;
    }
    .tabclsA{
        font-size: 20px;
        padding:20px;
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


<section id="middle_section" >
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-9"  >
                <div>
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#all"  style="padding-right:20px; padding-left: 20px;" class="tabclsA"  aria-controls="all" role="tab" data-toggle="tab">全部</a></li>
                        <li role="presentation"><a href="#internet"  style="padding-right:20px; padding-left: 20px;"  class="tabclsA" aria-controls="internet" role="tab" data-toggle="tab">互联网</a></li>
                        <li role="presentation"><a href="#news"  style="padding-right:20px; padding-left: 20px;"  class="tabclsA" aria-controls="news" role="tab" data-toggle="tab">热点新闻</a></li>
                        <li role="presentation"><a href="#novel"  style="padding-right:20px; padding-left: 20px;"  class="tabclsA" aria-controls="novel" role="tab" data-toggle="tab">小说</a></li>
                        <li role="presentation"><a href="#short"   style="padding-right:20px; padding-left: 20px;" class="tabclsA" aria-controls="short" role="tab" data-toggle="tab">短文</a></li>
                        <li role="presentation"><a href="#sanwen"  style="padding-right:20px; padding-left: 20px;" class="tabclsA" aria-controls="sanwen" role="tab" data-toggle="tab">散文</a></li>
                        <li role="presentation"><a href="#health"  style="padding-right:20px; padding-left: 20px;"  class="tabclsA" aria-controls="health" role="tab" data-toggle="tab">健康养生</a></li>
                        <li role="presentation"><a href="#others" style="padding-right:20px; padding-left: 20px;"  class="tabclsA" aria-controls="others" role="tab" data-toggle="tab">其它</a></li>
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="all">
                            <div class="row" style="margin-top: 20px">
                                <div class="col-md-12">
                                    <c:forEach var="entry" items="${allPappers}">
                                        <c:forEach var="item" items="${entry.value}">
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
                                    </c:forEach>
                                </div>
                            </div>
                        </div>

                        <div role="tabpanel" class="tab-pane" id="internet">
                            <c:forEach var="entry" items="${allPappers}">
                                <c:if test="${entry.key=='互联网'}">
                                    <c:forEach items="${entry.value}" var="item">
                                        <a href="/papper/queryPapperById/${item.papperId}" style="color:#000000">
                                            <div class="col-md-5" style="border: 1px solid #e7e7e7;margin-left: 20px;margin-top: 10px">
                                                <p style="font-weight: bold;font-size: 21px;padding-top:10px">${item.title}</p>
                                                <div style="line-height:30px;overflow: hidden;font-size: 15px;height:88px;text-overflow:ellipsis;" class="text-muted">
                                                    <span style="font-size: 20px;font-weight: bold; ">简介:</span>
                                                        ${item.papperProfile}
                                                </div>
                                                <div class="row" style="margin-top: 10px">
                                                    <span class="text-muted" style="font-size: 15px;margin-left: 17px">发布日期:<fmt:formatDate pattern="yyyy-MM-dd" value="${item.submitDate}"></fmt:formatDate></span>
                                                    <div class="pull-right">
                                                        <img style="width: 30px;height:  30px;margin-top: 2px;" src="/static/images/commonPic/heart.png"><span class="text-muted" style="padding-top: 10px;margin-right: 10px;font-size: 18px ;">${item.enshrineNumber}人</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </c:forEach>
                                </c:if>
                            </c:forEach>
                        </div>

                        <div role="tabpanel" class="tab-pane" id="news">
                            <c:forEach var="entry" items="${allPappers}">
                                <c:if test="${entry.key=='热点新闻'}">
                                    <c:forEach items="${entry.value}" var="item">
                                        <a href="/papper/queryPapperById/${item.papperId}" style="color:#000000">
                                            <div class="col-md-5" style="border: 1px solid #e7e7e7;margin-left: 20px;margin-top: 10px">
                                                <p style="font-weight: bold;font-size: 21px;padding-top:10px">${item.title}</p>
                                                <div style="line-height:30px;overflow: hidden;font-size: 15px;height:88px;text-overflow:ellipsis;" class="text-muted">
                                                    <span style="font-size: 20px;font-weight: bold; ">简介:</span>
                                                        ${item.papperProfile}
                                                </div>
                                                <div class="row" style="margin-top: 10px">
                                                    <span class="text-muted" style="font-size: 15px;margin-left: 17px">发布日期:<fmt:formatDate pattern="yyyy-MM-dd" value="${item.submitDate}"></fmt:formatDate></span>
                                                    <div class="pull-right">
                                                        <img style="width: 30px;height:  30px;margin-top: 2px;" src="/static/images/commonPic/heart.png"><span class="text-muted" style="padding-top: 10px;margin-right: 10px;font-size: 18px ;">${item.enshrineNumber}人</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </c:forEach>
                                </c:if>
                            </c:forEach>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="novel">
                            <c:forEach var="entry" items="${allPappers}">
                                <c:if test="${entry.key=='小说'}">
                                    <c:forEach items="${entry.value}" var="item">
                                        <a href="/papper/queryPapperById/${item.papperId}" style="color:#000000">
                                            <div class="col-md-5" style="border: 1px solid #e7e7e7;margin-left: 20px;margin-top: 10px">
                                                <p style="font-weight: bold;font-size: 21px;padding-top:10px">${item.title}</p>
                                                <div style="line-height:30px;overflow: hidden;font-size: 15px;height:88px;text-overflow:ellipsis;" class="text-muted">
                                                    <span style="font-size: 20px;font-weight: bold; ">简介:</span>
                                                        ${item.papperProfile}
                                                </div>
                                                <div class="row" style="margin-top: 10px">
                                                    <span class="text-muted" style="font-size: 15px;margin-left: 17px">发布日期:<fmt:formatDate pattern="yyyy-MM-dd" value="${item.submitDate}"></fmt:formatDate></span>
                                                    <div class="pull-right">
                                                        <img style="width: 30px;height:  30px;margin-top: 2px;" src="/static/images/commonPic/heart.png"><span class="text-muted" style="padding-top: 10px;margin-right: 10px;font-size: 18px ;">${item.enshrineNumber}人</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </c:forEach>
                                </c:if>
                            </c:forEach>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="short">
                            <c:forEach var="entry" items="${allPappers}">
                                <c:if test="${entry.key=='短文'}">
                                    <c:forEach items="${entry.value}" var="item">
                                        <a href="/papper/queryPapperById/${item.papperId}" style="color:#000000">
                                            <div class="col-md-5" style="border: 1px solid #e7e7e7;margin-left: 20px;margin-top: 10px">
                                                <p style="font-weight: bold;font-size: 21px;padding-top:10px">${item.title}</p>
                                                <div style="line-height:30px;overflow: hidden;font-size: 15px;height:88px;text-overflow:ellipsis;" class="text-muted">
                                                    <span style="font-size: 20px;font-weight: bold; ">简介:</span>
                                                        ${item.papperProfile}
                                                </div>
                                                <div class="row" style="margin-top: 10px">
                                                    <span class="text-muted" style="font-size: 15px;margin-left: 17px">发布日期:<fmt:formatDate pattern="yyyy-MM-dd" value="${item.submitDate}"></fmt:formatDate></span>
                                                    <div class="pull-right">
                                                        <img style="width: 30px;height:  30px;margin-top: 2px;" src="/static/images/commonPic/heart.png"><span class="text-muted" style="padding-top: 10px;margin-right: 10px;font-size: 18px ;">${item.enshrineNumber}人</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </c:forEach>
                                </c:if>
                            </c:forEach>
                        </div>

                        <div role="tabpanel" class="tab-pane" id="sanwen">
                            <c:forEach var="entry" items="${allPappers}">
                                <c:if test="${entry.key=='散文'}">
                                    <c:forEach items="${entry.value}" var="item">
                                        <a href="/papper/queryPapperById/${item.papperId}" style="color:#000000">
                                            <div class="col-md-5" style="border: 1px solid #e7e7e7;margin-left: 20px;margin-top: 10px">
                                                <p style="font-weight: bold;font-size: 21px;padding-top:10px">${item.title}</p>
                                                <div style="line-height:30px;overflow: hidden;font-size: 15px;height:88px;text-overflow:ellipsis;" class="text-muted">
                                                    <span style="font-size: 20px;font-weight: bold; ">简介:</span>
                                                        ${item.papperProfile}
                                                </div>
                                                <div class="row" style="margin-top: 10px">
                                                    <span class="text-muted" style="font-size: 15px;margin-left: 17px">发布日期:<fmt:formatDate pattern="yyyy-MM-dd" value="${item.submitDate}"></fmt:formatDate></span>
                                                    <div class="pull-right">
                                                        <img style="width: 30px;height:  30px;margin-top: 2px;" src="/static/images/commonPic/heart.png"><span class="text-muted" style="padding-top: 10px;margin-right: 10px;font-size: 18px ;">${item.enshrineNumber}人</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </c:forEach>
                                </c:if>
                            </c:forEach>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="health">
                            <c:forEach var="entry" items="${allPappers}">
                                <c:if test="${entry.key=='健康养生'}">
                                    <c:forEach items="${entry.value}" var="item">
                                        <a href="/papper/queryPapperById/${item.papperId}" style="color:#000000">
                                            <div class="col-md-5" style="border: 1px solid #e7e7e7;margin-left: 20px;margin-top: 10px">
                                                <p style="font-weight: bold;font-size: 21px;padding-top:10px">${item.title}</p>
                                                <div style="line-height:30px;overflow: hidden;font-size: 15px;height:88px;text-overflow:ellipsis;" class="text-muted">
                                                    <span style="font-size: 20px;font-weight: bold; ">简介:</span>
                                                        ${item.papperProfile}
                                                </div>
                                                <div class="row" style="margin-top: 10px">
                                                    <span class="text-muted" style="font-size: 15px;margin-left: 17px">发布日期:<fmt:formatDate pattern="yyyy-MM-dd" value="${item.submitDate}"></fmt:formatDate></span>
                                                    <div class="pull-right">
                                                        <img style="width: 30px;height:  30px;margin-top: 2px;" src="/static/images/commonPic/heart.png"><span class="text-muted" style="padding-top: 10px;margin-right: 10px;font-size: 18px ;">${item.enshrineNumber}人</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </c:forEach>
                                </c:if>
                            </c:forEach>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="others">
                            <c:forEach var="entry" items="${allPappers}">
                                <c:if test="${entry.key=='其它'}">
                                    <c:forEach items="${entry.value}" var="item">
                                        <a href="/papper/queryPapperById/${item.papperId}" style="color:#000000">
                                            <div class="col-md-5" style="border: 1px solid #e7e7e7;margin-left: 20px;margin-top: 10px">
                                                <p style="font-weight: bold;font-size: 21px;padding-top:10px">${item.title}</p>
                                                <div style="line-height:30px;overflow: hidden;font-size: 15px;height:88px;text-overflow:ellipsis;" class="text-muted">
                                                    <span style="font-size: 20px;font-weight: bold; ">简介:</span>
                                                        ${item.papperProfile}
                                                </div>
                                                <div class="row" style="margin-top: 10px">
                                                    <span class="text-muted" style="font-size: 15px;margin-left: 17px">发布日期:<fmt:formatDate pattern="yyyy-MM-dd" value="${item.submitDate}"></fmt:formatDate></span>
                                                    <div class="pull-right">
                                                        <img style="width: 30px;height:  30px;margin-top: 2px;" src="/static/images/commonPic/heart.png"><span class="text-muted" style="padding-top: 10px;margin-right: 10px;font-size: 18px ;">${item.enshrineNumber}人</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </c:forEach>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3" >
                <div class="panel panel-default">
                    <!-- Default panel contents -->
                    <div class="panel-heading">热点文章</div>
                    <!-- List group -->
                    <ul class="list-group">
                        <li class="list-group-item" style="white-space: nowrap; overflow: hidden;text-overflow: ellipsis"><a href="/papper/queryPapperById/${hotPappers[0].papperId}">${hotPappers[0].title}</a><span class="badge" style="background: red">1</span></li>
                        <li class="list-group-item" style="white-space: nowrap; overflow: hidden;text-overflow: ellipsis"><a href="/papper/queryPapperById/${hotPappers[1].papperId}">${hotPappers[1].title}</a><span class="badge" style="background: yellow">2</span></li>
                        <li class="list-group-item" style="white-space: nowrap; overflow: hidden;text-overflow: ellipsis"><a href="/papper/queryPapperById/${hotPappers[2].papperId}">${hotPappers[2].title}</a><span class="badge" style="background: lawngreen">3</span></li>
                        <c:forEach var="papper" items="${hotPappers}" begin="3" varStatus="index">
                            <li class="list-group-item" style="white-space: nowrap; overflow: hidden;text-overflow: ellipsis"><a href="/papper/queryPapperById/${papper.papperId}">${papper.title}</a><span class="badge">${index.index+1}</span></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
