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
            String checi = request.getParameter("checi");  
            String qidian= request.getParameter("qidian"); 
                   qidian=java.net.URLDecoder.decode(qidian,"GB2312");
                   qidian=new String(qidian.getBytes("ISO-8859-1")); //中文格式转化
            String zhongdian= request.getParameter("zhongdian"); 
                   zhongdian=java.net.URLDecoder.decode(zhongdian,"GB2312");
                   zhongdian=new String(zhongdian.getBytes("ISO-8859-1")); //中文格式转化
            String a_time= request.getParameter("a_time");  
            String  g_time= request.getParameter("g_time");  
            String  price= request.getParameter("price");  
            int  yupiao=Integer.parseInt(request.getParameter("yupiao")); 
            String driverClass = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
            String url = "jdbc:sqlserver://localhost:1433; DatabaseName = train";
            String username = "sa";
            String password = "123456";
            Class.forName(driverClass);//加载驱动 
            Connection conn = DriverManager.getConnection(url,username,password);//得到连接
            Statement sm=conn.createStatement();
           PreparedStatement ps= conn.prepareStatement("insert into ticket(checi,qidian,zhongdian,g_time,a_time,price,yupiao)values(?,?,?,?,?,?,?)");  
            ps.setString(1,checi);
            ps.setString(2,qidian);
            ps.setString(3,zhongdian);
            ps.setString(4,g_time);
            ps.setString(5,a_time);
            ps.setString(6,price);
            ps.setInt(7,yupiao);
            int flag=ps.executeUpdate();
            ps.close();
            sm.close();
            conn.close();
            if(flag>0){
            	
            	response.sendRedirect("addtrainsuccess.jsp"); 
            	%><script type="text/javascript">alert("添加成功！");</script> <%
                }else{
                	out.println("添加失败，请重新操作");
                	response.sendRedirect("addtrainfailed.jsp");//密码不对返回到登陆  
                }
   %>
</body>
</html>