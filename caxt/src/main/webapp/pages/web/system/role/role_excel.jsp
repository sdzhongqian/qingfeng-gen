<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../admin/top.jsp"%>

<div id="jpstr" style="margin-top: 10px;">
    <button class="layui-btn layui-btn-sm" onclick="jprint();">打印</button>
    <button class="layui-btn layui-btn-sm" onclick="importExcel();">导出</button>
</div>
<table width="90%" id="table_report" border="1" style="margin-left: 5%;margin-top: 10px;">
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">角色名称：</label></td>
            <td colspan="3">${p.name}</td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">角色简称：</label></td>
            <td colspan="3">${p.short_name}</td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">选择用户：</label></td>
            <td colspan="3">
                ${p.user_names}
            </td>
        </tr>
        <tr style="margin-top: 10px">
            <td width="20%" align="right"><label class="layui-form-label">选择组织：</label></td>
            <td colspan="3">
                ${p.organize_names}
            </td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">排序：</label></td>
            <td colspan="3">${p.order_by}</td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">备注：</label></td>
            <td colspan="3">${p.remark}</td>
        </tr>
    </table>

<%@include file="../admin/bottom.jsp"%>