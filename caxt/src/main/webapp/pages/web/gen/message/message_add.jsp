<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../system/admin/top.jsp"%>

<form class="layui-form" action="${pageContext.request.contextPath}/gen/message/save.do" id="form">
<table width="90%">
    <tr>
        <td width="20%" align="right"><label class="layui-form-label">标题：</label></td>
        <td colspan="3"><input type="text" name="title" lay-verify="required" autocomplete="off" placeholder="请输入标题" class="layui-input"></td>
    </tr>
    <tr>
        <td width="20%" align="right"><label class="layui-form-label">排序：</label></td>
        <td colspan="3"><input type="text" name="order_by" lay-verify="title" autocomplete="off" placeholder="请输入排序" class="layui-input"></td>
    </tr>
    <tr>
        <td width="20%" align="right"><label class="layui-form-label">内容：</label></td>
        <td colspan="3"><textarea name="content" id="content" placeholder="请输入说明" class="layui-textarea" style=" margin: 0 0 10px;min-height: 320px;"></textarea></td>
    </tr>
    <tr>
        <td width="20%" align="right"><label class="layui-form-label">备注：</label></td>
        <td colspan="3"><textarea name="remark" placeholder="请输入备注" lay-verify="remark" class="layui-textarea"></textarea></td>
    </tr>
    <tr>
        <td style="text-align: center; padding-top: 10px;" colspan="4">
            <input type="hidden" name="type" value="${pd.type}">
            <button class="layui-btn layui-btn-sm" lay-submit="" lay-filter="submit_form">保存</button>
            <button class="layui-btn layui-btn-danger layui-btn-sm" id="cancel">取消</button>
        </td>
    </tr>
</table>
</form>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/layui/layui.js"></script>
<link href="${pageContext.request.contextPath}/resources/plugins/umeditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/umeditor/third-party/jquery.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/plugins/umeditor/umeditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/plugins/umeditor/umeditor.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/umeditor/lang/zh-cn/zh-cn.js"></script>

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
            $.post("${pageContext.request.contextPath}/gen/message/save.do",data.field,function(res){
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


    var um = UM.getEditor("content");

</script>



<%@include file="../../system/admin/bottom.jsp"%>