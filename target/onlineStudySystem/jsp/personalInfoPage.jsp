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
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>个人信息</title>
</head>
<body>
<c:if test="${update_msg!=null}">
    <script>
        <c:choose>
        <c:when test="${update_msg=='修改成功！'}">
                alert("更新成功")
            </c:when>
            <c:otherwise>
                 alert("修改失败！请刷新重试")
            </c:otherwise>
        </c:choose>
    </script>
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

<section id="personalInfoSection" style="margin-top: 40px">
    <div class="container">
        <div class="row">
            <div class="page-header">
                <h1>个人信息</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-10" style="margin-top: 20px">
                <form class="form-horizontal" action="/user/updatePersonalInfo" method="post" enctype="multipart/form-data">
                    <div class="form-group" >
                        <label for="email" class="col-sm-2 control-label" style="font-size: 20px;padding: 14px">邮箱</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" value="${sessionScope.userInfo.email}"  style="font-size: 20px;padding: 14px;margin-top: 10px" name="email" id="email" placeholder="输入你的邮箱">
                            <span style="color:red;font-size: 16px;margin-left: 10px" id="email_error">${email}</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="nickName" class="col-sm-2 control-label"  style="font-size: 20px;padding: 14px">昵称</label>
                        <div class="col-sm-10">
                            <input type="text" name="nikeName" class="form-control" style="font-size: 20px;padding: 14px;margin-top: 10px"   value="${sessionScope.userInfo.nikeName}" id="nickName" placeholder="输入昵称">
                            <span style="color:red;font-size: 16px;margin-left: 10px" id="nickName_error">${nickName}</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="detail" class="col-sm-2 control-label" style="font-size: 20px;padding: 14px">座右铭</label>
                        <div class="col-sm-10">
                            <input type="text" style="font-size: 20px;padding: 14px;margin-top: 10px" name="detail"  class="form-control" value="${sessionScope.userInfo.detail}" id="detail" placeholder="输入座右铭">
                            <span style="color:red;font-size: 16px;margin-left: 10px" id="detail_error">${detail}</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="profilePicture" class="col-sm-2 control-label" style="font-size: 20px;padding: 14px">头像</label>
                        <img src="${sessionScope.userInfo.photo}" style="margin-left: 20px;width: 80px;height: 80px;float: left;display: inline-block; border: 1px solid #e7e7e7;padding: 15px">
                        <input type="file" name="profilePicture" style="float: left;display: inline-block;margin-left: 20px;margin-top: 30px"  id="profilePicture" accept="image/png,image/jpeg"/>
                    </div>
                    <div>
                        <button type="submit" class="btn btn-md btn-danger text-center col-md-offset-5" style="width: 300px;font-size: 20px;padding:10px"  >提交</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
</body>
</html>
