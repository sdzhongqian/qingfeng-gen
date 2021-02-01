<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../admin/top.jsp"%>


<div class="x-nav">
    <c:if test="${fn:contains(pd.authParam,'add')}">
        <button class="layui-btn layui-btn-sm" onclick="add();"><i class="layui-icon layui-icon-add-1"></i>添加</button>
    </c:if>
    <c:if test="${fn:contains(pd.authParam,'addMore')}">
        <button class="layui-btn layui-btn-sm" onclick="addMore();"><i class="layui-icon layui-icon-add-1"></i>批量添加</button>
    </c:if>
    <c:if test="${fn:contains(pd.authParam,'edit')}">
        <button class="layui-btn layui-btn-normal layui-btn-sm" id="edits"><i class="layui-icon layui-icon-edit"></i>编辑</button>
    </c:if>
    <c:if test="${fn:contains(pd.authParam,'edit')}">
        <button class="layui-btn layui-btn-danger layui-btn-sm" id="dels"><i class="layui-icon layui-icon-delete"></i>删除</button>
    </c:if>
    <c:if test="${fn:contains(pd.authParam,'mould')}">
        <button class="layui-btn layui-btn-sm" onclick="downloadExcel();"><i class="layui-icon layui-icon-add"></i>模板下载</button>
    </c:if>
    <c:if test="${fn:contains(pd.authParam,'import')}">
        <button class="layui-btn layui-btn-sm" onclick="toImport();"><i class="layui-icon layui-icon-add"></i>批量导入</button>
    </c:if>
    <c:if test="${fn:contains(pd.authParam,'auth')}">
        <button class="layui-btn layui-btn-primary layui-btn-sm" id="auths"><i class="layui-icon layui-icon-auz"></i>数据权限</button>
    </c:if>

        <button class="layui-btn layui-btn-primary layui-btn-sm" id="synchUserWxAccount"><i class="layui-icon layui-icon-auz"></i>企业微信账号同步</button>


    <span class="layui-btn layui-btn-sm" id="current_org"></span>
    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right;line-height: 30px"  onclick="clearOrg();" title="清除组织">清除组织</a>
</div>
<div style="float: left; width: 18%; margin-right:15px;" id="leftDiv">
    <ul id="treeDemo" class="ztree"></ul>
    <input type="hidden" name="tree_id" id="tree_id" value="" />
    <input type="hidden" id="tree_name" value="" />
    <input type="hidden" id="tree_level" value="" />
    <input type="hidden" id="tree_cascade" value="" />
    <input type="hidden" name="code" id="code" value="" />
</div>
<div style="float: left; width: 80%" id="rightDiv">
    <div class="admin-main">

        <blockquote id="search" class="layui-elem-quote">
            <label class="layui-form-lab" style="width: auto">登录名称</label>
            <input type="text" name="login_name" id="login_name" style="width: 240px;height: 32px;display: inline" placeholder="请输入登录名称" class="layui-input">
            <label class="layui-form-lab" style="width: auto">用户名称</label>
            <input type="text" name="nickname" id="nickname" style="width: 240px;height: 32px;display: inline" placeholder="请输入用户名称" class="layui-input">
            <a href="javascript:;" class="layui-btn layui-btn-sm" data-type="reload">
                <i class="layui-icon">&#xe615;</i> 搜索
            </a>
        </blockquote>
        <div class="layui-field-box layui-form" style="padding: 0;">
            <table id="LAY_table_user" class="layui-table admin-table" lay-filter="user">
            </table>
        </div>
        <%--<fieldset class="layui-elem-field">

        </fieldset>--%>

    </div>
</div>
<script type="text/html" id="barDemo">
    <c:if test="${fn:contains(pd.authParam,'info')}">
        <a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
    </c:if>
    <c:if test="${fn:contains(pd.authParam,'edit')}">
        <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">编辑</a>
    </c:if>
    <c:if test="${fn:contains(pd.authParam,'del')}">
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </c:if>
    <c:if test="${fn:contains(pd.authParam,'auth')}">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="auth">权限</a>
    </c:if>
</script>
<script type="text/html" id="statusTpl">
    <!-- 这里的 checked 的状态只是演示 -->
    <input type="checkbox" name="status" value="{{d.id}}" lay-skin="switch" lay-text="启用|停用" lay-filter="statusCheck" {{ d.status == 'Y' ? 'checked' : '' }}>
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/ztree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/ztree/js/jquery.ztree.all.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css" />
<%@include file="../organize/organize_ztree.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/layui/layui.js"></script>
<script>

    var table,form;
        layui.use('table', function(){
            table = layui.table;
            form = layui.form;
        //方法级渲染
        table.render({
            elem: '#LAY_table_user'
//            ,toolbar: 'default'
//            ,defaultToolbar: ['filter', 'print', 'exports']
            ,url: '${pageContext.request.contextPath}/system/user/findListPage.do?auth_type=${pd.auth_type}&auth_organize_ids=${pd.auth_organize_ids}'
                ,cols: [[
                {checkbox: true, fixed: true}
                ,{field:'login_name', title: '登录名称',sort: true, fixed: true}
                ,{field:'nickname', title: '用户名称',}
                ,{field:'sex', title: '性别', sort: true}
                ,{field:'status', title: '状态',  templet: '#statusTpl'}
                ,{field:'order_by', title: '排序',width:60}

                ,{field:'qywx_account', title:'同步企业微信账号', width:160, templet: function(res){
                    if(res.qywx_account!=''&&res.qywx_account!=null){
                        return "<span style='color:green;'>已同步</span>";
                    }else{
                        return "<span style='color:red;'>未同步</span>";
                    }
                }}

//                ,{field:'create_time', title: '创建时间'}
                ,{align:'center', title:'操作',width:240, toolbar: '#barDemo'}
            ]]
            ,id: 'table_user'
            ,page: true
           // ,height: 420
        });

        var $ = layui.$, active = {
            reload: function(){
                var login_name = $('#login_name').val();
                var nickname = $('#nickname').val();
                var auth_type = '${pd.auth_type}';
                var auth_organize_ids = '${pd.organize_ids}';
                //执行重载
                table.reload('table_user', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        //key: {
                        auth_type: auth_type,
                        auth_organize_ids: auth_organize_ids,
                        login_name: login_name,
                        nickname: nickname
                        //}
                    }
                });
            }
        };

        $('#search .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        //监听状态操作
        form.on('switch(statusCheck)', function(obj){
            var status='N';
            if(obj.elem.checked){
                status='Y';
            }
            $.get("${pageContext.request.contextPath}/system/user/updateStatus.do?id="+this.value+"&status="+status,null,function(res){
                console.log(res);
                if (res.success) {
                    layer.tips("状态修改成功。");
                }else{
                    if(res.loseSession=='loseSession'){
                        loseSession(res.msg,res.url)
                    }else{
                        layer.msg(res.msg, {time: 2000});
                    }
                }
            },'json');
        });

        $('#edits').on('click',function (){
            var checkStatus = table.checkStatus('table_user')
                    ,data = checkStatus.data;
            if(data.length!=1){
                layer.msg('请选择一条数据进行操作。');
            }else{
                edit(data[0].id)
            }
        })

        $('#dels').on('click',function (){
            var checkStatus = table.checkStatus('table_user')
                    ,data = checkStatus.data;
            if(data.length>0){
                layer.confirm('删除数据会同步删除【用户组织信息、用户权限信息】，真的要删除数据么?', function(index){
                    var ids = [];
                    for ( var i = 0; i <data.length; i++){
                        ids.push(data[i].id);
                    }
                    $.get("${pageContext.request.contextPath}/system/user/del.do?ids="+ids,null,function(res){
                        if (res.success) {
                            layer.msg("数据删除成功。", {time: 2000});
                            location.replace(location.href);
                        }else{
                            if(res.loseSession=='loseSession'){
                                loseSession(res.msg,res.url)
                            }else{
                                layer.msg(res.msg, {time: 2000});
                            }
                        }
                    },'json');
                });
            }else{
                layer.msg('请选择要删除的数据。');
            }
        })


        $('#auths').on('click',function (){
            var checkStatus = table.checkStatus('table_user')
                    ,data = checkStatus.data;
            if(data.length!=1){
                layer.msg('请选择一条数据进行操作。');
            }else{
                auth(data[0].id)
            }
        })


        //监听工具条
        table.on('tool(user)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                info(data.id)
            } else if(obj.event === 'del'){
                layer.confirm('删除数据会同步删除【用户组织信息、用户权限信息】，真的要删除数据么?', function(index){
                    $.get("${pageContext.request.contextPath}/system/user/del.do?ids="+data.id,null,function(res){
                        if (res.success) {
                            layer.msg("数据删除成功。", {time: 2000});
                            location.replace(location.href);
                        }else{
                            if(res.loseSession=='loseSession'){
                                loseSession(res.msg,res.url)
                            }else{
                                layer.msg(res.msg, {time: 2000});
                            }
                        }
                    },'json');
                });
            } else if(obj.event === 'edit'){
                edit(data.id);
            }else if(obj.event === 'auth'){
                auth(data.id);
            }
        });

            //同步企业微信账号
        $('#synchUserWxAccount').on('click',function (){
            var index = layer.load(1);
            $.get("${pageContext.request.contextPath}/system/user/synchUserWxAccount.do?",null,function(res){
                layer.close(index);
                if (res.success) {
                    console.log(res.msg);
                    layer.alert(res.msg);
//                    location.replace(location.href);
                }else{
                    if(res.loseSession=='loseSession'){
                        loseSession(res.msg,res.url)
                    }else{
                        layer.msg(res.msg, {time: 2000});
                    }
                }
            },'json');
        })


    });

    function reloadData(organize_id){
        var auth_type = '${pd.auth_type}';
        var auth_organize_ids = '${pd.organize_ids}';
        var login_name = $('#login_name').val();
        var nickname = $('#nickname').val();
        //执行重载
        table.reload('table_user', {
            page: {
                curr: 1 //重新从第 1 页开始
            }
            ,where: {
                auth_type: auth_type,
                auth_organize_ids: auth_organize_ids,
                login_name: login_name,
                nickname: nickname,
                organize_id: organize_id
            }
        });
    }


    function add(){
        var organize_id =  $("#tree_id").val();
        var organize_name = $("#tree_name").val();
        if(organize_id==''||organize_id==null){
            layer.msg("请在左侧选择组织。");
        }else{
            parent.layer.open({
                id:'user_add',
                //skin: 'layui-layer-molv',
                title: '添加',
                maxmin: true,
                type: 2,
                content: '${pageContext.request.contextPath}/system/user/toAdd.do?organize_id='+organize_id+'&organize_name='+organize_name,
                area: ['800px', '500px'],
                end: function () {
                    location.reload();
                }
            });
        }
    }

    function addMore(){
        var organize_id =  $("#tree_id").val();
        var organize_name = $("#tree_name").val();
        if(organize_id==''||organize_id==null){
            layer.msg("请在左侧选择组织。");
        }else{
            parent.layer.open({
                id: 'addMore',
                //skin: 'layui-layer-molv',
                title: '添加',
                maxmin: true,
                type: 2,
                content: '${pageContext.request.contextPath}/system/user/toAddMore.do?organize_id='+organize_id+'&organize_name='+organize_name,
                area: ['1000px', '500px'],
                end: function () {
                    location.reload();
                }
            });
        }
    }


    function edit(id){
        parent.layer.open({
            id:'user_edit',
            //skin: 'layui-layer-molv',
            title: '编辑',
            maxmin: true,
            type: 2,
            content: '${pageContext.request.contextPath}/system/user/toUpdate.do?id='+id,
            area: ['800px', '500px'],
            end: function () {
                location.reload();
            }
        });
    }

    function info(id){
        parent.layer.open({
            //skin: 'layui-layer-molv',
            title: '详情',
            maxmin: true,
            type: 2,
            content: '${pageContext.request.contextPath}/system/user/findInfo.do?id='+id,
            area: ['800px', '500px']
        });
    }

    function clearOrg(){
        $("#tree_id").val("");
        $("#tree_name").val("");
        $("#tree_level").val("");
        $("#tree_cascade").val("");
        $("#code").val("");

        $("#current_org").html("当前组织：无");
        reloadData('')
    }


    function auth(id){
        parent.layer.open({
            id: 'user_auth',
            //skin: 'layui-layer-molv',
            title: '授权',
            maxmin: true,
            type: 2,
            content: '${pageContext.request.contextPath}/system/user/toAuth.do?user_id='+id,
            area: ['800px', '500px'],
            end: function () {
                //location.reload();
            }
        });
    }

    function toImport(){
        var organize_name = $("#tree_name").val();
        var organize_id =  $("#tree_id").val();
        if(organize_id==''||organize_id==null){
            layer.msg("请在左侧选择组织。");
        }else{
            parent.layer.open({
                //id: 'toimport',
                //skin: 'layui-layer-molv',
                title: '批量导入',
                maxmin: true,
                type: 2,
                content: '${pageContext.request.contextPath}/system/user/toImport.do?organize_id='+organize_id+'&organize_name='+organize_name,
                area: ['500px', '300px'],
                end: function () {
                    location.reload();
                }
            });
        }
    }

    function downloadExcel(){
        window.location.href="${pageContext.request.contextPath}/system/user/downloadExcel.do";
    }

</script>

<%@include file="../admin/bottom.jsp"%>