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
  
    
     <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <title>订单管理（管理员界面）</title>

     <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet"href="t1.css">
 <script type="text/javascript">
   	function myAction(pid){
   		document.forms[0].id.value=pid;
   		document.forms[0].submit();
   	}
   </script>

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
    <div class="row clearfix biaoti1">
    <div  class="col-md-8 column">
 		<h1><img src="image/glyjm.jpg" class="img-circle"width="50"height="50"/>用户管理界面</h1>
 		</div>
 		  <div  class="col-md-4 column">
 		  <form action="admin/order/deleteorder.jsp" method="post">
                          订单编号：<input type="text" name="oder_num"><br>
           <input type="submit" value="删除">
           </form>
 		  </div>
	</div>
      <div class="row clearfix" >
            <div class="col-md-12 column">
                <sql:setDataSource var="snapshot" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
                                   url="jdbc:sqlserver://localhost:1433;DatabaseName=train"
                                   user="sa"  password="123456"/>
               
                <sql:query dataSource="${snapshot}" var="result">
                    select * FROM orders ;
                </sql:query>
                <center>
                <table border="1">
                    <tr><th>订单号</th><th>用户名</th><th>车次</th>
                        <th>起点</th><th>终点</th><th>出发时间</th>
                        <th>到达时间</th><th>车票日期</th><th>票价</th>
                        <th>车票数量</th></tr>
                    <c:forEach var="row" items="${result.rows}">
                
                        <tr>
                        <td><c:out value="${row.oder_num}"/></td>
                            <td><c:out value="${row.username}"/></td>
                            <td><c:out value="${row.checi}"/></td>
                            <td><c:out value="${row.qidian}"/></td>
                            <td><c:out value="${row.zhongdian}"/></td>
                            <td><c:out value="${row.g_time}"/></td>
                            <td><c:out value="${row.a_time}"/></td>
                            <td><c:out value="${row.ticketdate}"/></td>
                            <td><c:out value="${row.price}"/></td>
                            <td><c:out value="${row.ticketnum}"/></td>
                         
						
                    </c:forEach>
                </table>
                </center>
            </div>
		</div>
</div>


</body>
</html>