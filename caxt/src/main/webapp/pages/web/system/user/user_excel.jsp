<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../admin/top.jsp"%>

<div id="jpstr" style="margin-top: 10px;">
    <button class="layui-btn layui-btn-sm" onclick="jprint();">打印</button>
    <button class="layui-btn layui-btn-sm" onclick="importExcel();">导出</button>
</div>
    <table width="90%" id="table_report" border="1" style="margin-left: 5%;margin-top: 10px;">
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">登录名称：</label></td>
            <td>${p.login_name}</td>
            <td width="20%" align="right"><label class="layui-form-label">登录密码：</label></td>
            <td>${p.login_password}</td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">用户名称：</label></td>
            <td>${p.nickname}</td>
            <td width="20%" align="right"><label class="layui-form-label">性别：</label></td>
            <td>${p.sex}</td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">电子邮箱：</label></td>
            <td>${p.email}</td>
            <td width="20%" align="right"><label class="layui-form-label">手机号码：</label></td>
            <td>${p.phone}</td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">出生日期：</label></td>
            <td>${p.birth_date}</td>
            <td width="20%" align="right"><label class="layui-form-label">排序：</label></td>
            <td>${p.order_by}</td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">组织名称：</label></td>
            <td colspan="3">${p.organize_name}</td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">兼职组织：</label></td>
            <td colspan="3">
                ${p.jz_organize_name}
            </td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">居住地址：</label></td>
            <td colspan="3">${p.live_address}</td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">出生地址：</label></td>
            <td colspan="3">${p.birth_address}</td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">备注：</label></td>
            <td colspan="3">${p.remark}</td>
        </tr>
    </table>

<%@include file="../admin/bottom.jsp"%>