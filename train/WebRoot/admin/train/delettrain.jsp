<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <title>删除车次（管理员）</title>
</head>
<body>
 <%    //接收订单号 
            String checi = request.getParameter("checi");  
            String driverClass = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
            String url = "jdbc:sqlserver://localhost:1433; DatabaseName = train";
            String username = "sa";
            String password = "123456";
            Class.forName(driverClass);//加载驱动 
            Connection conn = DriverManager.getConnection(url,username,password);//得到连接
            Statement sm=conn.createStatement();
            PreparedStatement ps= conn.prepareStatement("delete from ticket where checi='"+checi+"'");  
            int flag=ps.executeUpdate();
           
            if(flag>0){
            	%><script type="text/javascript">alert("删除成功！");</script> <%
            	response.sendRedirect("ticket.jsp"); 
                }else{%>
                	<script type="text/javascript">alert("删除失败，请重新操作");</script><%
                	response.sendRedirect("ticket.jsp?="+checi);//密码不对返回到登陆  
                }
            ps.close();
            sm.close();
            conn.close();
     %>
</body>
</html>