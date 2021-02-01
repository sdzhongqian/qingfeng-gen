<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../admin/top.jsp"%>


<div class="x-nav">
    <c:if test="${fn:contains(pd.authParam,'add')}">
        <button class="layui-btn layui-btn-sm" onclick="add();"><i class="layui-icon layui-icon-add-1"></i>添加</button>
    </c:if>
    <c:if test="${fn:contains(pd.authParam,'edit')}">
        <button class="layui-btn layui-btn-normal layui-btn-sm" id="edits"><i class="layui-icon layui-icon-edit"></i>编辑</button>
    </c:if>
    <c:if test="${fn:contains(pd.authParam,'del')}">
        <button class="layui-btn layui-btn-danger layui-btn-sm" id="dels"><i class="layui-icon layui-icon-delete"></i>删除</button>
    </c:if>
    <c:if test="${fn:contains(pd.authParam,'auth')}">
        <button class="layui-btn layui-btn-primary layui-btn-sm" id="auths"><i class="layui-icon layui-icon-auz"></i>权限分配</button>
    </c:if>

    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
<div class="admin-main">

    <blockquote id="search" class="layui-elem-quote">
        <label class="layui-form-lab" style="width: auto">角色名称</label>
        <input type="text" name="name" id="name" style="width: 240px;height: 32px;display: inline" placeholder="请输入角色名称" class="layui-input">
        <label class="layui-form-lab" style="width: auto">角色简称</label>
        <input type="text" name="short_name" id="short_name" style="width: 240px;height: 32px;display: inline" placeholder="请输入角色简称" class="layui-input">
        <a href="javascript:;" class="layui-btn layui-btn-sm" data-type="reload">
            <i class="layui-icon">&#xe615;</i> 搜索
        </a>
    </blockquote>
    <div class="layui-field-box layui-form" style="padding: 0;">
        <table id="LAY_table_role" class="layui-table admin-table" lay-filter="role">
        </table>
    </div>
    <%--<fieldset class="layui-elem-field">

    </fieldset>--%>

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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/layui/layui.js"></script>
<script>

    layui.use('table', function(){
        var table = layui.table,
            form = layui.form;
        //方法级渲染
        table.render({
            elem: '#LAY_table_role'
            ,url: '${pageContext.request.contextPath}/system/role/findListPage.do?auth_type=${pd.auth_type}&auth_organize_ids=${pd.auth_organize_ids}'
                ,cols: [[
                {checkbox: true, fixed: true}
                ,{field:'name', title: '角色名称', width:240, sort: true, fixed: true}
                ,{field:'short_name', title: '角色简称', width:240}
                ,{field:'order_by', title: '排序'}
                ,{field:'create_time', title: '创建时间'}
                ,{align:'center', title:'操作',width:250, toolbar: '#barDemo'}
            ]]
            ,id: 'table_role'
            ,page: true
           // ,height: 420
        });

        var $ = layui.$, active = {
            reload: function(){
                var auth_type = '${pd.auth_type}';
                var auth_organize_ids = '${pd.organize_ids}';
                var name = $('#name').val();
                var short_name = $('#short_name').val();
                //执行重载
                table.reload('table_role', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        auth_type: auth_type,
                        auth_organize_ids: auth_organize_ids,
                        name: name,
                        short_name: short_name
                    }
                });
            }
        };

        $('#search .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });


        $('#edits').on('click',function (){
            var checkStatus = table.checkStatus('table_role')
                    ,data = checkStatus.data;
            if(data.length!=1){
                layer.msg('请选择一条数据进行操作。');
            }else{
                edit(data[0].id)
            }
        })

        $('#dels').on('click',function (){
            var checkStatus = table.checkStatus('table_role')
                    ,data = checkStatus.data;
            if(data.length>0){
                layer.confirm('真的要删除数据么', function(index){
                    var ids = [];
                    for ( var i = 0; i <data.length; i++){
                        ids.push(data[i].id);
                    }
                    $.get("${pageContext.request.contextPath}/system/role/del.do?ids="+ids,null,function(res){
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
            var checkStatus = table.checkStatus('table_role')
                    ,data = checkStatus.data;
            if(data.length!=1){
                layer.msg('请选择一条数据进行操作。');
            }else{
                auth(data[0].id)
            }
        })

        //监听工具条
        table.on('tool(role)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                info(data.id)
            } else if(obj.event === 'del'){
                layer.confirm('真的要删除数据么', function(index){
                    $.get("${pageContext.request.contextPath}/system/role/del.do?ids="+data.id,null,function(res){
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
            } else if(obj.event === 'auth'){
                auth(data.id);
            }
        });
    });



    function add(){
        parent.layer.open({
            //skin: 'layui-layer-molv',
            title: '添加',
            maxmin: true,
            type: 2,
            content: '${pageContext.request.contextPath}/system/role/toAdd.do',
            area: ['800px', '500px'],
            end: function () {
                location.reload();
            }
        });
    }

    function edit(id){
        parent.layer.open({
            //skin: 'layui-layer-molv',
            title: '编辑',
            maxmin: true,
            type: 2,
            content: '${pageContext.request.contextPath}/system/role/toUpdate.do?id='+id,
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
            content: '${pageContext.request.contextPath}/system/role/findInfo.do?id='+id,
            area: ['800px', '500px']
        });
    }

    function auth(id){
        parent.layer.open({
            id: 'role_auth',
            //skin: 'layui-layer-molv',
            title: '授权',
            maxmin: true,
            type: 2,
            content: '${pageContext.request.contextPath}/system/role/toAuth.do?role_id='+id,
            area: ['320px', '500px'],
            end: function () {
                //location.reload();
            }
        });
    }

</script>

<%@include file="../admin/bottom.jsp"%>