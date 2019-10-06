<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
 <base href="<%=basePath%>">
  <title>管理员界面</title>

     <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet"href="t.css">

  <style type="text/css">
        .login{
            height: 430px;
            width: 100%;
            background-image: url("image/dlbz.jpg");

        }
        .logi{
            width:300px;
            position: absolute;
            left:50%;
            top:50%;
            margin-left:-100px;
            margin-top:-100px;
        }

    </style>
<body>
<div class="top">
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <img src="image/logo.png" class="img-circle"width="40"height="40">
        <a class="navbar-brand" href="main.jsp">火车售票系统</a>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="main.jsp"><span class="glyphicon glyphicon-log-out"></span> 退出登录</a></li>
        </ul>
    </div>
</div>
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="biaoti">
                    <h1><img src="image/dong1.gif" class="img-circle"width="50"height="50">管理员界面</h1>
                </div>
                <div class="login" >
                    <div class="logi">
                        <h3 >选择功能</h3>
                        <a class="btn btn-default" href="admin/order/order.jsp" role="button">订单管理</a>
                        <a class="btn btn-default" href="admin/train/ticket.jsp" role="button">车次管理</a>
                        <a class="btn btn-default" href="admin/user/user.jsp" role="button">用户管理</a>

                    </div>
                </div>

            </div>
        </div>
</div>
<div align="center" class="foot">

    <small>Cherry pellets train ticketing system&小丸子火车售票系统版权所有<br/>
        小丸子咨询热线 222-111-333<br/></small>
    <img src="image/foot_pic.jpg"/>
</div>

</body>