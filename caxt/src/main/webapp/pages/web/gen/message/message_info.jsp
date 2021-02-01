<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../system/admin/top.jsp"%>
<form class="layui-form" action="" id="form">
    <table width="90%">
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">标题：</label></td>
            <td colspan="3"><input type="text" name="title" lay-verify="required" readonly value="${p.title}" autocomplete="off" placeholder="请输入标题" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">排序：</label></td>
            <td colspan="3"><input type="text" name="order_by" lay-verify="title" readonly value="${p.order_by}" autocomplete="off" placeholder="请输入排序" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">内容：</label></td>
            <td colspan="3"><textarea name="content" id="content" placeholder="请输入内容" readonly class="layui-textarea" style=" margin: 0 0 10px;min-height: 320px;">${p.content}</textarea></td>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/layui/layui.js"></script>
<link href="${pageContext.request.contextPath}/resources/plugins/umeditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/umeditor/third-party/jquery.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/plugins/umeditor/umeditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/plugins/umeditor/umeditor.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/umeditor/lang/zh-cn/zh-cn.js"></script>

<script>
    layui.use(['form'], function(){
        var form = layui.form
                ,$ = layui.$;


        $('#cancel').on('click',function (){
            var index = parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
        })
    });

    var um = UM.getEditor('content');
</script>

<%@include file="../../system/admin/bottom.jsp"%>