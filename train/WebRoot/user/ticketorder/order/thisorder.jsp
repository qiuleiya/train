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

    <title>生成订单</title>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet"href="t1.css">

<body>
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
    <div class="row clearfix biaoti1">
 		<h1><img src="image/glyjm.jpg" class="img-circle"width="50"height="50"/>生成的订单如下：</h1>
	</div>
        <div class="row clearfix" >
            <div class="col-md-12 column">
            <%String ordernum= request.getParameter("oder_num");   //获取url中的参数值%>
                <sql:setDataSource var="snapshot" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
                                   url="jdbc:sqlserver://localhost:1433;DatabaseName=train"
                                   user="sa"  password="123456"/>
            
                  <c:set var="empId" value="<%=ordernum%>"/>
                <sql:query dataSource="${snapshot}" var="result">
                    select * FROM orders where oder_num=?
                     <sql:param value = "${empId}" />
                </sql:query>

                 <center>
              <!-- 打印生成订单 -->
                    <c:forEach var="row" items="${result.rows}">
                      
                        <ul type="none">
                        <li>订单号：<c:out value="${row.oder_num}"/></li>
                            <li>&nbsp;用户名：<c:out value="${row.username}"/></li>
                            <li>&nbsp;车次：<c:out value="${row.checi}"/></li>
                            <li> &nbsp;起点 :<c:out value="${row.qidian}"/></li>
                            <li> &nbsp;终点：<c:out value="${row.zhongdian}"/></li>
                            <li>出发时间：<c:out value="${row.g_time}"/></li>
                            <li>到达时间：<c:out value="${row.a_time}"/></li>
                            <li>车票日期：<c:out value="${row.ticketdate}"/></li>
                            <li>车票价格：<c:out value="${row.price}"/></li>
                            <li>车票数量：<c:out value="${row.ticketnum}"/></li>
                            </ul>
                            <a class="btn btn-default" href="user/usermain.jsp?username=${row.username}" role="button">点此回到车票管理页面</a>
            
                    </c:forEach>
         </center>
            </div>
		</div>
</div>
</body>
</html>