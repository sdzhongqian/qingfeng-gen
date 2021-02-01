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
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/orgchart/css/font-awesome.min.css">--%>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/orgchart/css/jquery.orgchart.css">--%>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/orgchart/css/style.css">--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/layui/css/layui.css" media="all" />

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.orgchart.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">

</head>
<body>
    <div class="x-nav">
        <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right;margin-left: 10px;"  href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
        <a class="layui-btn layui-btn-sm" style="margin-top:3px;float:right;margin-left: 10px;"  onclick="reloadData();" title="重新生成">重新生成</a>
        <a class="layui-btn layui-btn-normal layui-btn-sm" style="margin-top:3px;float:right;margin-left: 10px;" onclick="importImg()">导出图片</a>
    </div>
    <div id="chart-container"></div>
</body>

<%--<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/orgchart/js/jquery.min.js"></script>--%>

<%--<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/orgchart/js/jquery.mockjax.min.js"></script>--%>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/orgchart/js/jquery.orgchart.js"></script>--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.mockjax.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.orgchart.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/html2canvas.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jspdf.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/layer/layer.js"></script>

<script type="application/javascript">

    function importImg() {
        html2canvas($(".orgchart")[0]).then(function (canvas) {
            document.body.appendChild(canvas);
            canvas.id = "mycanvas";
            var img = convertCanvasToImage(canvas);
            //调用下载方法 封装的下载方法，都在资源里面
            if (browserIsIe()) {  //假如是ie浏览器
                DownLoadReportIMG('安氏家谱.png', img.src);
            } else {
                downloadImage(img.src)  //下载图片
            }
        });

        $("#mycanvas").attr("style","display:none;");
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
        console.log("SRC:"+src);
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

        <%--var ajaxURLs = {--%>
            <%--'children': '${pageContext.request.contextPath}/gen/show/children/',--%>
            <%--'parent': '${pageContext.request.contextPath}/orgchart/parent/',--%>
            <%--'siblings': '${pageContext.request.contextPath}/orgchart/siblings/',--%>
            <%--'families': '${pageContext.request.contextPath}/orgchart/families/'--%>
        <%--};--%>

        var datascource = ${mpd};
//        $('#chart-container').orgchart({
//            'data' : datascource,
////            'depth': 5,
//            'nodeContent': 'title'
//        });
        $('#chart-container').orgchart({
            'data' : datascource,
//            'visibleLevel': 2,
            'nodeContent': 'title',
            'exportButton': true,
            'zoom':true,
            'zoominLimit':7,
            'zoomoutLimit':0.5,
            'exportFilename':'安氏家谱',
//            'exportFileextension': 'pdf',
            'exportFilename': 'MyOrgChart'
        });


        <%--$('#chart-container').orgchart({--%>
            <%--'data' : '${pageContext.request.contextPath}/gen/show/findTreeAllJson',--%>
            <%--'depth': 3,--%>
            <%--'nodeContent': 'title'--%>
        <%--});--%>

    });

    function reloadData(){
        layer.confirm('确定要重新生成吗？因数据太大需要更多的时间！', function(index){
            var index = layer.load(1, {
                shade: [0.1,'#000'] //0.1透明度的白色背景
            });
            $.ajax({
                type: "GET",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/gen/show/reloadData.do",//url
                data: "",
                success: function (res) {
                    layer.closeAll();
                    window.location.reload();
                },
                error : function(XMLHttpRequest, textStatus, errorThrown) {
                    console.log("异常！"+XMLHttpRequest+":"+textStatus+":"+errorThrown);
                }
            });
        });
    }

</script>
</html>
