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
<meta name="apple-mobile-web-app-title" content="Beauty" />
<title>${content.title}</title>
<meta name="keywords" content="${content.keywords}" />
<meta name="description" content="${content.title} ${content.categoryName} Beauty" />
<link href="/static/css/m-style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="header" id="header">
		<span class="login">
			<a>
				<i class="icon"></i>
			</a>
		</span>
		<h1>
			<a href="/">Beauty</a>
		</h1>
		<span class="open">
			<i class="icon" onClick="opensearch();"></i>
		</span>
	</div>
	<div class="nav"><a href="${categoryOneSlug}">${categoryOneName}</a><a href="${categoryTwoSlug}">${categoryTwoName}</a><a href="${categoryThreeSlug}">${categoryThreeName}</a><a href="/random/">${randomContentName}</a><a href="/guestbook/">${guestbookName}</a></div>
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
	<div class="content">
		<h1>${content.title}</h1>
		<div class="picinfo">
			<i>发表于 ${content.ymdtime}</i>
			<i onClick="showall();" id="openOrClose">展开</i>
		</div>
		<div id="picbox">
				<img src="${IPDD}/${content.path}/1.jpg"
					alt="${content.title}" onClick="nextPic();"/>
		</div>
		<script type="text/javascript">
					(new Image()).src="${IPDD}/${content.path}/2.jpg";
				</script>
	</div>
	<div class="contentpage" id="page">
		<span id="prePic" onClick="prePic();">
			<a>上一套</a>
		</span>
		<span class="show" onClick="showall();">
			<i id="currentPicIndex">展开全部(1/${content.pictureCount})</i>
		</span>
		<span id="nextPic" onClick="nextPic();">
			<a>下一张</a>
		</span>
	</div>
	<div id="contentCid" style="display: none">${content.cid}</div>
	<div id="totalCount" style="display: none">${totalCount}</div>
	<div id="picCount" style="display: none">${content.pictureCount}</div>
	<div class="msg">
		<i>美图精选</i>
	</div>
	<div>
		<ul class="piclist" id="piclist">
			<c:forEach items="${contentList}" var="cont">
			<li>
				<h2>
					<a href="/${cont.categorySlug}/${cont.cid}.html">${cont.title}</a>
				</h2>
				<div class="pic">
					<a href="/${cont.categorySlug}/${cont.cid}.html">
					<img src="${IPDD}/${cont.path}/1.jpg"
								width="636" alt="${cont.title}" />
					</a>
				</div>
				<div class="info">
					<span>${cont.mdtime} 发布</span>
				</div>
			</li>
			</c:forEach>
		</ul>
	</div>
	<div class="footer">Copyright &copy; Beauty beauty.coding.ee</div>
	<div id="topbtn" onClick="goscrolltop();" style="display: block;"></div>
	<script type="text/javascript" src="/static/js/m-common.js"></script>
</body>
</html>