<%--
  Created by IntelliJ IDEA.
  User: 86137
  Date: 2019/6/10
  Time: 11:24
  To change this template use File | Settings | File Templates.onlinestudysystem
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="http://code.jquery.com/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/js/jquery.form.js"></script>

<html>
<head>
    <title>观看文章界面</title>
</head>
<style>
    #secondSection{
        margin-top: 60px;
        margin-left: 80px;

        margin-right: 100px;
        margin-bottom: 90px;
    }
    body{
        background: #f5f6f7;
    }
    #papperBody{
        font-size: 20px;
        color:#000000;
        padding-left: 2em;
        padding-right: 2em;
        text-indent: 2em;

    }
</style>
<script>
    $(function () {
        $("#enshrine_btn").click(function () {

            $.ajax({
                url:"/enshrine/add",
                type:"POST",
                data:{
                    papperId:"${papper.papperId}",
                    papperProfile:"${papper.papperProfile}",
                    title:"${papper.title}"
                },
                dataType:"json"
            }).done(function(data){
                alert(data.msg);
            });
        });


        $("#subcomment_btn").click(function () {
            $("#subCommentForm").ajaxSubmit({
                type: "POST",
                url: "/comment/addComment",
                data:{
                    papperId:"${papper.papperId}",
                    authorId:"${papper.authorId}"
                },
                dataType: "json",
                success:function (data) {
                    alert("评论成功！");
                    console.log(data);
                    $("#message").val("");
                }
            });
            return false;
        });
    })
</script>
<body>
<c:if test="${enshrine_msg!=null}">
    <script>
        alert("收藏成功！");
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

<section id="secondSection" >
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3" style="border:1px solid #e5e5e5">
                <div class="row" style="height:150px;background:white;overflow: hidden">
                    <img src="${papper.author.photo}" style="width:80px;height: 80px;margin-top: 15px;margin-left: 150px" alt="作者头像">
                    <p style="font-size: 22px;font-weight: bold;margin-left: 14px;margin-top:20px;" class="text-center">作者昵称:${papper.author.nikeName}</p>
                </div>
                <div class="row" style="height:150px;background:white;border-top: 1px solid #e5e5e5;padding:20px;padding-left: 80px" >
                    <a href="#" class="btn btn-danger btn-md">关注作者</a>
                    <button id="enshrine_btn" class="btn btn-success btn-md" style="margin-left: 20px">收藏文章</button>
                    <button type="button" class="btn btn-success btn-md" style="margin-top: 10px;margin-left: 50px" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">评价此文章</button>
                </div>

            </div>
            <div class="col-md-8" style="border:1px solid #e7e7e7;background: white;height: 900px;overflow-y: auto">
                <p style="font-weight: bold;font-size: 28px;margin-left: 20px;margin-top: 20px">${papper.title}</p>
                <p style="font-size: 19px;margin-left: 20px;margin-top: 8px" class="text-muted"><fmt:formatDate value="${papper.submitDate}" pattern="yyyy年MM月dd日"></fmt:formatDate>
                    <span style="margin-left: 100px;font-size: 19px;color:lightskyblue">文章作者:${papper.author.username}</span>
                    <span style="margin-left:30px;font-size: 19px;" class="text-muted" >收藏数:${papper.enshrineNumber}</span>
                </p>
                <p style="border:1px solid #e7e7e7;margin-top:20px;margin-bottom: 30px"></p>
                <div id="papperBody">
                    ${papper.papperText}
                </div>
            </div>

        </div>
    </div>
</section>

<section id="commentSection" style="margin-right: 100px;margin-left: 80px; margin-bottom: 90px;">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-8 col-md-offset-3" style="border:1px solid #e7e7e7;background: white;height: 900px;overflow-y: auto">
                <p style="font-weight: bold;font-size: 28px;margin-left: 20px;margin-top: 20px">用户评论<span class="badge">${commentItems.size()}</span></p>
                <p style="border:1px solid #e7e7e7;margin-top:20px;margin-bottom: 30px"></p>
                <c:forEach var="item" items="${commentItems}">
                <div class="row" style="margin-top: 20px;margin-left: 10px;margin-right: 10px">
                        <div class="media">
                            <div class="media-left">
                                <a href="#">
                                    <img class="media-object" style="width: 45px;height: 45px;" src="${item.userInfo.photo}" alt="用户头像"/>
                                </a>
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">${item.userInfo.nikeName}</h4>
                                <p class="text-muted">评论日期:<fmt:formatDate value="${item.commentDate}" pattern="yyyy年MM月dd日"></fmt:formatDate></p>
                            </div>
                        </div>
                        <div class="col-md-12" style="text-indent: 2em;border: 1px solid lightseagreen;text-indent: 2em;font-size: 18px;padding: 10px">
                            ${item.commentText}
                        </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </div>
</section>



<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="exampleModalLabel">评论模态框</h4>
            </div>
            <form id="subCommentForm">
                <div class="modal-body">
                        <div class="form-group" style="margin-top: 20px">
                            <label for="message" class="control-label">评论内容：</label>
                            <textarea class="form-control" name="commentText" id="message"></textarea>
                        </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button id="subcomment_btn" class="btn btn-primary btn-md" >提交评论</button>
                </div>
            </form>
        </div>
    </div>
</div>


</body>
</html>
