<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 青锋
  Date: 2019-1-7
  Time: 9:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>安氏家谱</title>
    <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport"/>
    <meta content="yes" name="apple-mobile-web-app-capable"/>
    <meta content="black" name="apple-mobile-web-app-status-bar-style"/>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/plugins/orgchart/img/logo.ico">
    <meta content="telephone=no" name="format-detection"/>
    <link href="${pageContext.request.contextPath}/resources/plugins/app/css/style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/app/css/commons.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/app/css/denglv.css" />
</head>
<body>
<section class="aui-flexView">
    <header class="aui-navBar aui-navBar-fixed">
        <div class="head-top"> <!--表头开始  -->
            <span class="bt">安氏家谱</span>
            <div class="div-1">
                <a style="cursor: pointer" onclick="back();">
                    <img src="${pageContext.request.contextPath}/resources/plugins/app/images/fanhui-ioc.png" />
                    <span style="color: #fff;font-size: 14px;">返回</span>
                </a>
            </div>
        </div>
    </header>
    <section class="aui-scrollView">
        <div class="aui-head-bg">
            <div class="aui-flex" style="padding-bottom:0">
                <div class="aui-flex-box">
                    <h1>登录说明</h1>
                </div>
            </div>
        </div>
        <div class="aui-link-list" style="margin: auto 10px;font-size: 17px">
            ${p.content}
        </div>
        <div style="height:53px;"></div>
    </section>
</section>

</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/orgchart/js/jquery.min.js"></script>
<script>
    function back(){
        window.history.go(-1);
    }
</script>
</html>
