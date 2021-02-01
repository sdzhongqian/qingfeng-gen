<!-- 
	参数管理里面的收入参数、扣发参数、补贴对应表获取tree的公共页面。 
-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<script type="text/javascript">
	var setting = {
		view: {
			dblClickExpand: false
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
			beforeClick: beforeClick,
			onClick: onClick
		}
	};


	$(document).ready(function (){
		var treeNodes = '';
		$.ajax({
			url : "${pageContext.request.contextPath}/system/organize/findList.do",
			data : {},
			type : 'GET',
			dataType : 'json',
			success : function(res) {
				if (res.success) {
					treeNodes += "[";
					$.each(res.data,function(i,n){
						treeNodes += "{";
						treeNodes += "id:'"+n.id+"'";
						treeNodes += ",pId:'"+n.parent_id+"'";
						treeNodes += ",name:'"+n.name+"'";
						treeNodes += "},";
					});
					treeNodes = treeNodes.substr(0,treeNodes.length-1)+"]";
					if(treeNodes != ']'){
						$.fn.zTree.init($("#selectOrgZtree"), setting ,eval(treeNodes));
						expandFirst();
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
				alert('Sorry, there was a problem!');
			},
			complete : function(xhr, status) {
			}
		});
	});

	//展开第一个节点
	function expandFirst(){
		var treeObj = $.fn.zTree.getZTreeObj("selectOrgZtree");
		var nodes = treeObj.getNodes();
		treeObj.expandNode(nodes[0],true,false,true,true);
	}

	function beforeClick(treeId, treeNode) {
		return true;
	}

	var name = '';
	var id = '';
	function onClick(e, treeId, treeNode) {
		var zTree = $.fn.zTree.getZTreeObj("selectOrgZtree"),
				nodes = zTree.getSelectedNodes(),
				v = "",
				n = "";
		nodes.sort(function compare(a,b){return a.id-b.id;});
		for (var i=0, l=nodes.length; i<l; i++) {
			v += nodes[i].id + ",";
			n += nodes[i].name + ",";
		}
		if (v.length > 0 ) v = v.substring(0, v.length-1);
		if (n.length > 0 ) n = n.substring(0, n.length-1);
		var orgObj = $("#"+name);
		var orgIdObj = $("#"+id);
		orgObj.attr("value", n);
		orgIdObj.attr("value", v);
	}

	function showMenu(param_name,param_id) {
		name = param_name;
		id = param_id;
		var orgObj = $("#"+name);
		var orgOffset = $("#"+name).offset();
		$("#menuContent").css({left:orgOffset.left + "px", top:orgOffset.top + orgObj.outerHeight() + "px"}).slideDown("fast");
		$("body").bind("mousedown", onBodyDown);
	}


	function hideMenu() {
		$("#menuContent").fadeOut("fast");
		$("body").unbind("mousedown", onBodyDown);
	}

	function onBodyDown(event) {
		if (!(event.target.id == "orgSel" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
			hideMenu();
		}
	}

</script>
