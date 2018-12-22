<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="shortcut icon" href="/static/image/favicon.ico" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>提示信息_Beauty</title>
<style type="text/css">
a {
	color: #FF6681;
	text-decoration: none;
}

a:hover {
	color: #FF0000;
	text-decoration: underline;
}

i {
	color: #FF6681;
	font-style: normal;
	cursor: pointer;
}

.msg {
	font-size: 12px;
	color: #666;
	text-align: center;
	height: 180px;
	width: 350px;
	margin: 100px auto 0px auto;
}

.dead {
	background: url(/static/image/dead.png) no-repeat center top;
}

.ok {
	background: url(/static/image/ok.png) no-repeat center top;
}

.yes {
	background: url(/static/image/yes.png) no-repeat center top;
}

.msg span {
	height: 24px;
	width: 350px;
	float: left;
	padding-top: 145px;
}
</style>
<script type="text/javascript">
	function closeweb() {
		var browserName = navigator.appName;
		if (browserName == "Netscape") {
			window.open("", "_self", "");
			window.close();
		} else {
			window.close();
		}
	}
</script>
</head>
<body>
	<div class="msg dead">
		<span>不存在的，网站每8小时发布一套图，敬请期待！ <a href="/">点击返回</a></span>
	</div>
</body>
</html>