<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>后台系统登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/index.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/layui/layui.js" charset="utf-8"></script>
</head>
<body class="login-bg">
<canvas id="fullstarbg">你的浏览器不支持canvas标签</canvas>
<div class="login">
    <div class="login_head" align="center"><img src="${pageContext.request.contextPath}/resources/images/bghead.png"> </div>
    <%--<div class="message">后台系统登录</div>--%>
    <div id="darkbannerwrap"></div>
    <form method="post" action="${pageContext.request.contextPath}/system/login/login.do" class="layui-form" >
        <input name="login_name" placeholder="用户名"  type="text" lay-verify="required" class="layui-input" >
        <hr class="hr15">
        <input name="login_password" lay-verify="required" placeholder="密码"  type="password" class="layui-input">
        <hr class="hr15">
        <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
        <hr class="hr20" >
        <div align="center" style="color: red;">${errMsg}</div>
    </form>
</div>
<script>
    layui.use(['form'],
            function() {
                $ = layui.jquery;
                var form = layui.form(),
                        layer = layui.layer;

                //监听提交
                form.on('submit(login)',
                        function(data) {
                            console.log(data);
                            layer.alert(JSON.stringify(data.field), {
                                title: '最终的提交信息'
                            },function  () {
                                location.href = "${pageContext.request.contextPath}/system/login/login.do";
                            })
                            return false;
                        });

            });

    //回车事件
    document.onkeydown = function (event) {
        var e = event || window.event;
        if (e && e.keyCode == 13) { //回车键的键值为13
            login(); //调用登录按钮的登录事件
        }
    };

    function login(){
        $("#form").submit();
    }

</script>


<!-- 底部结束 -->

</body>
</html>