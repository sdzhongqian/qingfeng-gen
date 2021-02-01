<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../admin/top.jsp"%>

<form class="layui-form" action="${pageContext.request.contextPath}/system/user/saveMore.do" id="form">
<table class="layui-table">
    <thead>
    <tr>
        <th>组织名称</th>
        <th>登录名称</th>
        <th>登录密码</th>
        <th>用户名称</th>
        <th>性别</th>
        <th>邮件</th>
        <th>电话</th>
        <th>排序</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="table">
        <tr>
            <td><input type="text" readonly autocomplete="off" placeholder="请输入组织名称" value="${pd.organize_name }" class="layui-input"></td>
            <td><input type="text" name="login_name" lay-verify="required|title" autocomplete="off" placeholder="请输入登录名称" class="layui-input"></td>
            <td><input type="password" name="login_password" lay-verify="pass" autocomplete="off" placeholder="请输入登录密码" class="layui-input"></td>
            <td><input type="text" name="nickname" lay-verify="required|title" autocomplete="off" placeholder="请输入用户名称" class="layui-input"></td>
            <td>
                <select name="sex" style="width: 80px;">
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
            </td>
            <td><input type="text" name="email" autocomplete="off" placeholder="请输入电子邮箱" class="layui-input"></td>
            <td><input type="tel" name="phone" autocomplete="off" placeholder="请输入手机号码" class="layui-input"></td>
            <td><input type="text" name="order_by" lay-verify="title" autocomplete="off" placeholder="请输入排序" value="1" class="layui-input"></td>
            <td style="width: 78px;"><div class="layui-btn-group"><button onclick="addLine();" type="button" class="layui-btn layui-btn-xs"><i class="layui-icon"></i></button></div></td>
        </tr>
    </tbody>
    <tr>
        <td style="text-align: center; padding-top: 10px;" colspan="9">
            <input type="hidden" id="organize_id" name="organize_id" value="${pd.organize_id }">
            <button type="button" class="layui-btn layui-btn-sm" lay-submit="" lay-filter="submit_form">保存</button>
            <button type="button" class="layui-btn layui-btn-danger layui-btn-sm" id="cancel">取消</button>
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
            var index = parent.layer.getFrameIndex("addMore");
            parent.layer.close(index);
        });

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
//            layer.alert(JSON.stringify(data.field), {
//                title: '最终的提交信息'
//            })

            $.ajax({
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/system/user/saveMore.do" ,//url
                data: $('#form').serialize(),
                success: function (res) {
                    if(res.success){
                        layer.msg("数据保存成功。", {time: 2000});
                        var index = parent.layer.getFrameIndex("addMore");
                        parent.layer.close(index);
                    }else{
                        if(res.loseSession=='loseSession'){
                            loseSession(res.msg,res.url)
                        }else{
                            layer.msg(res.msg, {time: 2000});
                        }
                    }
                },
                error : function() {
                    layer.msg("异常！");
                }
            });

            <%--$.post("${pageContext.request.contextPath}/system/organize/saveMore.do",data.field,function(res){--%>
                <%--layer.msg("数据保存成功。", {time: 2000});--%>
                <%--var index = parent.layer.getFrameIndex(window.name);--%>
                <%--parent.layer.close(index);--%>
            <%--},'json');--%>

            return false;
        });
    });

    var name = '${pd.organize_name}';
    var index = 1;
    function addLine(){
        index ++;
        var tt = '<tr id="tr_'+index+'">';
            tt += '<td><input type="text" readonly autocomplete="off" placeholder="请输入组织名称" value="'+name+'" class="layui-input"></td>';
            tt += '<td><input type="text" name="login_name" lay-verify="required|title" autocomplete="off" placeholder="请输入登录名称" class="layui-input"></td>';
            tt += '<td><input type="password" name="login_password" lay-verify="pass" autocomplete="off" placeholder="请输入登录密码" class="layui-input"></td>';
            tt += '<td><input type="text" name="nickname" lay-verify="required|title" autocomplete="off" placeholder="请输入用户名称" class="layui-input"></td>';
            tt += '<td><select name="sex" style="display: block;width: 80px;height: 28px;"><option value="男">男</option><option value="女">女</option></select></td>';
            tt += '<td><input type="text" name="email" autocomplete="off" placeholder="请输入电子邮箱" class="layui-input"></td>';
            tt += '<td><input type="tel" name="phone" autocomplete="off" placeholder="请输入手机号码" class="layui-input"></td>';
            tt += '<td><input type="text" name="order_by" lay-verify="title" autocomplete="off" placeholder="请输入排序" value="'+index+'" class="layui-input"></td>';
            tt += '<td style="width: 78px;"><div class="layui-btn-group"><button type="button" onclick="addLine();" class="layui-btn layui-btn-xs"><i class="layui-icon"></i></button><button type="button" onclick="delLine(\''+index+'\');" class="layui-btn layui-btn-xs layui-btn-danger"><i class="layui-icon"></i></button></div></td>';
            tt += '</tr>';
            $("#table tr:last").after(tt);
    }

    function delLine(index){
        $("#tr_"+index).remove();
    }
</script>

<%@include file="../admin/bottom.jsp"%>