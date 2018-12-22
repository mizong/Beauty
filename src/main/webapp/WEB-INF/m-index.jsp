<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link rel="shortcut icon" href="/static/image/favicon.ico" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta name="viewport"
	content="width=device-width,initial-scale=1, minimum-scale=1.0, maximum-scale=1, user-scalable=no" />
<meta name="apple-mobile-web-app-title" content="Beauty" />
<title>Beautyleg,Tpimage,AISS爱丝,丝袜美腿_Beauty</title>
<link href="/static/css/m-style.css" rel="stylesheet" type="text/css" />
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
	<div>
		<ul class="piclist" id="piclist">
			<c:forEach items="${result.data}" var="content">
				<li>
					<h2>
						<a href="/${content.categorySlug}/${content.cid}.html"
							target="_self">${content.title}</a>
					</h2>
					<div class="pic">
						<a href="/${content.categorySlug}/${content.cid}.html">
							<img
								src="${IPDD}/${content.path}/1.jpg"
								alt="${content.title}" class="loaded">
						</a>
					</div>
					<div class="info">
						<span>${content.mdtime} 发布</span>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
	<div class="page">
		<c:if test="${result.totalPage == 1}">
			<ul>
				<li class="pre">
					<i>最新了</i>
				</li>
				<li>第(${result.currentPage}/${result.totalPage})页</li>
				<li class="next">
					<i>没有了</i>
				</li>
			</ul>
		</c:if>
		<c:if test="${result.totalPage > 1}">
			<c:if test="${result.currentPage == 1}">
				<ul>
					<li class="pre">
						<i>最新了</i>
					</li>
					<li>第(${result.currentPage}/${result.totalPage})页</li>
					<li class="next">
						<a href="javascript:goPage(2)">下一页</a>
					</li>
				</ul>
			</c:if>
			<c:if test="${result.currentPage == result.totalPage}">
				<ul>
					<li class="pre">
						<a href="javascript:goPage(${result.currentPage - 1})">上一页</a>
					</li>
					<li>第(${result.currentPage}/${result.totalPage})页</li>
					<li class="next">
						<i>没有了</i>
					</li>
				</ul>
			</c:if>
			<c:if test="${result.currentPage != result.totalPage && result.currentPage != 1}">
				<ul>
					<li class="pre">
						<a href="javascript:goPage(${result.currentPage - 1})">上一页</a>
					</li>
					<li>第(${result.currentPage}/${result.totalPage})页</li>
					<li class="next">
						<a href="javascript:goPage(${result.currentPage + 1})">下一页</a>
					</li>
				</ul>
			</c:if>
		</c:if>
	</div>
	<div class="footer">Copyright &copy; Beauty beauty.coding.ee</div>
	<div id="topbtn" onClick="goscrolltop();" style="display: block;"></div>
	<script type="text/javascript" src="/static/js/m-common.js"></script>
</body>
</html>