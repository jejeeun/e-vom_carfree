<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"		uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt"		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>자동차 운행제한 시스템</title>
	<link rel="stylesheet" type="text/css" href="/css/jquery-ui.css"/> 
	<link rel="stylesheet" type="text/css" href="/css/jquery.datetimepicker.css"/>
	<link rel="stylesheet" type="text/css" href="/css/reset.css"/>
	<link rel="stylesheet" type="text/css" href="/css/common.css"/>
	<link rel="stylesheet" type="text/css" href="/css/main.css"/>
	<link rel="apple-touch-icon" sizes="180x180" href="/images/favicon/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="32x32" href="/images/favicon/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="/images/favicon/favicon-16x16.png">
	<link rel="manifest" href="/images/favicon/site.webmanifest">
	<meta name="msapplication-TileColor" content="#da532c">
	<meta name="theme-color" content="#ffffff">
</head>
<body>
	<!--내비게이션-->
	<div class="navi">
	</div>
	<!--내비게이션//-->
	<!--메인컨텐츠-->
	<div class="con_wrap">
		<div class="con_center">
			<div class="left_wrap">
			</div>	
			<div class="contents_wrap_02 sub_box">
				<div class="info_box_container">
					<h3>공지사항 상세보기</h3>
					<form id="modifyForm" method="post" enctype="multipart/form-data">
						<input type="hidden" id="_csrf" name="_csrf" value="${CSRF_TOKEN}"/>
						<input type="hidden" id="postNo" name="postNo" value="${boardInfo.postNo}">
						<input type="hidden" id="fileName" name="fileName" value="${boardInfo.fileName}">
						<input type="hidden" id="orignFileNm" name="orignFileNm" value="${boardInfo.orignFileNm}">
						<input type="hidden" id="fileExtes" name="fileExtes" value="${boardInfo.fileExtes}"/>
						<input type="hidden" id="filePath" name="filePath" value="${boardInfo.filePath}"/>
						<input type="hidden" id="downloadCnt" name="downloadCnt" value="${boardInfo.downloadCnt}"/>
						<input type="hidden" id="stDay" value="${boardInfo.postStDate}">
						<input type="hidden" id="edDay" value="${boardInfo.postEdDate}">
						<table class="resi_table">
							<colgroup>
								<col style="width:10%">
								<col style="width:40%">
								<col style="width:10%">
								<col style="width:19%">
								<col style="width:2%">
								<col style="width:19%">
							</colgroup>
							<tbody>
							<tr>
								<th>제목</th>
								<td colspan="5" class="no_r_line">
									<input type="text" name="title" id="title" class="disabled" value="${boardInfo.title}" autocomplete="off" readonly/>
								</td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td id="fileTd" colspan="4" class="no_r_line">
									<input type="text" name="txt" id="txt" value="" class="disabled" autocomplete="off" readonly/>	
								</td>
								<td id="downloadTd" class="no_r_line search_btn">
									<input type="file" size="0" id="file" name="file" style="display:none;" />	
									<button type="button" class="btn btn_gray btn_search_s" id="fileDownloadButton" onclick="javascript:fileDownload()">내려받기</button>
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td colspan="5" class="no_r_line">
									<textarea rows="24" name="contents" id="contents" class="disabled" disabled>${fn:replace(boardInfo.contents,br,n)}</textarea>
								</td>
							</tr>
							<tr>
								<th>작성자</th>
								<td>
									${userName}
									<input type="hidden" name="userName" id="username" value="${userName}" readonly/>
								</td>
								<th>게시기간</th>
								<td class="no_r_line">${boardInfo.postStDate}</td>
								<td class="no_r_line"> ~ </td>
								<td class="no_r_line">${boardInfo.postEdDate}</td>
							</tr>
							</tbody> 
						</table>
					</form>
					<div class="bottom_btn_rt">
						<button type="button" class="btn btn_navy1 btn_table" id="listButton" onclick="javascript:listGo();">목록</button>
					</div>
				</div>
			</div>		
		</div>
	</div> 
	
	<form id="pageForm" method="post">
		<input type="hidden" id="_csrf" name="_csrf" value="${CSRF_TOKEN}"/>
		<input type="hidden" id="pageNo" name="pageNo" value="${searchInfo.pageNo}"/>
		<input type="hidden" id="searchCondition" name="searchCondition" value="${searchInfo.searchCondition}"/>
		<input type="hidden" id="searchKeyword" name="searchKeyword" value="${searchInfo.searchKeyword}"/>
	</form>
	
	<form id="linkForm" method="post">
		<input type="hidden" id="_csrf" name="_csrf" value="${CSRF_TOKEN}"/>
		<input type="hidden" id="loginId" name="loginId" value="${login.loginId}"/>
	</form>
	
 	<!--푸터-->
	<div class="footer_wrap">
	</div>
	<!--푸터//-->

<script type="text/javascript" src="/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="/js/jquery.datetimepicker.full.js"></script>
<script type="text/javascript" src="/js/common/util.js"></script>
<script src="/js/layout/cims-gnb.js"></script>
<script src="/js/layout/cims-lnb.js"></script>
<script src="/js/layout/cims-footer.js"></script>

<script type="text/javascript">
	Gnb.draw($('div.navi'));
	Lnb.draw($('div.left_wrap'), 'mypage', 'mypage.notice');
	Footer.draw($('div.footer_wrap'));
	
	// 레이아웃에서 페이지 이동 시 필요 (Gnb, Lnb에서 사용됨)
	function linkURL(url) {
		$("#linkForm").prop('action', url);
		$("#linkForm").submit();
	}

	$(document).ready(function () {
		if('${boardInfo.orignFileNm}' != null && '${boardInfo.orignFileNm}' != '') {
			$("#txt").val('${boardInfo.orignFileNm}' + '.' + '${boardInfo.fileExtes}');
		} else {
			$("#fileDownloadButton").css("display", "none");
			
			$("#fileTd").prop("colspan", "5");
			$("#downloadTd").remove();
		}
	});
	
	$(document).keydown(function(event) {
		if(event.keyCode == '13') {
			event.preventDefault();
			return;
		}
	});

	function fileDownload() {
		var fileCk = $("#txt").val();
		
		if(fileCk==""){
			alert("다운로드할 파일이 없습니다.");
			return;
		}
		
		$("#modifyForm").prop("action", "/system/fileDownload");
		$("#modifyForm").submit();
	}
	
	function listGo(){
		$("#pageForm").prop("action", "/login/myNotice");
		$("#pageForm").submit();
	}
</script>	
	
</body>
</html>