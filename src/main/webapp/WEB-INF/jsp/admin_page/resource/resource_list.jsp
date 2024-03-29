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

		<!-- 弹出树,模态框 -->
		<div id="dialog-message" class="hide">
			<div>
				<a href="javascript:void(0);" class="glyphicon glyphicon-asterisk"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-plus"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-euro"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-eur"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-minus"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-cloud"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-envelope"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-pencil"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-glass"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-music"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-search"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-heart"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-star"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-star-empty"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-user"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-film"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-th-large"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-th"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-th-list"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-ok"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-remove"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-zoom-in"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-zoom-out"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-off"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-signal"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-cog"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-trash"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-home"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-file"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-time"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-road"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-download-alt"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-download"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-upload"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-inbox"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-play-circle"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-repeat"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-refresh"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-list-alt"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-lock"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-flag"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-headphones"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-volume-off"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-volume-down"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-volume-up"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-qrcode"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-barcode"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-tag"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-tags"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-book"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-bookmark"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-print"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-camera"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-font"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-bold"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-italic"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-text-height"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-text-width"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-align-left"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-align-center"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-align-right"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-align-justify"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-list"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-indent-left"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-indent-right"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-facetime-video"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-picture"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-map-marker"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-adjust"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-tint"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-edit"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-share"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-check"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-move"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-step-backward"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-fast-backward"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-backward"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-play"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-pause"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-stop"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-forward"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-fast-forward"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-step-forward"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-eject"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-chevron-left"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-chevron-right"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-plus-sign"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-minus-sign"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-remove-sign"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-ok-sign"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-question-sign"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-info-sign"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-screenshot"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-remove-circle"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-ok-circle"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-ban-circle"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-arrow-left"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-arrow-right"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-arrow-up"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-arrow-down"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-share-alt"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-resize-full"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-resize-small"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-exclamation-sign"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-gift"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-leaf"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-fire"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-eye-open"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-eye-close"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-warning-sign"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-plane"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-calendar"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-random"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-comment"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-magnet"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-chevron-up"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-chevron-down"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-retweet"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-shopping-cart"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-folder-close"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-folder-open"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-resize-vertical"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-resize-horizontal"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-hdd"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-bullhorn"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-bell"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-certificate"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-thumbs-up"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-thumbs-down"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-hand-right"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-hand-left"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-hand-up"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-hand-down"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-circle-arrow-right"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-circle-arrow-left"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-circle-arrow-up"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-circle-arrow-down"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-globe"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-wrench"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-tasks"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-filter"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-briefcase"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-fullscreen"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-dashboard"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-paperclip"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-heart-empty"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-link"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-phone"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-pushpin"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-usd"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-gbp"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-sort"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-sort-by-alphabet"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-sort-by-alphabet-alt"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-sort-by-order"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-sort-by-order-alt"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-sort-by-attributes"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-sort-by-attributes-alt"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-unchecked"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-expand"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-collapse-down"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-collapse-up"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-log-in"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-flash"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-log-out"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-new-window"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-record"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-save"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-open"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-saved"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-import"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-export"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-send"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-floppy-disk"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-floppy-saved"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-floppy-remove"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-floppy-save"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-floppy-open"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-credit-card"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-transfer"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-cutlery"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-header"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-compressed"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-earphone"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-phone-alt"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-tower"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-stats"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-sd-video"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-hd-video"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-subtitles"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-sound-stereo"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-sound-dolby"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-sound-5-1"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-sound-6-1"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-sound-7-1"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-copyright-mark"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-registration-mark"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-cloud-download"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-cloud-upload"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-tree-conifer"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-tree-deciduous"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-cd"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-save-file"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-open-file"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-level-up"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-copy"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-paste"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-alert"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-equalizer"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-king"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-queen"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-pawn"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-bishop"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-knight"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-baby-formula"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-tent"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-blackboard"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-bed"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-apple"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-erase"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-hourglass"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-lamp"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-duplicate"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-piggy-bank"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-scissors"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-bitcoin"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-btc"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-xbt"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-yen"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-jpy"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-ruble"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-rub"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-scale"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-ice-lolly"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-ice-lolly-tasted"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-education"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-option-horizontal"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-option-vertical"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-menu-hamburger"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-modal-window"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-oil"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-grain"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-sunglasses"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-text-size"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-text-color"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-text-background"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-object-align-top"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-object-align-bottom"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-object-align-horizontal"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-object-align-left"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-object-align-vertical"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-object-align-right"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-triangle-right"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-triangle-left"></a><a
					href="javascript:void(0);"
					class="glyphicon glyphicon-triangle-bottom"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-triangle-top"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-console"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-superscript"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-subscript"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-menu-left"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-menu-right"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-menu-down"></a><a
					href="javascript:void(0);" class="glyphicon glyphicon-menu-up"></a>
			</div>
		</div>

		<!-- 弹出没有选中节点模态框 -->
		<div id="no-id-dialog" class="hide">
			<div class="widget-main padding-8">添加资源必须选择父节点</div>
		</div>

		<!-- 弹出无法在动作类型下添加子节点模态框 -->
		<div id="can-not-add-dialog" class="hide">
			<div class="widget-main padding-8">无法在动作类型下添加子节点</div>
		</div>

		<!-- 弹出无法在动作类型下添加子节点模态框 -->
		<div id="can-not-delete-dialog" class="hide">
			<div class="widget-main padding-8">系统初始化数据无法删除!</div>
		</div>

		<!-- 弹出无法修改root节点模态框 -->
		<div id="can-not-modify-dialog" class="hide">
			<div class="widget-main padding-8">资源管理模块根节点不允许修改!</div>
		</div>
	</div>
	<!-- /.col -->
</div>
<!-- /.row -->

<input id="shiro_create" type="hidden"
	value="<shiro:hasPermission name='sys:resource:create'>true</shiro:hasPermission>">
<input id="shiro_update" type="hidden"
	value="<shiro:hasPermission name='sys:resource:update'>true</shiro:hasPermission>">
<input id="shiro_delete" type="hidden"
	value="<shiro:hasPermission name='sys:resource:delete'>true</shiro:hasPermission>">

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

    //override dialog's title function to allow for HTML titles
    $.widget("ui.dialog", $.extend({}, $.ui.dialog.prototype, {
      _title : function(title){
        var $title = this.options.title || '&nbsp;'
        if (("title_html" in this.options) && this.options.title_html == true)
          title.html($title);
        else
          title.text($title);
      }
    }));
    
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
      url : "resource/resourceList",//请求路径
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
          "资源名称", "图标", "资源路径", "权限字符串", "排序号", "资源类型", "系统数据"
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
          }, {
            name : 'icon',
            edittype : 'custom',
            width : 20,
            editable : true,
            sortable : false,
            jsonmap : "icon",
            formatter : function(data){
              return '<span class="'+data+'" aria-hidden="true"></span>'
            },
            editoptions : {
              custom_element : function(text){
                var c = $(text).attr("class")
                if (!c) {
                  return $('<a href="javascript:void(0);" class="glyphicon">请选择图标</a>')
                }
                return $('<a href="javascript:void(0);" class="' + c + '"></a>')
              },
              custom_value : function(dom){
                var c = $(dom).removeClass("customelement").attr("class")
                return c
              },
              dataEvents : [
                {
                  type : "click",
                  fn : function(e){
                    var dialog = $("#dialog-message").removeClass('hide').dialog({
                      modal : true,
                      width : 900,
                      title : "<div class='widget-header widget-header-small'><h4 class='smaller'>图标</h4></div>",
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
                  }
                }
              ]
            }
          }, {
            name : 'url',
            edittype : 'text',
            width : 80,
            editable : true,
            sortable : false,
          }, {
            name : 'permission',
            edittype : 'text',
            width : 80,
            editable : true,
            sortable : false,
            editrules : {
              required : true
            }
          }, {
            name : 'sortNum',
            edittype : 'text',
            width : 80,
            editable : true,
            sortable : false,
            formatter : function(val){
              if (-1 == val) {
                return ""
              } else {
                return val
              }
            },
            editrules : {
              required : true,
              integer : true
            }
          }, {
            name : 'type',
            edittype : 'text',
            width : 80,
            editable : false,
            sortable : false,
            formatter : function(data){
              var val = "";
              switch (data) {
                case "column":
                  val = "栏目";
                  break;
                case "menu":
                  val = "菜单";
                  break;
                case "action":
                  val = "动作";
                  break;
              }
              return val;
            }
          }, {
            name : 'isInitialized',
            editable : false,
            width : 80,
            hidden : true
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
    
    $("#dialog-message .glyphicon").click(function(){
      $("a[name='icon']").text("").attr("class", $(this).attr("class") + " customelement")
      $("#dialog-message").dialog("close")
    })

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
      url : "resource/updateResource",
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
        //获取选中id
        var id = $(grid_selector).jqGrid('getGridParam', 'selrow');
        //获取选中行数据
        var rowDatas = $(grid_selector).jqGrid('getRowData', id);
        
        var form = $(e[0]);
        switch (rowDatas.type) {
          case "栏目":
            //在栏目节点下添加的元素为menu元素，隐藏icon input
            form.find('#tr_url').hide();
            break;
          case "菜单":
            //在菜单节点下添加的元素为menu元素，隐藏url、icon的input
            form.find('#tr_icon').hide();
            break;
          case "动作":
            form.find('#tr_url').hide();
            form.find('#tr_icon').hide();
            break;
        }
        
        form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
        style_edit_form(form);
      }
    }, {
      //add-新增操作
      url : "resource/addResource",
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
        } else if ("动作" == rowDatas.type) {
          //如果是按钮，则弹出提示框无法在具体动作下添加子节点
          //提示必须选择父节点弹出框
          var dialog = $("#can-not-add-dialog").removeClass('hide').dialog({
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
        //获取选中id
        var id = $(grid_selector).jqGrid('getGridParam', 'selrow');
        //获取选中行数据
        var rowDatas = $(grid_selector).jqGrid('getRowData', id);
        
        var form = $(e[0]);
        switch (rowDatas.type) {
          case "":
            //在根节点下添加的元素为column元素,隐藏资源路径input
            form.find('#tr_url').hide();
            break;
          case "栏目":
            //在栏目节点下添加的元素为menu元素，隐藏icon input
            form.find('#tr_icon').hide();
            break;
          case "菜单":
            //在菜单节点下添加的元素为menu元素，隐藏url、icon的input
            form.find('#tr_url').hide();
            form.find('#tr_icon').hide();
            break;
        }
        
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
      url : "resource/deleteResource",
      recreateForm : true,
      reloadAfterSubmit : true,
      beforeInitData : function(form){
        //获取选中id
        var id = $(grid_selector).jqGrid('getGridParam', 'selrow');
        //获取选中行数据
        var rowDatas = $(grid_selector).jqGrid('getRowData', id);
        //如果是系统初始化数据，弹出提醒不进行删除
        if ("true" == rowDatas.isInitialized) {
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
          $(form).find('.delmsg').html("当前资源节点包含子资源<br/>，删除操作会删除子资源，<br/>是否删除?")
        } else {
          $(form).find('.delmsg').html("删除所选记录?")
        }
        if (form.data('styled'))
          return false;
        
        form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
        style_delete_form(form);
        
        form.data('styled', true);
      },
    }, null, {
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
