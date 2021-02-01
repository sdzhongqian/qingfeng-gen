<%@ page import="com.wdata.base.util.DateTimeUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css" media="all">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/table.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/wdata-style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/layui/layui.js"></script>
</head>
<body>
<div class="layui-tab-content" style="   background: #f7f7f7;">
    <div class="layui-row layui-col-space10">
        <div class="layui-col-md12">
            <div class="grid-demo index-head layui-clear">
                <div class="head-img">
                    <c:if test="${loginUser.head_address==''||loginUser.head_address==null}">
                        <img src="${pageContext.request.contextPath}/resources/images/0.jpg" />
                    </c:if>
                    <c:if test="${loginUser.head_address!=''&&loginUser.head_address!=null}">
                        <img src="${pageContext.request.contextPath}/${loginUser.head_address}" />
                    </c:if>
                </div>
                <div class="wel">
                    <p class="style-1"><span>${loginUser.nickname}</span>你好，欢迎X氏家谱网管理后台</p>
                    <p class="style-2" ><span><%=DateTimeUtil.getDateTimeStr()%></span></p>
                </div>
                <iframe style=" position: absolute; right:0px; width:240px; height: 70px;" id="fancybox-frame" name="fancybox-frame1541561112936" frameborder="0" scrolling="no" hspace="0"  src="http://i.tianqi.com/index.php?c=code&a=getcode&id=42&h=54&w=214"></iframe>
            </div>
        </div>
    </div>

    <div id="gn">

    </div>

</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/layui/layui.js"></script>

<script>
    $(document).ready(function(){
        // 初始化内容
        $("#cidebox a").attr("href","");

    });


    function selectMenu(id,title,href,icon){
        //window.location.href = href;
        parent.addTabMenu(id,title,href,icon)
    }

</script>

</body>
</html>