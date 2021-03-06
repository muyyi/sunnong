﻿<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<title>管理首页</title>
<link href="../../Styles/layou.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="container">
  <div id="header">
      <h1>欢迎你，管理员！</h1>
  </div>
  <div class="clearfloat"></div>
  <div id="nav">
    <ul>
      <li><a href="/admin">返回首页</a></li>
      <li><a href="/admin/productlist">商品管理</a></li>
      <li><a href="/admin/newslist">资讯管理</a></li>
      <li><a href="/admin/supplierlist">企业管理</a></li>
      <li><a href="/security/logout">退出登录</a></li>
    </ul>
  </div>
  <div id="mainContent">
        <div id="main">
          <div class="mainbox">
            <h2>相关列表</h2>
            暂无任何数据
          </div>
        </div>
    <div id="side">
          <div class="sidebox">
            <h4>相关操作</h4>
            暂无任何相关操作
          </div>
        </div>
    </div>
    <div class="clearfloat"></div>
    <div id="footer">
    <dl>
    <dt><a href="#"> 关于我们</a>　||　<a href="#">产品目录</a>　||　<a href="#">联系我们</a>　||　<a href="#">友情链接</a>　||　<a href="#">反馈问题</a>　||　<a href="#">广告合作</a></dt>
      <dd>Copyright &copy; 2014   All Rights Reserved<br />
          湖南三农网  版权所有  京ICP备10007159号</dd>
    </dl>
    </div>
</div>
</body>
</html>

