<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>ProductTest</title>
    <link rel=stylesheet type="text/css" href="/style/span_test.css">
<%--    @import url(style/span_test.css)--%>
</head>
<body>
         <div>
            <fieldset>
                <legend>供应信息</legend>
                   <div id="imgBox">
                    <img src="/content/images/nongji1.jpg" />
                </div>
                <div id="detail" style="float:lift">
                 <ul>
                        <li>
                            滤油机
                            <span class="seeClickNum">
                                (3665次浏览)</span>
                        </li>
                        <li>
                            <span style="color:Gray">
                                供应商：</span><a href='#' target='_blank'>株洲国能滤油机制造有限公司</a></li>
                        <li>
                            <span>
                                所在地：</span>株洲市</li>
                        <li>
                            <span>
                                单&nbsp;&nbsp;价：</span>36000元/台
                        </li>
                </ul>
                </div>
              </fieldset>
      </div>
</body>
</html>
