<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 5.01 Transitional//EN" "http://www.w3.org/TR/html5/loose.dtd">
<html>
<head>
 <base href="<%=basePath%>">

    <title>购买失败</title>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet"href="t.css">
    <style>
        .jumbotron{
            background-image: url("image/bodybj.jpg");
            background-size: 100%;
            height: 400px;
        }
    </style>
</head>

<body >
<div class="top">
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <img src="image/logo.png" class="img-circle"width="40"height="40">
        <a class="navbar-brand" href="main.jsp">小丸子火车售票系统</a>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="main.jsp"><span class="glyphicon glyphicon-log-out"></span> 退出登录</a></li>
        </ul>
    </div>
</div>

<div class="container">
    <div class="jumbotron">
        <h1>购买操作：</h1>
        <form name="form1" method="post" action="">
            <p>购买失败!请重新购买</p>
           <p>点此返回：
            <a class="btn btn-default" href="user/usermain.jsp" role="button">用户页面</a>
            </p>
        </form>
    </div>
</div>

<div  align="center" class="foot">
    <small>Cherry pellets train ticketing system&小丸子火车售票系统版权所有<br/>
        小丸子咨询热线 222-111-333<br/></small>
    <img src="image/foot_pic.jpg"/>
</div>
</body>
</html>