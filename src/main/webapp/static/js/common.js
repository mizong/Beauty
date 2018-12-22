//首页
var $g = function(id){return document.getElementById(id)};
var osh=0;
var sarr = new Array(new Array('on','block','notop'),new Array('','none',''));
function showsearch(){(osh == 0) ? searchdo(0) : searchdo(1);$g('categorySlug').setAttribute("value",'');}
function searchdo(sid){
   (sid == 0) ? osh = 1 : osh = 0;
   $g('searchbtn').className = sarr[sid][0];
   $g('search').style.display = sarr[sid][1];
   $g('piclist').getElementsByTagName('li')[0].className = sarr[sid][2];
}

function goPage(currentPage){
	$g('currentPage').setAttribute("value",currentPage);
	var categorySlug = $g('categorySlug').getAttribute("value");
	$g('formsearch').setAttribute("action","/" + categorySlug);	
	$g('formsearch').submit();
}

var flag = false;
var title = document.getElementById("picbox").childNodes[1].getAttribute("alt").trim();
var picUrl = document.getElementById("picbox").childNodes[1].getAttribute("src");
var prePath = picUrl.substring(0,picUrl.length - 5);
var countStr = document.getElementById("picCount").innerHTML;
var count = parseInt(countStr.substring(0,countStr.length - 2));
var currentPicIndex = 0;
var contentCid = parseInt(document.getElementById("contentCid").innerHTML);
var totalCount = parseInt(document.getElementById("totalCount").innerHTML);
function showall(){
	flag = !flag;
	var allImgs = '';
	if(flag){
		currentPicIndex = parseInt(document.getElementById("currentPicIndex").innerHTML.trim());
		for ( var index = 1; index <= count; index++) {
			allImgs+= ('<img src="' + prePath + index + '.jpg"' + ' alt="' + title + '(图' + index + ')' +'"/>');
		}
		var pageInnerHtml = '';
		if(contentCid > 1){
			pageInnerHtml += '<a href="/goto/'+ (contentCid - 1) +'.html" class="pre">上一套</a>';
		}else{
			pageInnerHtml += '<a class="pre">没有了</a>';
		}
		pageInnerHtml += '<a href="javascript:showall();" class="info" style="color: red">折叠</a>';
		
		if(contentCid < totalCount){
			pageInnerHtml += '<a href="/goto/'+ (contentCid + 1) +'.html" class="pre">下一套</a>';
		}else{
			pageInnerHtml += '<a class="next">没有了</a>';
		}
		
		document.getElementById("page").innerHTML = pageInnerHtml;
		document.getElementById("picbox").innerHTML = allImgs;
	}else{
		goPic(currentPicIndex);
	}
}

window.onload=function()
{
	goPic(1);
}

function nextPic(){
	var picUrl = document.getElementById("currentPic").getAttribute("src").trim();
	var currPicIndex = parseInt(picUrl.substring(picUrl.lastIndexOf("/") + 1, picUrl.lastIndexOf(".")));
	if(currPicIndex < count){
		goPic(currPicIndex + 1);
	}else{
		if(contentCid > 1){
			window.location="/goto/"+ (contentCid - 1) +".html";
		}else{
			window.location="/";
		}
	}
}


function goPic(imgIndex){
	var pageInnerHtml = '';
	
	var img = new Image();
	img.src = prePath + (imgIndex + 1) + ".jpg";
	
	if(imgIndex == 1){
		if(contentCid > 1){
			pageInnerHtml += '<a href="/goto/'+ (contentCid - 1) +'.html" class="pre">上一套</a>';
		}else{
			pageInnerHtml += '<a class="pre">没有了</a>';
		}
		pageInnerHtml += '<em id="currentPicIndex">1</em>';
		pageInnerHtml += '<a href="javascript:goPic(2);">2</a>';
		pageInnerHtml += '<a href="javascript:goPic(' + count + ');">' + count + '</a>';
		pageInnerHtml += '<a href="javascript:goPic(2);" class="next">下一张</a>';
		
		document.getElementById("picbox").innerHTML = '<img src="' + picUrl + '" alt="' + title +'" onclick="nextPic();" id="currentPic"/>';
	}else if(imgIndex == count){
		pageInnerHtml += '<a href="javascript:goPic('+ (count - 1) +');" class="pre">上一张</a>';
		pageInnerHtml += '<a href="javascript:goPic(1);">1</a>';
		pageInnerHtml += '<a href="javascript:goPic(' + (count - 1) + ');">' + (count-1) + '</a>';
		pageInnerHtml += '<em id="currentPicIndex">'+ count +'</em>';
		
		if(contentCid < totalCount){
			pageInnerHtml += '<a href="/goto/'+ (contentCid + 1) +'.html" class="pre">下一套</a>';
		}else{
			pageInnerHtml += '<a class="next">没有了</a>';
		}
		document.getElementById("picbox").innerHTML = '<img src="' + prePath + imgIndex + '.jpg" alt="' + title +'" onclick="nextPic();" id="currentPic"/>';
	}else{
		pageInnerHtml += '<a href="javascript:goPic('+ (imgIndex - 1) +');" class="pre">上一张</a>';
		pageInnerHtml += '<a href="javascript:goPic(1);">1</a>';
		pageInnerHtml += '<em id="currentPicIndex">'+ imgIndex +'</em>';
		pageInnerHtml += '<a href="javascript:goPic(' + count + ');">' + count + '</a>';
		pageInnerHtml += '<a href="javascript:goPic(' + (imgIndex + 1) + ');" class="next">下一张</a>';
		
		document.getElementById("picbox").innerHTML = '<img src="' + prePath + imgIndex + '.jpg" alt="' + title +'" onclick="nextPic();" id="currentPic"/>';
	}
	
	document.getElementById("page").innerHTML = pageInnerHtml;
	
	
}