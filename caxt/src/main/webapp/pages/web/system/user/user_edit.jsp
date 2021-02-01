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
            <td><input type="text" name="login_name" lay-verify="title" autocomplete="off" placeholder="请输入登录名称" value="${p.login_name}" class="layui-input"></td>
            <td width="20%" align="right"><label class="layui-form-label">登录密码：</label></td>
            <td><input type="password" name="login_password" autocomplete="off" placeholder="请输入登录密码" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">用户名称：</label></td>
            <td><input type="text" name="nickname" lay-verify="title" autocomplete="off" placeholder="请输入用户名称" value="${p.nickname}" class="layui-input"></td>
            <td width="20%" align="right"><label class="layui-form-label">性别：</label></td>
            <td>
                <select name="sex" lay-verify="required">
                    <option value="男" <c:if test="${p.sex=='男'}">selected</c:if>>男</option>
                    <option value="女" <c:if test="${p.sex=='女'}">selected</c:if>>女</option>
                </select>
            </td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">电子邮箱：</label></td>
            <td><input type="text" name="email" lay-verify="email" autocomplete="off" placeholder="请输入电子邮箱" value="${p.email}" class="layui-input"></td>
            <td width="20%" align="right"><label class="layui-form-label">手机号码：</label></td>
            <td><input type="tel" name="phone" lay-verify="phone" autocomplete="off" placeholder="请输入手机号码" readonly value="${p.phone}" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">出生日期：</label></td>
            <td><input type="text" name="birth_date" id="birth_date" lay-verify="date" placeholder="yyyy-MM-dd" value="${p.birth_date}" autocomplete="off" class="layui-input"></td>
            <td width="20%" align="right"><label class="layui-form-label">排序：</label></td>
            <td><input type="text" name="order_by" lay-verify="title" autocomplete="off" placeholder="请输入排序" value="${p.order_by}" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">头像地址：</label></td>
            <td colspan="3">
                <div class="layui-upload">
                    <button type="button" class="layui-btn" id="head_address">上传图片</button>
                    <div class="layui-upload-list">
                        <img class="layui-upload-img" id="head_address_url" width="100px;">
                        <p id="demoText"></p>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">组织名称：</label></td>
            <td colspan="3">
                <input type="text" readonly autocomplete="off" id="organize_name" name="organize_name" placeholder="请选择组织名称" value="${p.organize_name}" class="layui-input">
            </td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">兼职组织：</label></td>
            <td colspan="3">
                <input type="text" name="jz_organize_name" id="jz_organize_name" value="${p.jz_organize_name}" readonly autocomplete="off" placeholder="请输入兼职组织" class="layui-input">
            </td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">居住地址：</label></td>
            <td colspan="3"><input type="text" name="live_address" lay-verify="title" autocomplete="off" placeholder="请输入居住地址" value="${p.live_address}" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">出生地址：</label></td>
            <td colspan="3"><input type="text" name="birth_address" lay-verify="title" autocomplete="off" placeholder="请输入出生地址" value="${p.birth_address}" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">备注：</label></td>
            <td colspan="3"><textarea name="remark" placeholder="请输入备注" class="layui-textarea">${p.remark}</textarea></td>
        </tr>
        <tr id="operate_button">
            <td style="text-align: center; padding-top: 10px;" colspan="4">
                <div class="layui-form-item">
                <input type="hidden" name="id" value="${p.id}">
                <input type="hidden" name="old_login_name" value="${p.login_name}">
                <button class="layui-btn layui-btn-sm" lay-submit="" lay-filter="submit_form">保存</button>
                <button class="layui-btn layui-btn-danger layui-btn-sm" id="cancel">取消</button>
                </div>
            </td>
        </tr>
    </table>
</form>
<div id="menuContent" class="menuContent" style="display:none; position: absolute; background-color: #eaeaea; height: 300px;width:180px; ">
    <ul id="selectOrgZtree" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/ztree/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/ztree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/ztree/js/jquery.ztree.excheck.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css" />
<%@include file="../organize/organize_ztreeradio.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/commonLayer.js"></script>
<script>
    layui.use(['form', 'layedit', 'laydate', 'upload'], function(){
        var form = layui.form
                ,layer = layui.layer
                ,layedit = layui.layedit
                ,laydate = layui.laydate
                ,upload = layui.upload
                ,$ = layui.$;
        //日期
        laydate.render({
            elem: '#birth_date'
        });


        form.verify({
            required: [/[\S]+/, '必填项不能为空'],
            phone: [/(^$)|^1\d{10}$/, '请输入正确的手机号'],
            email: [/(^$)|^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/, '邮箱格式不正确'],
            url: [/(^$)|(^#)|(^http(s*):\/\/[^\s]+\.[^\s]+)/, '链接格式不正确'],
            number: [/(^$)|^\d+$/, '只能填写数字'],
            intNumber: [/(^$)|^[0-9]*$/, '只能填写整型数字'],
            date: [/(^$)|^(\d{4})[-\/](\d{1}|0\d{1}|1[0-2])([-\/](\d{1}|0\d{1}|[1-2][0-9]|3[0-1]))*$/, '日期格式不正确'],
            identity: [/(^$)|(^\d{15}$)|(^\d{17}(x|X|\d)$)/, '请输入正确的身份证号']
        });

        //普通图片上传
        var uploadInst = upload.render({
            elem: '#head_address'
            ,url: '/common/upload/uploadImg.do'
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#head_address_url').attr('src', result); //图片链接（base64）
                });
            }
            ,done: function(res){
                //如果上传失败
                if(res.code = 1){
                    return layer.msg('上传成功');
                }
                if(res.code = 0){
                    return layer.msg('上传失败');
                }

            }
            ,error: function(){
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    uploadInst.upload();
                });
            }
        });

        $('#cancel').on('click',function (){
            var index = parent.layer.getFrameIndex("login_user");
            parent.layer.close(index);
        })



        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

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

            var bm_leader = $("#bm_leader").val();
            var bm_leader_name = $("#bm_leader_name").val();
            $("#bm_leader").val(bm_leader+"#"+bm_leader_name);

            var fg_leader = $("#fg_leader").val();
            var fg_leader_name = $("#fg_leader_name").val();
            $("#fg_leader").val(fg_leader+"#"+fg_leader_name);

            var sj_leader = $("#sj_leader").val();
            var sj_leader_name = $("#sj_leader_name").val();
            $("#sj_leader").val(sj_leader+"#"+sj_leader_name);

            $.ajax({
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/system/user/update.do" ,//url
                data: $('#form').serialize(),
                success: function (res) {
                    if (res.success) {
                        layer.msg("数据保存成功。", {time: 2000});
                        var index = parent.layer.getFrameIndex("login_user");
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
            return false;
        });

        //表单初始赋值
        form.val('example', {
            "username": "贤心" // "name": "value"
            ,"password": "123456"
            ,"interest": 1
            ,"like[write]": true //复选框选中状态
            ,"close": true //开关状态
            ,"sex": "女"
            ,"desc": "我爱 layui"
        })


    });


    function selectOneUser(name,id){
        var ids = $("#"+id).val();
        var names = $("#"+name).val();
        parent.layer.open({
            //skin: 'layui-layer-molv',
            title: '添加人员',
            maxmin: true,
            type: 2,
            content: '${pageContext.request.contextPath}/system/user/selectOneUser.do?ids='+ids+'&names='+names,
            area: ['800px', '520px'],
            end: function () {
                getUser(id,name);
            }
        });
    }

</script>

<%@include file="../admin/bottom.jsp"%>