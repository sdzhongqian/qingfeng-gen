<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../system/admin/top.jsp"%>
<form class="layui-form" action="" id="form">
    <table width="90%">
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">所属家族：</label></td>
            <td colspan="3">
                <select name="family_id" id="family_id" onchange="selectFamily();" readonly="" lay-filter='selectFamily' style="height: 30px;width: 190px;float: right;"  class="layui-input layui-unselect tfield-all">
                    <c:forEach items="${familyLs}" var="var" varStatus="status">
                        <option value="${var.id}" <c:if test="${var.id==p.family_id}"> selected </c:if>>${var.name}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">所属世代：</label></td>
            <td colspan="3">
                <select name="generation_id" id="generation_id" onchange="selectGeneration();" readonly="" lay-filter='selectGeneration' style="height: 30px;width: 190px;float: right;"  class="layui-input layui-unselect tfield-all">
                </select>
            </td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">父亲名称：</label></td>
            <td colspan="3">
                <select name="father_id" id="father_id" onchange="" style="height: 30px;width: 190px;float: right;" readonly="" class="layui-input layui-unselect tfield-all">
                </select>
            </td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">姓名：</label></td>
            <td colspan="3"><input type="text" name="name" value="${p.name}" lay-verify="required" readonly autocomplete="off" placeholder="请输入家族名称" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">家中排行：</label></td>
            <td colspan="3">
                <select name="level" id="level" onchange="" style="height: 30px;width: 190px;float: right;" readonly="" class="layui-input layui-unselect tfield-all">
                    <c:forEach items="${levelLs}" var="var" varStatus="status">
                        <option value="${var.id}" <c:if test="${var.id==p.level}"> selected </c:if>>${var.name}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">添加妻子</label></td>
            <td colspan="3"><input type="checkbox" name="open_wife" readonly lay-filter="openButton" <c:if test="${p.open_wife == 'on'}"> checked </c:if>  title="开启【添加妻子】功能"></td>
        </tr>
        <tr id="button_tr" style="display: none;">
            <td width="20%" align="right"><label class="layui-form-label">妻子</label></td>
            <td colspan="3">
                <div style="width:564px; overflow:auto;">
                    <table class="layui-table" style="width:564px;">
                        <thead>
                        <tr>
                            <th>姓名</th>
                            <th>介绍</th>
                            <th>排行</th>
                            <th>备注</th>
                            <%--<th>操作</th>--%>
                        </tr>
                        </thead>
                        <tbody id="table">
                        <c:if test="${p.open_wife == 'on'}">
                            <c:forEach items="${list}" var="var" varStatus="status">
                                <tr id="tr_ls${var.id}">
                                    <td><input type="hidden" name="w_id" value="${var.id}"><input type="text" name="w_name" lay-verify="title" value="${var.name}" readonly autocomplete="off" placeholder="请输入家属姓名" class="layui-input"></td>
                                    <td><input type="text" name="w_content" lay-verify="title" value="${var.content}" readonly autocomplete="off" placeholder="请输入家属介绍" class="layui-input"></td>
                                    <td><input type="text" name="w_level" lay-verify="title" value="${var.level}" readonly autocomplete="off" placeholder="请输入家属排行" class="layui-input"></td>
                                    <td><input type="text" name="w_remark" lay-verify="title" autocomplete="off" placeholder="请输入备注" value="${var.remark}" readonly class="layui-input"></td>
                                    <%--<td style="width: 78px;"><div class="layui-btn-group">--%>
                                    <%--</div>--%>
                                    <%--</td>--%>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${p.open_wife != 'on'}">
                            <tr>
                                <td colspan="5">无数据</td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">排序：</label></td>
            <td colspan="3"><input type="text" name="order_by" value="${p.order_by}" readonly lay-verify="title" autocomplete="off" placeholder="请输入排序" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">内容介绍：</label></td>
            <td colspan="3"><textarea name="content" placeholder="请输入内容介绍" readonly lay-verify="remark" class="layui-textarea" style=" margin: 0 0 10px;">${p.content}</textarea></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">备注：</label></td>
            <td colspan="3"><textarea name="remark" placeholder="请输入备注" readonly lay-verify="remark" class="layui-textarea">${p.remark}</textarea></td>
        </tr>
        <tr>
            <td style="text-align: center; padding-top: 10px;" colspan="4">
                <button class="layui-btn layui-btn-danger layui-btn-sm" id="cancel">关闭</button>
            </td>
        </tr>
    </table>
</form>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/layui/layui.js"></script>
<script>
    var form,$;
    layui.use(['form'], function(){
        form = layui.form;
        $ = layui.$;


        $('#cancel').on('click',function (){
            var index = parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
        })
    });


    var open_wife = '${p.open_wife}';
    $(document).ready(function(){
        selectFamily();
        if(open_wife=='on'){
            $("#button_tr").show();
        }
    });



    var generation_id='${p.generation_id}';
    function selectFamily(){
        var family_id = $('#family_id option:selected') .val();
        $.ajax({
            type: "GET",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "${pageContext.request.contextPath}/gen/generation/findList.do?family_id="+family_id+"&status=Y",//url
            data: "",
            success: function (res) {
                if (res.success) {
                    var tt = '';
                    $.each(res.data,function(i,n){
                        if(generation_id== n.id){
                            tt += '<option value="'+ n.id+'" selected>'+ n.name+'</option>';
                        }else{
                            tt += '<option value="'+ n.id+'">'+ n.name+'</option>';
                        }
                    });
                    $("#generation_id").html(tt);
                    selectGeneration();
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
    }


    var father_id='${p.father_id}';
    function selectGeneration(){
        var family_id = $('#family_id option:selected') .val();
        var generation_id = $('#generation_id option:selected') .val();
        $.ajax({
            type: "GET",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "${pageContext.request.contextPath}/gen/member/findFatherList.do?family_id="+family_id+"&generation_id="+generation_id,//url
            data: "",
            success: function (res) {
                console.log(res);
                if (res.success) {
                    var tt = '';
                    $.each(res.data,function(i,n){
                        if(father_id== n.id){
                            tt += '<option value="'+ n.id+'" selected>'+ n.name+'</option>';
                        }else{
                            tt += '<option value="'+ n.id+'">'+ n.name+'</option>';
                        }
                    });
                    $("#father_id").html(tt);
                    form.render('select');
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
    }


    var index = 1;
    function addLine(){
        index ++;
        var tt = '<tr id="tr_'+index+'">';
        tt += '<td><input type="hidden" name="w_id" value=""><input type="text" name="w_name" lay-verify="title" autocomplete="off" placeholder="请输入家属姓名" class="layui-input"></td>';
        tt += '<td><input type="text" name="w_content" lay-verify="title" autocomplete="off" placeholder="请输入家属介绍" class="layui-input"></td>';
        tt += '<td><input type="text" name="w_level" lay-verify="title" autocomplete="off" placeholder="请输入家属排行" class="layui-input"></td>';
        <%--tt += '<td><select name="w_level" id="w_level" onchange="" style="height: 30px;width: 190px;float: right;"  class="layui-input layui-unselect tfield-all">';--%>
        <%--$.each(${levelLsJson},function(i,n){--%>
        <%--tt += '<option value="'+ n.id+'">'+ n.name+'</option>';--%>
        <%--});--%>
        <%--tt += '</select></td>';--%>
        tt += '<td><input type="text" name="w_remark" lay-verify="title" autocomplete="off" placeholder="请输入备注" value="" class="layui-input"></td>';
        tt += '<td style="width: 78px;"><div class="layui-btn-group"><button type="button" onclick="addLine();" class="layui-btn layui-btn-xs"><i class="layui-icon"></i></button><button type="button" onclick="delLine(\''+index+'\',\'\');" class="layui-btn layui-btn-xs layui-btn-danger"><i class="layui-icon"></i></button></div></td>';
        tt += '</tr>';
        $("#table tr:last").after(tt);
    }

    function delLine(index,id){
        $("#tr_"+index).remove();
        //删除
        if(id!=''){
            $.get("${pageContext.request.contextPath}/gen/member/delWife.do?ids="+id,null,function(res){
                if (res.success) {
                    layer.msg("数据删除成功。", {time: 2000});
                    location.replace(location.href);
                }else{
                    if(res.loseSession=='loseSession'){
                        loseSession(res.msg,res.url)
                    }else{
                        layer.msg(res.msg, {time: 2000});
                    }
                }

            },'json');
        }
    }


</script>

<%@include file="../../system/admin/bottom.jsp"%>