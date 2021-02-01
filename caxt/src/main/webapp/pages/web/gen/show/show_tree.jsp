<%--
  Created by IntelliJ IDEA.
  User: 青锋
  Date: 2019-1-2
  Time: 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>家谱树展示</title>

    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/plugins/orgchart/img/logo.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/orgchart/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/orgchart/css/jquery.orgchart.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/orgchart/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/layui/css/layui.css" media="all" />

</head>
<body>
    <div align="right" style="padding-right: 20px;padding-top: 10px;"><button class="layui-btn layui-btn-normal layui-btn-sm" onclick="importImg()">导出图片</button></div>
    <div id="chart-container"></div>
</body>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/orgchart/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/orgchart/js/jquery.mockjax.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/orgchart/js/jquery.orgchart.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/html2canvas.js"></script>
<script type="application/javascript">

    function importImg() {
        html2canvas($(".orgchart")[0]).then(function (canvas) {
            document.body.appendChild(canvas);
            canvas.id = "mycanvas";
            var img = convertCanvasToImage(canvas);
            //调用下载方法 封装的下载方法，都在资源里面
            if (browserIsIe()) {  //假如是ie浏览器
                DownLoadReportIMG('安氏家谱.jpg', img.src);
            } else {
                downloadImage(img.src)  //下载图片
            }
        });
        $("#mycanvas").remove();
    }


    // 从canvas提取图片image
    function convertCanvasToImage(canvas){
        //新Image对象,可以理解为DOM;
        var image = new Image();
        //canvas.toDataURL返回的是一串Base64编码的URL,当然,浏览器自己肯定支持
        //指定格式PNG
        image.src = canvas.toDataURL("image/png");
        return image;
    }

    function downloadImage(src) {
        var $a = $("<a></a>").attr("href", src).attr("download", "安氏家谱.png");
        $a[0].click();
    }


    function browserIsIe(){
        if (!!window.ActiveXObject || "ActiveXObject" in window) {
            return true;
        }else{
            return false;
        }
    }

    $(function() {
        $.mockjax({
            url: '/orgchart/children/3/',
            contentType: 'application/json',
            responseTime: 1000,
            responseText: { 'children': [
                { 'id': '4', 'name': 'Pang Pang1', 'title': 'engineer', 'relationship': '110' },
                { 'id': '5', 'name': 'Xiang Xiang2', 'title': 'UE engineer', 'relationship': '110'}
            ]}
        });

        $.mockjax({
            url: '/orgchart/parent/1/',
            contentType: 'application/json',
            responseTime: 1000,
            responseText: { 'id': '6','name': 'Lao Lao', 'title': 'general manager', 'relationship': '001' }
        });


        $.mockjax({
            url: '/orgchart/siblings/1/',
            contentType: 'application/json',
            responseTime: 1000,
            responseText: { 'siblings': [
                { 'id': '7','name': 'Bo Miao', 'title': 'department engineer', 'relationship': '110' },
                { 'id': '8', 'name': 'Yu Jie', 'title': 'department engineer', 'relationship': '110' },
                { 'id': '9', 'name': 'Yu Li', 'title': 'department engineer', 'relationship': '110' },
                { 'id': '10', 'name': 'Hong Miao', 'title': 'department engineer', 'relationship': '110' },
                { 'id': '11', 'name': 'Yu Wei', 'title': 'department engineer', 'relationship': '110' },
                { 'id': '12', 'name': 'Chun Miao', 'title': 'department engineer', 'relationship': '110' },
                { 'id': '13', 'name': 'Yu Tie', 'title': 'department engineer', 'relationship': '110' }
            ]}
        });

        $.mockjax({
            url: '/orgchart/families/1/',
            contentType: 'application/json',
            responseTime: 1000,
            responseText: {
                'id': '6',
                'name': 'Lao Lao',
                'title': 'general manager',
                'relationship': '001',
                'children': [
                    { 'id': '7','name': 'Bo Miao', 'title': 'department engineer', 'relationship': '110' },
                    { 'id': '8', 'name': 'Yu Jie', 'title': 'department engineer', 'relationship': '110' },
                    { 'id': '9', 'name': 'Yu Li', 'title': 'department engineer', 'relationship': '110' },
                    { 'id': '10', 'name': 'Hong Miao', 'title': 'department engineer', 'relationship': '110' },
                    { 'id': '11', 'name': 'Yu Wei', 'title': 'department engineer', 'relationship': '110' },
                    { 'id': '12', 'name': 'Chun Miao', 'title': 'department engineer', 'relationship': '110' },
                    { 'id': '13', 'name': 'Yu Tie', 'title': 'department engineer', 'relationship': '110' }
                ]}
        });

        var datascource1 = {
            'id': '1',
            'name': 'Su Miao',
            'title': 'department manager',
            'relationship': '111',
            'children': [
                { 'id': '2','name': 'Tie Hua', 'title': 'senior engineer', 'relationship': '112' },
                { 'id': '3','name': 'Hei Hei', 'title': 'senior engineer', 'relationship': '111' }
            ]
        };

        var datascource = ${data};
        console.log(datascource);

        <%--var ajaxURLs = {--%>
            <%--'children': '${pageContext.request.contextPath}/gen/show/children/',--%>
            <%--'parent': '${pageContext.request.contextPath}/gen/show/parent/',--%>
            <%--'siblings': '${pageContext.request.contextPath}/gen/show/siblings/',--%>
            <%--'families': '${pageContext.request.contextPath}/gen/show/siblings/'--%>
        <%--};--%>
        var ajaxURLs = {
            'children': '${pageContext.request.contextPath}/gen/show/children/',
            'parent': '${pageContext.request.contextPath}/gen/show/parent/',
            'siblings': '${pageContext.request.contextPath}/gen/show/siblings/',
            'families': '${pageContext.request.contextPath}/gen/show/siblings/'
        };

        $('#chart-container').orgchart({
            'data' : datascource,
            'ajaxURL': ajaxURLs,
            'nodeContent': 'title',
            'nodeId': 'id'
        });

    });
</script>
</html>
