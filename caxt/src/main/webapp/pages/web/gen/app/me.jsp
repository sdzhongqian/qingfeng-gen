<%--
  Created by IntelliJ IDEA.
  User: 青锋
  Date: 2019-1-7
  Time: 9:09
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
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/plugins/orgchart/img/logo.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/orgchart/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/orgchart/css/jquery.orgchart.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/orgchart/css/style.css">

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
                    <h1>我的关系树</h1>
                </div>
            </div>
        </div>
        <div class="aui-link-list">
            <div id="chart-container"></div>
        </div>
    </section>
    <footer class="aui-footer aui-footer-fixed">
        <a href="index.html" class="aui-tabBar-item ">
            <span class="aui-tabBar-item-text">首页</span>
        </a>
        <a href="tree.html" class="aui-tabBar-item">
            <span class="aui-tabBar-item-text">家谱树</span>
        </a>
        <a href="me.html" class="aui-tabBar-item aui-tabBar-item-active">
            <span class="aui-tabBar-item-text">我的</span>
        </a>
    </footer>
</section>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/touch/touch.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/touch/cat.touchjs.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/orgchart/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/orgchart/js/jquery.mockjax.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/orgchart/js/jquery.orgchart.js"></script>
<script type="application/javascript">
    $(function() {
        var datascource = ${data};
        console.log(datascource);

//        var ajaxURLs = {
//            'children': '/gen/app/children/',
//            'parent': '/gen/app/parent/',
//            'siblings': '/gen/app/siblings/',
//            'families': '/gen/app/siblings/'
//        };

        var ajaxURLs = {
            'children': '${pageContext.request.contextPath}/gen/app/children/',
            'parent': '${pageContext.request.contextPath}/gen/app/siblings/',
            'siblings': '${pageContext.request.contextPath}/gen/app/siblings/',
            'families': '${pageContext.request.contextPath}/gen/app/siblings/'
        };


        $('#chart-container').orgchart({
            'data' : datascource,
            'ajaxURL': ajaxURLs,
            'nodeContent': 'title',
            'nodeId': 'id'
        });

    });

    $(function () {
        var $targetObj = $('.orgchart');
//        //初始化拖动手势（不需要就注释掉）
        cat.touchjs.drag($targetObj, function (left, top) {
        });
        //初始化缩放手势（不需要就注释掉）
        cat.touchjs.scale($targetObj, function (scale) {
        });
    });

</script>
</html>
