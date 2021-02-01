<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../admin/top.jsp"%>

<div id="jpstr" style="margin-top: 10px;">
    <button class="layui-btn layui-btn-sm" onclick="jprint();">打印</button>
    <button class="layui-btn layui-btn-sm" onclick="toExport('dic','${p.id}');">导出</button>
</div>
<form class="layui-form" action="${pageContext.request.contextPath}/system/dictionary/update.do" id="form">
    <table width="90%">
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">父级名称：</label></td>
            <td colspan="3">
                <c:if test="${p.parent_name==null}"><input type="text" readonly autocomplete="off" placeholder="请输入父级名称" value="字典信息" class="layui-input"></c:if>
                <c:if test="${p.parent_name!=null}"><input type="text" readonly autocomplete="off" placeholder="请输入父级名称" value="${p.parent_name}" class="layui-input"></c:if>
            </td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">字典名称：</label></td>
            <td colspan="3"><input type="text" name="name" lay-verify="required|title" autocomplete="off" placeholder="请输入字典名称" value="${p.name}" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">字典简称：</label></td>
            <td colspan="3"><input type="text" name="short_name" lay-verify="title" autocomplete="off" placeholder="请输入字典简称" value="${p.short_name}" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">排序：</label></td>
            <td colspan="3"><input type="text" name="order_by" lay-verify="title" autocomplete="off" placeholder="请输入排序" value="${p.order_by}" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">备注：</label></td>
            <td colspan="3"><textarea name="remark" placeholder="请输入备注" class="layui-textarea">${p.remark}</textarea></td>
        </tr>
        <tr id="operate_button">
            <td style="text-align: center; padding-top: 10px;" colspan="4">
                <input type="hidden" name="id" value="${p.id}">
                <button class="layui-btn layui-btn-sm" lay-submit="" lay-filter="submit_form">保存</button>
                <button class="layui-btn layui-btn-danger layui-btn-sm" id="cancel">取消</button>
            </td>
        </tr>
    </table>
</form>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/layui/layui.js"></script>
<script>
    layui.use(['form'], function(){
        var form = layui.form
                ,layer = layui.layer
                ,$ = layui.$;

        $('#cancel').on('click',function (){
            var index = parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
        })

        //自定义验证规则
        form.verify({
            title: function(value){
                if(value.length > 50){
                    return '长度不得大于50个字符啊';
                }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
        });

        //监听提交
        form.on('submit(submit_form)', function(data){
            $.post("${pageContext.request.contextPath}/system/dictionary/update.do",data.field,function(res){
                if (res.success) {
                    layer.msg("数据保存成功。", {time: 2000});
                    var index = parent.layer.getFrameIndex(window.name);
                    parent.layer.close(index);
                }else{
                    if(res.loseSession=='loseSession'){
                        loseSession(res.msg,res.url)
                    }else{
                        layer.msg(result.msg, {time: 2000});
                    }
                }
            },'json');

            return false;
        });

    });
</script>

<%@include file="../admin/bottom.jsp"%>