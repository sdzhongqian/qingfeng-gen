<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../admin/top.jsp"%>

<form class="layui-form" action="${pageContext.request.contextPath}/system/user/save.do" id="form">
    <div>
        <blockquote id="search" class="layui-elem-quote" style="position: relative;">
            <div class="layui-form-item" style="margin-bottom: 0;">
                <div class="layui-inline">
                    <label class="layui-form-lab" style="width: auto">登录名称</label>
                    <input type="text" name="login_name" id="login_name" style="width: 238px;height: 32px;display: inline" placeholder="请输入登录名称" class="layui-input">
                        </div>
                        <div class="layui-inline">
                    <label class="layui-form-lab" style="width: auto">用户名称</label>
                    <input type="text" name="nickname" id="nickname" style="width: 238px;height: 32px;display: inline" placeholder="请输入用户名称" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-bottom: 0;">
                <div class="layui-inline">
                <label class="layui-form-lab" style="width: auto">组织名称</label>
                <input type="text" name="login_name" id="organize_name" style="width: 238px;height: 32px;display: inline" placeholder="请输入组织名称" class="layui-input">
                            </div>
                            <div class="layui-inline">
                <label class="layui-form-lab" style="width: auto">手机号码</label>
                <input type="text" name="login_name" id="phone" style="width: 238px;height: 32px;display: inline" placeholder="请输入手机号码" class="layui-input">
                            </div>
            </div>
            <div class="layui-form-item" style="position: absolute;right:15px;bottom:6px;">
            <a href="javascript:;" class="layui-btn layui-btn-sm"  onclick="searchUser();">
                <i class="layui-icon">&#xe615;</i>
            </a>
            <a href="javascript:;" class="layui-btn layui-btn-sm"  onclick="clearSearch();">
                <i class="layui-icon">&#xe639;</i>
            </a>
            </div>
        </blockquote>

    </div>
    <div align="center">
        <div style="float: left;width: 30%;height: 320px;padding-left: 10px;background-color: #eee;">
            <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                <ul class="layui-tab-title">
                    <li class="layui-this">组织</li>
                </ul>
                <div class="layui-tab-content" style="height: 100px;">
                    <div class="layui-tab-item layui-show">
                        <ul id="treeDemo" class="ztree"></ul>
                        <input type="hidden" name="tree_id" id="tree_id" value="" />
                        <input type="hidden" id="tree_name" value="" />
                        <input type="hidden" id="tree_level" value="" />
                        <input type="hidden" id="tree_cascade" value="" />
                        <input type="hidden" name="code" id="code" value="" />
                    </div>
                </div>
            </div>
        </div>
        <div style="float: left;width: 68%;height: 320px;">
            <div style="height: 30px;line-height: 30px;" align="left">
                全部组织
            </div>
            <div style="border: 1px solid grey;height: 198px;border-radius:8px 8px 8px 8px;">
                <div align="center" class="label-title">
                    选择用户【全选】
                    <input type="checkbox" id="checkAllUser" onclick="checkAll()" style="display: inline-block">
                </div>
                <ul id="listUser">
                </ul>
            </div>
            <div id="label_user" style="height: 88px;border: 1px solid grey;margin-top: 2px;border-radius:8px 8px 8px 8px;" align="left">
                <%--<span class="tag label label-info">张震<a class="label-a" onclick="delUser();"><i class="layui-icon layui-icon-close label-icon"></i></a></span>--%>
            </div>
        </div>
        <div style="clear: both"></div>
    </div>
    <div align="center" style="padding-top: 10px;">
        <button type="button" class="layui-btn layui-btn-sm" onclick="define()">确定</button>
        <button type="button" class="layui-btn layui-btn-danger layui-btn-sm" id="cancel">取消</button>
    </div>
</form>

<div id="menuContent" class="menuContent" style="display:none; position: absolute; background-color: #eaeaea; height: 300px;width:180px; ">
    <ul id="selectOrgZtree" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/ztree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/ztree/js/jquery.ztree.all.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css" />
<%@include file="../organize/organize_ztree.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/commonLayer.js"></script>
<script>
    layui.use('element', function(){
        var $ = layui.jquery
                ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

        $('#cancel').on('click',function (){
            defineUser(ids,names);
            var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
            parent.layer.close(index);
        })
    });

    $(document).keyup(function(event){
        if(event.keyCode ==13){
            searchUser();
        }
    });

    var param_ids = '${pd.ids}';
    var param_names = '${pd.names}'
    $(document).ready(function(){
        ids = param_ids.split(',');
        names = param_names.split(',');
        var tt = '';
        for(var i=0; i< ids.length; i++){
            if(ids[i]!=''&&ids[i]!=null){
                tt += '<span id="span_'+ids[i]+'" class="tag label label-info">'+ names[i]+'<a class="label-a" onclick="delUser(\''+ids[i]+'\',\''+names[i]+'\');"><i class="layui-icon layui-icon-close label-icon"></i></a></span>';
                $("#user_"+ids[i]).attr("checked",true);
            }
        }
        $("#label_user").html(tt);
    });


    function reloadData(id){
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/system/user/findList.do?organize_id="+id,
            dataType: "json",
            success: function (res) {
                if(res.success){
                    var tt ='';
                    $.each(res.data,function(i,n){
                        tt+='<li class="label-li"><input type="checkbox" id="user_'+ n.id+'" name="user" value="'+n.id+'" onclick="checkUser(\''+ n.id+'\',\''+ n.nickname+'\')" style="display: inline-block" title="'+n.nickname+'">'+n.nickname+'</li>';
                    });
                    $("#listUser").html(tt);
                    for(var i=0; i< ids.length; i++) {
                        if (ids[i] != '' && ids[i] != null) {
                            $("#user_" + ids[i]).attr("checked", true);
                        }
                    }
                }else{
                    if(res.loseSession=='loseSession'){
                        loseSession(res.msg,res.url)
                    }else{
                        layer.msg(res.msg, {time: 2000});
                    }
                }
            },
            error: function(data) {
            }
        });
    }

    function searchUser(){
        var login_name = $("#login_name").val();
        var nickname = $("#nickname").val();
        var organize_name = $("#organize_name").val();
        var phone = $("#phone").val();
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/system/user/findList.do?login_name="+login_name+"&nickname="+nickname+"&organize_name="+organize_name+"&phone="+phone,
            dataType: "json",
            success: function (res) {
                if(res.success){
                    var tt ='';
                    $.each(res.data,function(i,n){
                        tt+='<li class="label-li"><input type="checkbox" id="user_'+ n.id+'" name="user" value="'+n.id+'" onclick="checkUser(\''+ n.id+'\',\''+ n.nickname+'\')" style="display: inline-block" title="'+n.nickname+'">'+n.nickname+'</li>';
                    });
                    $("#listUser").html(tt);
                    for(var i=0; i< ids.length; i++) {
                        if (ids[i] != '' && ids[i] != null) {
                            $("#user_" + ids[i]).attr("checked", true);
                        }
                    }
                }else{
                    if(res.loseSession=='loseSession'){
                        loseSession(res.msg,res.url)
                    }else{
                        layer.msg(res.msg, {time: 2000});
                    }
                }
            },
            error: function(data) {
            }
        });
    }

    var ids = [];
    var names = [];
    function checkUser(id,name){
        var is_check = $("input[id='user_"+id+"']").is(':checked');
        if(is_check){
            ids.push(id);
            names.push(name);
            var tt = '<span id="span_'+id+'" class="tag label label-info">'+ name+'<a class="label-a" onclick="delUser(\''+id+'\',\''+name+'\');"><i class="layui-icon layui-icon-close label-icon"></i></a></span>';
            $("#label_user").append(tt);
        }else{
            delUser(id,name);
        }
    }

    function delUser(id,name){
        ids.remove(id);
        names.remove(name);
        $("#span_"+id).remove();
        $("#user_"+id).removeAttr('checked');
    }


    function define(){
        defineUser(ids,names);
        var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
        parent.layer.close(index);
    }

    function checkAll(){
        var c = $("#checkAllUser").prop("checked");
        if(c){
            $("input:checkbox[id^='user_']").each(function(){
                $(this).prop("checked",true);
                checkUser($(this).val(),$(this).attr("title"))
            });
        }else{
            $("input:checkbox[id^='user_']").each(function(){
                $(this).prop("checked",false);
                checkUser($(this).val(),$(this).attr("title"))
            });
        }
    }

    function clearSearch(){
        $("#login_name").val("");
        $("#nickname").val("");
        $("#organize_name").val("");
        $("#phone").val("");
    }
</script>

<%@include file="../admin/bottom.jsp"%>