<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<div id="header">
    <div id="logo"><img src="/images/logo.jpg" alt="企业名称" width="181" height="45" /></div>
    <div id="security">
    <%if (Session["User"] == null)
      { %>
	欢迎来到湖南三农网 [<a href="/security/login">请登陆</a>]|[<a href="/security/Register">免费注册</a>]    
    <%} %>
    <%else
        { %>
        欢迎你，<%=Session["Username"]%>|<a href="/security/logout">注销</a>
    <%} %>
  </div>
  <div class="clearfloat"></div>
  <div id="menu">
  <ul>
    <li class="m_line"><img src="/images/line1.gif" /></li>
    <li id="m_1" class='m_li_a'><a href="/home/index">主页</a></li>
    <li class="m_line"><img src="/images/line1.gif" /></li>
    <li id="m_2" class='m_li' onmouseover='mover(2);' onmouseout='mout(2);'><a href="/product/index">三农产品</a></li>
    <li class="m_line"><img src="/images/line1.gif" /></li>
    <li id="m_3" class='m_li' onmouseover='mover(3);' onmouseout='mout(3);'><a href="/news/index">三农资讯</a></li>
    <li class="m_line"><img src="/images/line1.gif" /></li>
    <li id="m_4" class='m_li' onmouseover='mover(4);' onmouseout='mout(4);'><a href="/supplier/index">三农企业</a></li>
    <li class="m_line"><img src="/images/line1.gif" /></li>
    <li id="m_5" class='m_li' onmouseover='mover(5);' onmouseout='mout(5);'><a href="#">关于我们</a></li>
    <li class="m_line"><img src="/images/line1.gif" /></li>
  </ul>
</div>
  <div id="memu_s" style="height:32px; background-color:#F1F1F1;">
   <ul class="smenu">
     <li style="padding-left:29px;" id="s_1" class='s_li_a'>欢迎光临湖南三农网！</li>
     <li style="padding-left:141px;" id="s_2" class='s_li' onmouseover='mover(2);' onmouseout='mout(2);'><a href="/product/category/1">农机类</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/product/category/2">农资类</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/product/category/3">种植类</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/product/index">更多</a></li>
     <li style="padding-left:252px;" id="s_3" class='s_li' onmouseover='mover(3);' onmouseout='mout(3);'><a href="/news/NewsType/1">三农新闻</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/news/NewsType/2">三农财经</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/news/NewsType/3">农业科技</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/news/index">更多</a></li>
	 <li style="padding-left:362px;" id="s_4" class='s_li' onmouseover='mover(4);' onmouseout='mout(4);'>帮你找到最好的合作伙伴和供应商</li>
	 <li style="padding-left:474px;" id="s_5" class='s_li' onmouseover='mover(5);' onmouseout='mout(5);'>关于湖南三农网的更多资讯</li>
     </ul>
</div>
  <div class="clearfloat"></div>

