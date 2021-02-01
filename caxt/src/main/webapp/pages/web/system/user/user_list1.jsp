<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../admin/top.jsp"%>


<div class="x-nav">
    <button class="layui-btn layui-btn-sm" onclick="add();"><i class="layui-icon layui-icon-add-1"></i>添加</button>
    <button class="layui-btn layui-btn-normal layui-btn-sm" onclick="edits();"><i class="layui-icon layui-icon-edit"></i>编辑</button>
    <button class="layui-btn layui-btn-danger layui-btn-sm" onclick="dels();"><i class="layui-icon layui-icon-delete"></i>删除</button>
    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
<div class="admin-main">

    <blockquote class="layui-elem-quote">
        <label class="layui-form-lab" style="width: auto">标题</label>
        <input type="text" name="title"  style="width: 240px;height: 32px;display: inline" placeholder="请输入标题" class="layui-input">
        <label class="layui-form-lab" style="width: auto">标题</label>
        <input type="text" name="title" style="width: 240px;height: 32px;display: inline" placeholder="请输入标题" class="layui-input">
        <a href="javascript:;" class="layui-btn layui-btn-sm" id="search">
            <i class="layui-icon">&#xe615;</i> 搜索
        </a>
    </blockquote>
    <fieldset class="layui-elem-field">
        <div class="layui-field-box layui-form">
            <table class="layui-table admin-table">
                <thead>
                <tr>
                    <th style="width: 30px;"><input name="checkAll" id="checkAll" type="checkbox" style="display: block" lay-filter="allselector" lay-skin="primary"></th>
                    <th>登录名称</th>
                    <th>用户名称</th>
                    <th>性别</th>
                    <th>状态</th>
                    <th>排序</th>
                    <th>创建时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="content">
                    <c:forEach items="${list}" var="var" varStatus="">
                        <tr>
                            <td><input type="checkbox" name="check" id="check_${var.id}" style="display: block" lay-filter="allselector" lay-skin="primary"></td>
                            <td>${var.login_name}</td>
                            <td>${var.nickname}</td>
                            <td>${var.sex}</td>
                            <td>${var.status}</td>
                            <td>${var.order_by}</td>
                            <td>${var.create_time}</td>
                            <td>
                                <a onclick="findInfo('${var.id}')" class="layui-btn layui-btn-sm"><i class="layui-icon layui-icon-file"></i></a>
                                <a onclick="edit('${var.id}')" target="_blank" class="layui-btn layui-btn-normal layui-btn-sm"><i class="layui-icon layui-icon-edit"></i></a>
                                <a onclick="del('${var.id}')" data-id="1" data-opt="del" class="layui-btn layui-btn-danger layui-btn-sm"><i class="layui-icon layui-icon-delete"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div id="page" class="page">
        </div>
    </fieldset>

</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/layui/layui.js"></script>
<script>
    layui.define(['laypage', 'layer'], function(){
        var laypage = layui.laypage
                ,layer = layui.layer;
        //完整功能
        laypage.render({
            elem: 'page'
            ,count: '${num}'
            ,layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip']
            ,jump: function(obj){
                console.log(obj.curr)
            }
        });

    });


    function add(){
        parent.layer.open({
            title: '添加',
            maxmin: true,
            type: 2,
            content: '${pageContext.request.contextPath}/system/user/toAdd.do',
            area: ['800px', '500px']
        });
    }

</script>

<%@include file="../admin/bottom.jsp"%>