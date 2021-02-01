<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 青锋
  Date: 2018-8-16
  Time: 13:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <title>首页</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <meta name="copyright" content="" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css" media="all">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
    <style>
        ::-webkit-scrollbar {
            width: 2px;
            height: 2px;
        }
        ::-webkit-scrollbar-button,
        ::-webkit-scrollbar-button:vertical {
            display: none;
        }
        ::-webkit-scrollbar-track,
        ::-webkit-scrollbar-track:vertical {
            background-color: black;
        }
        ::-webkit-scrollbar-track-piece {
            background-color: #f5f5f5;
        }
        ::-webkit-scrollbar-thumb,
        ::-webkit-scrollbar-thumb:vertical {
            margin-right: 10px;
            background-color: #a6a6a6;
        }
        ::-webkit-scrollbar-thumb:hover,
        ::-webkit-scrollbar-thumb:vertical:hover {
            background-color: #aaa;
        }
        ::-webkit-scrollbar-corner,
        ::-webkit-scrollbar-corner:vertical {
            background-color: #535353;
        }
    </style>
</head>

<body>
<div class="layui-layout layui-layout-admin" style="border-bottom: solid 5px #1aa094;">
    <div class="layui-header header header-demo">
        <div class="layui-main">
            <div class="admin-login-box">
                <a class="logo" style="left: 0;" href="#">
                    <span style="font-size: 22px;">系统管理</span>
                </a>
                <div class="admin-side-toggle">
                    <i class="fa fa-bars" aria-hidden="true"></i>
                </div>
                <div class="admin-side-full">
                    <i class="fa fa-life-bouy" aria-hidden="true"></i>
                </div>
            </div>
            <ul class="layui-nav layui-layout-left layui-ygyd-menu" style="position:absolute; left:280px;">
                <c:forEach items="${ls}" var="var" varStatus="status">
                    <c:if test="${pd.parent_id==''}">
                        <c:if test="${status.index==0}">
                            <li class="layui-nav-item layui-this"><a style="cursor: pointer" onclick="selectMenu('${var.id}');">${var.title}</a></li>
                        </c:if>
                        <c:if test="${status.index!=0}">
                            <li class="layui-nav-item"><a style="cursor: pointer" onclick="selectMenu('${var.id}');">${var.title}</a></li>
                        </c:if>
                    </c:if>
                    <c:if test="${pd.parent_id!=''}">
                        <c:if test="${pd.parent_id==var.id}">
                            <li class="layui-nav-item layui-this"><a style="cursor: pointer" onclick="selectMenu('${var.id}');">${var.title}</a></li>
                        </c:if>
                        <c:if test="${pd.parent_id!=var.id}">
                            <li class="layui-nav-item"><a style="cursor: pointer" onclick="selectMenu('${var.id}');">${var.title}</a></li>
                        </c:if>
                    </c:if>
                </c:forEach>

                <%--<li class="layui-nav-item">--%>
                    <%--<a href="javascript:;">系统管理</a>--%>
                    <%--<dl class="layui-nav-child">--%>
                        <%--<dd><a href="">角色管理</a></dd>--%>
                        <%--<dd><a href="">权限设置</a></dd>--%>
                        <%--<dd><a href="">日志管理</a></dd>--%>
                    <%--</dl>--%>
                <%--</li>--%>
            </ul>
            <ul class="layui-nav admin-header-item">
                <%--<li class="layui-nav-item">--%>
                    <%--<a href="javascript:;">待办消息</a>--%>
                    <%--<dl class="layui-nav-child">--%>
                        <%--<dd>--%>
                            <%--<a onclick="openDbTask();" style="cursor: pointer;"><i class="layui-icon layui-icon-notice"></i>待办任务<span style="color: red;">(${pd.db_num})</span></a>--%>
                        <%--</dd>--%>
                    <%--</dl>--%>
                <%--</li>--%>
                <%--<li class="layui-nav-item">--%>
                    <%--<a href="javascript:;">浏览网站</a>--%>
                <%--</li>--%>
                <%--<li class="layui-nav-item" id="video1">--%>
                    <%--<a href="javascript:;">视频</a>--%>
                <%--</li>--%>
                <li class="layui-nav-item">
                    <a href="javascript:;" class="admin-header-user">
                        <c:if test="${loginUser.head_address==''||loginUser.head_address==null}">
                            <img src="${pageContext.request.contextPath}/resources/images/0.jpg" />
                        </c:if>
                        <c:if test="${loginUser.head_address!=''&&loginUser.head_address!=null}">
                            <img src="${pageContext.request.contextPath}/${loginUser.head_address}" />
                        </c:if>
                        <span>${loginUser.nickname}</span>
                    </a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:showUserInfo();"><i class="fa fa-user-circle" aria-hidden="true"></i> 个人信息</a>
                        </dd>
                        <dd>
                            <a href="javascript:;" onclick="selectMenu1(1,2,3,4)"><i class="fa fa-gear" aria-hidden="true"></i> 设置</a>
                        </dd>
                        <dd id="lock">
                            <a href="javascript:;">
                                <i class="fa fa-lock" aria-hidden="true" style="padding-right: 3px;padding-left: 1px;"></i> 锁屏 (Alt+L)
                            </a>
                        </dd>
                        <dd>
                            <a href="${pageContext.request.contextPath}/system/login/login.do"><i class="fa fa-sign-out" aria-hidden="true"></i> 注销</a>
                        </dd>
                    </dl>
                </li>
            </ul>
            <ul class="layui-nav admin-header-item-mobile">
                <li class="layui-nav-item">
                    <a href="login.html"><i class="fa fa-sign-out" aria-hidden="true"></i> 注销</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="layui-side layui-bg-black" id="admin-side">
        <div class="layui-side-scroll" id="admin-navbar-side" lay-filter="side">

        </div>
    </div>
    <div class="layui-body" style="bottom: 0;border-left: solid 2px #1AA094;" id="admin-body">
        <div class="layui-tab admin-nav-card layui-tab-brief" lay-filter="admin-tab">
            <ul class="layui-tab-title">
                <li class="layui-this">
                    <i class="fa fa-dashboard" aria-hidden="true"></i>
                    <cite>控制面板</cite>
                </li>
            </ul>
            <div class="layui-tab-content" style="min-height: 150px; padding: 5px 0 0 0;">
                <div class="layui-tab-item layui-show">
                    <iframe id="mainFrame" src="${pageContext.request.contextPath}/pages/web/system/admin/index.jsp"  scrolling="yes"></iframe>
                </div>
            </div>
        </div>
    </div>
    <div class="layui-footer footer footer-demo" id="admin-footer">
        <div class="layui-main">
            <p>2017 &copy;
                <a href="#">官网</a>
            </p>
        </div>
    </div>
    <div class="site-tree-mobile layui-hide">
        <i class="layui-icon">&#xe602;</i>
    </div>
    <div class="site-mobile-shade"></div>

    <!--锁屏模板 start-->
    <script type="text/template" id="lock-temp">
        <div class="admin-header-lock" id="lock-box">
            <div class="admin-header-lock-img">
                <img src="${pageContext.request.contextPath}/resources/images/0.jpg"/>
            </div>
            <div class="admin-header-lock-name" id="lockUserName">beginner</div>
            <input type="text" class="admin-header-lock-input" value="输入密码解锁.." name="lockPwd" id="lockPwd" />
            <button class="layui-btn layui-btn-small" id="unlock">解锁</button>
        </div>
    </script>
    <!--锁屏模板 end -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/index.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/ifram.js"></script>
    <script>

        var element,$;
        layui.use('element', function(){
            $ = layui.jquery;
            element = layui.element;
        });


        function openDbTask(){
            $("#mainFrame").attr("src","${pageContext.request.contextPath}/process/bus/index.do?status=1");
        }

        function selectMenu(id){
            window.location.href="${pageContext.request.contextPath}/main.do?parent_id="+id;
        }

        var navs = ${menu_data};
//        console.log(navs);


        <%--function selectMenu(id){--%>
            <%--$.ajax({--%>
                <%--type: "POST",//方法类型--%>
                <%--dataType: "json",//预期服务器返回的数据类型--%>
                <%--url: "${pageContext.request.contextPath}/findMenu.do?parent_id="+id ,//url--%>
                <%--data: "",--%>
                <%--success: function (res) {--%>
                    <%--if (res.success) {--%>
                        <%--navs = res.data;--%>
                        <%--console.log(res.data);--%>

                    <%--}else{--%>
                        <%--if(res.loseSession=='loseSession'){--%>
                            <%--loseSession(res.msg,res.url)--%>
                        <%--}else{--%>
                            <%--layer.msg(res.msg, {time: 2000});--%>
                        <%--}--%>
                    <%--}--%>
                <%--},--%>
                <%--error : function() {--%>
                    <%--layer.msg("异常！");--%>
                <%--}--%>
            <%--});--%>
        <%--}--%>


//        console.log(navs);

//        var navs = [{
//            "title": "系统管理",
//            "icon": "fa-cubes",
//            "spread": true,
//            "children": [{
//                "title": "用户信息",
//                "icon": "&#xe641;",
//                "href": "/system/user/index.do"
//            },{
//                "title": "角色信息",
//                "icon": "&#xe641;",
//                "href": "/system/role/index.do"
//            }, {
//                "title": "组织管理",
//                "icon": "&#xe63c;",
//                "href": "/system/organize/index.do"
//            }, {
//                "title": "字典信息",
//                "icon": "&#xe63c;",
//                "href": "/system/dictionary/index.do"
//            }, {
//                "title": "菜单信息",
//                "icon": "&#xe60c;",
//                "href": "/system/menu/index.do"
//            }]
//        }, {
//            "title": "这是一级导航",
//            "icon": "fa-stop-circle",
//            "href": "https://www.baidu.com",
//        }, {
//            "title": "其他",
//            "icon": "fa-stop-circle",
//            "href": "#",
//            "children": [{
//                "title": "子窗体中打开选项卡",
//                "icon": "fa-github",
//                "href": "pages/web/system/admin/cop.jsp"
//            }]
//        }];

            startInit('mainFrame', 500);

        layui.use('layer', function() {
            var $ = layui.jquery,
                    layer = layui.layer;

            $('#video1').on('click', function() {
                layer.open({
                    title: '视频播放',
                    maxmin: true,
                    type: 2,
                    content: '${pageContext.request.contextPath}/pages/web/system/admin/video.jsp',
                    area: ['800px', '500px']
                });
            });

        });
        /*主界面中的个人信息*/
        function showUserInfo() {
            parent.layer.open({
                id:'login_user',
                //skin: 'layui-layer-molv',
                title: '个人信息',
                maxmin: true,
                type: 2,
                content: '${pageContext.request.contextPath}/system/user/toEdit.do?id=${loginUser.id}',
                area: ['800px', '500px']
            });
        }



        function addTabMenu(id,title,href,icon){
            //window.location.href = href;
            var content = '<iframe id="id_'+id+'" src="' + href + '" data-id="' + id + '"></iframe>';
            var tit = "";
            if(icon !== undefined) {
                if(icon.indexOf('fa-') !== -1) {
                    tit += '<i class="fa ' + icon + '" aria-hidden="true"></i>';
                } else {
                    tit += '<i class="layui-icon">' + icon + '</i>';
                }
            }
            tit += '<cite>' + title + '</cite>';
            tit += '<i class="layui-icon layui-unselect layui-tab-close" onclick="delTabMenu('+id+')" data-id="' + id + '">&#x1006;</i>';
            element.tabAdd("admin-tab", {
                title: tit,
                content: content,
                id:id
            });
            var height = parseInt($(".layui-tab-content").get(0).offsetHeight);
            $("#id_"+id).height(height);
            element.tabChange("admin-tab", id);
        }

        function delTabMenu(id){
            element.tabDelete('admin-tab', id);
        }

    </script>
</div>

</body>

</html>