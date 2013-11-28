<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="yi.core.*" %>
<%@page import="yi.debugger.*" %>
<%
Debugger debugger = DebuggerPage.newDebugger(request);
Mod mod = debugger.getMod();
// 是否直接载入
String load = request.getParameter("load");
boolean direct = (null != load && (load.equals("1") || load.equals("true")));
%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><%=mod.getName()%> <%=mod.getVersion()%> - 调试器</title>
<%=Stage.importStyles("../lib/") %>
<link href="assets/css/app-debugger.css" rel="stylesheet" />
</head>

<body>
<header class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".navbar-collapse">
      	<span class="sr-only">Toggle navigation</span>
      	<span class="icon-bar"></span>
      	<span class="icon-bar"></span>
      	<span class="icon-bar"></span>
      </button>
      <div class="navbar-brand">调试器</div>
    </div>
  </div>
</header>

<div class="container">
  <div class="row">
    <div class="col-md-12">
      <form class="form-horizontal" role="form">
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input_args">模组参数</label>
          <div class="col-sm-8">
            <input type="text" class="form-control" id="input_args" placeholder="输入模组参数" maxlength="512" />
          </div>
          <div class="col-sm-2">
            <button id="btn_run" type="button" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="加载调试"><span class="glyphicon glyphicon-play"></span></button>
            <button id="btn_clear" type="button" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="清空参数"><span class="glyphicon glyphicon-trash"></span></button>
          </div>
        </div>
      </form>
    </div>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="panel panel-primary">
        <div class="panel-heading">
          <div class="panel-title"><%=mod.getName()%> <%=mod.getVersion()%> - 预览</div>
        </div>
        <div id="mod" class="panel-body">
        </div>
      </div>
    </div>
  </div>
</div>

<!-- 页脚 -->
<div class="container page-wrapper-footer">
  <div class="row">
    <div class="col-md-12">
      <div>
        <p class="text-muted credit">&copy; 2013,2014 东华软件</p>
      </div>
    </div>
  </div>
</div>
<%=Stage.importScripts("../lib/")%>
<script type="text/javascript">
(function() {
	this.mod = <%=mod.toJSONString()%>;
	this.direct = <%=direct%>;
})();
</script>
<script src="assets/js/app-debugger.js" type="text/javascript"></script>
</body>
</html>
