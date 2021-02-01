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
    <style>
        .title{
            background: #ffffff;height: 40px;line-height: 40px;padding: 2px 4px;margin-top: 2px;font-size: 16px; border-left: 5px solid #00C88D;
        }
        .content{
            background: #ffffff;min-height: 32px;font-size: 16px;padding-top: 2px;
            margin: auto 10px;
            border-bottom: 	#B5B5B5 0.5px dashed !important;
        }
        .aui-link-list{
            background: #ffffff;
        }

    </style>
</head>
<body>
<section class="aui-flexView">
    <header class="aui-navBar aui-navBar-fixed">
        <div class="aui-center aui-center-clear" style="color: #ffffff;font-size: 1.2em;">安氏家谱</div>
    </header>
    <section class="aui-scrollView">
        <div class="aui-head-bg">
            <div class="aui-flex" style="padding-bottom:0">
                <div class="aui-flex-box">
                    <h1>${p.name}</h1>
                </div>
                <div class="aui-arrow">
                    <a href="tree.html" style="color: #fff;font-size: 14px;">查看家谱树</a>
                </div>
            </div>
        </div>
        <div class="aui-link-list">
            <c:if test="${p.biography!=''&&p.biography!=null&&p.biography!=' '}">
                <div class="title">家传：</div>
                <div class="content">&nbsp;&nbsp;&nbsp;&nbsp;${p.biography}</div>
            </c:if>
            <c:if test="${p.training!=''&&p.training!=null&&p.training!=' '}">
                <div class="title">家训：</div>
                <div class="content">&nbsp;&nbsp;&nbsp;&nbsp;${p.training}</div>
            </c:if>
            <c:if test="${p.senior!=''&&p.senior!=null&&p.senior!=' '}">
                <div class="title">辈分字：</div>
                <div class="content">&nbsp;&nbsp;&nbsp;&nbsp;${p.senior}</div>
            </c:if>
            <c:if test="${p.address!=''&&p.address!=null&&p.address!=' '}">
                <div class="title">所在地：</div>
                <div class="content">&nbsp;&nbsp;&nbsp;&nbsp;${p.address}</div>
            </c:if>
            <c:if test="${p.his_intro!=''&&p.his_intro!=null&&p.his_intro!=' '}">
                <div class="title">历史渊源：</div>
                <div class="content">&nbsp;&nbsp;&nbsp;&nbsp;${p.his_intro}</div>
            </c:if>
            <c:if test="${p.source!=''&&p.source!=null&&p.source!=' '}">
                <div class="title">姓氏源流：</div>
                <div class="content">&nbsp;&nbsp;&nbsp;&nbsp;${p.source}</div>
            </c:if>
            <c:if test="${p.maintainer!=''&&p.maintainer!=null&&p.maintainer!=' '}">
                <div class="title">家谱维护人：</div>
                <div class="content">&nbsp;&nbsp;&nbsp;&nbsp;${p.maintainer}</div>
            </c:if>
        </div>
        <div style="height:53px;"></div>
    </section>
    <footer class="aui-footer aui-footer-fixed">
        <a href="content.html" class="aui-tabBar-item aui-tabBar-item-active">
            <span class="aui-tabBar-item-text">首页</span>
        </a>
        <a href="tree.html" class="aui-tabBar-item">
            <span class="aui-tabBar-item-text">家谱树</span>
        </a>
        <a href="index.html" class="aui-tabBar-item">
            <span class="aui-tabBar-item-text">检索</span>
        </a>
    </footer>
</section>

</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/orgchart/js/jquery.min.js"></script>
<script type="text/javascript">

</script>
</html>
