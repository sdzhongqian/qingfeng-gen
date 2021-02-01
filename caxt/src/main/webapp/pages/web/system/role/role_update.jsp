<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../admin/top.jsp"%>

<div id="jpstr" style="margin-top: 10px;">
    <button class="layui-btn layui-btn-sm" onclick="jprint();">打印</button>
    <button class="layui-btn layui-btn-sm" onclick="toExport('role','${p.id}');">导出</button>
</div>

<form class="layui-form" action="${pageContext.request.contextPath}/system/role/update.do" id="form">
    <table width="90%">
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">角色名称：</label></td>
            <td colspan="3"><input type="text" name="name" lay-verify="required|title" autocomplete="off" placeholder="请输入角色名称" value="${p.name}" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">角色简称：</label></td>
            <td colspan="3"><input type="text" name="short_name" lay-verify="title" autocomplete="off" placeholder="请输入角色简称" value="${p.short_name}" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">选择用户：</label></td>
            <td colspan="3">
                <textarea name="user_names" id="user_names" placeholder="请选择用户" style="width: 518px;display: inline-block;" readonly class="layui-textarea">${p.user_names}</textarea>
                <a href="javascript:;" class="layui-btn layui-btn-sm"  onclick="selectMoreUser();" style="vertical-align: top;"><i class="layui-icon layui-icon-more"></i></a>
                <input type="hidden" id="user_ids" name="user_ids" value="${p.user_ids}">
            </td>
        </tr>
        <tr style="margin-top: 10px">
            <td width="20%" align="right"><label class="layui-form-label">选择组织：</label></td>
            <td colspan="3">
                <textarea name="organize_names" id="organize_names" placeholder="请选择组织" style="width: 518px;display: inline-block;" readonly class="layui-textarea">${p.organize_names}</textarea>
                <a href="javascript:;" class="layui-btn layui-btn-sm"  onclick="selectMoreOrg();" style="vertical-align: top;"><i class="layui-icon layui-icon-more"></i></a>
                <input type="hidden" id="organize_ids" name="organize_ids" value="${p.organize_ids}">
            </td>
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
                <div class="layui-form-item">
                <input type="hidden" name="id" value="${p.id}">
                <button class="layui-btn layui-btn-sm" lay-submit="" lay-filter="submit_form">保存</button>
                <button class="layui-btn layui-btn-danger layui-btn-sm" id="cancel">取消</button>
                </div>
            </td>
        </tr>
    </table>
</form>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/commonLayer.js"></script>
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
            $.post("${pageContext.request.contextPath}/system/role/update.do",data.field,function(res){
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

    function selectMoreUser(){
        var ids = $("#user_ids").val();
        var names = $("#user_names").val();
        parent.layer.open({
            //skin: 'layui-layer-molv',
            title: '添加人员',
            maxmin: true,
            type: 2,
            content: '${pageContext.request.contextPath}/system/user/selectMoreUser.do?ids='+ids+'&names='+names,
            area: ['800px', '520px'],
            end: function () {
                getUser("user_ids","user_names");
            }
        });
    }

    function selectMoreOrg(){
        var ids = $("#organize_ids").val();
        var names = $("#organize_names").val();
        parent.layer.open({
            //skin: 'layui-layer-molv',
            title: '选择组织',
            maxmin: true,
            type: 2,
            content: '${pageContext.request.contextPath}/system/organize/selectMoreOrg.do?ids='+ids+'&names='+names,
            area: ['800px', '520px'],
            end: function () {
                getOrg("organize_ids","organize_names");
            }
        });
    }
</script>

<%@include file="../admin/bottom.jsp"%>