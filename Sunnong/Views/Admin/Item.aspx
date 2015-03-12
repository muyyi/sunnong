<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<title>商品详细信息</title>
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
            <h2>商品详细信息</h2>
            <div id="product_item">
            <div id="product_main">
  <div id="product_detail">
  <h2><span>供应信息</span></h2>
  <div id="product_image">
  <img src="/content/img_pro/pro_<%=ViewData["ProductID"]%>.jpg"  width="227" height="198"/>
  </div>
  <div id="product_detail1">
  <ul>
  <li><span>商品名称</span>：<%=ViewData["Name"]%></li>
  <li><span>商品类型</span>：<%=ViewData["Category"]%></li>
  <li><span>供应商</span>： <%=ViewData["Supplier"]%></li>
  <li><span>产地</span>：<%=ViewData["ChangDi"]%></li>
  </ul>
  </div>
  </div>

  <div id="product_detail2">
  <h2><span>详细说明</span></h2>
  <br /><%=ViewData["Description"]%>
  </div>
  

 </div>
      </div>
          </div>
        </div>
    <div id="side">
          <div class="sidebox">
            <h4>相关操作</h4>
            <ul>
            <li><a href="/admin/addproduct">添加商品</a></li>
            <li><a href="#">商品类别管理</a></li>
            <li><a href="/admin/editproduct/<%=ViewData["ProductID"]%>">修改商品信息</a></li>
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
