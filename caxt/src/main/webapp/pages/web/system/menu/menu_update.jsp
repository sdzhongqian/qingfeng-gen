<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../admin/top.jsp"%>
<div id="jpstr" style="margin-top: 10px;">
    <button class="layui-btn layui-btn-sm" onclick="jprint();">打印</button>
    <button class="layui-btn layui-btn-sm" onclick="toExport('menu','${p.id}');">导出</button>
</div>
<form class="layui-form" action="${pageContext.request.contextPath}/system/menu/update.do" id="form">
    <table width="90%">
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">父级名称：</label></td>
            <td colspan="3">
                <c:if test="${p.parent_name==null}"><input type="text" readonly autocomplete="off" placeholder="请输入父级名称" value="菜单信息" class="layui-input"></c:if>
                <c:if test="${p.parent_name!=null}"><input type="text" readonly autocomplete="off" placeholder="请输入父级名称" value="${p.parent_name}" class="layui-input"></c:if>
            </td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">名称：</label></td>
            <td colspan="3"><input type="text" name="name" lay-verify="required|title" autocomplete="off" placeholder="请输入名称" value="${p.name}" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">编号：</label></td>
            <td colspan="3"><input type="text" name="code" lay-verify="title" autocomplete="off" placeholder="请输入编号" value="${p.code}" class="layui-input"></td>
        </tr>
        <c:if test="${p.type=='menu'}">
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">分类：</label></td>
            <td colspan="3">
                <select name="classify" lay-verify="required">
                    <option value="0" <c:if test="${p.classify=='0'}"> selected </c:if>>系统菜单</option>
                    <option value="1" <c:if test="${p.classify=='1'}"> selected </c:if>>自定义菜单</option>
                </select>
            </td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">URL：</label></td>
            <td colspan="3"><input type="text" name="url" lay-verify="title" autocomplete="off" placeholder="请输入URL" value="${p.url}" class="layui-input"></td>
        </tr>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">icon：</label></td>
            <td colspan="3"><input type="text" name="icon" lay-verify="title" autocomplete="off" placeholder="请输入icon" value="${p.icon}" class="layui-input"></td>
        </tr>
        </c:if>
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">排序：</label></td>
            <td colspan="3"><input type="text" name="order_by" lay-verify="title" autocomplete="off" placeholder="请输入排序" value="${p.order_by}" class="layui-input"></td>
        </tr>
        <c:if test="${p.type=='menu'}">
        <tr>
            <td width="20%" align="right"><label class="layui-form-label">功能权限</label></td>
            <td colspan="3"><input type="checkbox" name="open_button" lay-filter="openButton" <c:if test="${pd.open_button == 'Y'}"> checked </c:if> title="开启功能权限"></td>
        </tr>
        <tr id="button_tr" style="display: none;">
            <td width="20%" align="right"><label class="layui-form-label">功能按钮</label></td>
            <td colspan="3">
                <div style="width:564px; overflow:auto;">
                    <table class="layui-table" style="width:564px;">
                        <thead>
                        <tr>
                            <th>名称</th>
                            <th>编号</th>
                            <th>排序</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="table">
                        <c:if test="${pd.open_button == 'Y'}">
                            <c:forEach items="${list}" var="var" varStatus="status">
                                <tr id="tr_ls${var.id}">
                                    <td><input type="text" name="button_name" lay-verify="title" value="${var.name}" autocomplete="off" placeholder="请输入名称" class="layui-input"></td>
                                    <td><input type="text" name="button_code" lay-verify="title" value="${var.code}" autocomplete="off" placeholder="请输入编号" class="layui-input"></td>
                                    <td><input type="text" name="button_order_by" lay-verify="title" autocomplete="off" placeholder="请输入排序" value="${var.order_by}" class="layui-input"></td>
                                    <td style="width: 78px;">
                                        <div class="layui-btn-group">
                                            <button onclick="addLine();" type="button" class="layui-btn layui-btn-xs"><i class="layui-icon"></i></button>
                                            <c:if test="${status.index>0}">
                                                <button type="button" onclick="delLine('ls${var.id}');" class="layui-btn layui-btn-xs layui-btn-danger"><i class="layui-icon"></i></button>
                                            </c:if>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${pd.open_button == 'N'}">
                            <tr>
                                <td><input type="text" name="button_name" lay-verify="title" autocomplete="off" placeholder="请输入名称" class="layui-input"></td>
                                <td><input type="text" name="button_code" lay-verify="title" autocomplete="off" placeholder="请输入编号" class="layui-input"></td>
                                <td><input type="text" name="button_order_by" lay-verify="title" autocomplete="off" placeholder="请输入排序" value="1" class="layui-input"></td>
                                <td style="width: 78px;"><div class="layui-btn-group"><button onclick="addLine();" type="button" class="layui-btn layui-btn-xs"><i class="layui-icon"></i></button></div></td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                </div>
            </td>
        </tr>
        </c:if>

        <tr>
            <td width="20%" align="right"><label class="layui-form-label">备注：</label></td>
            <td colspan="3"><textarea name="remark" placeholder="请输入备注" class="layui-textarea">${p.remark}</textarea></td>
        </tr>
        <tr id="operate_button">
            <td style="text-align: center; padding-top: 10px;" colspan="4">
             <div class="layui-form-item">
                <input type="hidden" name="menu_cascade" value="${p.menu_cascade }"/>
                <input type="hidden" name="id" value="${p.id}">
                <input type="hidden" name="level" value="${p.level }"/>
                <button class="layui-btn layui-btn-sm" lay-submit="" lay-filter="submit_form">保存</button>
                <button class="layui-btn layui-btn-danger layui-btn-sm" id="cancel">取消</button>
              </div>
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
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
        });

        //监听提交
        form.on('submit(submit_form)', function(data){
            <%--$.post("${pageContext.request.contextPath}/system/menu/update.do",data.field,function(res){--%>
                <%--if(res==1){--%>
                    <%--layer.msg("数据保存成功。", {time: 2000});--%>
                    <%--var index = parent.layer.getFrameIndex(window.name);--%>
                    <%--parent.layer.close(index);--%>
                <%--}else{--%>
                    <%--layer.msg("数据保存失败。", {time: 2000});--%>
                <%--}--%>
            <%--},'json');--%>

            $.ajax({
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/system/menu/update.do" ,//url
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
                    layer.msg("数据保存失败。", {time: 2000});
                }
            });

            return false;
        });

        //监听状态操作
        form.on('checkbox(openButton)', function(obj){
            if(obj.elem.checked){
                $("#button_tr").show();
            }else{
                $("#button_tr").hide();
            }
        });

    });

    var open_button = '${pd.open_button}';
    $(document).ready(function(){
        if(open_button=='Y'){
            $("#button_tr").show();
        }
    });

    var index = 1;
    function addLine(){
        index ++;
        var tt = '<tr id="tr_'+index+'">';
        tt += '<td><input type="text" name="button_name" lay-verify="title" autocomplete="off" placeholder="请输入名称" class="layui-input"></td>';
        tt += '<td><input type="text" name="button_code" lay-verify="title" autocomplete="off" placeholder="请输入编号" class="layui-input"></td>';
        tt += '<td><input type="text" name="button_order_by" lay-verify="title" autocomplete="off" placeholder="请输入排序" value="'+index+'" class="layui-input"></td>';
        tt += '<td style="width: 78px;"><div class="layui-btn-group"><button type="button" onclick="addLine();" class="layui-btn layui-btn-xs"><i class="layui-icon"></i></button><button type="button" onclick="delLine(\''+index+'\');" class="layui-btn layui-btn-xs layui-btn-danger"><i class="layui-icon"></i></button></div></td>';
        tt += '</tr>';
        $("#table tr:last").after(tt);
    }

    function delLine(index){
        $("#tr_"+index).remove();
    }


</script>

<%@include file="../admin/bottom.jsp"%>