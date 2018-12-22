<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="shortcut icon" href="/static/image/favicon.ico" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>留言求图_Beauty</title>
<style type="text/css">
body {
	font-family: "Microsoft YaHei", Arial;
	font-size: 12px;
	color: #666;
	background: #E5E5E5 no-repeat fixed left top;
	margin: 0px;
}

img {
	border: none;
}

em, i {
	font-style: normal;
}

a {
	color: #333;
	text-decoration: none;
}

a:hover {
	color: #386DCD;
	text-decoration: none;
}

dl, dt, dd, form {
	display: inline;
	margin: 0px;
	padding: 0px;
}

dt, dd {
	float: left;
}

#main {
	background-color: #FFF;
	height: 272px;
	width: 700px;
	margin: 0px auto;
}

.left {
	background-color: #F7F7F7;
	float: left;
	height: 272px;
	width: 370px;
	padding-left: 20px;
}

.left dt {
	font-size: 14px;
	line-height: 46px;
	color: #777;
	height: 45px;
	width: 350px;
	padding-top: 2px;
}

.left dd {
	height: 220px;
	width: 360px;
}

.left dd span {
	float: left;
	height: 210px;
	width: 210px;
}

.left dd span.one {
	width: 145px;
}

.left dd img {
	float: left;
	padding-right: 4px;
	padding-bottom: 4px;
}

.right {
	float: right;
	height: 270px;
	width: 290px;
}

.right dt {
	font-size: 14px;
	line-height: 46px;
	color: #777;
	height: 45px;
	width: 270px;
	padding-top: 2px;
}

.right dd {
	height: 37px;
	width: 275px;
}

.right dd.text {
	height: 137px;
}

.right dd textarea {
	font-family: "Microsoft YaHei", Arial;
	display: inline;
	float: left;
	height: 123px;
	width: 266px;
	border: 1px solid #EEE;
	outline: none;
}

.right dd.email {
	height: 25px;
	width: 268px;
	margin-bottom: 10px;
	border: 1px solid #EEE;
}

.right dd span {
	line-height: 25px;
	background-color: #FAFAFA;
	text-align: center;
	float: left;
	height: 25px;
	width: 70px;
	border-right: 1px solid #EEE;
}

.right dd.email input {
	float: right;
	height: 18px;
	width: 192px;
	margin-top: 4px;
	border: none;
	outline: none;
}

.right dd input.btn {
	font-size: 14px;
	color: #FFF;
	background-color: #2D81C2;
	float: left;
	height: 30px;
	width: 83px;
	border: 1px solid #1573BB;
	outline: none;
	cursor: pointer;
}

.footer {
	line-height: 24px;
	color: #999;
	text-align: center;
	height: 28px;
	width: 700px;
	margin: 12px auto 0px auto;
}

.footer a {
	color: #999;
}

.footer a:hover {
	color: #386DCD;
	text-decoration: none;
}
</style>
<script type="text/javascript"
	src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
</head>
<body id="msg">
	<div id="main">
		<dl class="left">
			<dt>Beauty, 美女图片看不完</dt>
			<dd>
				<span class="one">
					<img
						src="http://ww2.sinaimg.cn/large/005AwgO4tw1eipcnznx4jj303w05pjrx.jpg" />
				</span>
				<span>
					<img
						src="http://ww3.sinaimg.cn/large/005AwgO4tw1eipco05opuj302s02s3yl.jpg" />
					<img
						src="http://ww4.sinaimg.cn/large/005AwgO4tw1eipco0uwejj302s02sglo.jpg" />
					<img
						src="http://ww3.sinaimg.cn/large/005AwgO4tw1eipco1jcjaj305p02sdgf.jpg" />
				</span>
			</dd>
		</dl>
		<dl class="right">
			<form id="formmsg" name="formmsg" method="post" action="/guest"
				onSubmit="return checkre();">
				<dt>留言求图</dt>
				<dd class="text">
					<c:if test="${empty referer}">
						<textarea name="message" id="message" cols="45" rows="5"></textarea>
					</c:if>
					<c:if test="${!empty referer}">
						<textarea name="message" id="message" cols="45" rows="5">本页图片不能显示，请处理。${referer}</textarea>
					</c:if>
				</dd>
				<dd class="email">
					<span>QQ或邮箱</span>
					<input type="text" name="qMail" id="qq" value="" />
				</dd>
				<dd>
					<input type="submit" name="button" id="button" value="保存信息"
						class="btn" />
				</dd>
			</form>
		</dl>
	</div>
	<script type="text/javascript">
		var bgarr = [ '005AwgO4tw1eipbkgcvy6j311y0lc0vw',
				'005AwgO4tw1eipbkj5kewj31400p0n0z',
				'005AwgO4tw1eipbkkai7fj30sg0lcace',
				'005AwgO4tw1eipbknqm24j31hc0u0dno',
				'005AwgO4tw1eipbkq2owvj30zk0m841k',
				'005AwgO4tw1eipbkshyglj30zk0sg42a',
				'005AwgO4tw1eipbkvr7wcj31ao0t6q82',
				'005AwgO4tw1eipbky239qj30zk0lcjuc',
				'005AwgO4tw1eipbl0dd06j30w00o0q5u',
				'005AwgO4tw1eipbl317orj30zk0qon0r',
				'005AwgO4tw1eipbl4xzisj30m80go0u6',
				'005AwgO4tw1eipc0tuwlgj31hc0xcwsd' ];
		var scrarr = [ '1366x768', '1440x900', '1024x768', '1920x1080',
				'1280x800', '1280x1024', '1680x1050', '1280x768', '1152x864',
				'1280x960', '800x600', '1920x1200' ];
		var maintop = parseInt((document.documentElement.clientHeight - 350) / 2);
		var uscr = screen.width + 'x' + screen.height;
		var bgurl = 'http://ww1.sinaimg.cn/large/';
		var et = 0;
		var mkey = 0;
		document.getElementById('main').style.marginTop = maintop + 'px';
		document.getElementById('ip').value = returnCitySN.cip;
		for (var i = 0; i < 12; i++) {
			if (uscr == scrarr[i]) {
				bgurl = bgurl + bgarr[i] + '.jpg';
				document.getElementById('msg').style.backgroundImage = 'url('
						+ bgurl + ')';
				break;
			}
		}
		function checkspace(checkstr) {
			var str = '';
			for (i = 0; i < checkstr.length; i++) {
				str = str + ' ';
			}
			return (str == checkstr);
		}
		function checkre() {
			if (et == 0) {
				if (checkspace(document.formmsg.message.value)) {
					document.formmsg.message.focus();
					alert("请填写留言内容");
					return false;
				}
				if (mkey == 0) {
					if (checkspace(document.formmsg.qq.value)) {
						document.formmsg.qq.focus();
						alert("填一个您常用的QQ号码或邮箱");
						return false;
					}
				}
			} else {
				alert('系统限制30秒刷新, 请稍后提交!');
				formmsg.message.focus();
				return false;
			}
		}
	</script>
	<div class="footer">
		<a href="${categoryOneSlug}">${categoryOnePCName}</a>
		|
		<a href="${categoryTwoSlug}">${categoryTwoPCName}</a>
		|
		<a href="${categoryThreeSlug}">${categoryThreePCName}</a>
		|
		<a href="/random/">${randomContentPCName}</a>
		<br />
		Copyright &copy; 2018 - 2018 Beauty All Rights Reserved
	</div>
</body>
</html>