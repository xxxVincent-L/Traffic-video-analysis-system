// JavaScript Document
var zTree;
	var demoIframe;

	var setting = {
		view: {
			dblClickExpand: false,
			showLine: true,
			selectedMulti: false
		},
		check: {  
                enable: true,  
                nocheckInherit: false

            },
		data: {
			simpleData: {
				enable:true,
				idKey: "id",
				pIdKey: "pId",
				rootPId: "rid"
			}
		},
		callback: {
			beforeClick: function(treeId, treeNode) {
				var zTree = $.fn.zTree.getZTreeObj("tree");
				if (treeNode.isParent) {
					zTree.expandNode(treeNode);
					return false;
				} else {
					demoIframe.attr("src",treeNode.file + ".html");
					return true;
				}
			}
		}
	};

	var zNodes =[
	     {	rid:101	,	id:	101	,pId:101,name:"	所有区域	",open:true,nocheck:true}	,
{	id:	1001	,	pId:	101	,name:"	上级部门一	",open:false,nocheck:true}	,
{	id:	1001003	,	pId:	1001	,name:"	中级部门一	",nocheck:true}	,
{	id:	1001008	,	pId:	1001	,name:"	中级部门一	",nocheck:true}	,
{	id:	1001019	,	pId:	1001	,name:"	中级部门一	"}	,
{	id:	1001020	,	pId:	1001	,name:"	中级部门一	"}	,
{	id:	100102001	,	pId:	1001020	,name:"下级部门1"}	,
{	id:	100102001	,	pId:	1001020	,name:"下级部门2	"}	,
{	id:	100102001	,	pId:	1001020	,name:"下级部门3	"}	,
{	id:	100102001	,	pId:	1001020	,name:"下级部门4"}	,
{	id:	100102001	,	pId:	1001020	,name:"下级部门5	"}	,
{	id:	1002	,	pId:	101	,name:"	上级部门二",open:false}	,
{	id:	1001003	,	pId:	1002	,name:"		中级部门一	",nocheck:false}	,
{	id:	1001008	,	pId:	1002	,name:"		中级部门一	"}	,
{	id:	1001019	,	pId:	1002	,name:"	中级部门一	"}	,
{	id:	1001020	,	pId:	1002	,name:"		中级部门一	"}	,
{	id:	1003	,	pId:	101	,name:"	上级部门一	",open:false}	,
{	id:	1001003	,	pId:	1003	,name:"		中级部门一	",nocheck:false}	,
{	id:	1001008	,	pId:	1003	,name:"		中级部门一	"}	,
{	id:	1001019	,	pId:	1003	,name:"	中级部门一	"}	,
{	id:	1001020	,	pId:	1003	,name:"		中级部门一	"}	,
{	id:	1004	,	pId:	101	,name:"	上级部门一	",open:false}	,
{	id:	1001003	,	pId:	1004	,name:"		中级部门一",nocheck:false}	,
{	id:	1001008	,	pId:	1004	,name:"		中级部门一	"}	,
{	id:	1001019	,	pId:	1004	,name:"		中级部门一	"}	,
{	id:	1001020	,	pId:	1004	,name:"		中级部门一	"}	,
{	id:	1005	,	pId:	101	,name:"	上级部门一	",open:false}	,
{	id:	1001003	,	pId:	1005	,name:"		中级部门一",nocheck:false}	,
{	id:	1001008	,	pId:	1005	,name:"		中级部门一	"}	,
{	id:	1001019	,	pId:	1005	,name:"		中级部门一	"}	,
{	id:	1001020	,	pId:	1005	,name:"		中级部门一	"}
	];

	$(document).ready(function(){
		var t = $("#tree");
		t = $.fn.zTree.init(t, setting, zNodes);
		
		var zTree = $.fn.zTree.getZTreeObj("tree");
		zTree.selectNode(zTree.getNodeByParam("id", 101));

	});