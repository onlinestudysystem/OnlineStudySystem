<%--
  Created by IntelliJ IDEA.
  User: 咯还长
  Date: 2018/12/3
  Time: 15:30
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
    <title>我的足迹</title>
</head>
<script>
    $(document).ready(function () {
        $("#myFootPrint").click(function () {
            <c:choose>
            <c:when test="${sessionScope.userInfo==null}">
            window.location.href="index.jsp";
            </c:when>
            <c:otherwise>
            window.location.href="affair.do?action=getAllFootPrint&userId=${sessionScope.userInfo.id}";
            </c:otherwise>
            </c:choose>
        });
        $("#enshrine").click(function () {
            <c:choose>
            <c:when  test="${sessionScope.userInfo==null}">
            window.location.href="index.jsp";
            </c:when>
            <c:otherwise>
            window.location.href="affair.do?action=getEnshrineGoods&userId=${sessionScope.userInfo.id}";
            </c:otherwise>
            </c:choose>
        });
    });
</script>

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
        <div class="container" style=" margin-left:70px">
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
                        <a href="/papper/homePage/queryAllPapper">首页</a>
                    </li>
                    <li>
                        <a href="/papper/homePage/todayPappers">今日发布</a>
                    </li>
                    <li>
                        <a href="#">我的足迹</a>
                    </li>

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">文章管理<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">收藏夹</a></li>
                            <li><a href="#">写文章</a></li>
                            <li><a href="#">管理已发布文章</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav pull-right" style="margin-left: 50px" >
                    <li><img src="static/images/userLogo/man.png" style="width: 45px;height: 45px;margin-top: 3px" class="img-circle"/></li>
                </ul>
                <div class="navbar-form navbar-right hidden-sm">
                    <form  action="/papper/queryPapperByTitle" method="get">
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
                            <p style="font-size: 22px;font-weight: bold" class="text-center">${item.title}</p>
                            <p style="font-size: 18px;line-height: 60px;" class="text-muted" >${item.papperProfile}</p>
                        </a>
                        <a style="padding: 10px;width: 100px;font-size: 18px;font-weight:bold;" class="btn btn-success btn-md" href="/papper/queryPapperById/${item.papperId}">浏览</a>
                        <a  style="padding: 10px;width: 100px;font-size: 18px;font-weight:bold;" class="btn btn-primary btn-md" href="/goods/delFootPrint/${item.goodsId}">删除</a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </c:forEach>
</section>

</body>
</html>
