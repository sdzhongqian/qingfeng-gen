<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../admin/top.jsp"%>
<form class="layui-form" id="form" action="">
    <div id="zhongxin">
        <div style="color: green;font-weight: bolder;font-size: 20px">人员导入组织:【${pd.organize_name}】</div>
        <button type="button" class="layui-btn" id="test1">
            <i class="layui-icon">&#xe67c;</i>上传附件
        </button>
        <div id='div_upload'></div>
        <div style="text-align: center">
            <input type="hidden" name="file_id" id="file_id" value="">
            <input type="hidden" name="file_path" id="file_path" value="">
            <input type="hidden" name="organize_id" value="${pd.organize_id}">
            <button class="layui-btn layui-btn-sm" lay-submit="" lay-filter="submit_form">保存</button>
            <button class="layui-btn layui-btn-danger layui-btn-sm" id="cancel">取消</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/layui/layui.js"></script>

	<script type="text/javascript">
        layui.use(['form','upload'], function(){
            var form = layui.form
                    ,layer = layui.layer
                    ,upload = layui.upload
                    ,$ = layui.$;

            $('#cancel').on('click',function (){
                var file_id = $("#file_id").val();
                var file_path = $("#file_path").val();
                if(file_id != null && file_id != ''){
                    delFile(file_id,file_path);
                }
                var index = parent.layer.getFrameIndex(window.name);
                parent.layer.close(index);
            })

            upload.render({
                elem: '#test1'
                ,url: '${pageContext.request.contextPath}/common/upload/uploadUserFile.do'
                ,auto: true
                ,multiple: true
                ,accept:'file'
                ,done: function(res){
                    if(res.success){
                        console.log(res.data.id);
                        var tt = '<div>'+res.data.name+'<a style="color: red;" onclick="delFile(\''+res.data.id+'\',\''+res.data.file_path+'\');">删除</a></div>';
                        $("#div_upload").html(tt);
                        $("#file_id").val(res.data.id);
                        $("#file_path").val(res.data.file_path);
                    }else{
                        if(res.loseSession=='loseSession'){
                            loseSession(res.msg,res.url);
                        }else{
                            layer.msg(res.msg, {time: 2000});
                        }
                    }
                },
                error : function() {
                    layer.msg("异常！");
                }
            });

            //监听提交
            form.on('submit(submit_form)', function(data){
                save();
                return false;
            });
        });

        function save(){
            var file_id = $("#file_id").val();
            var file_path = $("#file_path").val();
            if(file_id == null || file_id == ''){
                layer.msg("请上传导入数据文件。", {time: 2000});
            }else{
                $.ajax({
                    type: "POST",//方法类型
                    dataType: "json",//预期服务器返回的数据类型
                    url: "${pageContext.request.contextPath}/system/user/saveImportExcel.do" ,//url
                    data: $('#form').serialize(),
                    success: function (res) {
                        if (res.success) {
                            delFile(file_id,file_path);
                            layer.msg("数据保存成功。", {time: 2000});
                            var index = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(index);
                        }else{
                            delFile(file_id,file_path);
                            if(res.loseSession=='loseSession'){
                                loseSession(res.msg,res.url);
                            }else{
                                layer.alert(res.msg);
                            }
                        }
                    },
                    error : function() {
                        delFile(file_id,file_path);
                        layer.msg("异常！");
                    }
                });
            }
        }

        //删除文件
        function delFile(id,file_path){
            $.ajax({
                type: "GET",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/common/upload/delUserFile.do?id="+id+"&file_path="+file_path,//url
                data: "",
                success: function (res) {
                    if (res.success) {
                        $("#div_upload").html("");
                        $("#file_path").val("");
                        $("#file_id").val("");
                        //layer.msg("文件删除成功。", {time: 2000});
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
        }
		</script>

<%@include file="../../system/admin/bottom.jsp"%>