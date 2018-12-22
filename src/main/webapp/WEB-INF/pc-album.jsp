<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="shortcut icon" href="/static/image/favicon.ico" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${content.title}</title>
<meta name="keywords" content="${content.keywords}" />
<meta name="description"
	content="${content.title} ${content.categoryName} Beauty" />
<link href="/static/css/content.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="header">
		<p>
			<em>${siteName}</em><span style="color: red">Ctrl+D收藏本站,随时看美女!</span>
		</p>
		<ul>
			<li><a href="/">返回首页</a></li>
			<li><a href="${categoryOneSlug}">${categoryOnePCName}</a></li>
			<li><a href="${categoryTwoSlug}">${categoryTwoPCName}</a></li>
			<li><a href="${categoryThreeSlug}">${categoryThreePCName}</a></li>
			<li><a href="/random/">${randomContentPCName}</a></li>
			<li><span id="searchbtn" onclick="showsearch();">站内搜索</span></li>
			<li class="guestbook"><a href="/guestbook/"
				target="_blank">${guestbookPCName}</a></li>
		</ul>
	</div>
	<div class="search" id="search">
		<span class="text">
			<form id="formsearch" name="formsearch" method="post" action="/">
				<input type="hidden" name="categorySlug" value="${categorySlug}"
					id="categorySlug" /> <input type="hidden" name="currentPage"
					value="1" id="currentPage" /> <input type="text" name="keyword"
					id="keytext" class="key" /> <input type="submit" name="button"
					id="button" value="搜索图片" class="btn" />
			</form>
		</span>
	</div>
	<div class="main">
		<div class="column">
			<span id="picCount">${content.pictureCount}.P</span><a
				href="/${content.categorySlug}/">${content.categoryName}</a>
		</div>
		<div class="content">
			<div class="title">
				<span>
					<h2>${content.title}</h2> <i>${content.ymdtime}
						提示：如果图片没显示，请刷新页面。</i>
				</span> <span class="tool"> <a href="/guestbook/?go=err"
					title="如果图片无法显示，请点击这里" target="_blank">报错</a> <a href="/guestbook/"
					target="_blank">收藏</a> <em id="allbtn" class="show"
					onclick="showall();">展开</em>
				</span>
			</div>
			<div id="picbox" style="display: block;">
				<img
					src="${IPDD}/${content.path}/1.jpg"
					alt="${content.title}" onlick="nextPic();" id="currentPic" />
			</div>
			<script type="text/javascript">
					(new Image()).src="${IPDD}/${cont.path}/2.jpg";
				</script>
			<div class="page" id="page">
				<a
					href="javascript:goPic(${content.pictureCount > 1 ? content.pictureCount - 1 : 1})">上一张</a>
				<a href="javascript:goPic(1)">1</a> <em id="currentPicIndex"
					style="color: red"></em> <a
					href="javascript:goPic(${content.pictureCount})">${content.pictureCount}</a> <a
					href="javascript:goPic()">下一张</a>
			</div>
			<div id="contentCid" style="display: none">${content.cid}</div>
			<div id="totalCount" style="display: none">${totalCount}</div>
		</div>
		<div class="picdata">
			<span id="nextcache"></span>
		</div>
	</div>
	<div class="other">
		<ul id="otherpic">
			<c:forEach items="${contentList}" var="cont">
				<li>
					<p>
						<em>${content.mdtime}</em><a href="/${cont.categorySlug}/">${cont.categoryName}</a>
					</p>
					<dl>
						<dt>
							<a href="/${cont.categorySlug}/${cont.cid}.html"><img
								src="${IPDD}/${cont.path}/1.jpg"
								width="636" alt="${cont.title}" /></a>
						</dt>
						<dd>${cont.title}</dd>
						<dd class="number">图片(${cont.pictureCount})</dd>
						<dd class="tags">
							<c:forEach items="${cont.tagList}" var="tag">
								<span> <a href="/tag/${tag}" target="_self">${tag}</a>
								</span>
							</c:forEach>
						</dd>
					</dl>
				</li>
			</c:forEach>
		</ul>
		<div style="clear: both;"></div>
	</div>
	<div class="footer">Copyright &copy; Beauty beauty.coding.ee</div>
	<script type="text/javascript" src="/static/js/common.js"></script>
</body>
</html>