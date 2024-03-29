<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%
	String path = request.getContextPath() + "/";
	request.setAttribute("ctx", path);
%>
<title>登录登出</title>
<link rel="stylesheet" href="${ctx }assets/css/jquery-ui.css" />
<link rel="stylesheet" href="${ctx }assets/css/ui.jqgrid.css" />
<!-- ajax layout which only needs content area -->
<div class="page-header">
	<h1>登录登出</h1>
</div>

<div class="row">
	<div class="col-xs-12">

		<table id="grid-table"></table>

		<div id="grid-pager"></div>

		<!-- PAGE CONTENT ENDS -->
	</div>
	<!-- /.col -->
</div>
<!-- /.row -->

<!-- inline scripts related to this page -->
<script type="text/javascript">
  var scripts = [
      null, "${ctx }assets/js/jqGrid/jquery.jqGrid.src.js", "${ctx }assets/js/jqGrid/i18n/grid.locale-cn.js", null
  ]
  $('.page-content-area').ace_ajax('loadScripts', scripts, function(){
    /* 选择器 */
    var grid_selector = "#grid-table";
    var pager_selector = "#grid-pager";
    
    //调整大小为page-content宽度
    $(window).on('resize.jqGrid', function(){
      $(grid_selector).jqGrid('setGridWidth', $(".page-content").width());
    })
    //resize on sidebar collapse/expand
    var parent_column = $(grid_selector).closest('[class*="col-"]');
    //配置settings设置
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
      //解析从Server返回的json数据
      jsonReader : {
        root : "rows", // json中每行的记录
        page : "currentPage", //json中代表当前页码的数据  
        total : "totalPageSize", //json中代表页码总数的数据
        records : "totalRecords",//总记录数
        repeatitems : false,//通常设置为false
        id : "id",//解析rows中的id值,作为该行的id(默认就是id)
      },
      caption : "",//表格的名称
      cellEdit : false,//设置单元格是否可点击修改,false为不可以
      url : "loginlogout/loginlogoutList",//请求路径
      datatype : "json",//数据类型
      mtype : "GET",//提交方式
      height : 350,//jqgrid高度
      hoverrows : true,//当为false时mouse hovering会被禁用,true时鼠标移动到行时高亮显示
      rownumbers : true,//添加行号
      viewrecords : true,//显示总记录数
      altRows : true,//设置为交替表格,交替颜色区分
      rowNum : 10,//一页显示记录条数
      rowList : [
          10, 20, 30
      ],//可选的一页显示记录数
      autowidth : true,//true，重新计算表格相对于父元素的宽度。在表格建立时执行。如果建立之后表格父元素宽度改变，需要自动调整宽度，使用setGridWidth方法来实现
      emptyrecords : "当前获取数据为空...",//当表格没有数据时显示的提示信息，仅当viewrecords配置为true时有效。
      loadtext : "数据加载中...",
      pager : pager_selector,//分页元素
      pagerpos : "center",//定义分页栏位置,left、center、right
      pgbuttons : true,//显示分页按钮
      pginput : true,//是否显示跳转页面输入框
      pgtext : "{0} 共 {1} 页",//显示页数与总页数信息
      recordpos : "right",//定义了记录信息的位置： left, center, right
      colNames : [
          '用户名', 'ip', '记录内容', '类型', '时间'
      ],//定义表头内容显示的字符串数组。注意此数组长度要和colModel配置的数组长度一致
      /* JSON数组对象描述列的参数。 */
      colModel : [
          {
            name : 'username',
            width : 40,
            editable : false,
            sortable : false,
            jsonmap : "username",
          }, {
            name : 'ip',
            width : 40,
            edittable : false,
            sortable : false,
            jsonmap : "ip"
          }, {
            name : "content",
            width : 220,
            edittable : false,
            sortable : false,
            jsonmap : "content"
          }, {
            name : "type",
            width : 40,
            editable : false,
            sortable : false,
            jsonmap : "type",
            formatter : function(val){
              if ('login' == val) {
                return "登录";
              } else if ('logout' == val) {
                return "退出";
              } else if ('timeout') {
                return "超时";
              }
            }
          }, {
            name : "date",
            width : 80,
            editable : false,
            sortable : false,
            jsonmap : "date"
          }
      ],
      //在所有数据加载进入表格和所有处理已经完成后触发。在排序，分页等操作后也会触发。
      loadComplete : function(){
        var table = this;
        setTimeout(function(){
          
          //加载完成后，替换分页按钮图标
          updatePagerIcons(table);
        }, 0)
      }
    })

    //替换分页按钮为奥森字体图标
    function updatePagerIcons(table){
      var replacement = {
        'ui-icon-seek-first' : 'ace-icon fa fa-angle-double-left bigger-140',
        'ui-icon-seek-prev' : 'ace-icon fa fa-angle-left bigger-140',
        'ui-icon-seek-next' : 'ace-icon fa fa-angle-right bigger-140',
        'ui-icon-seek-end' : 'ace-icon fa fa-angle-double-right bigger-140'
      };
      $('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function(){
        var icon = $(this);
        var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
        
        if ($class in replacement)
          icon.attr('class', 'ui-icon ' + replacement[$class]);
      })
    }
    
    //触发window的resize.jqGrid事件
    $(window).triggerHandler('resize.jqGrid');
    
    // 必须添加
    //==================================================================================================
    $(document).one('ajaxloadstart.page', function(e){
      $(grid_selector).jqGrid('GridUnload');
      $('.ui-jqdialog').remove();
    });
  })
</script>










