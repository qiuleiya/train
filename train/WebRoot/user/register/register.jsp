<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%response.setContentType("text/html;charset=gb2312"); %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>"><!-- 设置基本路径-->
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>用户注册页面</title>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet"href="t.css">
    <script type="text/javascript">
        function $(id){
            return document.getElementById(id);
        }
        function checkUsername(){
            var username = $("username").value;
            var reg = /\S{1,30}$/;
            if(username==""){
                $("usernameSpan").innerHTML="用户名不能为空！ ";
                return false;
            }else if(reg.test(username)==false){
                $("usernameSpan").innerHTML="用户名格式不正确！ ";
                return false;
            }else{
                $("usernameSpan").innerHTML="";
                return true;
            }
        }
        function checkPassword(){
            var password = $("psw").value;
         
            if(password == ""){
                $("pswSpan").innerHTML="密码不能为空！ ";
                return false;
            }else{
                $("pswSpan").innerHTML="";
                return true;
            }
        }
        function checkConfirmPassword(){
            var repassword = $("repassword").value;
            var psw= $("psw").value;
            if(repassword==""){
                $("confirmPasswordSpan").innerHTML="确认密码不能为空！";
                return false;
            }else if(psw!=repassword){
                $("confirmPasswordSpan").innerHTML="密码与确认密码不一致！ ";
                return false;
            }else{
                $("confirmPasswordSpan").innerHTML="";
                return true;
            }
        }
        function checkName(){
            var name = $("realName").value;
            var reg = /^ /m;
            if(name==""){
                $("nameSpan").innerHTML="姓名不能为空！";
                return false;
            }else if(reg.test(name)){
                $("nameSpan").innerHTML="名字不可带空格！ ";
                return false;
            }else{
                $("nameSpan").innerHTML="";
                return true;
            }
        }
        function checkpapersNum(){
            var papers_num = $("papers_num").value;
            if(papers_num==""){
                $("paperNumSpan").innerHTML="证件号码不能为空！";
                return false;
            }else{
                $("papersNumSpan").innerHTML="";
                return true;
            }
        }

        function checkPhone(){
            var tel = $("tel").value;
            var reg = /^1[3-9]\d{9}$/;
            if(tel==""){
                $("phoneSpan").innerHTML="手机号码不能为空！";
                return false;
            }else if(reg.test(tel)==false){
                $("phoneSpan").innerHTML="手机格式不正确！";
                return false;
            }else{
                $("phoneSpan").innerHTML="";
                return true;
            }
        }
        function checkEmail(){
            var email = $("email").value;
            var reg = /^\w+@\w+\.[a-zA-Z]{2,3}(\.[a-zA-Z]{2,3})?$/;
            if(email==""){
                $("emailSpan").innerHTML="电子邮箱不能为空！";
                return false;
            }else if(reg.test(email)==false){
                $("emailSpan").innerHTML="邮箱格式不正确！";
                return false;
            }else{
                $("emailSpan").innerHTML="";
                return true;
            }
        }
        function checkUser(){  
            if(checkUsername()&&checkPassword()&&checkConfirmPassword()&&checkName()&&checkpapersNum()&&
                checkPhone()&&checkEmail()){

                return true;

            }else{
                alert("格式出错 请重新填写信息注册");
                return false;
            }
        }
    </script><!-- 检查输入格式 -->
<style type="text/css">
    .biaoti{
        border-style: dashed;
        border-color: salmon;
        background-image: url("image/vt.jpg");
        font-family:FZYaoti;
        color: salmon;}
</style>

</head>

<body class="ContentBody">
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
        <div class="col-md-12 column"><!-- 将表单信息提交给doregister.jsp -->
<form  method="post" action="user/register/doregister.jsp" name="form" onsubmit="return checkUser()" >
    <div class="MainDiv">
        <div class="biaoti">
            <h1><img src="image/dong4.gif" class="img-circle"width="50"height="50">用户注册</h1>
        </div>
        <table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
            <tr>
                <td class="CPanel">
                    <table border="0" cellpadding="0" cellspacing="0" style="width:100%">
                        <tr>
                            <td width="100%">
                                <fieldset style="height:100%;">
                                    <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
                                        <tr>
                                            <td class="information-sort">基本信息<span class="red" style="font-size:12px;">(*为必填项)</span></td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" ><hr/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right" >用户名:</td>
                                            <td>
                                                <input name='username' id='username' type="text" class="text" style="width:154px" onblur="checkUsername();" />
                                                <span class="red">* </span>
                                                <span style="color:#ff61ac;">必填，由字母、数字或“_”组成，不多于30位</span>
                                                <span style="color:#ff0c19;font-size:15px;" id="usernameSpan"></span>
                                            </td>
                                        </tr>
                                        <tr >
                                            <td nowrap="nowrap" align="right" >密码:</td>
                                            <td>
                                                <input name='psw' id='psw' type="password" class="text" style="width:154px" onblur="checkPassword();"/>
                                                <span class="red">* </span>
                                                <span style="color:#ff61ac;">必填，不大于30位，不能包含空格</span>
                                                <span style="color:#ff0c19;font-size:15px;" id="pswSpan"></span>
                                            </td>
                                        </tr>
                                        <tr >
                                            <td nowrap="nowrap" align="right" >密码确认:</td>
                                            <td>
                                                <input name='repassword' id='repassword' type="password" class="text" style="width:154px" onblur="checkConfirmPassword();" />
                                                <span class="red">* </span>
                                                <span style="color:#ff61ac;">必填，请再次输入密码</span>
                                                <span style="color:#ff0c19;font-size:15px;" id="confirmPasswordSpan"></span>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td colspan="4" ><hr/></td>
                                        </tr>

                                        <tr>
                                            <td nowrap="nowrap" align="right" >真实姓名:</td>
                                            <td><input name='realName' id='realName' type="text" class="text" style="width:154px" onblur="checkName();" />
                                                <span class="red">* </span>
                                                <span style="color:#ff61ac;">必填，请填入真实姓名</span>
                                                <span style="color:#ff0c19;font-size:15px;" id="nameSpan"></span>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td align="right">性别:</td>
                                            <td>
                                                <select name="genter" id="genter">
                                                    <option value="男" >男</option>
                                                    <option value="女">女</option>
                                                </select>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td align="right">身份证证件号码:</td>
                                            <td>
                                                <input class="text" name='papers_num' id='papers_num' style="width:154px" onblur="checkpapersNum();"/>
                                                <span class="red">* </span>
                                                <span style="color:#ff61ac;">必填，请填入正确的证件号码</span>
                                                <span style="color:red;font-size:15px;" id="paperNumSpan"></span>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="information-sort">联系方式:<span class="red" style="font-size:12px;">(*为必填项)</span></td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" ><hr/></td>
                                        </tr>

                                        <tr>
                                            <td align="right">手机号码:</td>
                                            <td>
                                                <input class="text" name='tel' id='tel' style="width:154px" onblur="checkPhone();"/>
                                                <span class="red">* </span>
                                                <span style="color:#ff61ac;">必填，请填入正确的手机号码</span>
                                                <span style="color:red;font-size:15px;" id="phoneSpan"></span>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td align="right">电子邮箱:</td>
                                            <td>
                                                <input class="text" name='email' id='email' style="width:154px" onblur="checkEmail();"/>
                                                <span class="red">* </span>
                                                <span style="color:#ff61ac;">必填，请填入正确的邮箱</span>
                                                <span style="color:red;font-size:15px;" id="emailSpan"></span>
                                            </td>
                                        </tr>

                                    </table>
                                    <br />
                                </fieldset></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center" height="50px">
                    <input type="submit" name="save" value="保存" class="button" />　
                    <input type="button" name="return" value="返回" class="button" onclick="window.history.go(-1);"/></td>
            </tr>
        </table>
    </div>
</form>
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