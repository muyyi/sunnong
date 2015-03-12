<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<title>商品信息修改</title>
<link href="../../Styles/layou.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="container">
  <div id="header">
      <h1>商品管理</h1>
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
            <h2>商品信息修改</h2>
            <div id="product_edit"></div>
             <form action="/admin/SaveEdit_Product/<%=ViewData["ProductID"] %>" method="post">
            
           
<p><asp:Label ID="id" Text="<%=ViewData["ProductID"] %>"   Visible="false"></asp:Label></p>         
<p>商品名称：<input type="text" value="<%=ViewData["Name"] %>"  name="name" /></p>
<p>商品类别: <%= Html.DropDownList("Category")%> </p>
<p>商品描述：<textarea name="description" id="description" cols="40" rows="10">
</textarea></p>
<script type="text/javascript">
<!--
    var ta = document.getElementById("description");
    ta.value = "<%=ViewData["BeiZhu"]%>";
-->
</script>
<%--给textarea赋值的方法--%>

<p>商品产地：<input type="text" value="<%=ViewData["ChangDi"] %>" name="changdi" /></p>
<p>供应商: <%= Html.DropDownList("Supplier")%></p> 
<%--无法绑定相关数据的问题待解决--%>
<p><input type="submit" value="提 交" /></p>


<%--<p><a href="/admin/SaveEdit/<%=ViewData["ProductID"] %>">提交修改</a></p>--%>
</form>
          </div>
        </div>
    <div id="side">
          <div class="sidebox">
            <h4>相关操作</h4>
            <ul>
            <li><a href="/admin/addproduct">添加商品</a></li>
            <li><a href="#">商品类别管理</a></li>
            <li><a href="/admin/EditProduct/<%=ViewData["ProductID"]%>">修改商品信息</a></li>
            <li><a href="/admin/deleteproduct/<%=ViewData["ProductID"]%>">删除该商品</a></li>
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
