<%--
  Created by IntelliJ IDEA.
  User: 青锋
  Date: 2019-1-7
  Time: 9:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>安氏家谱</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/plugins/orgchart/img/logo.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/app/css/commons.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/app/css/denglv.css" />
    <style>
        .line{
            height: 1px;
            border-top: 1px solid #ddd;
            text-align: center;
        }
        .line span{
            position: relative;
            top: -12px;
            background: #fff;
            padding: 0 20px;
        }
    </style>
</head>
<body>
<div class="outdiv">
    <div class="head-top"> <!--表头开始  -->
        <span class="bt">登录</span>
        <div class="div-1">
            <!--<img src="images/fanhui-ioc.png" />-->
            <!--<span>返回</span>-->
        </div>
    </div> <!--表头结束  -->
    <div class="body-conter"><!--页面详情开始  -->
        <div style="width: 100%;height: 180px;" align="center">
            <img src="${pageContext.request.contextPath}/resources/plugins/app/images/an1.png" style="height: 180px;">
        </div>

        <div class="div-dl" style="height: auto">
            <div class="line"></div>
            <ul>
                <li class="yhm">
                    <img class="yhico" src="${pageContext.request.contextPath}/resources/plugins/app/images/font-yonghu.png"/>
                    <input placeholder="请输入姓名" name="login_name" id="login_name" type="text"  />
                    <img class="qk" src="${pageContext.request.contextPath}/resources/plugins/app/images/font-quxiao.png"/>
                    <div style="clear: both;"></div>
                </li>
                <!--<li class="yhm" style="border: none;">-->
                <!--<img class="yhico" src="images/iconfont-mima.png"/>-->
                <!--<input placeholder="请输入密码" name="" type="password"  />-->
                <!--<img class="qk" src="images/iconfont-chakan.png"/>-->
                <!--</li>-->
            </ul>
            <div class="line"></div>
        </div>
        <div class="div-mmzd">

            <a onclick="login();" style="color:#fff;"><div class="dl-button">登录</div></a>
            <div class="fgx" id="msg" style="color: red;">${pd.msg}</div>
            <div class="fgx">------------------仅限安氏家族人员使用------------------</div>
            <div class="dl-button" style="background-color: #fff; color:  #5FB52C;" onclick="loginExplanation()">登录说明</div>
        </div>

    </div><!--页面详情结束  -->
    <!--底部菜单开始                                                                                                      -->
    <div class="body-bottom" align="center">
        <span>技术支持：安兴文、安兴涛</span>
    </div>
    <!--底部菜单结束                                                                                                      -->
</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/orgchart/js/jquery.min.js"></script>
<script type="text/javascript">
    function login(){
        var login_name = $("#login_name").val();
        if(login_name==''){
            $("#msg").html("请先输入姓名再进行登录。");
        }else{
            $("#msg").html("");
            window.location.href="${pageContext.request.contextPath}/gen/app/login.html?login_name="+login_name;
        }
    }


    function loginExplanation(){
        window.location.href="${pageContext.request.contextPath}/gen/app/loginExplanation.html";
    }
</script>
</html>
