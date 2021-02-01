<%@ page import="com.wdata.base.util.DatabaseUtil" %>
<%@ page import="com.wdata.base.util.DateTimeUtil" %>

</body>

<script>
    function jprint(){
        $("#jpstr").hide();
        $("#operate_button").hide();
        $("#search").hide();
        $("#mydisplay_add_1").hide();
        $("#mydisplay_del_1").hide();
        $("#mydisplay_").hide();
        $("#print_hide").hide();
        window.print();
        $("#jpstr").show();
        $("#operate_button").show();
        $("#search").show();
        $("#mydisplay_add_1").show();
        $("#mydisplay_del_1").show();
        $("#mydisplay_").show();
        $("#print_hide").show();
    }

    //导出
    function toExport(lx,id){
       // window.open("${pageContext.request.contextPath}/system/user/toExport.do?lx="+lx+"&id="+id);
        parent.layer.open({
            title: 'excel',
            maxmin: true,
            type: 2,
            content: '${pageContext.request.contextPath}/system/user/toExport.do?lx='+lx+'&id='+id,
            area: ['800px', '500px']
        });
    }

    function importExcel(){
        $("#table_report").tableExport({type:"excel",escape:"false"});
    }
    //导出
    function exportToExcel(){
        $("#operate_button").hide();
        tableToExcel('tb_excel','<%=DateTimeUtil.getDateTimeStr()%>','sheet');
        $("#operate_button").show();
    }
    function Cleanup(){
        window.clearInterval(idTmr);
        CollectGarbage();
    }
    var tableToExcel = (function (){
        var uri = 'data:application/vnd.ms-excel;base64,',
                template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]-->'+
                        ' <style type="text/css">' +
                        'table td {' +
                        'border: 1px solid #939393;' +
                        'width: 200px;' +
                        'height: 36px;' +
                        ' }' +
                        'table th {' +
                        'border: 1px solid #939393;' +
                        ' }' +
                        '</style>' +
                        '</head><body>{table}</body></html>',
                base64 = function (s) {
                    return window.btoa(unescape(encodeURIComponent(s)));
                },
                format = function (s, c){
                    return s.replace(/{(\w+)}/g, function (m, p) { return c[p]; });
                };
        return function (table,filename,sheetname){
//这里创建一个<a/>标记利用a标记的download属性来自定义Excel文件名,解决button按钮触发下载无法自定义Excel文件名的问题
            var a = $('<a id="dlink" style="display:none;"/>');
            $(document.body).append(a);
            if (!table.nodeType) table = document.getElementById(table);
            $("#area_position_1").remove();
            $("#area_position_2").remove();
            $("th[id=mydisplay_]").remove();
            $("td[id=mydisplay_]").remove();
            var ctx = { worksheet: sheetname || 'Worksheet', table: table.innerHTML }
            a.attr("href",uri + base64(format(template, ctx)));
            a.attr("download",filename);//这里是关键所在,当点击之后,设置a标签的属性,这样就可以更改excel文件的名字了
            document.getElementById("dlink").click();
        }
    })();

    function loseSession(msg,url){
        layer.msg(msg,{
            offset:['30%'],
            time: 2000 //2秒关闭（如果不配置，默认是3秒）
        },function(){
            outLogin(url);
        });
    }

    function outLogin(url){
        window.open (url,'_top')
    }

</script>

</html>