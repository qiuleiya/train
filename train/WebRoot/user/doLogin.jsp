<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.sql.ResultSet"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <%      //接收用户名和密码  
            String username = request.getParameter("username");  
            String psw = request.getParameter("psw");
            String driverClass = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
            String url = "jdbc:sqlserver://localhost:1433; DatabaseName = train";
            String usernames = "sa";
            String password = "123456";
            Class.forName(driverClass);//加载驱动 
            Connection conn = DriverManager.getConnection(url,usernames,password);//得到连接
            PreparedStatement pStmt = conn.prepareStatement("select * from users where username = '" + username + "' and psw = '" + psw + "'");
              ResultSet rs = pStmt.executeQuery();
                if(rs.next()){
                	response.sendRedirect("usermain.jsp?username="+username); }
               else{
            	   response.sendRedirect("Login.jsp"); }  

     rs.close();
     pStmt.close();
     conn.close();
 %>


</body>
</html>

