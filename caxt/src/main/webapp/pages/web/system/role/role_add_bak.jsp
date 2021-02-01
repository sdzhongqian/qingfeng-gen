<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../admin/top.jsp"%>

<form class="layui-form" action="${pageContext.request.contextPath}/system/role/save.do" id="form">
<table width="90%">
    <tr>
        <td width="20%" align="right"><label class="layui-form-label">角色名称：</label></td>
        <td colspan="3"><input type="text" name="name" lay-verify="required|title" autocomplete="off" placeholder="请输入角色名称" class="layui-input"></td>
    </tr>
    <tr>
        <td width="20%" align="right"><label class="layui-form-label">角色简称：</label></td>
        <td colspan="3"><input type="text" name="short_name" lay-verify="title" autocomplete="off" placeholder="请输入角色简称" class="layui-input"></td>
    </tr>
    <tr>
        <td><a onclick="selectOneUser()">选择人员</a></td>
        <td><a onclick="selectMoreUser()">选择多人</a></td>
    </tr>
    <tr>
        <td><a onclick="selectOneOrg()">选择组织</a></td>
        <td><a onclick="selectMoreOrg()">选择多组织</a></td>
    </tr>
    <tr>
        <td colspan="2"><a onclick="selectOrgUser()">选择组织选人</a></td>
    </tr>
    <tr>
        <td><input id="ids"></td>
        <td><input id="names"></td>
    </tr>
    <tr>
        <td width="20%" align="right"><label class="layui-form-label">排序：</label></td>
        <td colspan="3"><input type="text" name="order_by" lay-verify="title" autocomplete="off" placeholder="请输入排序" class="layui-input"></td>
    </tr>
    <tr>
        <td width="20%" align="right"><label class="layui-form-label">备注：</label></td>
        <td colspan="3"><textarea name="remark" placeholder="请输入备注" class="layui-textarea"></textarea></td>
    </tr>
    <tr>
        <td style="text-align: center; padding-top: 10px;" colspan="4">
            <button class="layui-btn layui-btn-sm" lay-submit="" lay-filter="submit_form">保存</button>
            <button class="layui-btn layui-btn-danger layui-btn-sm" id="cancel">取消</button>
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
            $.post("${pageContext.request.contextPath}/system/role/save.do",data.field,function(res){
                if(res==1){
                    layer.msg("数据保存成功。", {time: 2000});
                    var index = parent.layer.getFrameIndex(window.name);
                    parent.layer.close(index);
                }else{
                    layer.msg("数据保存失败。", {time: 2000});
                }
            },'json');

            return false;
        });
    });

    function selectOneUser(){
        var ids = $("#ids").val();
        var names = $("#names").val();
        parent.layer.open({
            //skin: 'layui-layer-molv',
            title: '添加人员',
            maxmin: true,
            type: 2,
            content: '${pageContext.request.contextPath}/system/user/selectOneUser.do?ids='+ids+'&names='+names,
            area: ['800px', '520px'],
            end: function () {
                getUser("ids","names");
            }
        });
    }


    function selectMoreUser(){
        var ids = $("#ids").val();
        var names = $("#names").val();
        parent.layer.open({
            //skin: 'layui-layer-molv',
            title: '添加人员',
            maxmin: true,
            type: 2,
            content: '${pageContext.request.contextPath}/system/user/selectMoreUser.do?ids='+ids+'&names='+names,
            area: ['800px', '520px'],
            end: function () {
                getUser("ids","names");
            }
        });
    }



    function selectOneOrg(){
        var ids = $("#ids").val();
        var names = $("#names").val();
        parent.layer.open({
            //skin: 'layui-layer-molv',
            title: '添加组织',
            maxmin: true,
            type: 2,
            content: '${pageContext.request.contextPath}/system/organize/selectOneOrg.do?ids='+ids+'&names='+names,
            area: ['800px', '520px'],
            end: function () {
                getOrg("ids","names");
            }
        });
    }


    function selectMoreOrg(){
        var ids = $("#ids").val();
        var names = $("#names").val();
        parent.layer.open({
            //skin: 'layui-layer-molv',
            title: '添加组织',
            maxmin: true,
            type: 2,
            content: '${pageContext.request.contextPath}/system/organize/selectMoreOrg.do?ids='+ids+'&names='+names,
            area: ['800px', '520px'],
            end: function () {
                getOrg("ids","names");
            }
        });
    }

    //选择组织选择人
    function selectOrgUser(){
        var ids = $("#ids").val();
        var names = $("#names").val();
        parent.layer.open({
            //skin: 'layui-layer-molv',
            title: '添加组织人员',
            maxmin: true,
            type: 2,
            content: '${pageContext.request.contextPath}/system/organize/selectOrgUser.do?ids='+ids+'&names='+names,
            area: ['800px', '520px'],
            end: function () {
                getOrg("ids","names");
            }
        });
    }


</script>

<%@include file="../admin/bottom.jsp"%>