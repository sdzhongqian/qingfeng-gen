<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../admin/top.jsp"%>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css" />
<form class="layui-form" action="" id="form">
<div>
    <ul id="treeDemo" class="ztree"></ul>
</div>
<div class="layui-form-item" align="center">
    <input type="hidden" id="role_id" name="role_id" value="${pd.role_id}">
    <input type="hidden" id="ids" name="ids" value="">
    <button class="layui-btn layui-btn-sm" lay-submit="" lay-filter="submit_form">保存</button>
    <button class="layui-btn layui-btn-danger layui-btn-sm" id="cancel">取消</button>
</div>
</form>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/ztree/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/ztree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/ztree/js/jquery.ztree.excheck.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/layui/layui.js"></script>

<script type="text/javascript">
    var setting = {
        check: {
            enable: true
        },
        data: {
            simpleData: {
                enable: true
            }
        },
        callback: {
            onCheck: onCheck
        }
    };


    $(document).ready(function (){
        var treeNodes = '';
        $.ajax({
            url : "${pageContext.request.contextPath}/system/role/findRoleMenuList.do?role_id=${pd.role_id}",
            data : {},
            type : 'GET',
            dataType : 'json',
            success : function(res) {
                if (res.success) {
                    treeNodes += "[{id:'0',pId:'parent',name:'菜单信息'},";
                    $.each(res.data,function(i,n){
                        treeNodes += "{";
                        treeNodes += "id:'"+n.id+"'";
                        treeNodes += ",pId:'"+n.parent_id+"'";
                        treeNodes += ",name:'"+n.name+"'";
                        treeNodes += ",checked:'"+n.checked+"'";
                        treeNodes += "},";
                    });
                    treeNodes = treeNodes.substr(0,treeNodes.length-1)+"]";
                    if(treeNodes != ']'){
                        $.fn.zTree.init($("#treeDemo"), setting ,eval(treeNodes));
                        openAll();
                        autoCheck();
                    }
                }else{
                    if(res.loseSession=='loseSession'){
                        loseSession(res.msg,res.url)
                    }else{
                        layer.msg(res.msg, {time: 2000});
                    }
                }

            },
            error : function(xhr, status) {
//                alert('Sorry, there was a problem!');
            },
            complete : function(xhr, status) {
            }
        });
    });

    function onCheck(e, treeId, treeNode) {
        var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
        var nodes = treeObj.getCheckedNodes(true);
        var ids = [];
        for (var i = 0; i < nodes.length; i++) {
            ids.push(nodes[i].id);
        }
        $("#ids").val(ids);
    }

    function autoCheck(){
        var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
        var nodes = treeObj.getCheckedNodes(true);
        var ids = [];
        for (var i = 0; i < nodes.length; i++) {
            ids.push(nodes[i].id);
        }
        $("#ids").val(ids);
    }

    /*展开全部*/
    function openAll(){
        var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
        treeObj.expandAll(true);
    }


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
            var index = layer.load(1, {
                shade: [0.1,'#393D49'] //0.1透明度的白色背景
            });
            $.post("${pageContext.request.contextPath}/system/role/saveRoleMenu.do",data.field,function(res){
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
<%@include file="../admin/bottom.jsp"%>