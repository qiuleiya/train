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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 5.01 Transitional//EN" "http://www.w3.org/TR/html5/loose.dtd">
<html>
<head>
 <base href="<%=basePath%>">

    <title>管理员登录</title>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet"href="t.css">
    <script type="text/javascript">
        function checkLogin(){
            var flag=0;
            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;
            var array = [["admin1", "admin"],["admin2", "123"]];

            var checked = document.getElementById("checked");
            if(username=="" || password==""){
                alert( "用户名或密码不能为空！");
                $("usernameSpan").innerHTML="姓名不能为空！";
                return false;
            }
            for (var i = 0; i < array.length; i++) {
                if (array [i][0] == username && array[i][1] == password) {
                    alert("用户登陆成功，欢迎<" + username + ">使用本系统！");
                    return true;
                    flag=1;
                }
            }
            if(flag==0){
                alert("用户名或密码错误，请重新登陆。");
                return false;
            }
        }

    </script>

    <style type="text/css">
        .login{
            height: 430px;
            width: 100%;
            background-image: url("image/dlbz.jpg");
        }
        .logi{
            width:340px;
            position: absolute;
            left:50%;
            top:50%;
            margin-left:-100px;
            margin-top:-100px;
        }

    </style>

</head>

<body  onload="interval()">
<div class="top">
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

        <img src="image/logo.png" class="img-circle"width="40"height="40">
        <a class="navbar-brand" href="main.jsp">小丸子火车售票系统</a>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="user/register/register.jsp"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
            <li><a href="login.html"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
        </ul>
    </div>

</div>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="biaoti">
                <h1><img src="image/dong1.gif" class="img-circle"width="50"height="50">用户登录</h1>
            </div>
            <div class="login" >
                <div class="logi">
                    <form method="post" action="admin/Admin.jsp" onsubmit="return checkLogin()">
                        <dl>
                            <dt>用户名：</dt>
                            <dd><input type="text" name="username" id="username" class="input-text" /></dd>
                            <dt>密　码：</dt>
                            <dd><input type="password" name="password" id="password" class="input-text" /></dd>
                        </dl>
                        <div class="buttons">
                            <input type="reset" name="reset" value="重　　填" class="input-button" />
                            <input type="submit" name="button" value="登录系统"  class="input-button" />
                        </div>
                    </form>
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
</html>