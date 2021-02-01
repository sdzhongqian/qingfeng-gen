<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>首页</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/mobile/js/jquery-1.8.3.min.js" ></script>
    <script type="text/javascript">
        $(document).ready(function(){
            // 初始化内容
            window.location.href="${pageContext.request.contextPath}/main.do"
        });


        var myLeftUrl = "/aa/dd/fff.do";
        var a = myLeftUrl.substring(0,myLeftUrl.lastIndexOf("/"))+"show_"+myLeftUrl.substring(myLeftUrl.lastIndexOf("/")+1)


    </script>
</head>
<body>

</body>
</html>
