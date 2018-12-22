<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="/static/image/favicon.ico" />
<meta charset='utf-8' />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta name="viewport"
	content="width=device-width,initial-scale=1, minimum-scale=1.0, maximum-scale=1, user-scalable=no" />
<title>页面不存在_${siteName}</title>
<style type="text/css">
body {
	margin: 0;
}

.main {
	font-size: 0.8rem;
	line-height: 2rem;
	text-align: center;
	margin-top: 2rem;
}
</style>
</head>
<body>
	<div class="main">
		不存在的，网站每8小时发布一套图，敬请期待！
		<br>
		<a href="/">返回${siteName}首页</a>
	</div>
</body>
</html>