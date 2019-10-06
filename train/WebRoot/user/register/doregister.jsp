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
    
    <title>检验注册页面</title>

  </head>
  
  <body>
    <br>
   <%
   //获取url中的值
   String username = request.getParameter("username");  
   String psw = request.getParameter("psw");
   String repassword = request.getParameter("repassword");
   String realName=request.getParameter("realName");
          realName=java.net.URLDecoder.decode(realName,"GB2312");
          realName=new String(realName.getBytes("ISO-8859-1")); //中文格式转化
   String papers_num=request.getParameter("papers_num");
   String genter=request.getParameter("genter");
          genter=java.net.URLDecoder.decode(genter,"GB2312");
          genter=new String(genter.getBytes("ISO-8859-1"));
   String tel = request.getParameter("tel");
   String email= request.getParameter("email");
   //连接数据库
   String driverClass = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
   String url = "jdbc:sqlserver://localhost:1433; DatabaseName = train";
   String usernames = "sa";
   String password = "123456";
   Class.forName(driverClass);//加载驱动 
   Connection conn = DriverManager.getConnection(url,usernames,password);//得到连接  
   Statement sm=conn.createStatement();//插入注册数据
    PreparedStatement sql =conn.prepareStatement("insert into users(username,psw,repassword,realName,papers_num,genter,tel,email) values(?,?,?,?,?,?,?,?)");
    sql.setString(1,username);
    sql.setString(2,psw);
    sql.setString(3,repassword);
    sql.setString(4,realName);
    sql.setString(5,papers_num);
    sql.setString(6,genter);
    sql.setString(7,tel);
    sql.setString(8,email);
   
    int flag=sql.executeUpdate();
    //判断是否进行了sql操作
    if(flag>0){
    	response.sendRedirect("Registersuccess.jsp"); 
        }else{
        	response.sendRedirect("registerfailed.jsp?="+username);//密码不对返回到登陆  
        }
    sql.close();
    sm.close();
    conn.close();//关闭资源
    %>

 </body>

</html>