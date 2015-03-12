<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
     <title>首页</title>
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
      
      <div id="index_pic">
        <h2><span></span></h2>
        <ul>
        <%int i = 0;%>
        <% foreach(var p in ViewData["products"] as List<Sunnong.Product>)
           { %>          
        	<li><a href="/product/item/<%=p.ProductID %>"><img src="/content/img_pro/pro_<%=p.ProductID %>.jpg" alt="产品名称" width="107" height="87" /><%=p.Name %></a></li>
            <%i++; %>
            <% if (i >= 10) %>
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
            <% if (x >= 10) %>
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
            <dt><a href="#">湖南农业网的目标？</a></dt>
            <dd>提供最快最新的湖南农业资讯，为供求双方提供一个信息的桥梁</dd>
          </dl>
          <dl>
            <dt><a href="#">成为VIP会员的好处？</a></dt>
            <dd><ul>
            <li>享用专用VIP会员模板</li>
            <li>赠送VIP会员免费广告</li>
            <li>推荐VIP会员的产品</li>
            <li>优先显示VIP会员的信息</li>
            <li>提供个性化建站服务</li>
            <li>将vip会员的信息同步到手机客户端</li>
            <li>更多...</li>
            </ul></dd>
          </dl>
          <dl>
            <dt><a href="#">如何成为VIP会员？</a></dt>
            <dd>拨打全国免费服务电话：400-080-6092资讯详情，或者发送邮件到sunnongvip@sina.com</dd>
          </dl>
          <dl>
            <dt><a href="#">如何提交供求信息？</a></dt>
            <dd>将您的供求信息发送邮件到sunnongproduct@sina.com,审核通过后发布,详细请点击...</dd>
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
