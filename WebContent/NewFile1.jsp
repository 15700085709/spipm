<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang='zh-cn'>
<head>
  <meta charset='utf-8'>
  <meta http-equiv='X-UA-Compatible' content='IE=edge'>
  <meta name="renderer" content="webkit"> 
  <title>dfd::浏览产品 - 禅道</title>
<script language='Javascript'>var config={"webRoot":"\/","appName":"","cookieLife":30,"requestType":"PATH_INFO","requestFix":"-","moduleVar":"m","methodVar":"f","viewVar":"t","defaultView":"html","themeRoot":"\/theme\/","currentModule":"product","currentMethod":"browse","clientLang":"zh-cn","requiredFields":"","router":"\/index.php","save":"\u4fdd\u5b58","runMode":"","timeout":30000,"pingInterval":""};
var lang={"submitting":"\u7a0d\u5019...","save":"\u4fdd\u5b58","timeout":"\u8fde\u63a5\u8d85\u65f6\uff0c\u8bf7\u68c0\u67e5\u7f51\u7edc\u73af\u5883\uff0c\u6216\u91cd\u8bd5\uff01"};

</script>
<script src='http://cdn.zentao.net/9.1.2/js/all.js?v=pro6.2' type='text/javascript'></script>
<link rel='stylesheet' href='http://cdn.zentao.net/9.1.2/theme/default/zh-cn.default.css?v=pro6.2' type='text/css' media='screen' />
<style>#createActionMenu .dropdown-menu{width: 100%}

.dropdown-menu.with-search {padding: 0; min-width: 150px; overflow: hidden; max-height: 302px;}
.dropdown-menu > .menu-search .input-group {width:100%;}
.dropdown-menu > .menu-search .input-group-addon {position: absolute; right: 10px; top: 0; z-index: 10; background: none; border: none; color: #666}
.dropdown-menu > .menu-search .form-control {border: none!important; box-shadow: none!important; border-top: 1px solid #ddd!important;}
.dropdown-list {display: block; padding: 0; max-height: 270px; overflow-y: auto;}
.dropdown-list > li > a {display: block; padding: 3px 20px; clear: both; font-weight: normal; line-height: 1.53846154; color: #141414; white-space: nowrap;}
.dropdown-list > li > a:hover,
.dropdown-list > li > a:focus {color: #1a4f85;text-decoration: none;background-color: #ddd;}

.pl-5px{padding-left:5px;}
a.removeModule{color:#ddd}
a.removeModule:hover{color:red}

tbody > tr > td > .btn-icon {margin-right: 3px;}
</style><link rel='icon' href='http://cdn.zentao.net/favicon.ico' type='image/x-icon' />
<link rel='shortcut icon' href='http://cdn.zentao.net/favicon.ico' type='image/x-icon' />
<!--[if lt IE 9]>
<script src='http://cdn.zentao.net/9.1.2/js/html5shiv/min.js?v=pro6.2' type='text/javascript'></script>
<script src='http://cdn.zentao.net/9.1.2/js/respond/min.js?v=pro6.2' type='text/javascript'></script>
<![endif]-->
<!--[if lt IE 10]>
<script src='http://cdn.zentao.net/9.1.2/js/jquery/placeholder/min.js?v=pro6.2' type='text/javascript'></script>
<![endif]-->
</head>
<body>
<script>
var noResultsMatch       = '没有匹配结果';
var chooseUsersToMail    = '选择要发信通知的用户...';
var defaultChosenOptions = {no_results_text: noResultsMatch, width:'100%', allow_single_deselect: true, disable_search_threshold: 1, placeholder_text_single: ' ', placeholder_text_multiple: ' ', search_contains: true};
$(document).ready(function()
{
    $("#mailto").attr('data-placeholder', chooseUsersToMail);
    $("#mailto, .chosen, #productID").chosen(defaultChosenOptions).on('chosen:showing_dropdown', function()
    {
        var $this = $(this);
        var $chosen = $this.next('.chosen-container').removeClass('chosen-up');
        var $drop = $chosen.find('.chosen-drop');
        $chosen.toggleClass('chosen-up', $drop.height() + $drop.offset().top - $(document).scrollTop() > $(window).height());
    });
});
</script>
<header id='header'>
  <div id='topbar'>
    <div class='pull-right' id='topnav'><div class='dropdown' id='userMenu'><a href='javascript:;' data-toggle='dropdown'><i class='icon-user'></i> Demo <span class='caret'></span></a><ul class='dropdown-menu'><li><a href='/my-profile.html?onlybody=yes' class='iframe' data-width='600'>个人档案</a>
</li><li><a href='/my-changepassword.html?onlybody=yes' class='iframe' data-width='500'>更改密码</a>
</li><li class='divider'></li><li class='dropdown-submenu left'><a href='javascript:;'>主题</a><ul class='dropdown-menu'><li class='theme-option active'><a href='javascript:selectTheme("default");' data-value='default'>默认</a></li><li class='theme-option'><a href='javascript:selectTheme("green");' data-value='green'>绿色</a></li><li class='theme-option'><a href='javascript:selectTheme("red");' data-value='red'>红色</a></li><li class='theme-option'><a href='javascript:selectTheme("lightblue");' data-value='lightblue'>亮蓝</a></li><li class='theme-option'><a href='javascript:selectTheme("blackberry");' data-value='blackberry'>黑莓</a></li></ul></li><li class='dropdown-submenu left'><a href='javascript:;'>Language</a><ul class='dropdown-menu'><li class='lang-option active'><a href='javascript:selectLang("zh-cn");' data-value='zh-cn'>简体</a></li><li class='lang-option'><a href='javascript:selectLang("zh-tw");' data-value='zh-tw'>繁體</a></li><li class='lang-option'><a href='javascript:selectLang("en");' data-value='en'>English</a></li></ul></li></ul></div><a href='/user-logout.html' >退出</a>
<div class='dropdown'><a href='javascript:;' data-toggle='dropdown'>帮助 <span class='caret'></span></a><ul class='dropdown-menu pull-right'><li><a href='javascript:;' class='open-help-tab'>手册</a>
</li><li><a href='/tutorial-start.html' class='iframe' data-width='800' data-headerless='true' data-backdrop='true' data-keyboard='true'>新手教程</a>
</li><li><a href='/misc-changeLog.html' class='iframe' data-width='800' data-headerless='true' data-backdrop='true' data-keyboard='true'>修改日志</a>
</li></ul></div><a href='/misc-about.html' class='about iframe' data-width='900' data-headerless='true' data-backdrop='true' data-keyboard='true' data-class='modal-about'>关于</a>
</div>
    <h5 id='companyname'>
      try项目管理系统    </h5>
  </div>
  <nav id='mainmenu'>
    <ul class='nav'>
<li  data-id='my'><a href='/my/' ><i class="icon-home"></i><span> 我的地盘</span></a></li>
<li class='active' data-id='product'><a href='/product/' class='active'>产品</a></li>
<li  data-id='project'><a href='/project/' >项目</a></li>
<li  data-id='qa'><a href='/qa/' >测试</a></li>
<li  data-id='doc'><a href='/doc/' >文档</a></li>
<li  data-id='report'><a href='/report/' >统计</a></li>
<li  data-id='company'><a href='/company/' >组织</a></li>
<li  data-id='admin'><a href='/admin/' >后台</a></li>
<li  data-id='feedback'><a href='/feedback-admin.html' >反馈</a></li>
<li class='custom-item'><a href='/custom-ajaxMenu-product-browse.html?onlybody=yes' data-toggle='modal' data-type='iframe' title='自定义导航' data-icon='cog' data-width='80%'><i class='icon icon-cog'></i></a></li></ul>
<div class='input-group input-group-sm' id='searchbox'><div class='input-group-btn' id='typeSelector'><button type='button' class='btn dropdown-toggle' data-toggle='dropdown'><span id='searchTypeName'>需求</span> <span class='caret'></span></button><input type='hidden' name='searchType' id='searchType' value='story'  />
<ul class='dropdown-menu'><li><a href='javascript:;' data-value='bug'>Bug</a></li><li><a href='javascript:;' data-value='story'>需求</a></li><li><a href='javascript:;' data-value='task'>任务</a></li><li><a href='javascript:;' data-value='testcase'>用例</a></li><li><a href='javascript:;' data-value='project'>项目</a></li><li><a href='javascript:;' data-value='product'>产品</a></li><li><a href='javascript:;' data-value='user'>用户</a></li><li><a href='javascript:;' data-value='build'>版本</a></li><li><a href='javascript:;' data-value='release'>发布</a></li><li><a href='javascript:;' data-value='productplan'>产品计划</a></li><li><a href='javascript:;' data-value='testtask'>测试版本</a></li><li><a href='javascript:;' data-value='doc'>文档</a></li><li><a href='javascript:;' data-value='caselib'>用例库</a></li><li><a href='javascript:;' data-value='testreport'>测试报告</a></li><li><a href='javascript:;' data-value='all'>全部</a></li><li><a href='javascript:;' data-value='todo'>待办</a></li><li><a href='javascript:;' data-value='effort'>日志</a></li><li><a href='javascript:;' data-value='testsuite'>套件</a></li></ul></div><input type='text' name='searchQuery' id='searchQuery' value='' onclick='this.value=""' onkeydown='if(event.keyCode==13) shortcut()' class='form-control' placeholder='' />
<div id='objectSwitcher' class='input-group-btn'><a href='javascript:shortcut();' class='btn'>GO! </a></div></div>
  </nav>
  <nav id="modulemenu">
    <ul class='nav'>
<li data-id='list'><a id='currentItem' href="javascript:showSearchMenu('product', '5', 'product', 'browse', '')">dfd <span class='icon-caret-down'></span></a><div id='dropMenu'><i class='icon icon-spin icon-spinner'></i></div></li>
<li class='right ' data-id='index'><a href='/product-index-no.html' ><i class='icon-home'></i>产品主页</a>
</li>
<li class=' active' data-id='story'><a href='/product-browse-5.html' >需求</a>
</li>
<li class=' ' data-id='dynamic'><a href='/product-dynamic-5.html' >动态</a>
</li>
<li class=' ' data-id='plan'><a href='/productplan-browse-5.html' >计划</a>
</li>
<li class=' ' data-id='release'><a href='/release-browse-5.html' >发布</a>
</li>
<li class=' ' data-id='roadmap'><a href='/product-roadmap-5.html' >路线图</a>
</li>
<li class=' ' data-id='doc'><a href='/doc-objectLibs-product-5-product.html' >文档</a>
</li>
<li class=' ' data-id='project'><a href='/product-project-all-5.html' >项目</a>
</li>
<li class=' ' data-id='module'><a href='/tree-browse-5-story.html' >模块</a>
</li>
<li class=' ' data-id='view'><a href='/product-view-5.html' >概况</a>
</li>
<li class='right ' data-id='create'><a href='/product-create.html' ><i class='icon-plus'></i>&nbsp;添加产品</a>
</li>
<li class='right ' data-id='all'><a href='/product-all-5.html' ><i class='icon-cubes'></i>&nbsp;所有产品</a>
</li>
</ul>
  </nav>
</header>

<div id='wrap'>
  <div class='outer'>
<style>
.datatable-menu-wrapper {position: relative;}
.datatable-menu {position: absolute; right: 0; top: 0; border: 1px solid #ddd; background: #fff; z-index: 999;}
.datatable-menu > .btn {padding: 5px 6px; outline: none; color: #4d90fe!important}
.datatable-menu > .btn:hover {color: #002563!important}
.datatable + .datatable-menu-wrapper .datatable-menu > .btn {padding: 5px 6px 6px;}
</style>
<script>
$(function()
{
    var table = $('#wrap > .outer > .main > form > table').first();
    if($(table).length > 0)
    {
        var $dropdown = $("<div class='datatable-menu-wrapper'><div class='dropdown datatable-menu'><button type='button' class='btn btn-link' data-toggle='dropdown'><i class='icon-cogs'></i> <span class='caret'></span></button></div></div>");
        var $dropmenu = $("<ul class='dropdown-menu pull-right'></ul>");
        $dropmenu.append("<li><a href='javascript:;' id='switchToDatatable'>切换到高级表格</a></li>");
        $dropdown.children('.dropdown').append($dropmenu);
        $(table).before($dropdown);
                $('.side .side-body .panel-body .tree').parent().append("<div class='text-right'><a href='javascript:;' data-toggle='showModuleModal'>列表页是否显示模块名</a></div>");
                $("a[data-toggle='showModuleModal']").click(function(){$('#showModuleModal').modal('show')});
    }

    $('#switchToDatatable').click(function()
    {
        saveDatatableConfig('mode', 'datatable', true)
    });

    $('#setShowModule').click(function()
    {
        saveDatatableConfig('showModule', $('#showModuleModal input[name="showModule"]:checked').val(), true)
    });

    function saveDatatableConfig(name, value, reload)
    {
        if('demo' == 'guest') return;
        datatableId = 'productBrowse';
        if(typeof value === 'object') value = JSON.stringify(value);
        $.ajax(
        {
            type: "POST",
            dataType: 'json',
            data: {target: datatableId, name: name, value: value},
            success:function(){if(reload) window.location.reload();},
            url: '/datatable-ajaxSave.html'
        });
    };
});
</script>
<div class="modal fade" id="showModuleModal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog w-600px">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title"><i class="icon-cog"></i> 列表页是否显示模块名</h4>
      </div>
      <div class="modal-body">
        <form class='form-condensed' method='post' target='hiddenwin' action='/datatable-ajaxSave.html'>
          <p>
            <span><label class='radio-inline'><input type='radio' name='showModule' value='0'  checked ='checked' id='showModule0' /> 不显示</label><label class='radio-inline'><input type='radio' name='showModule' value='base'  id='showModulebase' /> 只显示一级模块</label><label class='radio-inline'><input type='radio' name='showModule' value='end'  id='showModuleend' /> 只显示最后一级模块</label></span>
            <button type='button' id='setShowModule' class='btn btn-primary'>保存</button>
          </p>
        </form>
      </div>
    </div>
  </div>
</div>
<script language='Javascript'>browseType = "unclosed";</script>
<div id='featurebar'>
  <ul class='nav'>
    <li>
      <div class='label-angle'>
        所有模块      </div>
    </li>
                <li id='unclosedTab'><a href='/product-browse-5-0-unclosed.html' >未关闭</a>
</li>
                    <li id='allstoryTab'><a href='/product-browse-5-0-allstory.html' >全部需求</a>
</li>
                    <li id='assignedtomeTab'><a href='/product-browse-5-0-assignedtome.html' >指派给我</a>
</li>
                    <li id='openedbymeTab'><a href='/product-browse-5-0-openedbyme.html' >由我创建</a>
</li>
                    <li id='reviewedbymeTab'><a href='/product-browse-5-0-reviewedbyme.html' >由我评审</a>
</li>
                    <li id='closedbymeTab'><a href='/product-browse-5-0-closedbyme.html' >由我关闭</a>
</li>
                    <li id='draftstoryTab'><a href='/product-browse-5-0-draftstory.html' >草稿</a>
</li>
                    <li id='activestoryTab'><a href='/product-browse-5-0-activestory.html' >激活</a>
</li>
                    <li id='changedstoryTab'><a href='/product-browse-5-0-changedstory.html' >已变更</a>
</li>
                    <li id='willcloseTab'><a href='/product-browse-5-0-willclose.html' >待关闭</a>
</li>
                    <li id='closedstoryTab'><a href='/product-browse-5-0-closedstory.html' >已关闭</a>
</li>
            <li id='bysearchTab'><a href='javascript:;'><i class='icon-search icon'></i> 搜索</a></li>
  </ul>
  <div class='actions'>
    <div class='btn-group'>
      <div class='btn-group'>
        <button type='button' class='btn btn-default dropdown-toggle' data-toggle='dropdown'>
          <i class='icon-download-alt'></i> 导出          <span class='caret'></span>
        </button>
        <ul class='dropdown-menu' id='exportActionMenu'>
        <li><a href='/story-export-5-id_desc.html' class='export'>导出数据</a>
</li>        </ul>
      </div>
        <a href='/story-report-5-unclosed-0-0.html' class='btn ' ><i class='icon-common-report icon-bar-chart'></i> 报表</a>
    </div>
    <div class="btn-group" id='createActionMenu'>
      <a href='/story-create-5-0-0.html' class='btn btn-primary'><i class='icon icon-plus'></i>提需求</a>
      <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
        <span class="caret"></span>
      </button>
      <ul class='dropdown-menu pull-right'>
      <li><a href='/story-batchCreate-5-0-0.html' >批量添加</a>
</li>      </ul>
    </div>
  </div>
  <div id='querybox' class=''></div>
</div>
<div class='side' id='treebox'>
  <a class='side-handle' data-id='productTree'><i class='icon-caret-left'></i></a>
  <div class='side-body'>
    <div class='panel panel-sm'>
      <div class='panel-heading nobr'><i class='icon-cube'></i> <strong>dfd</strong></div>
      <div class='panel-body'>
        <ul class='tree tree-lines'></ul>
        <div class='text-right'>
          <a href='/tree-browse-5-story.html' >维护模块</a>
        </div>
      </div>
    </div>
  </div>
</div>
<div class='main'>
  <script>setTreeBox();</script>
  <form method='post' id='productStoryForm'>
        <script src='http://cdn.zentao.net/9.1.2/js/jquery/tablesorter/min.js?v=pro6.2' type='text/javascript'></script>
<script src='http://cdn.zentao.net/9.1.2/js/jquery/tablesorter/metadata.js?v=pro6.2' type='text/javascript'></script>
<style>
table.tablesorter tr.tablesorter-headerRow .header.tablesorter-headerUnSorted .tablesorter-header-inner:after{font-family: NewZenIcon; font-weight: normal; content: "\e6bd"; font-size: 14px;}
table.tablesorter tr.tablesorter-headerRow .header.headerSortUp .tablesorter-header-inner:after{font-family: NewZenIcon; font-weight: normal; content: "\e6b9"; font-size: 14px; color: #03C;}
table.tablesorter tr.tablesorter-headerRow .header.headerSortDown .tablesorter-header-inner:after{font-family: NewZenIcon; font-weight: normal; content: "\e6b8"; font-size: 14px; color: #03C;}
table.tablesorter tr.tablesorter-headerRow .header.sorter-false .tablesorter-header-inner:after{content:"";}
</style>
<script>
function sortTable(selector, options)
{
    var $table = $(selector);
    $table.tablesorter($.extend(
    {
        saveSort: true,
        widgets: ['zebra', 'saveSort'], 
        widgetZebra: {css: ['odd', 'even'] }
    }, $table.data(), options)).on('mouseenter', 'tbody tr', function()
    {
        $(this).addClass('hoover');
    }).on('mouseleave', 'tbody tr', function()
    {
        $(this).removeClass('hoover');
    }).on('click', 'tbody tr', function()
    {
        $(this).toggleClass('clicked');
    });
}
$.fn.sortTable = function(options)
{
    return this.each(function()
    {
        sortTable(this, options);
    });
};
/* sort table after page load. */
$(function(){$('.tablesorter').sortTable();});
</script>
    <table class='table table-condensed table-hover table-striped tablesorter table-fixed table-selectable' id='storyList'>
      <thead>
      <tr>
        <th class='w-id {sorter:false}'>  <div class='headerSortUp'><a href='/product-browse-5-0-unclosed-0-id_asc-1-20.html' >ID</a>
</div></th>
        <th class='w-pri {sorter:false}'> <div class='header'><a href='/product-browse-5-0-unclosed-0-pri_asc-1-20.html' >P</a>
</div></th>
        <th class='w-p30 {sorter:false}'> <div class='header'><a href='/product-browse-5-0-unclosed-0-title_asc-1-20.html' >需求名称</a>
</div></th>
        <th class='w-90px {sorter:false}'><div class='header'><a href='/product-browse-5-0-unclosed-0-plan_asc-1-20.html' >计划</a>
</div></th>
        <th class='w-user {sorter:false}'><div class='header'><a href='/product-browse-5-0-unclosed-0-openedBy_asc-1-20.html' >创建</a>
</div></th>
        <th class='w-user {sorter:false}'><div class='header'><a href='/product-browse-5-0-unclosed-0-assignedTo_asc-1-20.html' >指派</a>
</div></th>
        <th class='w-hour {sorter:false}'><div class='header'><a href='/product-browse-5-0-unclosed-0-estimate_asc-1-20.html' >预计</a>
</div></th>
        <th class='w-50px {sorter:false}'><div class='header'><a href='/product-browse-5-0-unclosed-0-status_asc-1-20.html' >状态</a>
</div></th>
        <th class='w-70px {sorter:false}'><div class='header'><a href='/product-browse-5-0-unclosed-0-stage_asc-1-20.html' >阶段</a>
</div></th>
        <th title='任务数' class='w-30px'>T</th>
        <th title='Bug数'  class='w-30px'>B</th>
        <th title='用例数' class='w-30px'>C</th>
        <th class='w-140px {sorter:false}'>操作</th>
      </tr>
      </thead>
            <tbody>
                  <tr class='text-center'>
        <td class='cell-id'>
          <input type='checkbox' name='storyIDList[10]' value='10' /> 
          <a href='/story-view-10.html' >010</a>
        </td>
        <td><span class='pri'></span></td>
        <td class='text-left' title="hgtgh"><nobr>
                        <a href='/story-view-10.html' style='color: '>hgtgh</a>
        </nobr></td>
        <td title=" "> </td>
        <td>Demo</td>
        <td></td>
        <td>10</td>
        <td class='story-active'>激活</td>
        <td>
          <div'>未开始</div>        </td>
        <td class='linkbox'>
          0        </td>
        <td class='linkbox'>
          0        </td>
        <td class='linkbox'>
          0        </td>
        <td class='text-right'>
          <a href='/story-change-10.html' class='btn-icon ' title='变更' ><i class='icon-story-change icon-random'></i></a><button type='button' class='disabled btn-icon '><i class='icon-story-review disabled icon-review' title='评审' ></i></button><a href='/story-close-10.html?onlybody=yes' class='btn-icon iframe' title='关闭' ><i class='icon-story-close icon-off'></i></a><a href='/story-edit-10.html' class='btn-icon ' title='编辑' ><i class='icon-common-edit icon-pencil'></i></a><a href='/testcase-create-5-0-0--0-10.html' class='btn-icon ' title='建用例' ><i class='icon-testcase-create icon-sitemap'></i></a>        </td>
      </tr>
            </tbody>
            <tfoot>
      <tr>
        <td colspan='13'>
          <div class='table-actions clearfix'>
                        <div class='checkbox btn'><label><input type='checkbox' data-scope='' class='rows-selector'> 选择</label></div>                        <div class='btn-group dropup'>
               <button type='button' class='btn btn-default' onclick="setFormAction('/story-batchEdit-5-0-0.html')" >编辑</button>              <button type='button' class='btn dropdown-toggle' data-toggle='dropdown'><span class='caret'></span></button>
              <ul class='dropdown-menu'>
                <li><a href='#' onclick="setFormAction('/story-batchClose-5-0.html')">关闭</a>
</li><li class='dropdown-submenu'><a href='javascript:;' id='reviewItem'>评审</a>
<ul class='dropdown-menu'><li><a href='#' onclick="setFormAction('/story-batchReview-pass.html','hiddenwin')">确认通过</a>
</li><li><a href='#' onclick="setFormAction('/story-batchReview-clarify.html','hiddenwin')">有待明确</a>
</li><li class='dropdown-submenu'><a href='#' id='rejectItem'>拒绝</a>
<ul class='dropdown-menu'><li><a href='#' onclick="setFormAction('/story-batchReview-reject-done.html','hiddenwin')">已完成</a>
</li><li><a href='#' onclick="setFormAction('/story-batchReview-reject-postponed.html','hiddenwin')">延期</a>
</li><li><a href='#' onclick="setFormAction('/story-batchReview-reject-willnotdo.html','hiddenwin')">不做</a>
</li><li><a href='#' onclick="setFormAction('/story-batchReview-reject-cancel.html','hiddenwin')">已取消</a>
</li><li><a href='#' onclick="setFormAction('/story-batchReview-reject-bydesign.html','hiddenwin')">设计如此</a>
</li></ul></li></ul></li><li class='dropdown-submenu'><a href='javascript:;' id='moduleItem'>模块</a>
<div class='dropdown-menu'><ul class='dropdown-list'><li class='option' data-key='0'><a href='#' onclick="setFormAction('/story-batchChangeModule-0.html','hiddenwin')">/</a>
</li></ul></div></li><li class='dropdown-submenu'><a href='javascript:;' id='planItem'>计划</a>
<div class='dropdown-menu'><ul class='dropdown-list'><li class='option' data-key='0'><a href='#' onclick="setFormAction('/story-batchChangePlan-0.html','hiddenwin')">空</a>
</li></ul></div></li><li class='dropdown-submenu'><a href='javascript:;' id='stageItem'>阶段</a>
<ul class='dropdown-menu'><li><a href='#' onclick="setFormAction('/story-batchChangeStage-.html','hiddenwin')">空</a>
</li><li><a href='#' onclick="setFormAction('/story-batchChangeStage-wait.html','hiddenwin')">未开始</a>
</li><li><a href='#' onclick="setFormAction('/story-batchChangeStage-planned.html','hiddenwin')">已计划</a>
</li><li><a href='#' onclick="setFormAction('/story-batchChangeStage-projected.html','hiddenwin')">已立项</a>
</li><li><a href='#' onclick="setFormAction('/story-batchChangeStage-developing.html','hiddenwin')">研发中</a>
</li><li><a href='#' onclick="setFormAction('/story-batchChangeStage-developed.html','hiddenwin')">研发完毕</a>
</li><li><a href='#' onclick="setFormAction('/story-batchChangeStage-testing.html','hiddenwin')">测试中</a>
</li><li><a href='#' onclick="setFormAction('/story-batchChangeStage-tested.html','hiddenwin')">测试完毕</a>
</li><li><a href='#' onclick="setFormAction('/story-batchChangeStage-verified.html','hiddenwin')">已验收</a>
</li><li><a href='#' onclick="setFormAction('/story-batchChangeStage-released.html','hiddenwin')">已发布</a>
</li></ul></li><li class='dropdown-submenu'><select name='assignedTo' id='assignedTo' class="hidden">
<option value='' selected='selected' data-keys=' '></option>
<option value='productManager' data-keys='chanpinjingli cpjl'>产品经理</option>
<option value='admin' data-keys='admin a'>admin</option>
<option value='demo' data-keys='demo d'>Demo</option>
<option value='feedback' data-keys='feedback f'>Feedback</option>
<option value='dev1' data-keys='kaifajia kfj'>开发甲</option>
<option value='dev2' data-keys='kaifayi kfy'>开发乙</option>
<option value='dev3' data-keys='kaifabing kfb'>开发丙</option>
<option value='projectManager' data-keys='xiangmujingli xmjl'>项目经理</option>
<option value='tester1' data-keys='ceshijia csj'>测试甲</option>
<option value='tester2' data-keys='ceshiyi csy'>测试乙</option>
<option value='tester3' data-keys='ceshibing csb'>测试丙</option>
<option value='testManager' data-keys='ceshijingli csjl'>测试经理</option>
<option value='closed' data-keys='closed c'>Closed</option>
</select>
<a href='javascript::' id="assignItem">指派给</a>
<div class='dropdown-menu with-search'><ul class="dropdown-list"><li class='option' data-key='productManager'><a href='javascript:$(".table-actions #assignedTo").val("productManager");setFormAction("/story-batchAssignTo-5.html")' >产品经理</a>
</li><li class='option' data-key='admin'><a href='javascript:$(".table-actions #assignedTo").val("admin");setFormAction("/story-batchAssignTo-5.html")' >admin</a>
</li><li class='option' data-key='demo'><a href='javascript:$(".table-actions #assignedTo").val("demo");setFormAction("/story-batchAssignTo-5.html")' >Demo</a>
</li><li class='option' data-key='feedback'><a href='javascript:$(".table-actions #assignedTo").val("feedback");setFormAction("/story-batchAssignTo-5.html")' >Feedback</a>
</li><li class='option' data-key='dev1'><a href='javascript:$(".table-actions #assignedTo").val("dev1");setFormAction("/story-batchAssignTo-5.html")' >开发甲</a>
</li><li class='option' data-key='dev2'><a href='javascript:$(".table-actions #assignedTo").val("dev2");setFormAction("/story-batchAssignTo-5.html")' >开发乙</a>
</li><li class='option' data-key='dev3'><a href='javascript:$(".table-actions #assignedTo").val("dev3");setFormAction("/story-batchAssignTo-5.html")' >开发丙</a>
</li><li class='option' data-key='projectManager'><a href='javascript:$(".table-actions #assignedTo").val("projectManager");setFormAction("/story-batchAssignTo-5.html")' >项目经理</a>
</li><li class='option' data-key='tester1'><a href='javascript:$(".table-actions #assignedTo").val("tester1");setFormAction("/story-batchAssignTo-5.html")' >测试甲</a>
</li><li class='option' data-key='tester2'><a href='javascript:$(".table-actions #assignedTo").val("tester2");setFormAction("/story-batchAssignTo-5.html")' >测试乙</a>
</li><li class='option' data-key='tester3'><a href='javascript:$(".table-actions #assignedTo").val("tester3");setFormAction("/story-batchAssignTo-5.html")' >测试丙</a>
</li><li class='option' data-key='testManager'><a href='javascript:$(".table-actions #assignedTo").val("testManager");setFormAction("/story-batchAssignTo-5.html")' >测试经理</a>
</li></ul><div class='menu-search'><div class='input-group input-group-sm'><input type='text' class='form-control'><span class='input-group-addon'><i class='icon-search'></i></span></div></div></div></li>              </ul>
            </div>
                        <div class='text'>本页共 <strong>1</strong> 个需求，预计 <strong>10</strong> 个工时，用例覆盖率<strong>0%</strong>。</div>
          </div>
          <div style='float:right; clear:none;' class='pager form-inline'>共 <strong>1</strong> 条记录，<div class='dropdown dropup'><a href='javascript:;' data-toggle='dropdown' id='_recPerPage' data-value='20'>每页 <strong>20</strong> 条<span class='caret'></span></a><ul class='dropdown-menu'><li><a href='javascript:submitPage("changeRecPerPage", 5)'>5</a></li><li><a href='javascript:submitPage("changeRecPerPage", 10)'>10</a></li><li><a href='javascript:submitPage("changeRecPerPage", 15)'>15</a></li><li class='active'><a href='javascript:submitPage("changeRecPerPage", 20)'>20</a></li><li><a href='javascript:submitPage("changeRecPerPage", 25)'>25</a></li><li><a href='javascript:submitPage("changeRecPerPage", 30)'>30</a></li><li><a href='javascript:submitPage("changeRecPerPage", 35)'>35</a></li><li><a href='javascript:submitPage("changeRecPerPage", 40)'>40</a></li><li><a href='javascript:submitPage("changeRecPerPage", 45)'>45</a></li><li><a href='javascript:submitPage("changeRecPerPage", 50)'>50</a></li><li><a href='javascript:submitPage("changeRecPerPage", 100)'>100</a></li><li><a href='javascript:submitPage("changeRecPerPage", 200)'>200</a></li><li><a href='javascript:submitPage("changeRecPerPage", 500)'>500</a></li><li><a href='javascript:submitPage("changeRecPerPage", 1000)'>1000</a></li><li><a href='javascript:submitPage("changeRecPerPage", 2000)'>2000</a></li></ul></div> <strong>1/1</strong> &nbsp; <i class='icon-step-backward' title='首页'></i> <i class='icon-play icon-rotate-180' title='上一页'></i> <i class='icon-play' title='下一页'></i> <i class='icon-step-forward' title='末页'></i> <input type='hidden' id='_recTotal'  value='1' />
<input type='hidden' id='_pageTotal' value='1' />
<input type='text'   id='_pageID'    value='1' style='text-align:center;width:30px;' class='form-control' /> 
<input type='button' id='goto'       value='GO!' onclick='submitPage("changePageID");' class='btn'/>        <script language='Javascript'>
        vars = 'productID=0&branch=&browseType=unclosed&param=0&orderBy=&recTotal=_recTotal_&recPerPage=_recPerPage_&pageID=_pageID_';
        pageCookie = 'pagerProductBrowse';
        function submitPage(mode, perPage)
        {
            pageTotal  = parseInt(document.getElementById('_pageTotal').value);
            pageID     = document.getElementById('_pageID').value;
            recPerPage = document.getElementById('_recPerPage').getAttribute('data-value');
            recTotal   = document.getElementById('_recTotal').value;
            if(mode == 'changePageID')
            {
                if(pageID > pageTotal) pageID = pageTotal;
                if(pageID < 1) pageID = 1;
            }
            else if(mode == 'changeRecPerPage')
            {
                recPerPage = perPage;
                pageID = 1;
            }
            $.cookie(pageCookie, recPerPage, {expires:config.cookieLife, path:config.webRoot});

            vars = vars.replace('_recTotal_', recTotal)
            vars = vars.replace('_recPerPage_', recPerPage)
            vars = vars.replace('_pageID_', pageID);
            location.href=createLink('product', 'browse', vars);
        }
        </script></div>        </td>
      </tr>
      </tfoot>
    </table>
  </form>
</div>
<script language='javascript'>
var moduleID = 0;
$('#module0').addClass('active');
$('#unclosedTab').addClass('active');
</script>
  </div>  <script>setTreeBox()</script>
    
  <div id='divider'></div>
  <iframe frameborder='0' name='hiddenwin' id='hiddenwin' scrolling='no' class='debugwin hidden'></iframe>
</div><div id='footer'>
  <div id='crumbs'>
    <a href='/my/' >禅道</a>
&nbsp;<i class="icon-angle-right"></i>&nbsp;<a href='/product/' >产品</a>
&nbsp;<i class="icon-angle-right"></i>&nbsp;dfd&nbsp;<i class="icon-angle-right"></i>&nbsp;浏览产品  </div>
  <div id='poweredby'>
  <a href='http://www.zentao.net' target='_blank' class='text-primary'><i class='icon-zentao'></i> 禅道pro6.2</a> &nbsp;
        <a href='/misc-downNotify.html' title='下载桌面提醒'><i class='icon-bell'></i></a>
 &nbsp;   </div>
</div>


<script>config.onlybody = 'no';</script>
<script language='Javascript'>function setWhite(acl)
{
    acl == 'custom' ? $('#whitelistBox').removeClass('hidden') : $('#whitelistBox').addClass('hidden');
}
$(function()
{
    if(browseType == 'bysearch') ajaxGetSearchForm();

    $('.dropdown-menu.with-search .menu-search').click(function(e)
    {
        e.stopPropagation();
        return false;
    }).on('keyup change paste', 'input', function()
    {
        var $input = $(this);
        var val = $input.val().toLowerCase();
        var $options = $input.closest('.dropdown-menu.with-search').find('.option');
        if(val == '') return $options.removeClass('hide');
        $options.each(function()
        {
            var $option = $(this);
            $option.toggleClass('hide', $option.text().toString().toLowerCase().indexOf(val) < 0 && $option.data('key').toString().toLowerCase().indexOf(val) < 0);
        });
    });

    $('.popoverStage').mouseover(function(){$(this).popover('show')});
    $('.popoverStage').mouseout(function(){$(this).popover('hide')});
    setTimeout(function(){fixedTfootAction('#productStoryForm')}, 100);
    setTimeout(function(){fixedTheadOfList('#storyList')}, 100);
})

</script>
<script>
$(function()
{
    $('#poweredby a:first').html('<i class="icon-zentao"></i> 禅道专业版 6.2');
})
</script>
<script>
$('#poweredby a:first').attr('title', '到期时间：2018-04-12，授权人数：50');
</script>
<script>
$('#poweredby a:first').after("(pro6.2  试用)");
</script>
<div class='hidden'><script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_4553360'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s5.cnzz.com/stat.php%3Fid%3D4553360' type='text/javascript'%3E%3C/script%3E"));</script></div>
<style>
#searchbox .dropdown-menu {margin-top: 0; left: 1px;}
#searchbox .dropdown-menu > li > a {padding: 5px 8px}
#searchbox .dropdown-menu > li {display: none}
#searchbox .dropdown-menu > li.search-type-all {width: 100%; display: block;}
#searchbox .dropdown-menu > li:hover {position: relative;}
#searchbox .dropdown-menu > li.active > a:before, #searchbox .dropdown-menu > li:hover > a:before {content: '\e6e1'; font-family: NewZenIcon; font-size: 14px; position: absolute; right: 8px; top: 4px; display: block; color: #808080; font-weight: normal;}
#searchbox .dropdown-menu > li.search-type-all.active > a:before, #searchbox .dropdown-menu > li.search-type-all:hover > a:before {content: '\e603'; font-family: NewZenIcon;}
#searchbox .dropdown-menu.show-quick-go.with-active {padding-top: 28px; position: absolute;}
#searchbox .dropdown-menu.show-quick-go > li {display: block;}
#searchbox .dropdown-menu.show-quick-go > li.active {position: absolute; top: 0; left: 0; right: 0; width: 100%;}
#objectSwitcher > a.btn {border-left: none; padding-right:5px;}
</style>
<script>
$(function()
{
    var reg = /[^0-9]/;
    var $typeSelector = $('#typeSelector');
    var $dropmenu = $typeSelector.children('.dropdown-menu');
    var $searchQuery = $('#searchQuery');
    var $searchbox = $('#searchbox');
    var searchType = $('#searchType').val();

    var toggleMmenu = function(show)
    {
        $searchbox.toggleClass('open', show);
        $dropmenu.toggleClass('show', show).toggleClass('in', show);
        if(show) $dropmenu.show();
        else $dropmenu.hide();
    };

    var hideMenu = function() {
        toggleMmenu(false);
    };

    var refreshMenu = function()
    {
        var val = $searchQuery.val();
        if(val !== null && val !== "")
        {
            var isQuickGo = !reg.test(val);
            $dropmenu.toggleClass('show-quick-go', isQuickGo);
            var $typeAll = $dropmenu.find('li.search-type-all > a');
            $typeAll.html('搜索 <span>"' + val + '"</span>');
            if(isQuickGo)
            {
                $typeAll.closest('li').removeClass('active');
                $dropmenu.removeClass('with-active').find('li:not(.search-type-all) > a').each(function()
                {
                    var $this = $(this);
                    var isActiveType = $this.data('value') === searchType && searchType !== 'all';
                    $this.closest('li').toggleClass('active', isActiveType);
                    $this.html($this.data('name') + ' <span>#' + (val.length > 4 ? (val.substr(0, 4) + '...') : val) + "</span>");
                    if(isActiveType) $dropmenu.addClass('with-active');
                });
            }
            else
            {
                $dropmenu.find('li.active').removeClass('active');
                $typeAll.closest('li').addClass('active');
            }
            toggleMmenu(true);
        } else
        {
            hideMenu();
        }
    };

    if(searchType == 'bug' && 'product' != 'bug' && 'browse' != 'bug')
    {
        searchType = 'all';
        $('#searchType').val(searchType);
        $('#searchTypeName').html("全部");
    }

    $dropmenu = $dropmenu.appendTo($searchbox);
    $typeSelector.hide();
    $dropmenu.on('click', 'a', function(e)
    {
        shortcut($(this).data('value'), $searchQuery.val());
        e.stopPropagation();
    }).find('li > a').each(function()
    {
        var $this = $(this);
        $this.attr('data-name', $this.text());
    });
    var $allItem = $dropmenu.find('li > a[data-value="all"]');
    if($allItem.length)
    {
        $allItem.closest('li').addClass('search-type-all').prependTo($dropmenu);
    }
    $('#objectSwitcher > a').html('搜索');
    $searchQuery.on('change keyup paste input propertychange', refreshMenu).on('focus', function(){
        setTimeout(refreshMenu, 300);
    });

    $(document).on('click', hideMenu);
});

function shortcut(objectType, objectValue)
{
    if(objectType === undefined) objectType  = $('#searchType').attr('value');
    if(objectValue === undefined) objectValue = $('#searchQuery').attr('value');
    if(objectType && objectValue)
    {
        var reg = /[^0-9]/;
        if(reg.test(objectValue) || objectType == 'all')
        {
            location.href=createLink('search', 'index') + (config.requestType == 'PATH_INFO' ? '?words=' + objectValue : '&words=' + objectValue);
        }
        else
        {
            location.href=createLink(objectType, 'view', "id=" + objectValue);
        }
    }    
}
</script>
</body>
</html>
<script language='Javascript'>
$(function(){
    $('#featurebar .actions').prepend("");
    $('#exportActionMenu').append("<li><a href='\/story-exportTemplet-5-0.html' class='exportTemplet'>\u5bfc\u51fa\u6a21\u677f<\/a>\n<\/li>");
    $(".import").colorbox({width:500, height:200, iframe:true, transition:'none'});
    $(".exportTemplet").colorbox({width:500, height:200, iframe:true, transition:'none'});
})
</script>
