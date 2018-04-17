<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="cache-control" content="no-cache, must-revalidate">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="imagetoolbar" content="no">
<link href="<c:url value='/images/favicon.ico'/>" rel="shortcut icon" />
<link href="<c:url value='/css/popup.css'/>" rel="shortcut icon" >
<title>
주소록 : N방 메일
</title>
</head>
<body class="nmaddr">
<div id="header" class="pop_header">
	<h1><span>메일 주소록</span></h1>
</div>

<div id="wrap" class="pop_content">
	<!-- <div id="category"> -->
	<div id="category">
		<div class="scr_area">
			<div class="default_group">
				<h2 class="_c1(mwAddress|clickGroup|privateAll) _ccr(lft.my) _stopDefault"><span class="guard selected"><a href="#"><span class="ic mycontact"></span>내 연락처 <em id="privateAllCount" class="cnt"></em></a></span></h2>
				<!-- [D]선택된 li에 "on" class 추가 -->
				<ul id="categoryUL" class="group_list">
				</ul>
			</div>
			<div class="works_group">
			</div>
		</div>
	</div>
	<div id="list">
		<div class="search_bar">
			<!-- [D] 검색결과시 노출 -->
			<div class="result_cnt" style="display:none"><span>검색결과 <em id="searchCount" class="cnt"></em></span></div>
			<div class="search_form">
				<span class="ipt_wrap">
					<label for="addr_search_keyword" class="blind">메일주소 찾기</label>			
					<input type="text" onfocus="this.value='';" onclick="ccr(this, 'add.findbox', event);return false;" id="addr_search_keyword" class="ipt" value="메일주소 찾기">
					<button type="submit" class="btn_submit"><span class="blind">찾기</span></button>
				</span>
			</div>			
		</div>
		<div class="addr_list_head">
			<input type="checkbox" onclick="ccr(this, 'add.selectall', event);" class="_c1(mwAddress|toggleCheckAllAddr)" id="check_all_addr" value=""><label for="check_all_addr">이메일 주소<span class="blind">전체선택</span></label>				
		</div>
		<!--
		<h3 id="listHeadLine">전체주소 <em class="cnt"></em></h3>
		<div class="search_bar">
		<form name="addr_search" onsubmit="return false;" action="">
		<fieldset>
			<legend>메일 주소 찾기 검색폼</legend>
			<label for="addr_search" class="blind">메일주소찾기</label>
			<input type="text" id="addr_search_keyword" onclick="ccr(this, 'add.findbox', event);return false;" class="ipt _stopDefault" value="메일주소 찾기" maxlength=31 onfocus="this.value='';">
			<button type="submit" class="btn_submit _c1(mwAddress|search) _ccr(add.find) _stopDefault">찾기</button>
		</fieldset>
		</form>
		</div>
		-->
		<div class="addr_list">
			<ul id="listUL" onclick="ccr(this, 'add.select', event);return false;">
			이메일주소
			</ul>			
		</div>
	
		<div class="page_ctrl">
			<!-- [D]띄어쓰기, 줄바꿈 유의해 주세요. -->
			<span class="page_dir">
				<label for="current_page" class="blind">목록 페이지로 이동</label><input type="text" id="current_page" value="1" class="page_num" onfocus="mwAddress.focusAddrPage();" onblur="mwAddress.blurAddrPage();"><span> / 1</span>
			</span>
			<a href="#" id="btn_first" class="btn_first"><span class="blind">처음</span></a><a href="#" id="btn_prev" class="btn_prev"><span class="blind">이전</span></a>
			<a href="#" id="btn_next" class="btn_next"><span class="blind">다음</span></a><a href="#" id="btn_last" class="btn_last"><span class="blind">끝</span></a>
			<!--
				btn_first : btn_first_n
				btn_prev : btn_prev_n
				btn_next : btn_next_n
				btn_last : btn_last_n	
			-->
		</div>
	
		<div class="btn_ctrl">
			<button id="addToBtn" type="button" class="btn_add to _c1(mwAddress|addTo|to) _ccr(add.addfrom) _stopDefault"><span>받는사람으로 추가</span></button>
			<button id="addCcBtn" type="button" class="btn_add cc _c1(mwAddress|addTo|cc) _ccr(add.addcc) _stopDefault"><span>참조로 추가</span></button>
			<button id="addBccBtn" type="button" class="btn_add bcc _c1(mwAddress|addTo|bcc) _ccr(add.addbcc) _stopDefault"><span>숨은참조로 추가</span></button>
		</div>
	</div>

	<div id="toitem">
		<div id="field_to">
			<h3>받는사람 <em class="cnt">0</em></h3>
			<div class="addr_list">
				<ul id="toUL" onclick="ccr(this, 'add.from', event);return false;">
				</ul>			
			</div>
			<div class="btn_ctrl">
				<button type="button" class="btn_remove _c1(mwAddress|deleteFrom|to) _ccr(add.delfrom) _stopDefault"><span>선택 삭제</span></button>
			</div>
			<textarea id="to" name="to" autocomplete="false" style="display:none;"></textarea>
		</div>
		<div id="field_cc">
			<h3>참조 <em class="cnt">0</em></h3>
			<div class="addr_list">	
				<ul id="ccUL" onclick="ccr(this, 'add.cc', event);return false;">
				</ul>			
			</div>
			<div class="btn_ctrl">
				<button type="button" class="btn_remove _c1(mwAddress|deleteFrom|cc) _ccr(add.delcc) _stopDefault"><span>선택 삭제</span></button>
			</div>
			<textarea id="cc" name="cc" autocomplete="false" style="display:none;"></textarea>
		</div>
		<div id="field_bcc">
			<h3>숨은참조 <em class="cnt">0</em></h3>
			<div class="addr_list">
				<ul id="bccUL" onclick="ccr(this, 'add.bcc', event);return false;">
				</ul>			
			</div>
			<div class="btn_ctrl">
				<button type="button" class="btn_remove _c1(mwAddress|deleteFrom|bcc) _ccr(add.delbcc) _stopDefault"><span>선택 삭제</span></button>
			</div>
			<textarea id="bcc" name="bcc" autocomplete="false" style="display:none;"></textarea>
		</div>
	</div>
</div>

<div id="footer">
	<div class="ft_inct">
		<p>Shift 키를 누르시면 여러개를 한번에 선택하여 추가할 수 있습니다.</p>
		<button class="submitAddr _c1(mwAddress|submitAddress) _ccr(add.confirm) _stopDefault"><strong class="_c1(mwAddress|submitAddress) _stopDefault">확인</strong></button>
		<button class="resetAddr _c1(mwAddress|cancelSubmit) _ccr(add.cancel) _stopDefault">취소</button>
	</div>
</div>

<script type="text/javascript">
    var wm = {};
    wm.staticDomain = "ssl.pstatic.net";
	cCode = "ko_KR";
</script>




<script src="/js/uglified_jindo.js" charset="utf-8"></script>
<script src="/js/uglified_ko_KR_180406.js"></script>
<script src="/js/uglified_address_popup_180406.js"></script>



<script type="text/javascript">



var nsc = "me.mailcontact";




</script>

<script type="text/javascript">
	cCode = "ko_KR";
	try {
		if (cCode != "ja_JP" && opener && opener.mEnv && opener.mEnv.listFontName && opener.mEnv.listFontName == "Nanumgothic") {
			var sNanumFont = "'나눔고딕',nanumgothic,'돋움',Dotum,Helvetica,'Apple SD Gothic Neo',Sans-serif";
			document.body.style.fontFamily = sNanumFont;
			$$.getSingle("#addr_search_keyword").style.fontFamily = sNanumFont;
			$$.getSingle("#current_page").style.fontFamily = sNanumFont;
			$$.getSingle("button.submitAddr").style.fontFamily = sNanumFont;
			$$.getSingle("button.resetAddr").style.fontFamily = sNanumFont;
		}
	} catch (e) {
	}
</script>
<!-- 엔트리포인트 -->
<script type="text/javascript">
	isExternal = false;
	mCom.isPopup = true;
	mCom.isWriting = true;
	serviceType = "naver";
	iDomainUser = "";
	
	bUseWorks = false;
	oMail = new Mail();
	mwAddress.initAddress();
	
	setLcs("/address/popup", null);
	
	document.onselectstart = function(){return false;}
</script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/popup.css'/>">
</body>
</html>