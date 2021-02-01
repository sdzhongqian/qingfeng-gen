<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../admin/top.jsp"%>
<div id="jpstr" style="margin-top: 10px;">
    <button class="layui-btn layui-btn-sm" onclick="jprint();">打印</button>
    <button class="layui-btn layui-btn-sm" onclick="importExcel();">导出</button>
</div>
<table width="90%" id="table_report" border="1" style="margin-left: 5%;margin-top: 10px;">
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">父级名称：</label></td>
            <td colspan="3">
                ${p.parent_name}
            </td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">名称：</label></td>
            <td colspan="3">${p.name}</td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">编号：</label></td>
            <td colspan="3">${p.code}</td>
        </tr>
        <c:if test="${p.type=='menu'}">
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">分类：</label></td>
            <td colspan="3">
                <c:if test="${p.classify=='0'}">系统菜单</c:if>
                <c:if test="${p.classify=='1'}">自定义菜单</c:if>
            </td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">URL：</label></td>
            <td colspan="3">${p.url}</td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">icon：</label></td>
            <td colspan="3">${p.icon}</td>
        </tr>
        </c:if>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">排序：</label></td>
            <td colspan="3">${p.order_by}</td>
        </tr>
        <c:if test="${p.type=='menu'}">
            <c:if test="${pd.open_button == 'Y'}">
            <tr>
                <td width="20%" align="right"><label class="layui-form-label">功能按钮</label></td>
                <td colspan="3">
                    <div style="width:564px; overflow:auto;">
                        <table class="layui-table" border="1" style="width:564px;">
                            <thead>
                            <tr>
                                <th>名称</th>
                                <th>编号</th>
                                <th>排序</th>
                            </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${list}" var="var" varStatus="status">
                                    <tr id="tr_ls${var.id}">
                                        <td>${var.name}</td>
                                        <td>${var.code}</td>
                                        <td>${var.order_by}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </td>
            </tr>
            </c:if>
        </c:if>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">备注：</label></td>
            <td colspan="3">${p.remark}</td>
        </tr>
    </table>
<%@include file="../admin/bottom.jsp"%>