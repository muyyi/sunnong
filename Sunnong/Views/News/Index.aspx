<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
     <title>三农资讯</title>
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
  <%Html.RenderAction("NewsTypeBar", "News");%>
  <div id="maincontent">
    <div id="main">      
      <div id="index_box">
        <div class="box">
          <h2><a class="more" href="/news/newstype/1">更多..</a><span>三农新闻</span></h2>
          <div class="box_con">
            <ul>
            <%int x = 0;%>
            <% foreach (var p in ViewData["news_1"] as List<Sunnong.News>)
           { %>
           <li><a href="/news/newsdetail/<%=p.NewsID%>"><%=p.Title%></a></li>        
            <%x++; %>
            <% if (x >= 7) %>
            <%{ break; }  %>
            <%} %>
            </ul>
          </div>
        </div>
        <div class="box box1">
          <h2><a class="more" href="/news/newstype/2">更多..</a><span>三农财经</span></h2>
          <div class="box_con">
            <ul>
            <%int z = 0;%>
            <% foreach (var p in ViewData["news_2"] as List<Sunnong.News>)
           { %>
           <li><a href="/news/newsdetail/<%=p.NewsID %>"><%=p.Title%></a></li>        
            <%z++; %>
            <% if (z >= 7) %>
            <%{ break; }  %>
            <%} %>
            </ul>
          </div>
        </div>
        <div class="box">
          <h2><a class="more" href="/news/newstype/3">更多..</a><span>农业科技</span></h2>
          <div class="box_con">
            <ul>
            <%int y = 0;%>
            <% foreach (var p in ViewData["news_3"] as List<Sunnong.News>)
           { %>
           <li><a href="/news/newsdetail/<%=p.NewsID %>"><%=p.Title%></a></li>        
            <%y++; %>
            <% if (y >= 7) %>
            <%{ break; }  %>
            <%} %>
            </ul>
          </div>
        </div>
        <div class="box box1">
          <h2><a class="more" href="/news/newstype/4">更多..</a><span>三农政策</span></h2>
          <div class="box_con">
            <ul>
            <%int s = 0;%>
            <% foreach (var p in ViewData["news_4"] as List<Sunnong.News>)
           { %>
           <li><a href="/news/newsdetail/<%=p.NewsID %>"><%=p.Title%></a></li>        
            <%s++; %>
            <% if (s >= 7) %>
            <%{ break; }  %>
            <%} %>
            </ul>
          </div>
        </div>
    </div>
    </div>
</div>
     <div class="clearfloat"></div>
<%--  此处为footer公用视图代码--%>
  <%Html.RenderPartial("footer"); %>
  </body>
</html>
