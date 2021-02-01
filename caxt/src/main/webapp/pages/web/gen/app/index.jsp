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
                    <h1>家谱检索</h1>
                </div>
                <div class="aui-arrow">
                    <a href="tree.html" style="color: #fff;font-size: 14px;">查看家谱树</a>
                </div>
            </div>
            <div class="aui-flex">
                <div class="aui-flex-box">
                    <select class="aui-color-div" id="generation_id" name="generation_id">
                        <option value="">请选择世代</option>
                        <c:forEach items="${list}" var="var" varStatus="status">
                            <option value="${var.id}" <c:if test="${pd.generation_id==var.id}"> selected </c:if>>${var.name}</option>
                        </c:forEach>
                    </select>
                    <input type="text" id="name" name="name" value="${pd.name}" placeholder="请输入名称" class="aui-color-div">
                    <a onclick="mySearch();" style="cursor: pointer"><i class="icon icon-search"></i></a>
                </div>
            </div>
        </div>
        <div class="aui-link-list">
            <ul id="ul" class="list" style="text-align: center">
                <li id="last_li" style="margin: 0 auto;width: 100%;">
                    <a style="cursor: pointer" onclick="findList();">
                        加载更多
                    </a>
                </li>
            </ul>
        </div>
        <div style="height:53px;"></div>
    </section>
    <footer class="aui-footer aui-footer-fixed">
        <a href="content.html" class="aui-tabBar-item">
            <span class="aui-tabBar-item-text">首页</span>
        </a>
        <a href="tree.html" class="aui-tabBar-item">
            <span class="aui-tabBar-item-text">家谱树</span>
        </a>
        <a href="index.html" class="aui-tabBar-item  aui-tabBar-item-active">
            <span class="aui-tabBar-item-text">检索</span>
        </a>

        <%--<a href="index.html" class="aui-tabBar-item aui-tabBar-item-active">--%>
            <%--<span class="aui-tabBar-item-text">首页</span>--%>
        <%--</a>--%>
        <%--<a href="tree.html" class="aui-tabBar-item">--%>
            <%--<span class="aui-tabBar-item-text">家谱树</span>--%>
        <%--</a>--%>
        <%--<a href="content.html" class="aui-tabBar-item">--%>
            <%--<span class="aui-tabBar-item-text">我的</span>--%>
        <%--</a>--%>
    </footer>
</section>

</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/orgchart/js/jquery.min.js"></script>
<script type="text/javascript">
    var index = 0;
    $(document).ready(function(){
        findList();
    });

    function mySearch(){
        index=0;
        findList();
    }

    function findList(){
        index++
        var generation_id = $("#generation_id option:selected").val();
        var name = $("#name").val();
        $.ajax({
            type: "GET",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "${pageContext.request.contextPath}/gen/app/findListPage.html?index="+index+"&generation_id="+generation_id+"&name="+name,//url
            data: "",
            success: function (res) {
                console.log(res);
                var tt = '';
                if(res.data.length==0){
                    if(index==1){
                        $("#ul").html("<img style='width: 100%;height: 320px' src='${pageContext.request.contextPath}/resources/plugins/app/images/none.png'>");
                    }else{
                        $("#last_li").html("数据加载完毕");
                    }
                }else{
                    $.each(res.data,function(i,n){
                        tt += '<li><a style="cursor: pointer" onclick="findInfo(\''+n.id+'\');">';
                        tt += '<i class="fl"></i>';
                        tt += '<span class="fl" style="font-size: 1.1rem;">'+ n.name+'</span>';
                        if(n.title.length<=5){
                            tt += '<em class="fl">'+ n.title+'</em>';
                        }else{
                            tt += '<em class="fl">'+ n.title.substring(0,5)+'...</em>';
                        }
//                    tt += '<em class="fl">父亲：'+ n.father_name+'</em>';
                        tt += '<div class="aui-arrow1" style="color: #00ad71">点我</div></a></li>';
                    });
                    if(index==1){
                        tt+='<li id="last_li" style="margin: 0 auto;"><a style="cursor: pointer" onclick="findList();">加载更多</a></li>';
                        $("#ul").html(tt);
                    }else{
                        $("#last_li").before(tt);
                    }
                }
            },
            error : function(XMLHttpRequest, textStatus, errorThrown) {
                console.log("异常！"+XMLHttpRequest+":"+textStatus+":"+errorThrown);
            }
        });
    }


    function findInfo(id){
        window.location.href="${pageContext.request.contextPath}/gen/app/info.html?id="+id;
    }

</script>
</html>
