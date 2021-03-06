﻿<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<title>三农产品</title>
<link href="../../Styles/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    //初始化
    var def = "1";
    function mover(object) {
        //主菜单
        var mm = document.getElementById("m_" + object);
        mm.className = "m_li_a";
        //初始主菜单先隐藏效果
        if (def != 0) {
            var mdef = document.getElementById("m_" + def);
            mdef.className = "m_li";
        }
        //子菜单
        var ss = document.getElementById("s_" + object);
        ss.style.display = "block";
        //初始子菜单先隐藏效果
        if (def != 0) {
            var sdef = document.getElementById("s_" + def);
            sdef.style.display = "none";
        }
    }

    function mout(object) {
        //主菜单
        var mm = document.getElementById("m_" + object);
        mm.className = "m_li";
        //初始主菜单还原效果
        if (def != 0) {
            var mdef = document.getElementById("m_" + def);
            mdef.className = "m_li_a";
        }
        //子菜单
        var ss = document.getElementById("s_" + object);
        ss.style.display = "none";
        //初始子菜单还原效果
        if (def != 0) {
            var sdef = document.getElementById("s_" + def);
            sdef.style.display = "block";
        }
    }
</script>
</head>
<body>
<div id="container">
<%-- 此处为top公用视图代码--%>
  <%Html.RenderPartial("top");%>
    <div id="selectbar">
  <form action="Search" method="post" target="_blank">
  请输入要查询的商品名：<input type="text" name="pro_name" /><input type="submit" value="查询" />
  </form>
  </div>
  <div class="clearfloat"></div>
  <div id="maincontent">
    <div id="main">
    <%Html.RenderAction("CategoryBar", "Product");%>    
      <div id="category_1">
        <h2><a class="more" href="/product/category/1">更多..</a><span>农机类</span></h2>
        <ul>
        <%int i = 0;%>
        <% foreach (var p in ViewData["products_1"] as List<Sunnong.Product>)
           { %>          
        	<li><a href="/product/item/<%=p.ProductID %>"><img src="/content/img_pro/pro_<%=p.ProductID%>.jpg" alt="产品名称" width="107" height="87" /><%=p.Name %></a></li>
            <%i++; %>
            <% if (i >= 10) %>
            <% { break; }%>
            <%} %>
        </ul>
      </div>

      <div id="category_2">
        <h2><a class="more" href="/product/category/2">更多..</a><span>农资类</span></h2>
        <ul>
        <%int x = 0;%>
        <% foreach (var p in ViewData["products_2"] as List<Sunnong.Product>)
           { %>          
        	<li><a href="/product/item/<%=p.ProductID %>"><img src="/content/img_pro/pro_<%=p.ProductID %>.jpg" alt="产品名称" width="107" height="87" /><%=p.Name %></a></li>
            <%x++; %>
            <% if (x >= 10) %>
            <% { break; }%>
            <%} %>
        </ul>
      </div>

      <div id="category_3">
        <h2><a class="more" href="/product/category/3">更多..</a><span>种植类</span></h2>
        <ul>
        <%int y = 0;%>
        <% foreach (var p in ViewData["products_3"] as List<Sunnong.Product>)
           { %>          
        	<li><a href="/product/item/<%=p.ProductID %>"><img src="/content/img_pro/pro_<%=p.ProductID %>.jpg" alt="产品名称" width="107" height="87" /><%=p.Name %></a></li>
            <%i++; %>
            <% if (y >= 10) %>
            <% { break; }%>
            <%} %>
        </ul>
      </div>
  </div>
 </div>
  <div class="clearfloat"></div>
<%--  此处为footer公用视图代码--%>
  <%Html.RenderPartial("footer"); %>

</div>
</body>
</html>
