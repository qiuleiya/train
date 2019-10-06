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

    <title>终点起点查询车次（未登录）</title>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet"href="t1.css">
    <style type="text/css">

</style>
<body>
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
    <div class="row clearfix biaoti1">
 		<h1><img src="image/glyjm.jpg" class="img-circle"width="50"height="50"/>车次查询</h1>
	</div>
        <div class="row clearfix" >
            <div class="col-md-12 column " >
            <%String username= request.getParameter("username");   //获取url中的参数值%>
                <sql:setDataSource var="snapshot" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
                                   url="jdbc:sqlserver://localhost:1433;DatabaseName=train"
                                   user="sa"  password="123456"/>
               <% String qi=request.getParameter("qidian");
              qi=java.net.URLDecoder.decode(qi,"GB2312");
               qi=new String(qi.getBytes("ISO-8859-1"));
               String zh=request.getParameter("zhongdian");
               zh=java.net.URLDecoder.decode(zh,"GB2312");
                 zh=new String(zh.getBytes("ISO-8859-1"));
               %>
                  <c:set var="qi" value="<%=qi%>"/>
                  <c:set var="zh" value="<%=zh%>"/>
             
                <sql:query dataSource="${snapshot}" var="result">
                    select * FROM ticket where qidian=? and zhongdian=?
                     <sql:param value = "${qi}" />
                     <sql:param value = "${zh}" />
                </sql:query>
          <center>//打印出查询的车次<!-- 遍历打印出查询到的车次-->
                <table  border="1">
                    <tr><th>车次</th><th>起点</th><th>终点</th>
                        <th>出发时间</th><th>到达时间</th><th>票价</th>
                        <th>余票</th></tr>
                    <c:forEach var="row" items="${result.rows}">
                        <tr>
                             <td><c:out value="${row.checi}"/></td>
                            <td><c:out value="${row.qidian}"/></td>
                            <td><c:out value="${row.zhongdian}"/></td>
                            <td><c:out value="${row.g_time}"/></td>
                             <td><c:out value="${row.a_time}"/></td>
                            <td><c:out value="${row.price}元"/></td>
                            <td><c:out value="${row.yupiao}张"/></td>
                            
                    </c:forEach>
                </table>
                </center>
            </div>
		</div>
</div>

</body>
</html>