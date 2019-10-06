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
    
    <title>购买车票页面</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
 
  </head>
  
  <body>
    <br>
   <%
   String username = request.getParameter("username");
   String checi = request.getParameter("checi");
   int ticketnum = Integer.parseInt(request.getParameter("ticketnum"));
   String ticketdate = request.getParameter("ticketdate");
   String qidian=null;
   String zhongdian=null;
   String g_time=null;
   String a_time=null;
   String price=null;
   int yupiao=0;
   String oder_num=RandomStringUtils.randomNumeric(20);
   String driverClass = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
   String url = "jdbc:sqlserver://localhost:1433; DatabaseName = train";
   String usernames = "sa";
   String password = "123456";
   Class.forName(driverClass);//加载驱动 
   Connection conn = DriverManager.getConnection(url,usernames,password);//得到连接  
   Statement sm=conn.createStatement();//数据库操作
   ResultSet rs=sm.executeQuery("select * from ticket where checi='"+checi+"'");
   while(rs.next()) {
   qidian=rs.getString(2);
   zhongdian=rs.getString(3);
   g_time=rs.getString(4);
   a_time=rs.getString(5);
   price=rs.getString(6);
   yupiao=rs.getInt(7);}
   yupiao=yupiao-ticketnum;
   PreparedStatement ps1= conn.prepareStatement("update ticket  set yupiao='"+yupiao+"' where checi='"+checi+"'");
   PreparedStatement ps= conn.prepareStatement("insert into orders(oder_num,username,checi,qidian,zhongdian,g_time,a_time,ticketdate,price,ticketnum)values(?,?,?,?,?,?,?,?,?,?)");  
   ps.setString(1,oder_num);
   ps.setString(2,username);
   ps.setString(3,checi);
   ps.setString(4,qidian);
   ps.setString(5,zhongdian);
   ps.setString(6,g_time);
   ps.setString(7,a_time);
   ps.setString(8,ticketdate);
   ps.setString(9,price);
   ps.setInt(10,ticketnum);
   
   int flag=ps1.executeUpdate();
   int flag1=ps.executeUpdate();
   if(flag1>0&&flag>0){

    	response.sendRedirect("order/thisorder.jsp?oder_num="+oder_num); 
        }
   else{
        	
        	response.sendRedirect("buyfailed.jsp?username="+username);//购买失败 
        }
   rs.close();
   ps.close();
    ps1.close();
    sm.close();
    conn.close();
    %>

 </body>

</html>