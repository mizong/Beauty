<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html><head>
<link rel="shortcut icon" href="/static/image/favicon.ico" />
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="Cache-Control" content="no-siteapp">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="viewport" content="width=device-width,initial-scale=1, minimum-scale=1.0, maximum-scale=1, user-scalable=no">
<meta name="apple-mobile-web-app-title" content="Beauty">
<title>留言求图_Beauty</title>
<link href="/static/css/m-guestbook-style.css" rel="stylesheet" type="text/css">
</head>

<body>
<div class="header" id="header"><span class="login"><a href="/"><i class="icon"></i></a></span><h1><a href="/">Beauty</a></h1><span class="open"><i class="icon" onclick="opensearch();"></i></span></div>
<div class="nav"><a href="/">首页</a><a href="${categoryOneSlug}">${categoryOneName}</a><a href="${categoryTwoSlug}">${categoryTwoName}</a><a href="${categoryThreeSlug}">${categoryThreeName}</a><a href="/random/">${randomContentName}</a></div>
<div class="search close" id="search">
		<form name="forms" id="forms" method="post" action="/">
			<p>
				<input type="hidden" name="categorySlug" value="${categorySlug}" id="categorySlug" />
				<input type="hidden" name="currentPage" value="1" id="currentPage" />
				<input type="text" name="keyword" value="${keyword}" id="searchtext">
				<i class="icon" onclick="gosearch();"></i>
			</p>
		</form>
</div>
<div class="msg"><i id="info">站内留言</i></div>
<div class="guestbook"><form id="formmsg" name="formmsg" method="post" action="/guest">
   <p class="font">邮箱或者QQ</p>
   <p><input type="text" name="qMail" id="qq" class="text" placeholder="请填写您的QQ号码, 以便客服快速处理问题"></p>
   <p class="font">留言内容</p>
   <p class="moretext"><textarea name="message" id="neirong" cols="45" rows="5"></textarea></p>
   <p class="btn" onclick="checkre();" id="msgbtn">提交留言</p>
   <div style="clear: both;"><input type="hidden" name="yidong" id="yidong" value="1"></div></form>
</div>
<script type="text/javascript">
var $web = function(id){return document.getElementById(id)};
var viewcss = ['open','close'],showsearch = 0,showmenu = 0,nPosition;
//顶部导航
function opensearch(){
   $web('search').className = 'search '+viewcss[showsearch];
   (showsearch == 1) ? showsearch = 0 : showsearch = 1;
}
//执行搜索
function gosearch(){
   if($web('searchtext').value != ''){document.forms.submit();}
}
//保存留言
function checkre(){
   var re = /^[0-9]+.?[0-9]*/;
   var inputData = $web('qq').value;
   if(inputData=='' || !re.test(inputData)){
      $web('info').innerHTML = '请填写您的数字QQ号码';
	  $web('info').className = 'red';
	  $web('qq').value = '';
	  return false;
   }
   if($web('neirong').value == ''){$web('info').innerHTML = '请填写留言内容';$web('info').className = 'red';return false;}
   document.formmsg.submit();
}
</script>

</body></html>