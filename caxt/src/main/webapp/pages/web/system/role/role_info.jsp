<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../admin/top.jsp"%>

<div id="jpstr" style="margin-top: 10px;">
    <button class="layui-btn layui-btn-sm" onclick="jprint();">打印</button>
    <button class="layui-btn layui-btn-sm" onclick="toExport('role','${p.id}');">导出</button>
</div>

    <table width="90%">
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">角色名称：</label></td>
            <td colspan="3"><input type="text" readonly name="name" lay-verify="required|title" autocomplete="off" placeholder="请输入角色名称" value="${p.name}" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">角色简称：</label></td>
            <td colspan="3"><input type="text" readonly name="short_name" lay-verify="title" autocomplete="off" placeholder="请输入角色简称" value="${p.short_name}" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">选择用户：</label></td>
            <td colspan="3">
                <textarea name="user_names" id="user_names" placeholder="请选择用户" style="display: inline-block;" readonly class="layui-textarea">${p.user_names}</textarea>
            </td>
        </tr>
        <tr style="margin-top: 10px">
            <td width="20%" align="right"><label class="layui-form-label">选择组织：</label></td>
            <td colspan="3">
                <textarea name="organize_names" id="organize_names" placeholder="请选择组织" style="display: inline-block;" readonly class="layui-textarea">${p.organize_names}</textarea>
            </td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">排序：</label></td>
            <td colspan="3"><input type="text" readonly name="order_by" lay-verify="title" autocomplete="off" placeholder="请输入排序" value="${p.order_by}" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">备注：</label></td>
            <td colspan="3"><textarea readonly name="remark" placeholder="请输入备注" class="layui-textarea">${p.remark}</textarea></td>
        </tr>
        <tr id="operate_button">
            <td style="text-align: center; padding-top: 10px;" colspan="4">
                <div class="layui-form-item">
                <button class="layui-btn layui-btn-danger layui-btn-sm" id="cancel">关闭</button>
                </div>
            </td>
        </tr>
    </table>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/layui/layui.js"></script>
<script>
    layui.use(['form'], function(){
        var form = layui.form
                ,$ = layui.$;


        $('#cancel').on('click',function (){
            var index = parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
        })
    });
</script>

<%@include file="../admin/bottom.jsp"%>