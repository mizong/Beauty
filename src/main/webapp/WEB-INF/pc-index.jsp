<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="shortcut icon" href="/static/image/favicon.ico" />
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<title>Beauty ${categoryName} 分享优质美女图片</title>
<meta name="keywords" content="Beauty,大美女,美女图片,美女,图片,清纯,美腿,性感" />
<meta name="description" content="Beauty分享无水印美女写真图片，给大家一个赏心悦目的美女图片站。" />
<link href="/static/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="header">
		<p>
			<em>${siteName}</em><span style="color: red">Ctrl+D收藏本站,随时看美女!</span>
		</p>
		<ul>
			<li><a href="${categoryOneSlug}">${categoryOnePCName}</a></li>
			<li><a href="${categoryTwoSlug}">${categoryTwoPCName}</a></li>
			<li><a href="${categoryThreeSlug}">${categoryThreePCName}</a></li>
			<li><a href="/random/">${randomContentPCName}</a></li>
			<li><span id="searchbtn" onclick="showsearch();">站内搜索</span></li>
			<li class="guestbook"><a href="/guestbook/"
				target="_blank">${guestbookPCName}</a></li>
		</ul>
	</div>
	<div class="main">
		<div class="search" id="search">
			<span class="text">
				<form id="formsearch" name="formsearch" method="post" action="/">
					<input type="hidden" name="categorySlug" value="${categorySlug}"
						id="categorySlug" />
					<input type="hidden" name="currentPage" value="1" id="currentPage" />
					<input type="text" name="keyword" value="${keyword}"
						id="keytext" class="key" />
					<input type="submit" name="button"
						id="button" value="搜索图片" class="btn" />
				</form>
			</span>
		</div>
		<ul id="piclist">
			<c:forEach items="${result.data}" var="content">
				<li>
					<p>
						<em>${content.mdtime}</em><a href="/${content.categorySlug}/">${content.categoryName}</a>
					</p>
					<dl>
						<dt>
							<a href="/${content.categorySlug}/${content.cid}.html"
								target="_self"> <img
								src="${IPDD}/${content.path}/1.jpg"
								width="636" alt="${content.title}" />
							</a>
						</dt>
						<dd class="number">
							<span>图片(${content.pictureCount})</span>
						</dd>
						<dd>
							<a href="/${content.categorySlug}/${content.cid}.html"
								target="_blank">${content.title}</a>
						</dd>
					</dl>
				</li>
			</c:forEach>
		</ul>
		<div style="clear: both;"></div>
	</div>
	<div class="page">
		<span class="info">共${result.totalCount}套图</span>
		<c:if test="${result.totalPage == 2}">
			<c:if test="${result.currentPage == 1}">
				<em>1</em>
				<a href="javascript:goPage(2)">2</a>
				<a class="next" href="javascript:goPage(2)">下一页</a>
			</c:if>
			<c:if test="${result.currentPage == 2}">
				<a class="next" href="javascript:goPage(1)">上一页</a>
				<a href="javascript:goPage(1)">1</a>
				<em>2</em>
			</c:if>
		</c:if>
		<c:if test="${result.totalPage == 3}">
			<c:if test="${result.currentPage == 1}">
				<em>1</em>
				<a href="javascript:goPage(2)">2</a>
				<a href="javascript:goPage(3)">3</a>
				<a class="next" href="javascript:goPage(2)">下一页</a>
			</c:if>
			<c:if test="${result.currentPage == 2}">
				<a class="next" href="javascript:goPage(1)">上一页</a>
				<a class="next" href="javascript:goPage(1)">1</a>
				<em>2</em>
				<a class="next" href="javascript:goPage(3)">3</a>
				<a class="next" href="javascript:goPage(1)">下一页</a>
			</c:if>
			<c:if test="${result.currentPage == 3}">
				<a class="next" href="javascript:goPage(2)">上一页</a>
				<a class="next" href="javascript:goPage(1)">1</a>
				<a class="next" href="javascript:goPage(2)">2</a>
				<em>3</em>
			</c:if>
		</c:if>
		<c:if test="${result.totalPage >= 4}">
			<c:if test="${result.currentPage == 1}">
				<em>1</em>
				<a href="javascript:goPage(2)">2</a>
				<a href="javascript:goPage(3)">3</a>
				<a href="javascript:goPage(${result.totalPage});">${result.totalPage}</a>
				<a class="next" href="javascript:goPage(${result.nextPage})">下一页</a>
			</c:if>
			<c:if test="${result.currentPage == result.totalPage}">
				<a class="pre" href="javascript:goPage(${result.prePage})">上一页</a>
				<a href="javascript:goPage(1)">1</a>
				<a href="javascript:goPage(${result.totalPage - 2});">${result.totalPage - 2}</a>
				<a href="javascript:goPage(${result.totalPage - 1});">${result.totalPage - 1}</a>
				<em>${result.totalPage}</em>
			</c:if>
			<c:if
				test="${result.currentPage != result.totalPage && result.currentPage != 1}">
				<a class="pre" href="javascript:goPage(${result.prePage})">上一页</a>
				<a href="javascript:goPage(1)">1</a>
				<em>${result.currentPage}</em>
				<a href="javascript:goPage(${result.totalPage});">${result.totalPage}</a>
				<a class="next" href="javascript:goPage(${result.nextPage})">下一页</a>
			</c:if>
		</c:if>
	</div>
	<div class="friendlink">
		<dl>
			<dt>合作伙伴</dt>
			<dd class="four">
				<a href="https://www.baidu.com/" target="_blank">百度搜索</a>
			</dd>
			<dd class="four">
				<a href="https://www.google.com" target="_blank">谷歌搜索</a>
			</dd>
			<dd class="five">
				<a href="https://www.so.com/" target="_blank">360搜索</a>
			</dd>
			<dd class="four">
				<a href="https://www.sogou.com/" target="_blank">搜狗搜索</a>
			</dd>
			<dd class="three">
				<a href="https://www.oracle.com/" target="_blank">甲骨文</a>
			</dd>
			<dd class="four">
				<a href="https://coding.ee/" target="_blank">编程日志</a>
			</dd>
		</dl>
	</div>
	<div class="footer">Copyright &copy; Beauty beauty.coding.ee</div>
	<script type="text/javascript" src="/static/js/common.js"></script>
</body>
</html>