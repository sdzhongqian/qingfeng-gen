<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../admin/top.jsp"%>

<div id="jpstr" style="margin-top: 10px;">
    <button class="layui-btn layui-btn-sm" onclick="jprint();">打印</button>
    <button class="layui-btn layui-btn-sm" onclick="toExport('user','${p.id}');">导出</button>
</div>
<form class="layui-form" action="${pageContext.request.contextPath}/system/user/update.do" id="form">
    <table width="90%">
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">登录名称：</label></td>
            <td><input type="text" readonly name="login_name" lay-verify="title" autocomplete="off" placeholder="请输入登录名称" value="${p.login_name}" class="layui-input"></td>
            <td width="20%" align="right"><label class="layui-form-label">登录密码：</label></td>
            <td><input type="password" readonly name="login_password" lay-verify="pass" autocomplete="off" placeholder="请输入登录密码" value="${p.login_password}" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">用户名称：</label></td>
            <td><input type="text" readonly name="nickname" lay-verify="title" autocomplete="off" placeholder="请输入用户名称" value="${p.nickname}" class="layui-input"></td>
            <td width="20%" align="right"><label class="layui-form-label">性别：</label></td>
            <td>
                <select name="sex" lay-verify="required" disabled>
                    <option value="男" <c:if test="${p.sex=='男'}">selected</c:if>>男</option>
                    <option value="女" <c:if test="${p.sex=='女'}">selected</c:if>>女</option>
                </select>
            </td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">电子邮箱：</label></td>
            <td><input type="text" readonly name="email" lay-verify="email" autocomplete="off" placeholder="请输入电子邮箱" value="${p.email}" class="layui-input"></td>
            <td width="20%" align="right"><label class="layui-form-label">手机号码：</label></td>
            <td><input type="tel" readonly name="phone" lay-verify="required|phone" autocomplete="off" placeholder="请输入手机号码" value="${p.phone}" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">出生日期：</label></td>
            <td><input type="text" readonly name="birth_date" id="birth_date" lay-verify="date" placeholder="yyyy-MM-dd" value="${p.birth_date}" autocomplete="off" class="layui-input"></td>
            <td width="20%" align="right"><label class="layui-form-label">排序：</label></td>
            <td><input type="text" readonly name="order_by" lay-verify="title" autocomplete="off" placeholder="请输入排序" value="${p.order_by}" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">头像地址：</label></td>
            <td colspan="3">
                <div class="layui-upload">
                    <div class="layui-upload-list">
                        <img class="layui-upload-img" id="head_address_url">
                        <p id="demoText"></p>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">组织名称：</label></td>
            <td colspan="3"><input type="text" readonly autocomplete="off" placeholder="请输入组织名称" value="${p.organize_name}" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">兼职组织：</label></td>
            <td colspan="3">
                <input type="text" name="jz_organize_name" id="jz_organize_name" value="${p.jz_organize_name}" readonly autocomplete="off" placeholder="请输入兼职组织" class="layui-input" onclick="showMenu();">
            </td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">居住地址：</label></td>
            <td colspan="3"><input type="text" readonly name="live_address" lay-verify="title" autocomplete="off" placeholder="请输入居住地址" value="${p.live_address}" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">出生地址：</label></td>
            <td colspan="3"><input type="text" readonly name="birth_address" lay-verify="title" autocomplete="off" placeholder="请输入出生地址" value="${p.birth_address}" class="layui-input"></td>
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
</form>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/layui/layui.js"></script>
<script>
    layui.use(['form', 'layedit', 'laydate', 'upload'], function(){
        var form = layui.form
                ,layer = layui.layer
                ,layedit = layui.layedit
                ,laydate = layui.laydate
                ,upload = layui.upload
                ,$ = layui.$;


        $('#cancel').on('click',function (){
            var index = parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
        })
    });
</script>

<%@include file="../admin/bottom.jsp"%>