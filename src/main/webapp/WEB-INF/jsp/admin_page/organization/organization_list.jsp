<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%
	String path = request.getContextPath() + "/";
	request.setAttribute("ctx", path);
%>
<title>资源管理</title>
<link rel="stylesheet" href="${ctx }assets/css/jquery-ui.css" />
<link rel="stylesheet" href="${ctx }assets/css/ui.jqgrid.css" />
<style type="text/css">
#dialog-message .glyphicon {
	width: 40px;
	height: 40px;
	line-height: 40px;
	text-align: center;
	font-size: 24px;
}
</style>
<!-- ajax layout which only needs content area -->
<div class="page-header">
	<h1>资源管理</h1>
</div>
<!-- /.page-header -->

<div class="row">
	<div class="col-xs-12">

		<table id="grid-table"></table>

		<div id="grid-pager"></div>

		<!-- PAGE CONTENT ENDS -->

		<!-- 弹出没有选中节点模态框 -->
		<div id="no-id-dialog" class="hide">
			<div class="widget-main padding-8">添加资源必须选择父节点</div>
		</div>

		<!-- 弹出无法在动作类型下添加子节点模态框 -->
		<div id="can-not-delete-dialog" class="hide">
			<div class="widget-main padding-8">root节点数据无法删除!</div>
		</div>

		<!-- 弹出无法修改root节点模态框 -->
		<div id="can-not-modify-dialog" class="hide">
			<div class="widget-main padding-8">root节点不允许修改!</div>
		</div>
	</div>
	<!-- /.col -->
</div>
<!-- /.row -->

<input id="shiro_create" type="hidden"
	value="<shiro:hasPermission name='sys:organization:create'>true</shiro:hasPermission>">
<input id="shiro_update" type="hidden"
	value="<shiro:hasPermission name='sys:organization:update'>true</shiro:hasPermission>">
<input id="shiro_delete" type="hidden"
	value="<shiro:hasPermission name='sys:organization:delete'>true</shiro:hasPermission>">

<!-- inline scripts related to this page -->
<script type="text/javascript">
  var scripts = [
      null, "${ctx }assets/js/jqGrid/jquery.jqGrid.src.js", "${ctx }assets/js/jqGrid/i18n/grid.locale-cn.js",
      "${ctx }assets/js/jquery-ui.js", null
  ]
  $('.page-content-area').ace_ajax('loadScripts', scripts, function(){
    /* 选择器 */
    var grid_selector = "#grid-table";
    var page_selector = "#grid-pager";
    
    //调整大小为page-content宽度
    $(window).on('resize.jqGrid', function(){
      $(grid_selector).jqGrid('setGridWidth', $(".page-content").width());
    })
    //resize on sidebar collapse/expand
    var parent_column = $(grid_selector).closest('[class*="col-"]');
    $(document).on('settings.ace.jqGrid', function(ev, event_name, collapsed){
      if (event_name === 'sidebar_collapsed' || event_name === 'main_container_fixed') {
        //setTimeout is for webkit only to give time for DOM changes and then redraw!!!
        setTimeout(function(){
          $(grid_selector).jqGrid('setGridWidth', parent_column.width());
        }, 0);
      }
    })

    /* jqgrid定义 */
    jQuery(grid_selector).jqGrid({
      treeGrid : true,
      treeGridModel : 'adjacency',
      ExpandColumn : 'name',
      //解析从Server返回的json数据
      jsonReader : {
        root : "rows",
        repeatitems : false
      },
      treeReader : {
        level_field : "level",
        parent_id_field : "parent",
        leaf_field : "isleaf",
        expanded_field : "expanded",
        loaded : "loaded",
        icon_field : null
      },
      datatype : "json", //数据类型
      url : "organization/organizationList",//请求路径
      treeIcons : {
        plus : 'glyphicon glyphicon-plus',
        minus : 'glyphicon glyphicon-minus',
        leaf : 'glyphicon glyphicon-menu-right'
      },
      mtype : "GET",//提交方式
      height : 400,//jqgrid高度
      hoverrows : true,//当为false时mouse hovering会被禁用,true时鼠标移动到行时高亮显示
      altRows : true,//设置为交替表格,交替颜色区分
      altclass : "",//当altRows为true,交替行的间隔样式,此处是class类,我们可以设置背景等
      autoencode : false,//是否编码服务器返回内容或者提交到服务器的内容中包含的html代码，设置为true时，<会被编码为&lt;
      autowidth : true,//true，重新计算表格相对于父元素的宽度。在表格建立时执行。如果建立之后表格父元素宽度改变，需要自动调整宽度，使用setGridWidth方法来实现
      emptyrecords : "当前获取数据为空...",//当表格没有数据时显示的提示信息，仅当viewrecords配置为true时有效。
      loadtext : "数据加载中...",
      pager : page_selector,//分页元素
      pagerpos : false,//定义分页栏位置,left、center、right
      pgbuttons : false,//显示分页按钮
      pginput : false,//是否显示跳转页面输入框
      recordpos : false,//定义了记录信息的位置： left, center, right
      colNames : [
        "部门名称"
      ],//定义表头内容显示的字符串数组。注意此数组长度要和colModel配置的数组长度一致
      /* JSON数组对象描述列的参数。 */
      scrollrows : true,
      colModel : [
        {
          name : 'name',
          edittype : 'text',
          width : 80,
          editable : true,
          sortable : false,
          jsonmap : "name",
          editrules : {
            required : true
          }
        }
      ],
      
      //在所有数据加载进入表格和所有处理已经完成后触发。在排序，分页等操作后也会触发。
      loadComplete : function(){
        var table = this;
        setTimeout(function(){
          enableTooltips(table);
        }, 0);
      },
    });
    
    function enableTooltips(table){
      $('.navtable .ui-pg-button').tooltip({
        container : 'body'
      });
      $(table).find('.ui-pg-div').tooltip({
        container : 'body'
      });
    }
    
    //触发window的resize.jqGrid事件
    $(window).triggerHandler('resize.jqGrid');
    
    //底部操作栏事件,包括新增,查询,等...
    jQuery(grid_selector).jqGrid('navGrid', page_selector, { //设置事件
      edit : $("#shiro_update").val() == "true",//编辑
      editicon : 'ace-icon fa fa-pencil blue',
      add : $("#shiro_create").val() == "true",//新增
      addicon : 'ace-icon fa fa-plus-circle purple',
      del : $("#shiro_delete").val() == "true",//删除
      delicon : 'ace-icon fa fa-trash-o red',
      search : false,
      refresh : true,//刷新
      refreshicon : 'ace-icon fa fa-refresh green',
      view : true,//查看
      viewicon : 'ace-icon fa fa-search-plus grey',
    }, {
      //edit-编辑操作
      url : "organization/update",
      closeAfterEdit : true,
      recreateForm : true,
      viewPagerButtons : false,
      beforeInitData : function(form){
        //获取选中id
        var id = $(grid_selector).jqGrid('getGridParam', 'selrow');
        //获取选中行数据
        var rowDatas = $(grid_selector).jqGrid('getRowData', id);
        if ("0" == rowDatas.level) {
          var dialog = $("#can-not-modify-dialog").removeClass('hide').dialog({
            modal : true,
            title : "<div class='widget-header widget-header-small'><h4 class='smaller'>提醒</h4></div>",
            title_html : true,
            buttons : [
              {
                text : "取消",
                "class" : "btn btn-minier",
                click : function(){
                  $(this).dialog("close");
                }
              }
            ]
          })
          return false;
        } else {
          return true;
        }
      },
      beforeShowForm : function(e){
        var form = $(e[0]);
        form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
        style_edit_form(form);
      }
    }, {
      //add-新增操作
      url : "organization/addOrganization",
      closeAfterAdd : true,
      recreateForm : true,
      viewPagerButtons : false,
      serializeEditData : function(data){
        return $.param($.extend({}, data, {
          id : ""
        }));
      },
      beforeInitData : function(form){
        //获取选中id
        var id = $(grid_selector).jqGrid('getGridParam', 'selrow');
        //获取选中行数据
        var rowDatas = $(grid_selector).jqGrid('getRowData', id);
        //判断是否选中
        if (null == id) {
          //提示必须选择父节点弹出框
          var dialog = $("#no-id-dialog").removeClass('hide').dialog({
            modal : true,
            title : "<div class='widget-header widget-header-small'><h4 class='smaller'>提醒</h4></div>",
            title_html : true,
            buttons : [
              {
                text : "确定",
                "class" : "btn btn-minier",
                click : function(){
                  $(this).dialog("close");
                }
              }
            ]
          })
          return false;
        } else {
          return true;
        }
      },
      beforeShowForm : function(e){
        var form = $(e[0]);
        form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
        style_edit_form(form);
      },
      //与服务器请求触发,用于解析服务器上的异常消息
      afterSubmit : function(response, postdata){
        var json = JSON.parse(response.responseText);
        if (!json.success) {
          return [
              false, json.message, null
          ]
        } else {
          return [
              true, null, null
          ]
        }
      }
    }, {
      //删除操作
      url : "organization/delete",
      recreateForm : true,
      reloadAfterSubmit : true,
      beforeInitData : function(form){
        //获取选中id
        var id = $(grid_selector).jqGrid('getGridParam', 'selrow');
        //获取选中行数据
        var rowDatas = $(grid_selector).jqGrid('getRowData', id);
        //如果是系统初始化数据，弹出提醒不进行删除
        if ("0" == rowDatas.level) {
          var dialog = $("#can-not-delete-dialog").removeClass('hide').dialog({
            modal : true,
            title : "<div class='widget-header widget-header-small'><h4 class='smaller'>提醒</h4></div>",
            title_html : true,
            buttons : [
              {
                text : "取消",
                "class" : "btn btn-minier",
                click : function(){
                  $(this).dialog("close");
                }
              }
            ]
          })
          return false;
        } else {
          return true;
        }
      },
      beforeShowForm : function(e){
        var form = $(e[0]);
        //获取选中id
        var id = $(grid_selector).jqGrid('getGridParam', 'selrow');
        //获取选中行数据
        var rowDatas = $(grid_selector).jqGrid('getRowData', id);
        if ("false" == rowDatas.isleaf) {
          $(form).find('.delmsg').html("当前部门节点包含子部门<br/>，删除操作会删除子部门，<br/>是否删除?")
        } else {
          $(form).find('.delmsg').html("删除所选记录?")
        }
        if (form.data('styled'))
          return false;
        
        form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
        style_delete_form(form);
        
        form.data('styled', true);
      },
      //与服务器请求触发,用于解析服务器上的异常消息
      afterSubmit : function(response, postdata){
        var json = JSON.parse(response.responseText);
        if (!json.success) {
          return [
              false, json.message, null
          ]
        } else {
          return [
              true, null, null
          ]
        }
      }
    }, null,//search 表单
    {
      //展示每条记录view 
      recreateForm : true,
      beforeShowForm : function(e){
        var form = $(e[0]);
        form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
      }
    })

    function style_edit_form(form){
      //update buttons classes
      var buttons = form.next().find('.EditButton .fm-button');
      buttons.addClass('btn btn-sm').find('[class*="-icon"]').hide();//ui-icon, s-icon
      buttons.eq(0).addClass('btn-primary').prepend('<i class="ace-icon fa fa-check"></i>');
      buttons.eq(1).prepend('<i class="ace-icon fa fa-times"></i>')

      buttons = form.next().find('.navButton a');
      buttons.find('.ui-icon').hide();
      buttons.eq(0).append('<i class="ace-icon fa fa-chevron-left"></i>');
      buttons.eq(1).append('<i class="ace-icon fa fa-chevron-right"></i>');
    }
    
    function style_delete_form(form){
      var buttons = form.next().find('.EditButton .fm-button');
      buttons.addClass('btn btn-sm btn-white btn-round').find('[class*="-icon"]').hide();//ui-icon, s-icon
      buttons.eq(0).addClass('btn-danger').prepend('<i class="ace-icon fa fa-trash-o"></i>');
      buttons.eq(1).addClass('btn-default').prepend('<i class="ace-icon fa fa-times"></i>')
    }
    
    // 必须添加
    $(document).one('ajaxloadstart.page', function(e){
      $(grid_selector).jqGrid('GridUnload');
      $('.ui-jqdialog').remove();
    });
  })
</script>
