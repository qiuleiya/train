<%@ page language="java" import="java.sql.*" contentType="text/html;charset=utf-8"%>
 <%@ page import="org.apache.commons.lang.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>退票检验页面</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
 
  </head>
  
  <body>
    <br>
   <%//接受值
   String username = request.getParameter("username");
   String oder_num = request.getParameter("oder_num");
   
   String checi=null;
   int yupiao=0;
   int ticketnum=0;
  
   String driverClass = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
   String url = "jdbc:sqlserver://localhost:1433; DatabaseName = train";
   String usernames = "sa";
   String password = "123456";
   Class.forName(driverClass);//加载驱动 
   Connection conn = DriverManager.getConnection(url,usernames,password);//得到连接  
   Statement sm=conn.createStatement();
   
   //查询订单车次并修改车次表中的余票数
   ResultSet rs1=sm.executeQuery("select * from orders where oder_num='"+oder_num+"'");
   while(rs1.next()) {
   checi=rs1.getString(3);
   ticketnum=rs1.getInt(10);}
   ResultSet rs2=sm.executeQuery("select * from ticket where checi='"+checi+"'");
   while(rs2.next()) {
	   yupiao=rs2.getInt(7);
   }
   yupiao=yupiao+ticketnum;
   PreparedStatement ps1= conn.prepareStatement("update ticket  set yupiao='"+yupiao+"' where checi='"+checi+"'");
 
   //根据订单号删除订单
   PreparedStatement ps= conn.prepareStatement("delete from orders where oder_num='"+oder_num+"'"); 
  
   
   int flag=ps1.executeUpdate();
   int flag1=ps.executeUpdate();
   if(flag1>0&&flag>0){

    	response.sendRedirect("returnsuccess.jsp?username="+username); //购买成功
        }
   else{
        	
        	response.sendRedirect("returnfalied.jsp?username="+username);//购买失败 
        }
    rs1.close();
    rs2.close();
    ps.close();
    ps1.close();
    sm.close();
    conn.close();//关闭资源
    %>

 </body>

</html>