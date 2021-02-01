<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../system/admin/top.jsp"%>
<form class="layui-form" action="" id="form">
    <table width="90%">
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">所属家族：</label></td>
            <td colspan="3">
                <select name="family_id" id="family_id" readonly="" style="height: 30px;width: 190px;float: right;"  class="layui-input layui-unselect tfield-all">
                    <c:forEach items="${list}" var="var" varStatus="status">
                        <option value="${var.id}" <c:if test="${var.id==p.family_id}"> selected </c:if>>${var.name}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">世代名称：</label></td>
            <td colspan="3"><input type="text" name="name" lay-verify="required" value="${p.name}" readonly autocomplete="off" placeholder="请输入名称" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">世代顺序：</label></td>
            <td colspan="3"><input type="text" name="gorder" lay-verify="required" value="${p.gorder}" readonly autocomplete="off" placeholder="请输入世代顺序" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">世代辈分：</label></td>
            <td colspan="3"><input type="text" name="seniority" lay-verify="" value="${p.seniority}" readonly autocomplete="off" placeholder="请输入世代辈分" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">排序：</label></td>
            <td colspan="3"><input type="text" name="order_by" lay-verify="title" value="${p.order_by}" readonly autocomplete="off" placeholder="请输入排序" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">备注：</label></td>
            <td colspan="3"><textarea name="remark" placeholder="请输入备注" lay-verify="remark" readonly class="layui-textarea">${p.remark}</textarea></td>
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