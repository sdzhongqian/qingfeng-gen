<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../system/admin/top.jsp"%>
<form class="layui-form" action="" id="form">
    <table width="90%">
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">家族名称：</label></td>
            <td colspan="3"><input type="text" name="name" value="${p.name}" readonly lay-verify="required" autocomplete="off" placeholder="请输入家族名称" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">姓氏：</label></td>
            <td colspan="3"><input type="text" value="${p.first_name}" readonly name="first_name" lay-verify="required" autocomplete="off" placeholder="请输入姓氏" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">家传：</label></td>
            <td colspan="3"><input type="text" name="biography" value="${p.biography}" readonly lay-verify="required" autocomplete="off" placeholder="请输入家传" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">家训：</label></td>
            <td colspan="3"><input type="text" name="training" value="${p.training}" readonly lay-verify="required" autocomplete="off" placeholder="请输入家训" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">辈分字：</label></td>
            <td colspan="3"><input type="text" name="senior" value="${p.senior}" readonly lay-verify="required" autocomplete="off" placeholder="请输入辈分字" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">所在地：</label></td>
            <td colspan="3"><input type="text" name="address" value="${p.address}" readonly lay-verify="title" autocomplete="off" placeholder="请输入所在地" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">家谱维护人：</label></td>
            <td colspan="3"><input type="text" name="maintainer" value="${p.maintainer}" readonly lay-verify="title" autocomplete="off" placeholder="请输入家谱维护人" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">排序：</label></td>
            <td colspan="3"><input type="text" name="order_by" value="${p.order_by}" readonly lay-verify="title" autocomplete="off" placeholder="请输入排序" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">历史渊源：</label></td>
            <td colspan="3"><textarea name="his_intro" placeholder="请输入历史渊源" readonly lay-verify="remark" class="layui-textarea" style=" margin: 0 0 10px;">${p.his_intro}</textarea></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">姓氏源流：</label></td>
            <td colspan="3"><textarea name="source" placeholder="请输入姓氏源流" readonly lay-verify="remark" class="layui-textarea" style=" margin: 0 0 10px;">${p.source}</textarea></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">内容介绍：</label></td>
            <td colspan="3"><textarea name="content" placeholder="请输入内容介绍" readonly lay-verify="remark" class="layui-textarea" style=" margin: 0 0 10px;">${p.content}</textarea></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">备注：</label></td>
            <td colspan="3"><textarea name="remark" placeholder="请输入备注" readonly lay-verify="remark" class="layui-textarea">${p.remark}</textarea></td>
        </tr>
        <tr>
            <td style="text-align: center; padding-top: 10px;" colspan="4">
                <button class="layui-btn layui-btn-danger layui-btn-sm" id="cancel">关闭</button>
            </td>
        </tr>
    </table>
</form>
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

<%@include file="../../system/admin/bottom.jsp"%>