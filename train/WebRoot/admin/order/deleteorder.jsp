<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    
    <title>订单管理（管理员界面）</title>

</head>
<body>
 <%    //接收订单号 
            String ordernum = request.getParameter("oder_num");  
            String driverClass = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
            String url = "jdbc:sqlserver://localhost:1433; DatabaseName = train";
            String username = "sa";
            String password = "123456";
            Class.forName(driverClass);//加载驱动 
            Connection conn = DriverManager.getConnection(url,username,password);//得到连接
            Statement sm=conn.createStatement();
            PreparedStatement ps= conn.prepareStatement("delete from orders where oder_num='"+ordernum+"'");  
            int flag=ps.executeUpdate();
           
            if(flag>0){
            	response.sendRedirect("order.jsp"); 
                }else{
                	response.sendRedirect("order.jsp?="+ordernum);//密码不对返回到登陆  
                }
            ps.close();
            sm.close();
            conn.close();
%>
</body>
</html>