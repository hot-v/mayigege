<section class="content">
    <ol class="breadcrumb">
        <li></li>
        <li><a href="${base }/admin/role/index.html">系统角色</a></li>
        <li class="active">查看</li>
    </ol>
    <div class="row">
        <div class="col-md-12">
            <form id="myFormId" method="post"  class="form-horizontal" role="form" >
                <div class="box box-primary">
                    <div class="box-body">
                        <input type="hidden" name="resources" value=""/>
                        <input type="hidden" name="roleId" value="${entity.roleId!}"/>
                        <div class="form-group">
                            <label for="descn" class="col-md-3 control-label no-padding-right">角色名称</label>
                            <div class="col-md-6">
                                <input type="text" id="roleName" name="roleName" class="form-control col-xs-10 col-sm-5" value="${entity.roleName!}" disabled/>
                            </div>
                            <div class="col-md-3"><font id="require-roleName" ></font><span id="errormsg-roleName" class="error"></span></div>
                        </div>
                        <div class="form-group">
                            <label for="val" class="col-md-3 control-label no-padding-right">权限</label>
                            <div class="col-md-9">
                                <p style="color:red;margin-top:8px;">*</p>
                            </div>
                        </div>
                        <div class="form-group" style="margin-top: -15px;">
                            <label for="val" class="col-sm-3 control-label no-padding-right"></label>
                            <div class="col-md-9" style="height: 300px;overflow-x: hidden; overflow-y: auto;">
                                <ul id="treeDemo" class="ztree ztree_accordition" style="margin-top: -6px;"></ul>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="descn" class="col-sm-3 control-label no-padding-right">角色描述</label>
                            <div class="col-md-5">
                                <textarea type="text" id="descn" name="descn" class="form-control col-xs-10 col-sm-5" rows="3" style="width:300px" disabled>${entity.descn!}</textarea>
                            </div>
                        </div>
	                    <div class="form-group">
	                        <label class="col-sm-3 control-label no-padding-right"></label>
	                        <div class="col-md-6">
								<a class="btn btn-sm btn-primary" href="${base }/admin/role/index.html">返回</a>
							</div>
	                    </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>

<script type="text/javascript">
    var _zTree=null;
    var _setting = {
        check:{
            enable: true,
            chkStyle: "checkbox",
            chkboxType: { "Y": "ps", "N": "ps" }
        },
        data: {
            simpleData: {
                enable: true,
                idKey: "id",
                pIdKey: "pId",
                rootPId: null
            }
        }
    };
    var _zNodes =[
        <#list FunctionChildMap["0"] as f1>
            {id:${(f1.id)!0}, pId:0, name:"${(f1.name)!0}",<#if map??&&(map[f1.ownerRole])?default('')!=''>checked:true,</#if>"roleVal":"${(f1.ownerRole)!0}"},
            <#if FunctionChildMap[""+f1.id]?size != 0>
                <#list FunctionChildMap[""+f1.id] as f2>
                    {id:${(f2.id)!0}, pId:${(f1.id)!0}, name:"${(f2.name)!0}",<#if map??&&(map[f2.ownerRole])?default('')!=''>checked:true,</#if>"roleVal":"${(f2.ownerRole)!0}"},
                    <#if FunctionChildMap[""+f2.id]?size != 0>
                        <#list FunctionChildMap[""+f2.id] as f3>
                            {id:${(f3.id)!0}, pId:${(f2.id)!0}, name:"${(f3.name)!0}",<#if map??&&(map[f3.ownerRole])?default('')!=''>checked:true,</#if>"roleVal":"${(f3.ownerRole)!0}"},
                        </#list>
                    </#if>
                </#list>
            </#if>
        </#list>
        {id:0,pId:null, name:"全选",isParent:true,"roleVal":""}
    ];

    function initComplete(){
        _zTree =$.fn.zTree.init($("#treeDemo"), _setting, _zNodes);
        showAll();
    }

    function  showAll(){
        var treeObj=$.fn.zTree.getZTreeObj("treeDemo");
        treeObj.expandAll(true);
    }
    function  hideAll(){
        var treeObj = $.fn.zTree.getZTreeObj("treeDemo")
        treeObj.expandAll(false);
    }

    function getResource(){
        var selectedNode="";
        if(_zTree!=null){
            var nodes = _zTree.getCheckedNodes(true);
            for(var i=0;i<nodes.length;i++){
                if(nodes[i].roleVal!=""){
                    selectedNode+=nodes[i].roleVal+",";
                }
            }
            if(selectedNode!=""){
                selectedNode = selectedNode.substring(0,((selectedNode.length*1)-1));
            }
        }

        return selectedNode;
    }

    $(function(){
        initComplete();
    });
</script>
<script>
    $(document).ready(function(){
        <#if resourceStrs??>
            var resourceStrs="${resourceStrs!}";
            var valueArray=resourceStrs.split(",");

            var zTree = $.fn.zTree.getZTreeObj("treeDemo");
            //根据过滤机制获得zTree的所有节点
            var nodes = zTree.transformToArray(zTree.getNodes());
            for(var i=0;i<nodes.length;i++){
                for(var j=0;j<valueArray.length;j++){
                    var valueCheck=valueArray[j].split("-");
                    if(valueCheck[0]==nodes[i].roleVal){
                        zTree.checkNode(nodes[i], true, false);
                    }
                }
                zTree.setChkDisabled(nodes[i], true);
            }
        </#if>
    });
</script>