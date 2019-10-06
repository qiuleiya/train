<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 5.01 Transitional//EN" "http://www.w3.org/TR/html5/loose.dtd">
<html>
<head>
 <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>火车售票系统用户登录</title>
    <link type="text/css" rel="stylesheet" href="style1.css" />
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
                <h1><img src="image/dong1.gif" class="img-circle"width="50"height="50">登录</h1>
            </div>
            <div class="login" >
                <div class="logi">
                    <h3 >请选择登录身份！</h3>
                    <a class="btn btn-default" href="user/Login.jsp" role="button">用户</a>
                    <a class="btn btn-default" href="admin/adminlogin.jsp" role="button">管理员</a>
                </div>
            </div>

        </div>
    </div>
</div>

<div bgcolor="#efefef" align="center" class="foot">
        <small>Cherry pellets train ticketing system&小丸子火车售票系统版权所有<br/>
            小丸子咨询热线 222-111-333<br/></small>
        <img src="image/foot_pic.jpg"/>
    </div>
</body>
</html>