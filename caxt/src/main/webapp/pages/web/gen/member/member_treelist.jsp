<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../system/admin/top.jsp"%>

<div class="x-nav">
    <div class="layui-inline">
        <label class="layui-form-lab" style="width: auto">家族检索</label>
        <select name="family_id" id="family_id" onchange="selectFamily();" style="height: 30px;width: 190px;float: right;"  class="layui-input layui-unselect tfield-all">
            <c:forEach items="${familyLs}" var="var" varStatus="status">
                <option value="${var.id}">${var.name}</option>
            </c:forEach>
        </select>
    </div>
    <c:if test="${fn:contains(pd.authParam,'add')}">
        <button class="layui-btn layui-btn-sm" onclick="add();"><i class="layui-icon layui-icon-add-1"></i>添加</button>
    </c:if>
    <c:if test="${fn:contains(pd.authParam,'edit')}">
        <button class="layui-btn layui-btn-normal layui-btn-sm" id="edits"><i class="layui-icon layui-icon-edit"></i>编辑</button>
    </c:if>
    <c:if test="${fn:contains(pd.authParam,'del')}">
        <button class="layui-btn layui-btn-danger layui-btn-sm" id="dels"><i class="layui-icon layui-icon-delete"></i>删除</button>
    </c:if>

    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
<div style="float: left; width: 18%; margin-right:15px;" id="leftDiv">
    <ul id="treeDemo" class="ztree"></ul>
    <input type="hidden" name="tree_id" id="tree_id" value="" />
    <input type="hidden" id="tree_name" value="" />
    <input type="hidden" id="dic_cascade" value="" />
</div>
<div style="float: left; width: 80%" id="rightDiv">
<div class="admin-main">
    <blockquote id="search" class="layui-elem-quote" style="position: relative;">
        <div class="layui-form-item" style="margin-bottom: 0;">
            <div class="layui-inline">
                <label class="layui-form-lab" style="width: auto">姓名</label>
                <input type="text" name="name" id="name" style="width:190px;height: 32px;display: inline" placeholder="请输入姓名" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" style="position: absolute;right:25px;bottom:6px;">
            <a href="javascript:;" class="layui-btn layui-btn-sm" data-type="reload">
                <i class="layui-icon">&#xe615;</i> 搜索
            </a>
        </div>
    </blockquote>
    <div class="layui-field-box layui-form" style="padding: 0;">
        <table id="LAY_table_member" class="layui-table admin-table" lay-filter="member">
        </table>
    </div>
   <%-- <fieldset class="layui-elem-field">

    </fieldset>
--%>
</div>
    </div>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="orgTree">族谱树</a>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/ztree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/ztree/js/jquery.ztree.all.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css" />
<%@include file="member_ztree.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/layui/layui.js"></script>

<script>
    var table,form;
    layui.use('table', function(){
             table = layui.table;
            form = layui.form;
        //方法级渲染
        table.render({
            elem: '#LAY_table_member'
            ,url: '${pageContext.request.contextPath}/gen/member/findListPage.do?auth_type=${pd.auth_type}&auth_organize_ids=${pd.auth_organize_ids}'
                ,cols: [[
                {checkbox: true, fixed: true}
                ,{field:'family_name', title: '家族名称', width:120, sort: true, fixed: true}
                ,{field:'generation_name', title: '世代名称'}
                ,{field:'name', title: '姓名'}
                ,{field:'level_name', title: '排行'}
                ,{field:'order_by', title: '排序', width:60}
                ,{field:'create_time', title: '创建时间'}
                ,{align:'center', title:'操作',width:220, toolbar: '#barDemo'}
            ]]
            ,id: 'table_member'
            ,page: true
           // ,height: 420
        });

        var $ = layui.$, active = {
            reload: function(){
                var auth_type = '${pd.auth_type}';
                var auth_organize_ids = '${pd.organize_ids}';
                var name = $('#name').val();
                var family_id = $('#family_id option:selected') .val();
//                var generation_id = $('#generation_id option:selected') .val();
                //执行重载
                table.reload('table_member', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        auth_type: auth_type,
                        auth_organize_ids: auth_organize_ids,
                        name: name,
                        family_id: family_id
//                        generation_id: generation_id
                    }
                });
            }
        };

        $('#search .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });


        $('#edits').on('click',function (){
            var checkStatus = table.checkStatus('table_member')
                    ,data = checkStatus.data;
            if(data.length!=1){
                layer.msg('请选择一条数据进行操作。');
            }else{
                edit(data[0].id)
            }
        })

        $('#dels').on('click',function (){
            var checkStatus = table.checkStatus('table_member')
                    ,data = checkStatus.data;
            if(data.length>0){
                layer.confirm('真的要删除数据么', function(index){
                    var ids = [];
                    for ( var i = 0; i <data.length; i++){
                        ids.push(data[i].id);
                    }
                    $.get("${pageContext.request.contextPath}/gen/member/del.do?ids="+ids,null,function(res){
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
        table.on('tool(member)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                info(data.id)
            } else if(obj.event === 'del'){
                layer.confirm('真的要删除数据么', function(index){
                    $.get("${pageContext.request.contextPath}/gen/member/del.do?ids="+data.id,null,function(res){
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
            } else if(obj.event === 'orgTree'){
                orgTree(data.id);
            }
        });
    });

    var generation_id = "";
    function reloadData(parent_id){
        var auth_type = '${pd.auth_type}';
        var auth_organize_ids = '${pd.organize_ids}';
        var name = $('#name').val();
        var family_id = $('#family_id option:selected') .val();
//                var generation_id = $('#generation_id option:selected') .val();
        if(parent_id==0){
            parent_id="";
        }else{
            generation_id=parent_id;
        }
        //执行重载
        table.reload('table_member', {
            page: {
                curr: 1 //重新从第 1 页开始
            }
            ,where: {
                auth_type: auth_type,
                auth_organize_ids: auth_organize_ids,
                name: name,
                family_id: family_id,
                generation_id: parent_id
            }
        });
    }


    $(document).ready(function () {
        selectFamily();
    });


    function add(){
        if(generation_id==''||generation_id==null){
            layer.msg("请选择左侧世代后进行添加", {time: 2000});
            return;
        }
        var family_id = $('#family_id option:selected') .val();
        parent.layer.open({
            //skin: 'layui-layer-molv',
            title: '添加',
            maxmin: true,
            type: 2,
            content: '${pageContext.request.contextPath}/gen/member/toAdd.do?family_id='+family_id+'&generation_id='+generation_id,
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
            content: '${pageContext.request.contextPath}/gen/member/toUpdate.do?id='+id,
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
            content: '${pageContext.request.contextPath}/gen/member/findInfo.do?id='+id,
            area: ['800px', '500px']
        });
    }


    function selectFamily(){
        var family_id = $('#family_id option:selected') .val();
        initTree(family_id)
        $.ajax({
            type: "GET",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "${pageContext.request.contextPath}/gen/generation/findList.do?family_id="+family_id+"&status=Y",//url
            data: "",
            success: function (res) {
                if (res.success) {
                    var tt = '';
                    $.each(res.data,function(i,n){
                        tt += '<option value="'+ n.id+'">'+ n.name+'</option>';
                    });
                    $("#generation_id").html(tt);
                }else{
                    if(res.loseSession=='loseSession'){
                        loseSession(res.msg,res.url);
                    }else{
                        layer.msg(res.msg, {time: 2000});
                    }
                }
            },
            error : function() {
                layer.msg("异常！");
            }
        });
    }


    function orgTree(id){
        parent.layer.open({
            //skin: 'layui-layer-molv',
            title: '家谱树',
            maxmin: true,
            type: 2,
            content: '${pageContext.request.contextPath}/gen/show/tree.do?id='+id,
            area: ['800px', '500px']
        });
    }

</script>

<%@include file="../../system/admin/bottom.jsp"%>