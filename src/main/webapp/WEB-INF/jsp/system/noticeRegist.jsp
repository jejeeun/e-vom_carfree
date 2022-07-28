<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
	<input type="hidden" name="changeText" id="changeText"/>
	<div class="con_wrap">
		<div class="con_center">
			<div class="left_wrap">
			</div>
			<div class="contents_wrap_05 sub_box">
				<div class="info_box_container">
					<h3>공지사항 등록</h3>
					<form id="registForm" enctype="multipart/form-data">
						<input type="hidden" id="_csrf" name="_csrf" value="${CSRF_TOKEN}"/>
						<input type="hidden" name="regId" value="${login.userId}">				
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
								<td colspan="5" class="no_r_line">
									<input type="text" id="title" name="title" autocomplete="off"/>
								</td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td colspan="4" class="no_r_line">
									<input type="text" class="filename" id="fileName" name="fileName" onclick="download(this.value)" autocomplete="off" readonly/>	
								</td>
								<td class="no_r_line search_btn">
									<input type="file" size="0" id="file" name="file" onchange="download(this.value)" style="display:none;" />
									<button type="button" class="btn btn_gray btn_search_s" onclick="javascript:fileGo()">찾아보기</button>
									<button type="button" class="btn btn_gray btn_search_s" onclick="javascript:deleteBoard()">삭제하기</button>
								</td>
							</tr>
							<tr>
								<th><span class="point_red">*</span>내용</th>
								<td colspan="5" class="no_r_line">
									<textarea rows="24" name="contents" id="contents"></textarea>
								</td>					
							</tr>
							<tr>
								<th>작성자</th>
								<td>
									${login.userName}
									<input type="hidden" name="userName" id="userName" value="${login.userName}" readonly>
								</td>
								<th>게시기간</th>
								<td class="no_r_line">
									<input type="text" name="postStDate" id="datepicker1" class="calendar" autocomplete="off">
								</td>
								<td class="no_r_line"> ~ </td>
								<td class="no_r_line">
									<input type="text" name="postEdDate" id="datepicker2" class="calendar" autocomplete="off">
								</td>
							</tr>
							</tbody> 
						</table>
					</form>
					<c:if test="${login.authorityCd eq 'A'}">
					<div class="bottom_btn_rt">
						<button type="button" class="btn btn_navy1 btn_table" onclick="javascript:listGo()">목록</button>
						<button type="button" class="btn btn_navy1 btn_table" onclick="javascript:regist()">저장</button>
					</div>
					</c:if>
				</div>
			</div>		
		</div>
	</div> 
	
	<form id="pageForm" method="post">
		<input type="hidden" id="_csrf" name="_csrf" value="${CSRF_TOKEN}"/>
		<input type="hidden" id="pageNo" name="pageNo" value="${searchInfo.pageNo}"/>
		<input type="hidden" id="searchCondition" name="searchCondition" value="${searchInfo.searchCondition}"/>
		<input type='hidden' id="searchKeyword" name="searchKeyword" value="${searchInfo.searchKeyword}"/>
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
	
	$(document).keydown(function(event) {
		if(event.keyCode == '13') {
			event.preventDefault();
			return;
		}
	});

	$("#title, #contents, #file").bind("change paste keyup", function() {
		$("#changeText").val("y");
	});
	
	function download(a) {
		$("#fileName").val(a.split('/').pop().split('\\').pop());
		
		var fileCk = $("#fileName").val();
	
		if(fileCk != "" && jQuery.trim(fileCk).length > 0) {
			var ext = fileCk.split('.').pop().toLowerCase();
			if($.inArray(ext, ['gif','png','jpg','jpeg','hwp','word','xlsx','ppt','csv','zip','txt','pptx','img','docx','xls'] ) == -1) {
				alert('지정된 파일형식이 아닙니다.');
			
				if($("#fileName").val()!=""){
					$("#fileName").val("");
					
					return;
				}
		    }
		}
	}

	function fileGo() {
		$("#file").trigger("click");
	}

	function regist() {
		var test1 = $("#title").val();
		var test2 = $("#contents").val();
		
		if(test1.length > 40){
			alert("제목을 40자 이내로 작성해주세요");
			return;
		}

		if(test2.length > 600){
			alert("내용을 600자 이내로 작성해주세요");
			return;
		}
		
		if($("#title").val()==""){
			alert("제목을 입력해주세요.");
			$("#title").focus();
			return;
		}
		
		if($("#contents").val()==""){
			alert("내용을 입력해주세요.");
			$("#contents").focus();
			return;
		}
		
		if($("#datepicker1").val()==""){
			alert("게시기간을 입력해주세요.");
			$("#datepicker1").focus();
			return;
		}
		
		if($("#datepicker2").val()==""){
			alert("게시기간을 입력해주세요.");
			$("#datepicker2").focus();
			return;
		}
		
		if($("#datepicker1").val() > $("#datepicker2").val()){
			alert("게시기간을 잘못 입력하였습니다. 다시 입력해주세요.");
			$("#datepicker1").focus();
			return;
		}
		
		if(confirm("등록하시겠습니까?")) {
			var data = $("#registForm").serialize();
			
			$.ajax({
				type: 'POST',
				url: '/system/registBoard',
				data: data,
				dataType: 'json',
				processData: false,
				//contentType: false,
				success: function(data) {
					if($("#fileName").val() != null && jQuery.trim($("#fileName").val()) != "") {
						fileUpload('${login.userId}');
					} else {
						$("#pageForm").prop("action", "/system/notice");
						$("#pageForm").submit();
					}
				}
			});
		} else {
			return;
		}
	}
	
	function fileUpload(loginId) {
		var file = $("#file")[0].files[0];
		
		var formData = new FormData();
		formData.append("file", file);
		formData.append("loginId", loginId);
		formData.append('_csrf', '${CSRF_TOKEN}');
		
		$.ajax({
			type: 'POST',
			url: '/system/fileUpload',
			data: formData,
			dataType: 'json',
			processData: false,
			contentType: false,
			success: function(data) {
				alert('저장되었습니다.');
				
				$("#pageForm").prop("action", "/system/notice");
				$("#pageForm").submit();
			}
		});
	}
	
	function deleteBoard() {
		$("#file").val("");
		$("#fileName").val("");
	}

	function listGo() {
		if($("#changeText").val()=="y"){
			 if(!confirm("입력된 사항이 있습니다.\n저장하지 않고 목록으로 이동하시겠습니까?")) {
			 	return;
			 } 
		}
		
		$("#pageForm").prop("action", "/system/notice");
		$("#pageForm").submit();
	}
	
	$(document).ready(function() {
		var loadDt = new Date();
	
		$( "#datepicker1" ).datetimepicker({
			format: 'Y.m.d',
			onShow: function () {
				this.setOptions({
					minDate: loadDt 
				})
			},
			lang: 'kr'
		});
		
		$( "#datepicker2" ).datetimepicker({
			format: 'Y.m.d',
			onShow: function () {
				this.setOptions({
					minDate: loadDt 
				})
			},
			lang: 'kr'
		});
		
		var today = dateFormat(loadDt);
		var afterWeek = dateFormat(new Date(Date.parse(loadDt) + 7 * 1000 * 60 * 60 * 24));
		
		$("#datepicker1").val(today);
		$("#datepicker2").val(afterWeek);
		
		$("#datepicker1").prop("readonly", true);//입력불가
		$("#datepicker2").prop("readonly", true);//입력불가
	});
	
	function dateFormat(date) {
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var day = date.getDate();
		
		var dateStr = year + "." + (month < 10 ? "0" + month : month) + "." + (day < 10 ? "0" + day : day);
		
		return dateStr;
	}
</script>	

</body>
</html>