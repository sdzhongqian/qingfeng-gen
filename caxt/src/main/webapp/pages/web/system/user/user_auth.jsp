<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../admin/top.jsp"%>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css" />
<form class="layui-form" action="" id="form">
<div style="width: 60%; margin-top:10px;" class="layui-form-item">
    <label class="layui-form-label">范围控制：</label>
    <div class="layui-input-block">
    <select name="allType" id="allType" lay-filter="allTypeClick" style="">
        <option value="1">本人</option>
        <option value="2">本组织</option>
        <option value="3">本组织及下属组织</option>
        <option value="4">全部</option>
        <option value="5">自定义</option>
    </select>
    </div>
</div>
<div style="margin:0 10px 0; border-right:1px solid #e3e3e3; border-bottom:1px solid #e3e3e3;">
    <table class="layui-table" style="margin:0;">
        <thead>
        <tr>
            <th width="60px;">编号</th>
            <th width="180px;">权限名称</th>
            <th colspan="2">范围控制</th>
        </tr>
        </thead>
        <tbody id="tbody">
        <%--<tr>--%>
            <%--<td>贤心</td>--%>
            <%--<td>汉族</td>--%>
            <%--<td>--%>
                <%--<select name="sex" lay-verify="required" style="width: 160px">--%>
                    <%--<option value="1">本人</option>--%>
                    <%--<option value="2">本组织</option>--%>
                    <%--<option value="3">本组织及下属组织</option>--%>
                    <%--<option value="4">全部</option>--%>
                    <%--<option value="5">自定义</option>--%>
                <%--</select>--%>
            <%--</td>--%>
            <%--<td>--%>
                <%--<input type="text" name="organize_names" id="organize_names" readonly placeholder="请选择组织" class="layui-input">--%>
                <%--<a href="javascript:;" class="layui-btn layui-btn-sm"  onclick="selectMoreOrg();"><i class="layui-icon layui-icon-more"></i></a>--%>
                <%--<input type="hidden" id="organize_ids" name="organize_ids" value="">--%>
            <%--</td>--%>
        <%--</tr>--%>
        </tbody>
    </table>

</div>
<div align="center" style="margin: 10px; 0">
    <input type="hidden" id="user_id" name="user_id" value="${pd.user_id}">
    <button class="layui-btn layui-btn-sm" lay-submit="" lay-filter="submit_form">保存</button>
    <button class="layui-btn layui-btn-danger layui-btn-sm" id="cancel">取消</button>
</div>
</form>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/commonLayer.js"></script>

<script type="text/javascript">

    $(document).ready(function (){
        var tt = '';
        $.ajax({
            url : "${pageContext.request.contextPath}/system/user/findUserMenuList.do?user_id=${pd.user_id}",
            data : {},
            type : 'GET',
            dataType : 'json',
            success : function(res) {
                console.log(res.data);
                if (res.success) {
                    $.each(res.data,function(i,n){
                        tt += '<tr>';
                        tt += '<td>'+(i+1)+'</td>';
                        tt += '<td>'+n.title+'</td>';
                        tt += '<td>';
                        tt += '<select name="type" id="type_'+n.id+'" onchange="selectType(\''+n.id+'\');" style="display: block;height: 28px">';
                        if(n.user_auth_type=='1'||n.user_auth_type==''||n.user_auth_type==null){
                            tt += '<option value="1" selected>本人</option>';
                            tt += '<option value="2">本组织</option>';
                            tt += '<option value="3">本组织及下属组织</option>';
                            tt += '<option value="4">全部</option>';
                            tt += '<option value="5">自定义</option>';
                        }
                        if(n.user_auth_type=='2'){
                            tt += '<option value="1">本人</option>';
                            tt += '<option value="2" selected>本组织</option>';
                            tt += '<option value="3">本组织及下属组织</option>';
                            tt += '<option value="4">全部</option>';
                            tt += '<option value="5">自定义</option>';
                        }
                        if(n.user_auth_type=='3'){
                            tt += '<option value="1">本人</option>';
                            tt += '<option value="2">本组织</option>';
                            tt += '<option value="3" selected>本组织及下属组织</option>';
                            tt += '<option value="4">全部</option>';
                            tt += '<option value="5">自定义</option>';
                        }
                        if(n.user_auth_type=='4'){
                            tt += '<option value="1">本人</option>';
                            tt += '<option value="2">本组织</option>';
                            tt += '<option value="3">本组织及下属组织</option>';
                            tt += '<option value="4" selected>全部</option>';
                            tt += '<option value="5">自定义</option>';
                        }
                        if(n.user_auth_type=='5'){
                            tt += '<option value="1">本人</option>';
                            tt += '<option value="2">本组织</option>';
                            tt += '<option value="3">本组织及下属组织</option>';
                            tt += '<option value="4">全部</option>';
                            tt += '<option value="5" selected>自定义</option>';
                        }

                        tt += '</select>';
                        tt += '</td>';
                        if(n.user_auth_type=='5'){
                            tt += '<td id="td_'+n.id+'" style="display: block; border-right:none; border-left:none;">';
                        }else{
                            tt += '<td id="td_'+n.id+'" style="display: none; border-right:none; border-left:none;">';
                        }
                        if(n.user_auth_organize_names!=undefined){
                            tt += '<input type="text" name="organize_names" id="organize_names_'+n.id+'" value="'+ n.user_auth_organize_names+'" readonly placeholder="请选择组织" class="layui-input"style="float:left; width:200px;">';
                            tt += '<a href="javascript:;" class="layui-btn layui-btn-sm"  onclick="selectOrgUser(\''+n.id+'\');"><i class="layui-icon layui-icon-more"></i></a>';
                            tt += '<input type="hidden" id="organize_ids_'+n.id+'" name="organize_ids" value="'+ n.user_auth_organize_ids+'">';
                            tt += '<input type="hidden" id="menu_id_'+n.id+'" name="menu_id" value="'+ n.id+'">';
                        }else{
                            if(n.user_auth_organize_names!='undefined'){
                                tt += '<input type="text" name="organize_names" id="organize_names_'+n.id+'" value="" readonly placeholder="请选择组织" class="layui-input"style="float:left; width:200px;">';
                                tt += '<a href="javascript:;" class="layui-btn layui-btn-sm"  onclick="selectOrgUser(\''+n.id+'\');"><i class="layui-icon layui-icon-more"></i></a>';
                                tt += '<input type="hidden" id="organize_ids_'+n.id+'" name="organize_ids" value="">';
                                tt += '<input type="hidden" id="menu_id_'+n.id+'" name="menu_id" value="'+ n.id+'">';
                            }
                        }

                        tt += '</td>';
                        tt += '</tr>';

                        $.each(n.children,function(j,m){
                            tt += '<tr>';
                            tt += '<td>'+(i+1)+'-'+(j+1)+'</td>';
                            tt += '<td>'+m.title+'</td>';
                            tt += '<td>';
                            tt += '<select name="type" id="type_'+m.id+'" onchange="selectType(\''+m.id+'\');" style="display: block;height: 28px">';
                            if(m.user_auth_type=='1'||m.user_auth_type==''||m.user_auth_type==null){
                                tt += '<option value="1" selected>本人</option>';
                                tt += '<option value="2">本组织</option>';
                                tt += '<option value="3">本组织及下属组织</option>';
                                tt += '<option value="4">全部</option>';
                                tt += '<option value="5">自定义</option>';
                            }
                            if(m.user_auth_type=='2'){
                                tt += '<option value="1">本人</option>';
                                tt += '<option value="2" selected>本组织</option>';
                                tt += '<option value="3">本组织及下属组织</option>';
                                tt += '<option value="4">全部</option>';
                                tt += '<option value="5">自定义</option>';
                            }
                            if(m.user_auth_type=='3'){
                                tt += '<option value="1">本人</option>';
                                tt += '<option value="2">本组织</option>';
                                tt += '<option value="3" selected>本组织及下属组织</option>';
                                tt += '<option value="4">全部</option>';
                                tt += '<option value="5">自定义</option>';
                            }
                            if(m.user_auth_type=='4'){
                                tt += '<option value="1">本人</option>';
                                tt += '<option value="2">本组织</option>';
                                tt += '<option value="3">本组织及下属组织</option>';
                                tt += '<option value="4" selected>全部</option>';
                                tt += '<option value="5">自定义</option>';
                            }
                            if(m.user_auth_type=='5'){
                                tt += '<option value="1">本人</option>';
                                tt += '<option value="2">本组织</option>';
                                tt += '<option value="3">本组织及下属组织</option>';
                                tt += '<option value="4">全部</option>';
                                tt += '<option value="5" selected>自定义</option>';
                            }
                            tt += '</select>';
                            tt += '</td>';
                            if(m.user_auth_type=='5'){
                                tt += '<td id="td_'+m.id+'" style="display: block;border-right:none; border-left:none;">';
                            }else{
                                tt += '<td id="td_'+m.id+'" style="display: none;border-right:none; border-left:none;">';
                            }
                            if(m.user_auth_organize_names!=undefined){
                                tt += '<input type="text" name="organize_names" id="organize_names_'+m.id+'" value="'+ m.user_auth_organize_names+'" readonly placeholder="请选择组织" class="layui-input" style="float:left; width:200px;">';
                                tt += '<a href="javascript:;" class="layui-btn layui-btn-sm"  onclick="selectOrgUser(\''+m.id+'\');"><i class="layui-icon layui-icon-more"></i></a>';
                                tt += '<input type="hidden" id="organize_ids_'+m.id+'" name="organize_ids" value="'+ m.user_auth_organize_ids+'">';
                                tt += '<input type="hidden" id="menu_id_'+m.id+'" name="menu_id" value="'+ m.id+'">';
                            }else{
                                tt += '<input type="text" name="organize_names" id="organize_names_'+m.id+'" value="" readonly placeholder="请选择组织" class="layui-input" style="float:left; width:200px;">';
                                tt += '<a href="javascript:;" class="layui-btn layui-btn-sm"  onclick="selectOrgUser(\''+m.id+'\');"><i class="layui-icon layui-icon-more"></i></a>';
                                tt += '<input type="hidden" id="organize_ids_'+m.id+'" name="organize_ids" value="">';
                                tt += '<input type="hidden" id="menu_id_'+m.id+'" name="menu_id" value="'+ m.id+'">';
                            }

                            tt += '</td>';
                            tt += '</tr>';



                            $.each(m.children_children,function(k,kn){
                                tt += '<tr>';
                                tt += '<td>'+(i+1)+'-'+(j+1)+'-'+(k+1)+'</td>';
                                tt += '<td>'+kn.title+'</td>';
                                tt += '<td>';
                                tt += '<select name="type" id="type_'+kn.id+'" onchange="selectType(\''+kn.id+'\');" style="display: block;height: 28px">';
                                if(kn.user_auth_type=='1'||kn.user_auth_type==''||kn.user_auth_type==null){
                                    tt += '<option value="1" selected>本人</option>';
                                    tt += '<option value="2">本组织</option>';
                                    tt += '<option value="3">本组织及下属组织</option>';
                                    tt += '<option value="4">全部</option>';
                                    tt += '<option value="5">自定义</option>';
                                }
                                if(kn.user_auth_type=='2'){
                                    tt += '<option value="1">本人</option>';
                                    tt += '<option value="2" selected>本组织</option>';
                                    tt += '<option value="3">本组织及下属组织</option>';
                                    tt += '<option value="4">全部</option>';
                                    tt += '<option value="5">自定义</option>';
                                }
                                if(kn.user_auth_type=='3'){
                                    tt += '<option value="1">本人</option>';
                                    tt += '<option value="2">本组织</option>';
                                    tt += '<option value="3" selected>本组织及下属组织</option>';
                                    tt += '<option value="4">全部</option>';
                                    tt += '<option value="5">自定义</option>';
                                }
                                if(kn.user_auth_type=='4'){
                                    tt += '<option value="1">本人</option>';
                                    tt += '<option value="2">本组织</option>';
                                    tt += '<option value="3">本组织及下属组织</option>';
                                    tt += '<option value="4" selected>全部</option>';
                                    tt += '<option value="5">自定义</option>';
                                }
                                if(kn.user_auth_type=='5'){
                                    tt += '<option value="1">本人</option>';
                                    tt += '<option value="2">本组织</option>';
                                    tt += '<option value="3">本组织及下属组织</option>';
                                    tt += '<option value="4">全部</option>';
                                    tt += '<option value="5" selected>自定义</option>';
                                }
                                tt += '</select>';
                                tt += '</td>';
                                if(kn.user_auth_type=='5'){
                                    tt += '<td id="td_'+kn.id+'" style="display: block;border-right:none; border-left:none;">';
                                }else{
                                    tt += '<td id="td_'+kn.id+'" style="display: none;border-right:none; border-left:none;">';
                                }
                                if(kn.user_auth_organize_names!=undefined){
                                    tt += '<input type="text" name="organize_names" id="organize_names_'+kn.id+'" value="'+ kn.user_auth_organize_names+'" readonly placeholder="请选择组织" class="layui-input" style="float:left; width:200px;">';
                                    tt += '<a href="javascript:;" class="layui-btn layui-btn-sm"  onclick="selectOrgUser(\''+kn.id+'\');"><i class="layui-icon layui-icon-more"></i></a>';
                                    tt += '<input type="hidden" id="organize_ids_'+kn.id+'" name="organize_ids" value="'+ kn.user_auth_organize_ids+'">';
                                    tt += '<input type="hidden" id="menu_id_'+kn.id+'" name="menu_id" value="'+ kn.id+'">';
                                }else{
                                    tt += '<input type="text" name="organize_names" id="organize_names_'+kn.id+'" value="" readonly placeholder="请选择组织" class="layui-input" style="float:left; width:200px;">';
                                    tt += '<a href="javascript:;" class="layui-btn layui-btn-sm"  onclick="selectOrgUser(\''+kn.id+'\');"><i class="layui-icon layui-icon-more"></i></a>';
                                    tt += '<input type="hidden" id="organize_ids_'+kn.id+'" name="organize_ids" value="">';
                                    tt += '<input type="hidden" id="menu_id_'+kn.id+'" name="menu_id" value="'+ kn.id+'">';
                                }

                                tt += '</td>';
                                tt += '</tr>';
                            });

                        });


                    });
                    $("#tbody").html(tt);


//                    $.each(res.data,function(i,n){
//                        $("#type_"+ n.user_auth_id).find("option[value='"+ n.user_auth_type+"']").attr("selected",true);
//                        if(n.user_auth_type==5){
//                            $("#td_"+ n.user_auth_id).css("display","block");
//                        }
//                        $.each(n.children,function(j,m){
//                            $("#type_"+ m.user_auth_id).find("option[value='"+ m.user_auth_type+"']").attr("selected",true);
//                            if(m.user_auth_type==5){
//                                alert(1);
//                                $("#td_"+ m.user_auth_id).css("display","block");
//                            }
//                        });
//                    });
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

        form.on('select(allTypeClick)', function(obj){
            var type = $("#allType").find("option:selected").val();
            $('select[id^="type_"]').each(function () {
                $(this).find("option[value='"+type+"']").attr("selected",true);
            });
            if(type==5){
                $('td[id^="td_"]').each(function () {
                    $(this).css("display","block");
                });
            }else{
                $('td[id^="td_"]').each(function () {
                    $(this).css("display","none");
                });
            }
        });

        //监听提交
        form.on('submit(submit_form)', function(data){
            var index = layer.load(1, {
                shade: [0.1,'#393D49'] //0.1透明度的白色背景
            });
            $.ajax({
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/system/user/saveUserAuth.do" ,//url
                data: $('#form').serialize(),
                success: function (res) {
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
                },
                error : function() {
                    layer.msg("异常！");
                }
            });

            return false;
        });
    });



    function selectType(id){
        var type = $("#type_"+id).find("option:selected").val();
        if(type==5){
            $("#td_"+id).css("display","block");
        }else{
            $("#td_"+id).css("display","none");
        }
    }


    //选择组织选择人
    function selectOrgUser(id){
        var ids = $("#organize_ids_"+id).val();
        var names = $("#organize_names_"+id).val();
        parent.layer.open({
            //skin: 'layui-layer-molv',
            title: '添加组织人员',
            maxmin: true,
            type: 2,
            content: '${pageContext.request.contextPath}/system/organize/selectOrgUser.do?ids='+ids+'&names='+names,
            area: ['800px', '520px'],
            end: function () {
                getOrg("organize_ids_"+id,"organize_names_"+id);
            }
        });
    }

</script>
<%@include file="../admin/bottom.jsp"%>