<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%response.setContentType("text/html;charset=gb2312"); %>
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
    <title>添加车次信息</title>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet"href="t.css">
    <style type="text/css">
        .biaoti{
            background-image: url("image/bt.jpg");
            }
    </style>
<script type="text/javascript">
    function $(id){
        return document.getElementById(id);
    }

    function checkcheci(){
    var trainorder= $("checi").value;
    
    if(trainorder==""){
    $("trainorderSpan").innerHTML="车次不能为空！ ";
    return false;
    }else{
    $("trainorderSpan").innerHTML="";
    return true;
    }
    }
    function checkStation1(){
    var station = $("qidian").value;
    if(station==""){
    $("stationSpan1").innerHTML="车站不能为空！ ";
    return false;
    }else{
    $("stationSpan1").innerHTML="";
    return true;
    }
    function checkStation2(){
            var station = $("zhongdian").value;
            if(station==""){
                $("stationSpan2").innerHTML="车站不能为空！ ";
                return false;
            }else{
                $("stationSpan2").innerHTML="";
                return true;
            }
    }

    function checkGtime(){
    var g_time = $("g_time").value;
    if(g_time==""){
    $("gTimeSpan").innerHTML="发车时间不能为空！ ";
    return false;
    }else{
    $("gTimeSpan").innerHTML="";
    return true;
    }
    }
    function checkGtime(){
        var a_time = $("a_time").value;
        if(a_time==""){
        $("aTimeSpan").innerHTML="到站时间不能为空！ ";
        return false;
        }else{
        $("aTimeSpan").innerHTML="";
        return true;
        }
    }
    function checkPrice(){
    var price = $("price").value;
    if(price==""){
    $("priceSpan").innerHTML="票价不能为空！ ";
    return false;
    }else{
    $("priceSpan").innerHTML="";
    return true;
    }
    }
    }
    function checkRemainder(){
    var yupiao= $("yupiao").value;

    if(remainder==""){
    $("remainderSpan").innerHTML="剩余票数不能为空！ ";
    return false;
    }
    else{
    $("remainderSpan").innerHTML="";
    return true;
    }
    }

    function checkit()
    {
    if(checkcheci() && checkStation1()&& checkStation2() && checkAtime() && checkGtime() && checkPrice() && checkAmount() && checkRemainder()
    ){
    alert("添加成功！");
    return true;
    }else{
    return false;
    }
    }
    </script>

</head>

<body >
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
    <div class="row clearfix">
        <div class="col-md-12 column biaoti">
            
                <h1><img src="image/glyjm.jpg" class="img-circle"width="50"height="50">添加火车</h1>
                   <a href="admin/train/ticket.jsp"> 返回车次管理界面 </a>
        </div>
        </div>
  <div class="row cleatfix">
  <div class="col-md-12 column">
          <form action="admin/train/doadd.jsp" method="post"  name="form1"  onsubmit="return checkit()">
                 <div class="MainDiv">
                <table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
                <tr>
                <td class="CPanel">
                    <table border="0" cellpadding="0" cellspacing="0" style="width:100%">
                        <tr>
                            <td width="100%">
                                <fieldset style="height:100%;">
                                    <table >

                                        <tr>
                                            <td nowrap="nowrap" align="right" >车次:</td>
                                            <td><input name='checi' id='checi' type="text" class="text"  onblur="checkTrainorder();" />
                                                <span class="red">* </span>
                                                <span style="color:#2e3192;">必填，格式如：T2422,G242,D242,K212,8567</span>
                                                <span style="color:red;font-size:15px;" id="trainorderSpan"></span>
                                            </td>
                                        </tr>
                                        <tr >
                                            <td nowrap="nowrap" align="right" >起点站:</td>
                                            <td>
                                                <input name="qidian" id="qidian" class="text"  onblur="checkStation();" />
                                                <span class="red">* </span>
                                                <span style="color:#2e3192;">必填</span>
                                                <span style="color:red;font-size:15px;" id="stationSpan1"></span>
                                            </td>
                                        </tr>
                                        <tr >
                                            <td nowrap="nowrap" align="right" >终点站:</td>
                                            <td>
                                                <input name="zhongdian" id="zhongdian" class="text"  onblur="checkStation();" />
                                                <span class="red">* </span>
                                                <span style="color:#2e3192;">必填</span>
                                                <span style="color:red;font-size:15px;" id="stationSpan2"></span>
                                            </td>
                                        </tr>
                                      <tr>
                                            <td nowrap="nowrap" align="right" >出发时间:</td>
                                            <td>
                                                <input name="g_time" id="g_time" class="text" onblur="checkGtime();" />
                                                <span class="red">* </span>
                                                <span style="color:#2e3192;">必填，格式如：07:33/07:51/08:02/---</span>
                                                <span style="color:red;font-size:15px;" id="gTimeSpan"></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right" >到站时间:</td>
                                            <td>
                                                <input name="a_time" id="a_time" class="text" onblur="checkAtime();" />
                                                <span class="red">* </span>
                                                <span style="color:#2e3192;">必填，格式如：---/07:49/08:00/08:25/次日6:00</span>
                                                <span style="color:red;font-size:15px;" id="aTimeSpan"></span>
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td nowrap="nowrap" align="right" >票价:</td>
                                            <td>
                                                <input name='price'id="price" class="text" onblur="checkPrice();" />
                                                <span class="red">* </span>
                                                <span style="color:#2e3192;">必填</span>
                                                <span style="color:red;font-size:15px;" id="priceSpan"></span>
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td nowrap="nowrap" align="right" >剩余票数:</td>
                                            <td><input name='yupiao' id='yupiao' type="number" class="text"  onblur="checkRemainder();" />
                                                <span class="red">* </span>
                                                <span style="color:#2e3192;">必填，为正整数,且不大于额定票数</span>
                                                <span style="color:red;font-size:15px;" id="remainderSpan"></span>
                                            </td>
                                        </tr>

                                    </table>
                                    <br />
                                </fieldset></td>
                        </tr>
                    </table>
                </td>
                </tr>
                <tr>
                <td colspan="2" align="center" height="50px">
                    <input type="submit" name="save" value="保存" class="button"/>　
                    <input type="button" name="return" value="返回" class="button" onclick="window.history.go(-1);"/></TD>
                </tr>
                </table>
                 </div>
         </form>
   </div>
  </div>
</div>
<div  align="center" class="foot">
                <small>Cherry pellets train ticketing system&小丸子火车售票系统版权所有<br/>
                    小丸子咨询热线 222-111-333<br/></small>
                <img src="image/foot_pic.jpg"/>
</div>
</body>
</html>