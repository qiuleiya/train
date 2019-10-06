<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%response.setContentType("text/html;charset=gb2312"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <title>首页</title>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet"href="t.css">
    <style type="text/css">
       

    .pic_list{float: left}
    .pic_list dl{float: left;width: 152px;margin:  5px 15px}
    .pic_list dl dd{float:left}
    .pic_list dl dt{text-align: center;color: #81d4ed}
    .price{font-size: 10px;font-weight: 800;color: darksalmon;float: right}

</style>
    <script type="text/javascript">
        function $(id){
            return document.getElementById(id);
        }
        function check(){
            var qidian= $("qidian").value;
            var zhongdian= $("zhongdian").value;

            if(qidian== zhongdian){
                alert("起点和终点不能相同！");
                return false;
            }
            else return true;
        }
    </script>
</head>
<body>
<div class="top"><!-- 页面顶部 -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

            <img src="image/logo.png" class="img-circle"width="40"height="40">
            <a class="navbar-brand" href="main.jsp">小丸子火车售票系统</a>
            <ul class="nav navbar-nav navbar-right">
            <li><a href="user/register/register.jsp"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
            
                <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
            </ul>
        </div>

</div>
<div class="container">
    <div class="row clearfix">
    <div class="col-md-12 column">
        <div class="biaoti">
            <h1><img src="image/dong2.gif" class="img-circle"width="50"height="50">系统首页</h1>
        </div>
    </div>
    </div>
    <div class="row clearfix">
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
                <!--  根据地点查询车次-->
                    <div class="tab-pane active" id="panel-51340">
                        <form class="form-horizontal form1" method="get"  onsubmit="retrun check()" action="unlogin/showticket1.jsp">
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
                     <!--  根据车次查询车次-->
                    <div class="tab-pane" id="panel-396533">
                        <form class="form-horizontal" role="form" action="unlogin/showticket.jsp">
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
        <div class="col-md-4 column">
            <div class="carousel slide" id="carousel-928536">
                <ol class="carousel-indicators">
                    <li data-slide-to="0" data-target="#carousel-928536">
                    </li>
                    <li data-slide-to="1" data-target="#carousel-928536" class="active">
                    </li>
                    <li data-slide-to="2" data-target="#carousel-928536">
                    </li>
                </ol>
                <div class="carousel-inner">
                    <div class="item">
                        <img alt="" src="image/gdt1.jpg" />
                        <div class="carousel-caption">
                            <h4 >
                                欢迎来到小丸子售票系统
                            </h4>
                            <p>
                                Welcome to the train
                            </p>
                        </div>
                    </div>
                    <div class="item active">
                        <img alt="" src="image/gdt2.jpg" />
                        <div class="carousel-caption">
                            <h4>
                                欢迎来到小丸子售票系统
                            </h4>

                        </div>
                    </div>
                    <div class="item">
                        <img alt="" src="image/gdt3.jpg" />
                        <div class="carousel-caption">
                            <h4>
                                欢迎来到小丸子售票系统
                            </h4>
                        </div>
                    </div>
                </div> <a class="left carousel-control" href="#carousel-928536" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
                <a class="right carousel-control" href="#carousel-928536" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
            </div>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion"
                               href="#collapseOne">
                                特惠景点门票
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <div class="pic_list">
                            <dl>
                                <div><a href="shoppingDetail.html" traget="_blank">
                                    <img src="image/mengpiao1.jpg"height="100" width="180"/></a> </div>
                                <dt> 鼓浪屿</dt>
                                <dd><span class="price">￥55起</span>&nbsp;&nbsp;
                                    </dd>
                            </dl>
                            <dl>
                                <div><a href="shoppingDetail.html" traget="_blank">
                                    <img src="image/mengpiao2.jpg"height="100" width="180"/></a> </div>
                                <dt> 武夷山</dt>
                                <dd><span class="price">￥60起</span>&nbsp;&nbsp;
                                </dd>
                            </dl>
                            <dl>
                                <div><a href="shoppingDetail.html" traget="_blank">
                                    <img src="image/mengpiao3.jpg"height="100" width="180"/></a> </div>
                                <dt> 方特梦幻乐园</dt>
                                <dd><span class="price">￥170起</span>&nbsp;&nbsp;
                                </dd>
                            </dl>
                            <dl>
                                <div><a href="shoppingDetail.html" traget="_blank">
                                    <img src="image/mengpiao4.jpg"height="100" width="180"/></a> </div>
                                <dt>清源山 </dt>
                                <dd><span class="price">￥80起</span>&nbsp;&nbsp;
                                </dd>
                            </dl>
                            <dl>
                                <div><a href="shoppingDetail.html" traget="_blank">
                                    <img src="image/mengpiao5.jpg"height="100" width="180"/></a> </div>
                                <dt> 火山岛海</dt>
                                <dd><span class="price">￥90起</span>&nbsp;&nbsp;
                                </dd>
                            </dl><dl>
                            <div><a href="shoppingDetail.html" traget="_blank">
                                <img src="image/mengpiao6.jpg"height="100" width="180"/></a> </div>
                            <dt> 永定土楼</dt>
                            <dd><span class="price">￥88起</span>&nbsp;&nbsp;
                            </dd>
                        </dl>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion"
                               href="#collapseTwo">
                               酒店预订
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse">
                        <div class="panel-body">
                            <div class="pic_list">
                                <dl>
                                    <div><a href="shoppingDetail.html" traget="_blank">
                                        <img src="image/jiudian1.jpg"height="100" width="180"/></a> </div>
                                    <dt> 木具客栈</dt>
                                    <dd><span class="price">￥155起</span>&nbsp;&nbsp;
                                    </dd>
                                </dl>
                                <dl>
                                    <div><a href="shoppingDetail.html" traget="_blank">
                                        <img src="image/jiudian2.jpg"height="100" width="180"/></a> </div>
                                    <dt> 青年旅舍</dt>
                                    <dd><span class="price">￥260起</span>&nbsp;&nbsp;
                                    </dd>
                                </dl>
                                <dl>
                                    <div><a href="shoppingDetail.html" traget="_blank">
                                        <img src="image/jiudian3.jpg"height="100" width="180"/></a> </div>
                                    <dt> 喜居主题住宿</dt>
                                    <dd><span class="price">￥170起</span>&nbsp;&nbsp;
                                    </dd>
                                </dl>
                                <dl>
                                    <div><a href="shoppingDetail.html" traget="_blank">
                                        <img src="image/jiudian4.jpg"height="100" width="180"/></a> </div>
                                    <dt>海边浪漫小窝 </dt>
                                    <dd><span class="price">￥180起</span>&nbsp;&nbsp;
                                    </dd>
                                </dl>
                                <dl>
                                    <div><a href="shoppingDetail.html" traget="_blank">
                                        <img src="image/jiudian5.jpg"height="100" width="180"/></a> </div>
                                    <dt> 时光印记酒店</dt>
                                    <dd><span class="price">￥190起</span>&nbsp;&nbsp;
                                    </dd>
                                </dl><dl>
                                <div><a href="shoppingDetail.html" traget="_blank">
                                    <img src="image/jiudian6.jpg"height="100" width="180"/></a> </div>
                                <dt>海轩渡假客栈</dt>
                                <dd><span class="price">￥188起</span>&nbsp;&nbsp;
                                </dd>
                            </dl>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion"
                               href="#collapseThree">
                               当季热门度假
                            </a>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse">
                        <div class="panel-body">
                            <div class="pic_list">
                                <dl>
                                    <div><a href="shoppingDetail.html" traget="_blank">
                                        <img src="image/dujia1.jpg"height="100" width="180"/></a> </div>
                                    <dt>含往返机票＋4晚住宿</dt>
                                    <dd><span class="price">￥3420起</span>&nbsp;&nbsp;
                                    </dd>
                                </dl>
                                <dl>
                                    <div><a href="shoppingDetail.html" traget="_blank">
                                        <img src="image/dujia2.jpg"height="100" width="180"/></a> </div>
                                    <dt>含往返机票＋7晚住宿</dt>
                                    <dd><span class="price">￥4000起</span>&nbsp;&nbsp;
                                    </dd>
                                </dl>
                                <dl>
                                    <div><a href="shoppingDetail.html" traget="_blank">
                                        <img src="image/dujia3.jpg"height="100" width="180"/></a> </div>
                                    <dt> 含往返机票＋6晚住宿</dt>
                                    <dd><span class="price">￥3900起</span>&nbsp;&nbsp;
                                    </dd>
                                </dl>
                                <dl>
                                    <div><a href="shoppingDetail.html" traget="_blank">
                                        <img src="image/dujia4.jpg"height="100" width="180"/></a> </div>
                                    <dt>含往返机票＋9晚住宿 </dt>
                                    <dd><span class="price">￥4180起</span>&nbsp;&nbsp;
                                    </dd>
                                </dl>
                                <dl>
                                    <div><a href="shoppingDetail.html" traget="_blank">
                                        <img src="image/dujia5.jpg"height="100" width="180"/></a> </div>
                                    <dt> 含往返机票＋4晚住宿</dt>
                                    <dd><span class="price">￥4190起</span>&nbsp;&nbsp;
                                    </dd>
                                </dl><dl>
                                <div><a href="shoppingDetail.html" traget="_blank">
                                    <img src="image/dujia6.jpg"height="100" width="180"/></a> </div>
                                <dt>含5晚住宿</dt>
                                <dd><span class="price">￥5188起</span>&nbsp;&nbsp;
                                </dd>
                            </dl>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-10 column">
            <div class="guangao">
                <div class="carousel slide" id="carousel-92853">
                    <ol class="carousel-indicators">
                        <li data-slide-to="0" data-target="#carousel-92853">
                        </li>
                        <li data-slide-to="1" data-target="#carousel-92853" >
                        </li>
                        <li data-slide-to="2" data-target="#carousel-92853">
                        </li>
                        <li data-slide-to="3" data-target="#carousel-92853">
                        </li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="item">
                            <img alt="夏天出门耍" src="image/gg1.jpg" />
                        </div>
                        <div class="item active">
                            <img alt="自驾" src="image/gg2.jpg" />
                        </div>
                        <div class="item">
                            <img alt="环球经典 免签海岛" src="image/gg3.jpg" />
                        </div>
                        <div class="item">
                            <img alt="暑假游" src="image/gg4.jpg" />
                        </div>
                    </div> <a class="left carousel-control" href="#carousel-92853" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
                    <a class="right carousel-control" href="#carousel-92853" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
                </div>
            </div>

            </div>
        <div class="col-md-2 column">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                       公告
                    </h3>
                </div>
                <div class="panel-body">
                    <ul>
                        <li><a href="gonggao.html"> 小丸子试营</a></li>
                        <li><a href="zhapian.html"> 反网络诈骗专栏</a></li>
                        <li><a href="tieshi.html">出行小贴士</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<div bgcolor="#efefef" align="center" class="foot">
            <small>Cherry pellets train ticketing system&小丸子火车售票系统版权所有<br/>
                小丸子咨询热线 222-111-333<br/></small>
            <img src="image/foot_pic.jpg"/>
        </div>
</body>
</html>