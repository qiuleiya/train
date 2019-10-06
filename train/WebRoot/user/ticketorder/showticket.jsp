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

    <title>车次查询及购买</title>
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
 		<h1><img src="image/glyjm.jpg" class="img-circle"width="50"height="50"/>车次查询</h1>
	</div>
        <div class="row clearfix" >
            <div class="col-md-12 column">
            <%String username= request.getParameter("username");   //获取url中的参数值%>
                <sql:setDataSource var="snapshot" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
                                   url="jdbc:sqlserver://localhost:1433;DatabaseName=train"
                                   user="sa"  password="123456"/>
               <%String checi = request.getParameter("checi");%>
                  <c:set var="empId" value="<%=checi%>"/>
                <sql:query dataSource="${snapshot}" var="result">
                    select * FROM ticket where checi=?
                     <sql:param value = "${empId}" />
                </sql:query>
<center>
                <table border="1">
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
                            <td><c:out value="${row.price}"/></td>
                            <td><c:out value="${row.yupiao}"/></td>
                            </tr>
                    </c:forEach>
                   
                    
                </table>
                 <form action="user/ticketorder/dobuy.jsp" method="post">
                 <input type="hidden" name='username' id='username' value="<%=username%>" >
                               <select name="checi" id="checi">
                                <c:forEach var="row" items="${result.rows}">
                                  <option value="${row.checi}">${row.checi}</option>
                                  </c:forEach>
                                  </select>
                                             数量：<input name='ticketnum' id='ticketnum' type="number" step="1" min="0" max="200" />
                                           乘车日期：<input type="date" name='ticketdate' id='tickerdate' >
                   <input type="submit" value="购买" />
                            
                    </form>
                </center>
            </div>
		</div>
</div>
</body>
</html>