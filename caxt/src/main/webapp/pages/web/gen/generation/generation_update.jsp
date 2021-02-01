<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../system/admin/top.jsp"%>

<form class="layui-form" action="${pageContext.request.contextPath}/gen/generation/update.do" id="form">
    <table width="90%">
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">所属家族：</label></td>
            <td colspan="3">
                <select name="family_id" id="family_id" style="height: 30px;width: 190px;float: right;"  class="layui-input layui-unselect tfield-all">
                    <c:forEach items="${list}" var="var" varStatus="status">
                        <option value="${var.id}" <c:if test="${var.id==p.family_id}"> selected </c:if>>${var.name}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">世代名称：</label></td>
            <td colspan="3"><input type="text" name="name" lay-verify="required" value="${p.name}" autocomplete="off" placeholder="请输入名称" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">世代顺序：</label></td>
            <td colspan="3"><input type="text" name="gorder" lay-verify="required" value="${p.gorder}" autocomplete="off" placeholder="请输入世代顺序" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">世代辈分：</label></td>
            <td colspan="3"><input type="text" name="seniority" lay-verify="" value="${p.seniority}" autocomplete="off" placeholder="请输入世代辈分" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">排序：</label></td>
            <td colspan="3"><input type="text" name="order_by" lay-verify="title" value="${p.order_by}" autocomplete="off" placeholder="请输入排序" class="layui-input"></td>
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
            $.post("${pageContext.request.contextPath}/gen/generation/update.do",data.field,function(res){
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