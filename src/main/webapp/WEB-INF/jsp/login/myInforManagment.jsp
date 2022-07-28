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
	<div class="con_wrap">
		<div class="con_center">
			<div class="left_wrap">
			</div>
			<div class="contents_wrap_05">
				<div class="info_box_container">
					<h2>내 정보 관리</h2>			
					<form id="modify" method="post">
						<input type="hidden" id="_csrf" name="_csrf" value="${CSRF_TOKEN}"/>
						<input type="hidden" name="userId" value="${member.userId}"/>
						<input type="hidden" id="msg" value="${msg}"/>
						<table class="info_table">
							<colgroup>
								<col style="width:25%">
								<col style="width:75%">
							</colgroup>
							<tbody>
							<tr>
								<th>아이디</th>
								<td><input type="text" name="loginId" value="${member.loginId}" class="disabled" readonly/></td>
							</tr>
							<tr>
								<th>이름</th>
								<td><input type="text" name="userName" value="${member.userName}" class="disabled" readonly/></td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td><input type="text" name="birthdate" value="${member.birthdate}" id="datepicker1" class="calendar" autocomplete="off"/></td>
								
							</tr>
							<tr>
								<th>e-Mail</th>
								<td><input type="text" name="email" value="${member.email}"/></td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td><input type="text" name="tel1" value="${member.tel1}"/></td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td><input type="password" name="pwd" id="pwd"/></td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="checkbox" id="pwdChange"/>&nbsp;비밀번호 변경
								</td>
							</tr>
							<tr id="newpwd" style="display:none;">
								<th>신규 비밀번호<p class="txt_preRq">(10~15자리)</p></th>
								<td><input type="password" id="newpwd1" name="newPwd" autocomplete="off"/></td>
							</tr>
							<tr id="pwdconfirm" style="display:none;">
								<th>비밀번호 확인<p class="txt_preRq">(10~15자리)</p></th>
								<td><input type="password" id="pwdconfirm1" autocomplete="off"/></td>
							</tr>
							</tbody>
						</table>
						<div class="txt_center" id="confirm" style="display:none;">
							10~15자 이내, 영문/숫자 조합으로 입력하여야 합니다.
						</div>
					</form>
					<div class="bottom_btn_ct">
						<button type="button" class="btn btn_navy1 btn_bot" onclick="javascript:confirmPwd()">수정</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--메인컨텐츠//-->
	
	<form id="linkForm" method="post">
		<input type="hidden" id="_csrf" name="_csrf" value="${CSRF_TOKEN}"/>
		<input type="hidden" id="loginId" name="loginId" value="${login.loginId}"/>
	</form>
	
	<!--푸터-->
	<div class="footer_wrap">
	</div>
	<!--푸터//-->

<script type="text/javascript" src="/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="/js/jquery-ui.js"></script>
<script type="text/javascript" src="/js/jquery.datetimepicker.full.js"></script>
<script type="text/javascript" src="/js/common/util.js"></script>	
<script src="/js/layout/cims-gnb.js"></script>
<script src="/js/layout/cims-footer.js"></script>
<script src="/js/layout/cims-lnb.js"></script>

<script type="text/javascript">
	Gnb.draw($('div.navi'));
	Lnb.draw($('div.left_wrap'), 'mypage', 'mypage.certification');
	Footer.draw($('div.footer_wrap'));
	
	// 레이아웃에서 페이지 이동 시 필요 (Gnb, Lnb에서 사용됨)
	function linkURL(url) {
		$("#linkForm").prop('action', url);
		$("#linkForm").submit();
	}

	$('.calendar').datetimepicker({
		format: 'Y.m.d',
		yearStart: 1960,
		maxDate: new Date()
	});
	
	$(document).ready(function() {
		if($("#msg").val() == "sucess"){
			alert("업데이트 성공!");
		}		
	});
	
	$(document).keydown(function(event) {
		if(event.keyCode == '13') {
			event.preventDefault();
			return;
		}
	});
		
	$("#pwdChange").click(function() {
		if($("#pwdChange").is(":checked")) {
			$("#newpwd").css("display","");
			$("#pwdconfirm").css("display","");
			$("#confirm").css("display","");
		} else {
			$("#newpwd").css("display","none");
			$("#pwdconfirm").css("display","none");
			$("#confirm").css("display","none");
			$("#newpwd1").val("");
			$("#pwdconfirm1").val("");
		}
	});

	function confirmPwd() {
		var pwd = $("#pwd").val();
		var pwd1 = $("#newpwd1").val();
		var pwd2 = $("#pwdconfirm1").val();
		
		if(pwd == "") {
			alert("현재 비밀번호를 입력해주세요.");
			return;
		}
		
		if(pwd != '${member.pwd}') {
			alert("현재 비밀번호가 맞지 않습니다.");
			return;
		}
		
		if($("#pwdChange").is(":checked")) {
			if(pwd1 == "") {
				alert("신규 비밀번호를 입력해주세요.");
				return;
			}
			
			if(pwd1.search(/[a-zA-Z]/g) < 0
					|| pwd1.search(/[0-9]/g) < 0
							|| pwd1.length < 10
									|| pwd1.length > 15) { 
				alert('신규 비밀번호는 영문자와 숫자 조합으로 10~15자리로 입력해주세요.');
				return;
			}
			
			if(pwd1.includes('_')) {
				alert('비밀번호에 _ 문자는 입력할 수 없습니다.');
				return;
			}
			
			if(pwd2 == "") {
				alert("비밀번호 확인을 입력해주세요.");
				$("#pwd2").focus();
				return;
			}
			
			if(pwd1 != pwd2) {
				alert("신규 비밀번호와 비밀번호 확인 값이 맞지 않습니다.");
				return;
			}
		}
		
		$("#modify").prop('action', '/myinfoModify');
		$("#modify").submit();
	}

	$("#datepicker1").datetimepicker({ format: 'Y.m.d' });
	$("#datepicker1").prop("readonly", true);
</script>
	
</body>
</html>