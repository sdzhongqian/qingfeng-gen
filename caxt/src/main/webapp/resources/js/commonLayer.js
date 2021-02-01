/**
 * Created by 青锋 on 2018-8-29.
 */
//设置单选、多选用户
function defineUser(ids_key,names_key){
    sessionStorage.setItem('ids', ids_key);
    sessionStorage.setItem('names', names_key);
}
//获取单选、多选用户
function getUser(ids,names){
    console.log("#"+names+"#");
    $("#"+ids).val(sessionStorage.getItem("ids"));
    $("#"+names).val(sessionStorage.getItem("names"));
    sessionStorage.removeItem("ids");
    sessionStorage.removeItem("names");
}

//获取单选、多选用户-自定义弹出
function getMUser(field_name,ids,names){
    console.log("#"+names+"#");
    $("#"+ids).val(sessionStorage.getItem("ids"));
    $("#"+names).val(sessionStorage.getItem("names"));
    if(sessionStorage.getItem("ids")!=''&&sessionStorage.getItem("ids")!=null){
        $("#"+field_name).val(sessionStorage.getItem("ids")+"#"+sessionStorage.getItem("names"));
    }else{
        $("#"+field_name).val("");
    }

    sessionStorage.removeItem("ids");
    sessionStorage.removeItem("names");
}


//设置单选、多选组织
function defineOrg(ids_key,names_key){
    sessionStorage.setItem('ids', ids_key);
    sessionStorage.setItem('names', names_key);
}
//获取单选、多选组织
function getOrg(ids,names){
    $("#"+ids).val(sessionStorage.getItem("ids"));
    $("#"+names).val(sessionStorage.getItem("names"));
    sessionStorage.removeItem("ids");
    sessionStorage.removeItem("names");
}


//获取单选、多选组织-自定义弹出
function getMOrg(field_name,ids,names){
    $("#"+ids).val(sessionStorage.getItem("ids"));
    $("#"+names).val(sessionStorage.getItem("names"));
    if(sessionStorage.getItem("ids")!=''&&sessionStorage.getItem("ids")!=null){
        $("#"+field_name).val(sessionStorage.getItem("ids")+"#"+sessionStorage.getItem("names"));
    }else{
        $("#"+field_name).val("");
    }
    sessionStorage.removeItem("ids");
    sessionStorage.removeItem("names");
}

//设置默认值
function setMrz(msg){
    sessionStorage.setItem('msg', msg);
}
//获取默认值
function getMrz(index){
    $("#field_value"+index).val(sessionStorage.getItem("msg"));
    sessionStorage.removeItem("msg");
}


//设置默认值
function setJsMrz(msg){
    sessionStorage.setItem('msg', msg);
}

//获取默认值
function getJsMrz(index){
    $("#field_value"+index).val(sessionStorage.getItem("msg"));
    sessionStorage.removeItem("msg");
}



//设置默认值
function setParam(param1,param2,param3){
    sessionStorage.setItem('param1', param1);
    sessionStorage.setItem('param2', param2);
    sessionStorage.setItem('param3', param3);
}
//获取默认值
function getParam(param1,param2,param3){
    $("#"+param1).val(sessionStorage.getItem("param1"));
    $("#"+param2).val(sessionStorage.getItem("param2"));
    $("#"+param3).val(sessionStorage.getItem("param3"));
    sessionStorage.removeItem("param1");
    sessionStorage.removeItem("param2");
    sessionStorage.removeItem("param3");
}


//设置默认值
function setImportParam(param1,param2,param3,param4,param5,param6,param7,param8){
    sessionStorage.setItem('param1', param1);
    sessionStorage.setItem('param2', param2);
    sessionStorage.setItem('param3', param3);
    sessionStorage.setItem('param4', param4);
    sessionStorage.setItem('param5', param5);
    sessionStorage.setItem('param6', param6);
    sessionStorage.setItem('param7', param7);
    sessionStorage.setItem('param8', param8);
}
//获取默认值
function getImportParam(param1,param2,param3,param4,param5,param6,param7,param8){
    $("#"+param1).val(sessionStorage.getItem("param1"));
    $("#"+param2).val(sessionStorage.getItem("param2"));
    $("#"+param3).val(sessionStorage.getItem("param3"));
    $("#"+param4).val(sessionStorage.getItem("param4"));
    $("#"+param5).val(sessionStorage.getItem("param5"));
    $("#"+param6).val(sessionStorage.getItem("param6"));
    $("#"+param7).val(sessionStorage.getItem("param7"));
    $("#"+param8).val(sessionStorage.getItem("param8"));
    sessionStorage.removeItem("param1");
    sessionStorage.removeItem("param2");
    sessionStorage.removeItem("param3");
    sessionStorage.removeItem("param4");
    sessionStorage.removeItem("param5");
    sessionStorage.removeItem("param6");
    sessionStorage.removeItem("param7");
    sessionStorage.removeItem("param8");
}

//拖拽设置参数
function setDragMrz(param1,param2,param3,param4,param5,param6,param7,param8,param9){
    sessionStorage.setItem('param1', param1);
    sessionStorage.setItem('param2', param2);
    sessionStorage.setItem('param3', param3);
    sessionStorage.setItem('param4', param4);
    sessionStorage.setItem('param5', param5);
    sessionStorage.setItem('param6', param6);
    sessionStorage.setItem('param7', param7);
    sessionStorage.setItem('param8', param8);
    sessionStorage.setItem('param9', param9);
}

//拖拽参数获取
function getDragMrz(param1,param2,param3,param4,param5,param6,param7,param8,param9){
    $("#"+param1).val(sessionStorage.getItem("param1"));
    $("#"+param2).val(sessionStorage.getItem("param2"));
    $("#"+param3).val(sessionStorage.getItem("param3"));
    $("#"+param4).val(sessionStorage.getItem("param4"));
    $("#"+param5).val(sessionStorage.getItem("param5"));
    $("#"+param6).val(sessionStorage.getItem("param6"));
    $("#"+param7).val(sessionStorage.getItem("param7"));
    $("#"+param8).val(sessionStorage.getItem("param8"));
    $("#"+param9).val(sessionStorage.getItem("param9"));
    sessionStorage.removeItem("param1");
    sessionStorage.removeItem("param2");
    sessionStorage.removeItem("param3");
    sessionStorage.removeItem("param4");
    sessionStorage.removeItem("param5");
    sessionStorage.removeItem("param6");
    sessionStorage.removeItem("param7");
    sessionStorage.removeItem("param8");
    sessionStorage.removeItem("param9");
}

//给js数组对象原型加indexof方法 获得元素索引
Array.prototype.indexOf = function(val) {
    for (var i = 0; i < this.length; i++) {
        if (this[i] == val) return i;
    }
    return -1;
};
//给js数组对象原型加remove方法 去掉元素
Array.prototype.remove = function(val) {
    var index = this.indexOf(val);
    if (index > -1) {
        this.splice(index, 1);
    }
};



function timestampToTime(timestamp) {
    var time = new Date(timestamp);
    var y = time.getFullYear();
    var m = time.getMonth()+1;
    var d = time.getDate();
    var h = time.getHours();
    var mm = time.getMinutes();
    var s = time.getSeconds();
    return y+'-'+add0(m)+'-'+add0(d)+' '+add0(h)+':'+add0(mm)+':'+add0(s);
}
function add0(m){return m<10?'0'+m:m };
