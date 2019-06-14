<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery -->
<script src="http://code.jquery.com/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>我的足迹</title>
</head>

<style type="text/css">
    #tabpaneSection{
        background:#e7e7e7;
        margin-top: 50px;
        height: 100px;
        padding: 20px;

    }
    #footprintDiv{
        margin-left: 100px;
        height: 100px;
        margin-right: 100px;
        margin-top: 10px;
    }
    .timeDiv{
        font-size: 20px;
        padding: 5px;
        padding-left: 20px;
        font-weight: bold;
        border: 1px solid #e7e7e7;
        background:#e7e7e7;
        color:black;
    }
    #itemListDiv-ul{
        list-style: none;
    }
    #itemListDiv-ul li{
        float: left;
        margin-left: 20px;
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


<section id="tabpaneSection">
    <div class="container">
        <div class="row">
            <div class="col-md-2">
                <h1 style="color:black;line-height:20px;font-weight:bold;margin-left: -175px">浏览记录</h1>
            </div>
        </div>
    </div>
</section>

<section id="footprintDiv">
    <c:if test="${allFootPrint.size()<=0}">
        <p style="font-size: 30px; font-weight: bolder ;margin-top: 200px;" class="text-center text-muted">暂时没有浏览记录喔</p>
    </c:if>
    <c:forEach var="footprintMapEntry" items="${allFootPrint}">
        <div class="timeDiv">${footprintMapEntry.key}</div>
        <div style="padding: 10px;margin-top: 10px;border: 1px solid #e7e7e7" class="text-center">
            <div class="row">
                <c:forEach var="item" items="${footprintMapEntry.value}">
                    <div class="col-md-3" style="border: 1px solid #e7e7e7">
                        <a style="text-decoration:none" href="/papper/queryPapperById/${item.papperId}}">
                            <p style="font-size:18px;font-weight: bold;overflow: hidden;text-overflow: ellipsis;" class="text-center" >${item.title}</p>
                            <p style="font-size: 15px;line-height:30px;overflow: hidden;" class="text-muted" >${item.papperProfile}</p>
                        </a>
                        <a style="padding: 10px;width: 100px;font-size: 18px;font-weight:bold;" class="btn btn-success btn-small" href="/papper/queryPapperById/${item.papperId}">浏览</a>
                        <a  style="padding: 10px;width: 100px;font-size: 18px;font-weight:bold;" class="btn btn-primary btn-small" href="/footPrint/deleteFootPrint/${item.papperId}">删除</a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </c:forEach>
</section>
</body>
</html>
