<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../system/admin/top.jsp"%>

<form class="layui-form" action="${pageContext.request.contextPath}/gen/family/update.do" id="form">
    <table width="90%">
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">家族名称：</label></td>
            <td colspan="3"><input type="text" name="name" value="${p.name}" lay-verify="required" autocomplete="off" placeholder="请输入家族名称" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">姓氏：</label></td>
            <td colspan="3"><input type="text" value="${p.first_name}" name="first_name" lay-verify="required" autocomplete="off" placeholder="请输入姓氏" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">家传：</label></td>
            <td colspan="3"><input type="text" name="biography" value="${p.biography}" lay-verify="" autocomplete="off" placeholder="请输入家传" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">家训：</label></td>
            <td colspan="3"><input type="text" name="training" value="${p.training}" lay-verify="" autocomplete="off" placeholder="请输入家训" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">辈分字：</label></td>
            <td colspan="3"><input type="text" name="senior" value="${p.senior}" lay-verify="" autocomplete="off" placeholder="请输入辈分字" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">所在地：</label></td>
            <td colspan="3"><input type="text" name="address" value="${p.address}" lay-verify="title" autocomplete="off" placeholder="请输入所在地" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">家谱维护人：</label></td>
            <td colspan="3"><input type="text" name="maintainer" value="${p.maintainer}" lay-verify="title" autocomplete="off" placeholder="请输入家谱维护人" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">排序：</label></td>
            <td colspan="3"><input type="text" name="order_by" value="${p.order_by}" lay-verify="title" autocomplete="off" placeholder="请输入排序" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">历史渊源：</label></td>
            <td colspan="3"><textarea name="his_intro" placeholder="请输入历史渊源" lay-verify="remark" class="layui-textarea" style=" margin: 0 0 10px;">${p.his_intro}</textarea></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">姓氏源流：</label></td>
            <td colspan="3"><textarea name="source" placeholder="请输入姓氏源流" lay-verify="remark" class="layui-textarea" style=" margin: 0 0 10px;">${p.source}</textarea></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">内容介绍：</label></td>
            <td colspan="3"><textarea name="content" placeholder="请输入内容介绍" lay-verify="remark" class="layui-textarea" style=" margin: 0 0 10px;">${p.content}</textarea></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">备注：</label></td>
            <td colspan="3"><textarea name="remark" placeholder="请输入备注" lay-verify="remark" class="layui-textarea">${p.remark}</textarea></td>
        </tr>
        <tr>
            <td style="text-align: center; padding-top: 10px;" colspan="4">
                <input type="hidden" name="id" value="${p.id}">
                <button class="layui-btn layui-btn-sm" lay-submit="" lay-filter="submit_form">保存</button>
                <button class="layui-btn layui-btn-danger layui-btn-sm" id="cancel">取消</button>
            </td>
        </tr>
    </table>
</form>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js"></script>
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
            },
            remark: function(value){
                if(value.length > 500){
                    return '长度不得大于500个字符啊';
                }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
        });

        //监听提交
        form.on('submit(submit_form)', function(data){
            $.post("${pageContext.request.contextPath}/gen/family/update.do",data.field,function(res){
                if (res.success) {
                    layer.msg("数据保存成功。", {time: 2000});
                    var index = parent.layer.getFrameIndex(window.name);
                    parent.layer.close(index);
                }else{
                    if(res.loseSession=='loseSession'){
                        loseSession(res.msg,res.url)
                    }else{
                        layer.msg(res.msg, {time: 2000});
                    }
                }
            },'json');

            return false;
        });

    });

</script>

<%@include file="../../system/admin/bottom.jsp"%>