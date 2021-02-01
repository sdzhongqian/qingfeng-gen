<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="${pageContext.request.contextPath}/resources/plugins/app/css/style.css" rel="stylesheet" type="text/css"/>
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

        .aui-head{
            background-color: #26a878;
            background-position: bottom;
            height: 36px;
            line-height: 36px;
            color: #fff;
            text-align: center;
            font-size: 16px;
        }
         .title{
             background: #ffffff;height: 40px;line-height: 40px;padding: 2px 4px;margin-top: 2px;font-size: 16px;text-align: center;color: #999;
         }
        .content{
            background: #ffffff;min-height: 32px;font-size: 16px;padding-top: 2px;
        }
        .a {
            color: #26a878;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="outdiv">
    <div class="aui-head">安氏家谱
    </div>
    <div class="body-conter"><!--页面详情开始  -->
        <div style="width: 100%;height: 180px;" align="center">
            <img src="${pageContext.request.contextPath}/resources/plugins/app/images/an1.png" style="height: 180px;">
        </div>
        <div class="title">我们为你找到以下人员，可选择登录</div>
        <div class="aui-link-list">
            <ul class="list">
                <c:forEach items="${list}" var="var" varStatus="status">
                    <li>
                        <a class="a" onclick="login('${var.id}')">
                            <i class="fl"></i>
                            <span class="fl" style="font-size: 16px;color: #999">${var.generation_name}:${var.name}</span>
                            <em class="fl" style="font-size: 14px;color: #999">父亲：${var.father_name}</em>
                            <div class="aui-arrow1" style="color: #26a878">
                                登录
                            </div>
                        </a>
                    </li>
                </c:forEach>
            </ul>

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
    function login(id){
        window.location.href="${pageContext.request.contextPath}/gen/app/saveSessionUser.html?id="+id;
    }
</script>
</html>
