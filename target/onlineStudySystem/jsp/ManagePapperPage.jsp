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
<script src="/js/jquery.form.js"></script>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>文章管理界面</title>
</head>
<style>
    #secondSection{
        margin-left: 80px;
        margin-right: 100px;
        margin-top: 40px;
    }
</style>
<script type="text/javascript">
 $(function () {
      $("#sub_btn").click(function () {
          $("#subForm").ajaxSubmit({
              type: "POST",
              url: "/papper/submitPapper",
              data:{
              },
              dataType: "json",
              success:function (data) {
                  alert(data.msg);
                  if(data.msg=="提交成功！"){
                      $("#title").val("");
                      $("#papperProfile").val("");
                      $("#papperText").val("");
                      return;
                  }else{
                      //呈现错误信息
                      $("#title_error").html(data.title);
                      $("#ppperProfile_error").html(data.papperProfile);
                      $("#papperText_error").html(data.papperText);
                  }
              }
          });
      });
 });



 function deleteFunction(papperId) {
     $.ajax({
         url:"/papper/deletePapper",
         type:"POST",
         data:{
             papperId:papperId
         },
         dataType:"json"
     }).done(function(data){
         console.log("data:",data.msg);
         alert(data.msg);
         //检查是否更新成功
         if(data.msg=='删除成功！'){
             //删除成功ajax重新获取上架的文章
             $("#item"+papperId).remove();
             $("#itemBtn"+papperId).remove();

         }});
 }

 function deleteComment(commentId,userId) {

     $.ajax({
         url:"/comment/delComment",
         type:"POST",
         data:{
           commentId:commentId,
             userId:userId
         },
         dataType:"json"
     }).done(function(data){
         alert(data.msg);
         //检查是否更新成功
         if(data.msg=='删除成功！'){
             //删除成功ajax重新获取上架的文章
             $("#comment"+commentId).remove();
         }});

 }

    

</script>
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

        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#write"  style="padding-right: 35px; padding-left: 35px;" class="tabclsA"  aria-controls="write" role="tab" data-toggle="tab">写文章</a></li>
            <li role="presentation"><a href="#manage" style="padding-right: 35px; padding-left: 35px;"  class="tabclsA" aria-controls="manage" role="tab" data-toggle="tab">管理文章</a></li>
            <li role="presentation"><a href="#message" style="padding-right: 35px; padding-left: 35px;"  class="tabclsA" aria-controls="message" role="tab" data-toggle="tab">评论消息<span class="badge" style="margin-left: 10px">${commentItems.size()}</span></a></li>
        </ul>
        <div class="tab-content" style="margin-top: 10px">
            <div role="tabpanel" class="tab-pane active" id="write">
                <form id="subForm">
                        <div class="form-group">
                            <label for="title">文章标题:</label><span style="color:red" id="title_error"></span>
                            <input type="text" class="form-control" name="title" id="title" placeholder="文章标题，小于50字">
                        </div>
                        <div class="form-group">
                            <label for="papperProfile">文章简介:</label><span style="color:red" id="ppperProfile_error"></span>
                            <textarea class="form-control" id="papperProfile" name="papperProfile" rows="3" placeholder="文章简介小于100字"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="papperText">文章内容</label><span style="color:red" id="papperText_error"></span>
                            <textarea class="form-control" id="papperText" name="papperText" rows="18"></textarea>
                        </div>

                    <div class="form-group">
                        <label for="papperText">文章类型</label>
                        <select id="type" name="type">
                            <option value="互联网">互联网</option>
                            <option value="热点新闻">热点新闻</option>
                            <option value="其他">其他</option>
                            <option value="健康养生">健康养生</option>
                            <option value="短文">短文</option>
                            <option value="散文">散文</option>
                            <option value="小说">小说</option>
                        </select>
                    </div>

                        <div class="row text-center" >
                            <button type="reset" style="width: 150px;"  class="btn  btn-default btn-lg">清空</button>
                            <button type="button" id="sub_btn" style="width: 150px;" class="btn btn-warning btn-danger btn-lg text-center">提交</button>
                        </div>
                </form>
            </div>

            <!--   管理已发布文章界面-->
            <div role="tabpanel" class="tab-pane active" id="manage">
                <div class="row">
                    <c:forEach items="${pappers}" var="item">
                            <div class="col-md-5" style="border: 1px solid #e7e7e7;margin-left: 20px;margin-top: 10px">
                                <a href="/papper/queryPapperById/${item.papperId}" style="color:#000000" id="item${item.papperId}">
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
                            </a>
                                <div class="row" style="margin-top: 10px" id="itemBtn${item.papperId}">
                                    <button type="button" onclick='deleteFunction("${item.papperId}")' id="deleteBtn" style="width: 150px;" class="btn  btn-default btn-lg">删除文章</button>
                                    <a href="/papper/queryEditForm/${item.papperId}" style="width: 150px;" class="btn btn-warning btn-danger btn-lg text-center">编辑文章</a>
                                </div>
                            </div>

                    </c:forEach>
                </div>
            </div>

            <div role="tabpanel" class="tab-pane active" id="message">
                <div class="container">
                    <c:forEach var="item" items="${commentItems}">
                        <div class="row" style="margin-top: 10px" id="comment${item.papperId}">
                                <div class="media">
                                    <div class="media-left">
                                        <a href="#">
                                            <img class="media-object" style="width: 45px;height: 45px;" src="${item.userInfo.photo}" alt="用户头像">
                                        </a>
                                    </div>
                                    <div class="media-body">
                                        <h4 class="media-heading">${item.userInfo.nikeName}</h4>
                                        <p class="text-muted">评论日期:<fmt:formatDate value="${item.commentDate}" pattern="yyyy年MM月dd日"></fmt:formatDate></p>
                                    </div>
                                </div>
                                <div class="col-md-12" style="border: 1px solid lightseagreen;text-indent: 2em;font-size: 18px;padding: 10px">
                                   ${item.commentText}
                                </div>
                                <div class="row pull-right" style="margin-right: 20px">
                                    <button onclick="deleteComment('${item.papperId}','${item.userId}')" class="btn btn-warning btn-md" >删除评论</button>
                                </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>

    </section>
</body>
</html>
