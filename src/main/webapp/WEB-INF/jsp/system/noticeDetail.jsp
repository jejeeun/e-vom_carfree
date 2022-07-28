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
	<input type="hidden" name="changeText" id="changeText">
	<!--내비게이션-->
	<div class="navi">
	</div>
	<!--내비게이션//-->
	
	<!--메인컨텐츠-->
	<div class="con_wrap">
		<div class="con_center">
			<div class="left_wrap">
			</div>	
			<div class="contents_wrap_05 sub_box">
				<div class="info_box_container">
					<h3>공지사항 상세보기</h3>
					<form id="modifyForm" method="post" enctype="multipart/form-data">
						<input type="hidden" id="_csrf" name="_csrf" value="${CSRF_TOKEN}"/>
						<input type="hidden" id="regId" name="regId" value="${login.userId}">
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
								<th><span class="point_red">*</span>제목</th>
								<td colspan="5" class="no_r_line" id="titleTd">
									<input type="text" name="title" id="title" value="${boardInfo.title}" autocomplete="off"/>
								</td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td colspan="4" class="no_r_line">
									<input type="text" class="filename" id="txt" name="txt" value="" autocomplete="off" readonly/>	
								</td>
								<td class="no_r_line search_btn">
									<input type="file" size="0" id="file" name="file" onchange="download(this.value)" style="display:none;" />
									<button type="button" class="btn btn_gray btn_search_s" id="fileDownloadButton" onclick="javascript:fileDownload()">내려받기</button>
									<button type="button" class="btn btn_gray btn_search_s" id="fileSearchButton" onclick="javascript:fileGo()">찾아보기</button>
									<button type="button" class="btn btn_gray btn_search_s" id="fileDeleteButton" onclick="javascript:fileDelete()">삭제하기</button>
								</td>
							</tr>
							<tr>
								<th><span class="point_red">*</span>내용</th>
								<td colspan="5" class="no_r_line" id="contentsTd">
									<textarea rows="24" name="contents" id="contents" >${fn:replace(boardInfo.contents,br,n)}</textarea>
								</td>					
							</tr>
							<tr>
								<th>작성자</th>
								<td>
									${userName}
									<input type="hidden" name="userName" id="username" value="${userName}" readonly>
								</td>
								<th>게시기간</th>
								<td class="no_r_line">
									<input type="text" name="postStDate" id="datepicker1" class="calendar" value="${boardInfo.postStDate}" autocomplete="off">
								</td>
								<td class="no_r_line"> ~ </td>
								<td class="no_r_line">
									<input type="text" name="postEdDate" id="datepicker2" class="calendar" value="${boardInfo.postEdDate}" autocomplete="off">
								</td>
							</tr>
							</tbody> 
						</table>
					</form>
					<div class="bottom_btn_rt">
						<button type="button" class="btn btn_navy2 btn_table" id="listButton" onclick="javascript:listGo()">목록</button>
						<button type="button" class="btn btn_navy2 btn_table" id="deleteButton" onclick="javascript:deleteBoard()">삭제</button>
						<button type="button" class="btn btn_navy2 btn_table" id="saveButton" onclick="javascript:modify()">수정</button>
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
	Gnb.draw($('div.navi'),'system');
	Lnb.draw($('div.left_wrap'), 'system', 'system.notice');
	Footer.draw($('div.footer_wrap'));
	
	// 레이아웃에서 페이지 이동 시 필요 (Gnb, Lnb에서 사용됨)
	function linkURL(url) {
		$("#linkForm").prop('action', url);
		$("#linkForm").submit();
	}
	
	$(document).ready(function () {
		if('${boardInfo.orignFileNm}' != null && '${boardInfo.orignFileNm}' != '') {
			$("#txt").val('${boardInfo.orignFileNm}' + '.' + '${boardInfo.fileExtes}');
		}
		
		if('${login.authorityCd}' != 'A') {
			$("#title").css('border', '0px');
			$("#title").prop('readOnly', true);
			$("#contents").css("border", "0px");
			$("#contents").prop("readonly", true);
			$("#postDateTd").html('${boardInfo.postStDate} ~ ${boardInfo.postEdDate}');
			$("#fileSearchButton").css("display", "none");
			$("#fileDeleteButton").css("display", "none");
			$("#saveButton").css("display", "none");
			$("#deleteButton").css("display", "none");
		}
		
		if($("#txt").val() == "" || jQuery.trim($("#txt").val()).length == 0) {
			$("#fileDownloadButton").css("display", "none");
		}
		
		if($("#txt").val() != "" && jQuery.trim($("#txt").val()).length > 0) {
			$("#fileSearchButton").css("display", "none");
		}
	});
	
	$(document).keydown(function(event) {
		if(event.keyCode == '13') {
			event.preventDefault();
			return;
		}
	});
	
	$("#title, #contents, #file").bind("change paste keyup", function() {
		if('${login.authorityCd}' == 'A') {
			$("#changeText").val("y");
		}
	});
	
	function download(a){
		document.getElementById('txt').value=a.split('/').pop().split('\\').pop();
		
		var fileCk = $("#txt").val();
		
		if(fileCk != "") {
			var ext = fileCk.split('.').pop().toLowerCase();
			if($.inArray(ext, ['gif','png','jpg','jpeg','hwp','word','xlsx','ppt','csv','zip','txt','pptx','img','docx','xls']) == -1) {
				alert('지원하는  파일형식이  아닙니다.');

				if($("#txt").val() != "") {
					$("#txt").val("");
					
					return;
				}
			}
		}
	}

	function fileGo(){
		document.getElementById('file').click();
	}

	function fileUpload(loginId) {
		var file = $("#file")[0].files[0];
		
		var formData = new FormData();
		formData.append("file", file);
		formData.append("loginId", loginId);
		formData.append("postNo", $("#postNo").val());
		formData.append('_csrf', '${CSRF_TOKEN}');
		
		$.ajax({
			type: 'POST',
			url: '/system/fileUpload',
			data: formData,
			dataType: 'json',
			processData: false,
			contentType: false,
			success: function(data) {
				$("#fileSearchButton").css("display", "none");
				$("#fileDownloadButton").css("display", "");
				
				location.reload();
			}
		});
	}
	
	function fileDelete() {
		if(confirm('업로드한 첨부 파일을 삭제하시겠습니까?')) {
			var file = $("#file")[0].files[0];
			
			var formData = new FormData();
			formData.append("file", file);
			formData.append("postNo", $("#postNo").val());
			formData.append("filePath", $("#filePath").val());
			formData.append('_csrf', '${CSRF_TOKEN}');
			
			$.ajax({
				type: 'POST',
				url: '/system/fileDelete',
				data: formData,
				dataType: 'json',
				processData: false,
				contentType: false,
				success: function(data) {
					$("#file").val("");
					$("#txt").val("");
					$("#orignFileNm").val("");
					
					$("#fileDownloadButton").css("display", "none");
					$("#fileSearchButton").css("display", "");
				}
			});
		}
	}
	
	function fileDownload() {
		var fileCk = $("#txt").val();
		
		if(fileCk==""){
			alert("다운로드할 파일이 없습니다.");
			return;
		}
		
		$("#modifyForm").prop("action", "/system/fileDownload");
		$("#modifyForm").submit();
	}
	
	function deleteBoard(){
		if(confirm("해당 게시글을 삭제하시겠습니까?")) {
			var data = $("#modifyForm").serialize();
			
	    	$.ajax({
				async: true,
	            type : 'POST',
	            data : data,
	            url : "/system/deleteBoard",
	            dataType : "json",
	            //contentType: "application/json; charset=UTF-8",
	            success : function(result) {
	            	if(result.deleteOK) {
	            		alert('삭제되었습니다.');

	            		$("#pageForm").prop('action', '/system/notice');
	            		$("#pageForm").submit();
	            	} else {
	            		alert('삭제에 실패하였습니다.');
	            		return;
	            	}
				}, error : function(error) {

				}
			});
		 } else {
		 	return;
		 }
	}
	
	function modify(){
		var test1 = $("#title").val();
		var test2 = $("#contents").val();
		
		if(test1.length > 40) {
			alert("제목을 40자이내로 작성해주세요");
			return;
		}

		if(test2.length > 600) {
			alert("내용을 600자이내로 작성해주세요");
			return;
		}
		
		if($("#title").val() == "") {
			alert("제목을 입력해주세요.");
			$("#title").focus();
			return;
		}
		
		if($("#contents").val() == "") {
			alert("내용을 입력해주세요.");
			$("#contents").focus();
			return;
		}

		if($("#datepicker1").val() == "") {
			alert("게시 기간을 입력해주세요");
			$("#datepicker1").focus();
			return;
		}
		
		if($("#datepicker2").val() == "") {
			alert("게시 기간을 입력해주세요");
			$("#datepicker2").focus();
			return;
		}

		if($("#datepicker1").val() > $("#datepicker2").val()){
			alert("게시 기간을 잘못 입력하였습니다. 다시 입력해주세요.");
			$("#datepicker1").focus();
			return;
		} 
		
		if(confirm("해당 게시글을 수정하시겠습니까?")) {
			var data = $("#modifyForm").serialize();
			
			$.ajax({
				type: 'POST',
				url: '/system/updateBoard',
				data: data,
				dataType: 'json',
				processData: false,
				//contentType: false,
				success: function(data) {
					if($("#txt").val() != null && jQuery.trim($("#txt").val()) != "") {
						if($("#orignFileNm").val() == "") {
							fileUpload('${login.userId}');
						}
					}
					
					alert('수정되었습니다.');
					
					$("#changeText").val("");
				}
			});
		} else {
			return;
		}
	}
	
	function listGo(){
		if($("#changeText").val()=="y"){
			 if(!confirm("입력된 사항이 있습니다.\n저장하지 않고 목록으로 이동하시겠습니까?")) {
			 	return;
			 } 
		}
		
		$("#pageForm").prop("action", "/system/notice");
		$("#pageForm").submit();
	}
	
	var stDay = $("#stDay").val(); 
	var edDay = $("#edDay").val();
	
	var d1 = new Date(stDay.substring(0,4),stDay.substring(4,6)-1,stDay.substring(6,8));
	var d2 = new Date(edDay.substring(0,4),edDay.substring(4,6)-1,edDay.substring(6,8));
	
	$( "#datepicker1" ).datetimepicker({ format: 'Y.m.d' });
	$( "#datepicker2" ).datetimepicker({ format: 'Y.m.d' });
	
	$( "#datepicker1" ).datetimepicker("setDate", d1);
	$( "#datepicker2" ).datetimepicker("setDate", d2);

	$("#datepicker1").prop("readonly", true);//입력불가
	$("#datepicker2").prop("readonly", true);//입력불가
</script>	

</body>
</html>