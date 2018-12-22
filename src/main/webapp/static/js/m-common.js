var $wg = function(id) {
	return document.getElementById(id)
};
var viewcss = [ 'open', 'close' ], showsearch = 0, showmenu = 0, nPosition;
var firstPic = true, wpArr = [], wpNum = 0, csPic = 0, litime, limsta = 0, limcur = 0;
var ascroll, dvalue, bscroll = scrolltopnow(), scrollbtn = $wg('topbtn');
// 顶部导航
function opensearch() {
	$wg('search').className = 'search ' + viewcss[showsearch];
	(showsearch == 1) ? showsearch = 0 : showsearch = 1;
}
// 执行搜索
function gosearch() {
	if ($wg('searchtext').value != '') {
		document.forms.submit();
	}
}
// 返回顶部
function scrolltopnow() {
	return document.documentElement.scrollTop || document.body.scrollTop;
}
function goscrolltop() {
	(document.documentElement.scrollTop) ? document.documentElement.scrollTop = 0
			: document.body.scrollTop = 0;
}
window.onscroll = function() {
	ascroll = scrolltopnow();
	dvalue = ascroll - bscroll;
	if (dvalue > 0) {
		scrollbtn.style.display = 'none';
	} else {
		(ascroll > 300) ? scrollbtn.style.display = 'block'
				: scrollbtn.style.display = 'none';
	}
	bscroll = ascroll;
};

function goPage(currentPage) {
	$wg('currentPage').setAttribute("value", currentPage);
	var categorySlug = $wg('categorySlug').getAttribute("value");
	$wg('forms').setAttribute("action", "/" + categorySlug);
	$wg('forms').submit();
}

// 展开图片
var flag = false;
var title = $wg("picbox").childNodes[1].getAttribute("alt").trim();
var picUrl = $wg("picbox").childNodes[1].getAttribute("src");
var prePath = picUrl.substring(0, picUrl.length - 5);
var picCount = parseInt($wg("picCount").innerHTML);
var originInnerHtml = "";
function showall() {
	flag = !flag;
	var allImgs = '';
	if (flag) {
		originInnerHtml = $wg("picbox").innerHTML;
		for (var index = 1; index <= picCount; index++) {
			allImgs += ('<img src="' + prePath + index + '.jpg"' + ' alt="'
					+ title + '(图' + index + ')' + '"/>');
		}
		$wg("openOrClose").innerHTML = $wg("openOrClose").innerHTML.replace(
				"展开", "收起");
		$wg("currentPicIndex").innerHTML = $wg("currentPicIndex").innerHTML
				.replace("展开全部", "收起图片");
		$wg("picbox").innerHTML = allImgs;
	} else {
		$wg("openOrClose").innerHTML = $wg("openOrClose").innerHTML.replace(
				"收起", "展开");
		$wg("currentPicIndex").innerHTML = $wg("currentPicIndex").innerHTML
				.replace("收起图片", "展开全部");
		$wg("picbox").innerHTML = originInnerHtml;
	}
}

var contentCid = parseInt(document.getElementById("contentCid").innerHTML);
var totalCount = parseInt(document.getElementById("totalCount").innerHTML);
var currentPicIndex = parseInt($wg("currentPicIndex").innerHTML.split("/")[0]
		.split("(")[1]);

function goPic(imgIndex) {
	var pageInnerHtml = '';

	var img = new Image();
	img.src = prePath + (imgIndex + 1) + ".jpg";


	$wg("picbox").innerHTML = '<img src="' + prePath + imgIndex + '.jpg"'
			+ 'onClick="nextPic();"' + ' alt="' + title + '(图' + imgIndex + ')'
			+ '"/>'

}

function prePic() {

	$wg("nextPic").innerHTML = "<a>下一张</a>";

	currentPicIndex = parseInt($wg("currentPicIndex").innerHTML.split("/")[0]
			.split("(")[1]);
	if (currentPicIndex == 1) {
		if (contentCid != 1) {
			window.open("/goto/" + (contentCid - 1) + ".html", "_self");
		}
	} else if (currentPicIndex == 2) {
		goPic(1);
		$wg("currentPicIndex").innerHTML = $wg("currentPicIndex").innerHTML
				.replace("2/", "1/");
		if (contentCid == 1) {
			$wg("prePic").innerHTML = $wg("prePic").innerHTML.replace("上一张",
					"没有了");
		} else {
			$wg("prePic").innerHTML = $wg("prePic").innerHTML.replace("上一张",
					"上一套");
		}
	} else {
		goPic(parseInt($wg("currentPicIndex").innerHTML.split("/")[0]
				.split("(")[1]) - 1);
		$wg("currentPicIndex").innerHTML = $wg("currentPicIndex").innerHTML
				.replace(currentPicIndex + "/", (currentPicIndex - 1) + "/");
	}

}

function nextPic() {
	$wg("prePic").innerHTML = "<a>上一张</a>";
	currentPicIndex = parseInt($wg("currentPicIndex").innerHTML.split("/")[0]
			.split("(")[1]);
	if (currentPicIndex == picCount) {
		if (contentCid != totalCount) {
			window.open("/goto/" + (contentCid + 1) + ".html", "_self");
		}
	} else if (currentPicIndex == (picCount - 1)) {
		goPic(parseInt($wg("currentPicIndex").innerHTML.split("/")[0]
				.split("(")[1]) + 1);
		$wg("currentPicIndex").innerHTML = $wg("currentPicIndex").innerHTML
				.replace(currentPicIndex + "/", (currentPicIndex + 1) + "/");
		if (contentCid == totalCount) {
			$wg("nextPic").innerHTML = $wg("nextPic").innerHTML.replace("下一张",
					"没有了");
		} else {
			if (contentCid != totalCount) {
				$wg("nextPic").innerHTML = $wg("nextPic").innerHTML.replace(
						"下一张", "下一套");
			} else {
				$wg("nextPic").innerHTML = $wg("nextPic").innerHTML.replace(
						"下一张", "没有了");
			}
		}
	} else {
		goPic(parseInt($wg("currentPicIndex").innerHTML.split("/")[0]
				.split("(")[1]) + 1);
		$wg("currentPicIndex").innerHTML = $wg("currentPicIndex").innerHTML
				.replace(currentPicIndex + "/", (currentPicIndex + 1) + "/");
	}

}

function fpprePic() {
	$wg("nextPic").innerHTML = "<a>下一张</a>";
	currentPicIndex = parseInt($wg("currentPicIndex").innerHTML.split("/")[0]
			.split("(")[1]);
	if (currentPicIndex != 1) {
		goPic(currentPicIndex - 1);
		$wg("currentPicIndex").innerHTML = $wg("currentPicIndex").innerHTML
				.replace(currentPicIndex + "/", (currentPicIndex - 1) + "/");
		if (currentPicIndex == 2) {
			$wg("prePic").innerHTML = "<a>没有了</a>";
		}
	}
}

function fpnextPic() {
	$wg("prePic").innerHTML = "<a>上一张</a>";
	currentPicIndex = parseInt($wg("currentPicIndex").innerHTML.split("/")[0]
			.split("(")[1]);
	if (currentPicIndex != picCount) {
		goPic(currentPicIndex + 1);
		$wg("currentPicIndex").innerHTML = $wg("currentPicIndex").innerHTML
				.replace(currentPicIndex + "/", (currentPicIndex + 1) + "/");
		if (currentPicIndex == (picCount - 1)) {
			$wg("nextPic").innerHTML = "<a>没有了</a>";
		}
	}
}

window.onload = function() {
	if (parseInt(document.getElementById("contentCid").innerHTML) == 1) {
		$wg("prePic").innerHTML = "<a>没有了</a>";
	}
}