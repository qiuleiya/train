<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%response.setContentType("text/html;charset=gb2312"); %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">


    <title>用户界面</title>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet"href="t.css">

</head>
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
    <div class="row clearfix">
        <div class="col-md-12 column biaoti1">
            <h1><img src="image/yhjm.jpg" class="img-circle"width="50"height="50">用户界面</h1>
        </div>
    </div>
     <%String username= request.getParameter("username"); //获取url中的username值%>
    <div class="row clearfix" >
        <div class="col-md-2 column">
            <a href="user/usermain.jsp" class="list-group-item btn1">车次查询购票</a>
            <a href="user/ticketorder/order/Myorder.jsp?username=<%=username%> " class="list-group-item btn1">订单查询及退票</a>
 </div>
        <div class="col-md-8 column">
            <div class="tabbable" id="tabs-649689">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#panel-51340" data-toggle="tab">起点终点查询</a>
                    </li>
                    <li>
                        <a href="#panel-396533" data-toggle="tab">车次查询</a>
                    </li>
                </ul>
             <div class="tab-content">
                    <div class="tab-pane active" id="panel-51340">
                   
                        <form class="form-horizontal form1" method="get"  onsubmit="retrun check()" action="user/ticketorder/showticket1.jsp">
                            <input type="hidden" name='username' id='username' value="<%=username%>" ><!-- 表单隐藏类型传username -->
                            <div class="form-group">
                                <label for="qidian" class="col-sm-2 control-label">起点</label>
                                <div class="col-sm-10">
                                    <select name="qidian" id="qidian">
                                        <option value="厦门">厦门</option>
                                        <option value="长沙">长沙</option>
                                        <option value="北京">北京</option>
                                        <option value="贵阳">贵阳</option>
                                        <option value="汕头">汕头</option>
                                        <option value="武汉">武汉</option>
                                        <option value="广州">广州</option>
                                        <option value="珠海">珠海</option>
                                        <option value="天津">天津</option>
                                        <option value="兰州">兰州</option>
                                        <option value="乌鲁木齐">乌鲁木齐</option>
                                        <option value="桂林">桂林</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="zhongdian" class="col-sm-2 control-label">终点</label>
                                <div class="col-sm-10">
                                <select name="zhongdian" id="zhongdian">
                                       
                                        <option value="福州">福州</option>
                                        <option value="珠海">珠海</option>
                                        <option value="成都">成都</option>
                                        <option value="上海">上海</option>
                                        <option value="桂林">桂林</option>
                                        <option value="天津">天津</option>
                                        <option value="深圳">深圳</option>
                                         <option value="厦门">厦门</option>
                                        <option value="长沙">长沙</option>
                                        <option value="北京">北京</option>
                                        <option value="广州">广州</option>
                                        <option value="汕头">汕头</option>
                                        <option value="杭州">杭州</option>
                                        <option value="西安">西安</option>
                                    </select>
                                </div>
                            </div>
								<div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-default">查询</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="tab-pane" id="panel-396533">
                        <form class="form-horizontal" role="form" action="user/ticketorder/showticket.jsp">
                            <input type="hidden" name='username' id='username' value="<%=username%>" >
                            <div class="form-group">
                                <label for="checi" class="col-sm-2 control-label">车次</label>
                                <div align="center">
                                    <select name="checi" id="checi">
                                        <option value="D3092">D3092</option>
                                        <option value="D3822">D3822</option>
                                        <option value="D7789">D7789</option>
                                        <option value="D4489">D4489</option>
                                        <option value="D7422">D7433</option>
                                        <option value="D633">D633</option>
                                        <option value="D264">D264</option>
                                        <option value="D289">D289</option>
                                        <option value="D309">D309</option>
                                        <option value="K236">K236</option>
                                        <option value="K310">K310</option>
                                        <option value="K735">K735</option>
                                        <option value="K597">K597</option>
                                        <option value="K260">K260</option>
                                        <option value="K278">K278</option>
                                        <option value="T934">T934</option>
                                        <option value="T674">T674</option>
                                        <option value="T357">T357</option>
                                        <option value="T842">T842</option>
                                        <option value="T379">T379</option>
                                        <option value="T144">T144</option>
                                        <option value="T085">T085</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-default">查询</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
        </div>

</div>
</div>
</div>
<div align="center" class="foot">
<small>Cherry pellets train ticketing system&小丸子火车售票系统版权所有<br/>
        小丸子咨询热线 222-111-333<br/></small>
    <img src="image/foot_pic.jpg"/>
</div>
</body>
</html>