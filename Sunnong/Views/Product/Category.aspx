<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title><%=ViewData["Category"]%></title>
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
  <div id="maincontent">
    <div id="main">
    <%Html.RenderAction("CategoryBar", "Product");%>    
      <div id="category_1">
        <h2><span><%=ViewData["Category"]%></span></h2>
        <ul>
        <%int i = 0;%>
        <% foreach (var p in ViewData.Model as List<Sunnong.Product>)
           { %>          
        	<li><a href="/product/item/<%=p.ProductID %>"><img src="/content/img_pro/pro_<%=p.ProductID %>.jpg" alt="产品名称" width="107" height="87" /><%=p.Name %></a></li>
            <%i++; %>
            <% if (i >= 10) %>
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
