<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">

    <title>火车售票系统用户登录</title>
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
            <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
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
                    <form method="post" action="user/doLogin.jsp" onsubmit="return checkLogin()">
                        <dl>
                            <dt>用户名：</dt>
                            <dd><input type="text" name="username" id="username" class="input-text" /></dd>
                            <dt>密　码：</dt>
                            <dd><input type="password" name="psw" id="psw" class="input-text" /></dd>
                        </dl>
                        <div class="buttons">
                            <input type="submit" name="button" value="登录系统"  class="input-button" />
                             <input type="reset" name="reset" value="重　　填" class="input-button" />
                            <input type="button" name="login" value="注册" onclick="user/register/register.jsp" />
                        </div>
                    </form>
                 
                </div>
            </div>

        </div>
    </div>
</div>

<div  align="center" class="foot">
    <small>Cherry pellets train ticketing system&小丸子火车售票系统版权所有<br/>
        小丸子咨询热线 222-111-333<br/></small>
    <img src="image/foot_pic.jpg"/>
</div>
</body>
</html>