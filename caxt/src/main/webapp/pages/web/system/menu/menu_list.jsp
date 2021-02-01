<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../admin/top.jsp"%>


<div class="x-nav">
    <c:if test="${fn:contains(pd.authParam,'add')}">
        <button class="layui-btn layui-btn-sm" onclick="add('menu');"><i class="layui-icon layui-icon-add-1"></i>添加</button>
    </c:if>
    <c:if test="${fn:contains(pd.authParam,'addMore')}">
        <button class="layui-btn layui-btn-sm" onclick="addMore('menu');"><i class="layui-icon layui-icon-add-1"></i>批量添加</button>
    </c:if>
    <c:if test="${fn:contains(pd.authParam,'edit')}">
        <button class="layui-btn layui-btn-normal layui-btn-sm" id="edits"><i class="layui-icon layui-icon-edit"></i>编辑</button>
    </c:if>
    <c:if test="${fn:contains(pd.authParam,'del')}">
        <button class="layui-btn layui-btn-danger layui-btn-sm" id="dels"><i class="layui-icon layui-icon-delete"></i>删除</button>
    </c:if>

    <span class="layui-btn layui-btn-sm" id="current_menu"></span>
    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
<div style="float: left; width: 18%; margin-right:15px;" id="leftDiv">
    <ul id="treeDemo" class="ztree"></ul>
    <input type="hidden" name="tree_id" id="tree_id" value="" />
    <input type="hidden" id="tree_name" value="" />
    <input type="hidden" id="tree_level" value="" />
    <input type="hidden" id="tree_type" value="" />
    <input type="hidden" id="menu_cascade" value="" />
</div>
<div style="float: left; width: 80%" id="rightDiv">
<div class="admin-main">

    <blockquote id="search" class="layui-elem-quote">
        <label class="layui-form-lab" style="width: auto">名称</label>
        <input type="text" name="name" id="name" style="width: 240px;height: 32px;display: inline" placeholder="请输入名称" class="layui-input">
        <label class="layui-form-lab" style="width: auto">编号</label>
        <input type="text" name="code" id="code" style="width: 240px;height: 32px;display: inline" placeholder="请输入编号" class="layui-input">
        <a href="javascript:;" class="layui-btn layui-btn-sm" data-type="reload">
            <i class="layui-icon">&#xe615;</i> 搜索
        </a>
    </blockquote>


        <fieldset class="layui-elem-field">
            <div class="layui-field-box layui-form">
                <table id="LAY_table_menu" class="layui-table admin-table" lay-filter="menu">
                </table>
            </div>
        </fieldset>
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

</script>
<script type="text/html" id="typeTpl">
    {{ d.type == 'menu' ? '菜单' : '功能按钮' }}
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/ztree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/ztree/js/jquery.ztree.all.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css" />
<%@include file="menu_ztree.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/layui/layui.js"></script>
<script>

    var table,form;
    layui.use('table', function(){
        table = layui.table;
        form = layui.form;
        //方法级渲染
        table.render({
            elem: '#LAY_table_menu'
            ,url: '${pageContext.request.contextPath}/system/menu/findListPage.do?auth_type=${pd.auth_type}&auth_organize_ids=${pd.auth_organize_ids}'
                ,cols: [[
                {checkbox: true, fixed: true}
                ,{field:'name', title: '名称', width:120, sort: true, fixed: true}
                ,{field:'code', title: '编号', width:120}
                ,{field:'order_by', title: '排序'}
                ,{field:'type', title: '类型', templet: '#typeTpl'}
                ,{field:'create_time', title: '创建时间'}
                ,{align:'center', title:'操作',width:180, toolbar: '#barDemo'}
            ]]
            ,id: 'table_menu'
            ,page: true
           // ,height: 420
        });

        var $ = layui.$, active = {
            reload: function(){
                var auth_type = '${pd.auth_type}';
                var auth_organize_ids = '${pd.organize_ids}';
                var name = $('#name').val();
                var short_name = $('#short_name').val();
                var parent_id = $('#tree_id').val();
                //执行重载
                table.reload('table_menu', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        auth_type: auth_type,
                        auth_organize_ids: auth_organize_ids,
                        name: name,
                        short_name: short_name,
                        parent_id: parent_id
                    }
                });
            }
        };

        $('#search .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });


        $('#edits').on('click',function (){
            var checkStatus = table.checkStatus('table_menu')
                    ,data = checkStatus.data;
            if(data.length!=1){
                layer.msg('请选择一条数据进行操作。');
            }else{
                edit(data[0].id,data[0].type);
            }
        })

        $('#dels').on('click',function (){
            var checkStatus = table.checkStatus('table_menu')
                    ,data = checkStatus.data;
            if(data.length>0){
                layer.confirm('删除数据会同步删除下级数据，是否进行删除操作？', function(index){
                    var ids = [];
                    for ( var i = 0; i <data.length; i++){
                        ids.push(data[i].id);
                    }
                    $.get("${pageContext.request.contextPath}/system/menu/del.do?ids="+ids,null,function(res){
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


        //监听工具条
        table.on('tool(menu)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                info(data.id,data.type)
            } else if(obj.event === 'del'){
                layer.confirm('删除数据会同步删除下级数据，是否进行删除操作？', function(index){
                    $.get("${pageContext.request.contextPath}/system/menu/del.do?ids="+data.id,null,function(res){
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
                edit(data.id,data.type);
            }
        });

    });

    function reloadData(parent_id){
        var auth_type = '${pd.auth_type}';
        var auth_organize_ids = '${pd.organize_ids}';
        var name = $('#name').val();
        var short_name = $('#short_name').val();
        //执行重载
        table.reload('table_menu', {
            page: {
                curr: 1 //重新从第 1 页开始
            }
            ,where: {
                auth_type: auth_type,
                auth_organize_ids: auth_organize_ids,
                name: name,
                short_name: short_name,
                parent_id: parent_id
            }
        });
    }

    function add(type){
        var parent_id =  $("#tree_id").val();
        var name = $("#tree_name").val();
        var level = $("#tree_level").val();
        var menu_cascade = $("#menu_cascade").val();
        var curr_type = $("#tree_type").val();
        if(parent_id==''||parent_id==null){
            layer.msg("请在左侧选择菜单父节点。");
        }else{
            if(curr_type=='button'){
                layer.msg("按钮下不可添加菜单！");
            }else if(level=='3'){
                layer.msg("最多添加三级菜单！");
            }else{
                parent.layer.open({
                    //skin: 'layui-layer-molv',
                    title: '添加',
                    maxmin: true,
                    type: 2,
                    content: '${pageContext.request.contextPath}/system/menu/toAdd.do?parent_id='+parent_id+'&name='+name+'&level='+level+'&menu_cascade='+menu_cascade+'&type='+type,
                    area: ['800px', '500px'],
                    end: function () {
                        location.reload();
                    }
                });
            }
        }
    }


    function addMore(type){
        var parent_id =  $("#tree_id").val();
        var name = $("#tree_name").val();
        var level = $("#tree_level").val();
        var menu_cascade = $("#menu_cascade").val();
        var curr_type = $("#tree_type").val();
        if(parent_id==''||parent_id==null){
            layer.msg("请在左侧选择菜单父节点。");
        }else{
            if(curr_type=='button'){
                layer.msg("按钮下不可添加菜单！");
            }else if(level=='3'){
                layer.msg("最多添加三级菜单！");
            }else{
                parent.layer.open({
                    id: 'addMore',
                    //skin: 'layui-layer-molv',
                    title: '添加',
                    maxmin: true,
                    type: 2,
                    content: '${pageContext.request.contextPath}/system/menu/toAddMore.do?parent_id='+parent_id+'&name='+name+'&level='+level+'&menu_cascade='+menu_cascade+'&type='+type,
                    area: ['1000px', '500px'],
                    end: function () {
                        location.reload();
                    }
                });
            }
        }
    }

    function edit(id,type){
        parent.layer.open({
            //skin: 'layui-layer-molv',
            title: '编辑',
            maxmin: true,
            type: 2,
            content: '${pageContext.request.contextPath}/system/menu/toUpdate.do?id='+id+'&type='+type+'&level='+$("#tree_level").val(),
            area: ['800px', '500px'],
            end: function () {
                location.reload();
            }
        });
    }

    function info(id,type){
        parent.layer.open({
            //skin: 'layui-layer-molv',
            title: '详情',
            maxmin: true,
            type: 2,
            content: '${pageContext.request.contextPath}/system/menu/findInfo.do?id='+id+'&type='+type,
            area: ['800px', '500px']
        });
    }

</script>

<%@include file="../admin/bottom.jsp"%>