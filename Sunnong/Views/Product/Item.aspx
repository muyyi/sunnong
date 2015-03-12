<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>商品详细信息</title>
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
  <%Html.RenderAction("CategoryBar", "Product");%>  
  <div id="product_main">
  <div id="product_detail">
  <h2><span>供应信息</span></h2>
  <div id="product_image"><img src="/content/img_pro/pro_<%=ViewData["ProductID"]%>.jpg"  width="227" height="198"/></div>
  <div id="product_detail1">
  <ul>
  <li><span>点击数</span>：<%=ViewData["Click"]%></li>
  <li><span>商品名称</span>：<%=ViewData["Name"]%></li>
  <li><span>商品类型</span>：<%=ViewData["Category"]%></li>
  <li><span>供应商</span>：<a href="/supplier/supplierDetail/<%=ViewData["SupplierID"]%>"> <%=ViewData["Supplier"]%></a></li>
  <li><span>产地</span>：<%=ViewData["ChangDi"]%></li>
  </ul>
  </div>
  </div>

  <div id="product_detail2">
  <h2><span>详细说明</span></h2>
  <p><%=ViewData["Description"]%></p>
  </div>
  

 </div>
 </div>

  <div class="clearfloat"></div>
<%--  此处为footer公用视图代码--%>
  <%Html.RenderPartial("footer"); %>

</div>
</body>
</html>
