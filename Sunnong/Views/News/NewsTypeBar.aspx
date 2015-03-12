<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>NewsTypeBar</title>
</head>
<body>
    <div>
    <a href="/news">全部</a>
    <%foreach(var c in ViewData.Model) {%>
    <a href="/news/NewsType/<%=c.NewsTypeID%>"><%=c.Name%></a>
    <%} %>
    </div>
</body>
</html>
