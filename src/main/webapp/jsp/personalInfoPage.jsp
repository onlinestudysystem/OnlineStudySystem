<%--
  Created by IntelliJ IDEA.
  User: 86137
  Date: 2019/6/10
  Time: 20:09
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
    <title>个人信息</title>
</head>
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
</body>
</html>
