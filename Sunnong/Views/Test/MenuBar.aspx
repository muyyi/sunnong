<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>jQuery+CSS清新蓝色水平二级菜单</title>
<link rel="stylesheet" type="text/css" href="/styles/header.css" />
<script language="javascript" type="text/javascript" src="jquery-1.3.2.min.js"></script>
<script language="javascript" type="text/javascript">
    $(document).ready(function () {
        $(".mainNav a").mouseover(function () {
            $(".mainNav a").attr("class", "");
            $("#" + this.id).attr("class", "actived");
            var currentMenuNo = parseInt(this.id.substring(1));
            $(".secondNav div").each(function () {
                $(this).hide();
                $("#subNav" + currentMenuNo).show();
            });
        });
    });
</script>
</head>
<body>
<div class="header">
	<div class="padder">
		<div class="nav">
			<div class="navLaftBg">
				<div class="navRightBg">
					<div class="mainNav">
						<a href="/home" id="n1" class="actived">首页</a>
						<a href="/product" id="n2">农产品</a>
						<a href="/news" id="n3">三农资讯</a>
						<a href="/supplier" id="n4">明星企业</a>
						<a href=#" id="n5">关于我们</a>
					</div>
				</div>
			</div>
		</div>
		<div class="secondNav">
			<div id="subNav2" class="subNav2">
				<a href="/product/category/1" class="actived">农机类</a>
				<a href="/product/category/2">农资类</a>
				<a href="/product/category/3">种植类</a>
			</div>
			<div id="subNav3" class="subNav3">
				<a href="http://sc.xueit.com/icons/ico/" class="actived">ICO图标</a>
				<a href="http://sc.xueit.com/icons/gif/">GIF图片</a>
				<a href="http://sc.xueit.com/icons/png/">PNG图标</a>
			</div>
			<div id="subNav4" class="subNav4">
				<a href="http://sc.xueit.com/icons/ico/" class="actived">ICO图标</a>
				<a href="http://sc.xueit.com/icons/gif/">GIF图片</a>
				<a href="http://sc.xueit.com/icons/png/">PNG图标</a>
			</div>
			<div id="subNav5" class="subNav5">
				<a href="http://sc.xueit.com/icons/ico/" class="actived">ICO图标</a>
				<a href="http://sc.xueit.com/icons/gif/">GIF图片</a>
				<a href="http://sc.xueit.com/icons/png/">PNG图标</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>