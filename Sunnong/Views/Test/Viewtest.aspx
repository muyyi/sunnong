<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Viewtest</title>
    <link href="/Styles/layout.css" rel="stylesheet" type="text/css" />
   
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
  <div id="maincontent">
    <div id="main">
      
      <div id="index_pic">
        <h2><span></span></h2>
        <ul>
        <%int i = 0;%>
        <% foreach(var p in ViewData["products"] as List<Sunnong.Product>)
           { %>          
        	<li><a href="/product/item/<%=p.ProductID %>"><img src="/images/2.gif" alt="产品名称" width="107" height="87" /><%=p.Name %></a></li>
            <%i++; %>
            <% if (i >= 10) %>
            <% { break; }%>
            <%} %>
        </ul>
      </div>

      <div id="index_pic1">
        <h2><span></span></h2>
        <ul>
        <%int s = 0;%>
        <% foreach(var p in ViewData["products"] as List<Sunnong.Product>)
           { %>          
        	<li><a href="/product/item/<%=p.ProductID %>"><img src="/images/2.gif" alt="产品名称" width="107" height="87" /><%=p.Name %></a></li>
            <%s++; %>
            <% if (s >= 10) %>
            <% { break; }%>
            <%} %>
        </ul>
      </div>

      <div id="index_box">
        <div class="box">
          <h2><a class="more" href="/supplier/index">更多..</a><span>明星企业</span></h2>
          <div class="box_con">
            <ul>
            <%int x = 0;%>
            <% foreach (var p in ViewData["suppliers"] as List<Sunnong.Supplier>)
           { %>
           <li><a href="/Supplier/SupplierDetail/<%=p.SupplierID%>"><%=p.Name%></a></li>        
            <%x++; %>
            <% if (x >= 7) %>
            <%{ break; }  %>
            <%} %>
            </ul>
          </div>
        </div>
        <div class="box box1">
          <h2><a class="more" href="/news/index">更多..</a><span>热门资讯</span></h2>
          <div class="box_con">
            <ul>
            <%int y = 0;%>
            <% foreach (var p in ViewData["news"] as List<Sunnong.News>)
           { %>
           <li><a href="/news/newsdetail/<%=p.NewsID %>"><%=p.Title%></a></li>        
            <%y++; %>
            <% if (y >= 7) %>
            <%{ break; }  %>
            <%} %>
            </ul>
          </div>
        </div>
    </div>
    </div>
   

    <div id="side">
      
      <div class="side_box">
        <h2><strong>使用</strong>问答</h2>
        <div class="side_con ask">
          <dl>
            <dt><a href="#">最新出的这个产品如何使用？</a></dt>
            <dd>该产品采用全新的技术，较上一产品有质的飞跃，功能上增强了许多，使用方法更加简便...</dd>
          </dl>
          <dl>
            <dt><a href="#">最新出的这个产品如何使用？</a></dt>
            <dd>该产品采用全新的技术，较上一...</dd>
          </dl>
          <dl>
            <dt><a href="#">最新出的这个产品如何使用？</a></dt>
            <dd>该产品采用全新的技术，较上一产品有质的飞跃，功能上增强了...</dd>
          </dl>
          <dl>
            <dt><a href="#">最新出的这个产品如何使用？</a></dt>
            <dd>该产品采用全新的技术，较上一产品有质的飞跃，功能上增强...</dd>
          </dl>
          <dl>
            <dt><a href="#">最新出的这个产品如何使用？</a></dt>
            <dd>该产品采用全新的技术，较上一产品有质的飞跃，功能上增强了许多，使用方法更加简便...</dd>
          </dl>
        </div>
      </div>
      <div class="side_box">
        <h2><strong>联系</strong>我们</h2>
        <div class="side_con contact"><a href="#"><img src="/images/tel.gif" alt="联系我们" width="222" height="112" /></a></div>
      </div>
    </div>
  </div>
 
  <div class="clearfloat"></div>
<%--  此处为footer公用视图代码--%>
  <%Html.RenderPartial("footer"); %>

</div>
</body>
</html>
