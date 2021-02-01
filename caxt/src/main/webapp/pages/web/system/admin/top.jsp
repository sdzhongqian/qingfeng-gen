<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>系统管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css" media="all">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/table.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/wdata-style.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/layui/layui.js"></script>
    <!--导出公共插件-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/tableExport/tableExport.js" charset="utf8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/tableExport/jquery.base64.js" charset="utf8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/tableExport/jspdf/libs/base64.js" charset="utf8"></script>
</head>

<body>