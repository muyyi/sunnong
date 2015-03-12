<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<title>编辑资讯</title>
<link href="../../Styles/layou.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="container">
  <div id="header">
      <h1>资讯管理</h1>
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
            <h2>编辑资讯</h2>
 <form action="/admin/SaveEdit_News/<%=ViewData["NewsID"] %>" method="post">
<p>新闻标题：<input type="text" value="<%=ViewData["Title"] %>"  name="Title" /></p>
<p>新闻类别: <%= Html.DropDownList("NewsType")%> </p>
<p>新闻内容：<textarea name="NewsContent" id="NewsContent" cols="40" rows="10">
</textarea></p>

<script type="text/javascript">
<!--
    var ta = document.getElementById("NewsContent");
    ta.value = "<%=ViewData["NewsContent"]%>";
-->
</script>

<p><input type="submit" value="提 交" /></p>
</form>

          </div>
        </div>
    <div id="side">
          <div class="sidebox">
            <h4>相关操作</h4>
            <ul>
            <li><a href="/admin/addnews">添加资讯</a></li>
            <li><a href="#">资讯类别管理</a></li>
            <li><a href="/admin/EditNews/<%=ViewData["NewsID"]%>">编辑资讯</a></li>
            <li><a href="/admin/deletenews/<%=ViewData["NewsID"]%>">删除该资讯</a></li>
            </ul>
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
