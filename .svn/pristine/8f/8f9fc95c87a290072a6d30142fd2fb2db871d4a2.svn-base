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
	<title>비밀번호 변경</title>
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
	<!--메인컨텐츠-->
	<div class="login">
		<div class="login_bg">
			<div class="con_wrap">
				<div class="con_center">
					<div class="contents_wrap_01 info_box_container">
						<h2>관리자 초기 비밀번호 변경</h2>
						<form id="pwdForm" method="post">
						<input type="hidden" id="loginId" name="loginId" value="${loginVO.loginId}"/>
						<input type="hidden" id="_csrf" name="_csrf" value="${CSRF_TOKEN}"/>
						<table>
							<tr>
								<td><input type="password" id="pwd" name="pwd" class="input_log" placeholder="초기 비밀번호 (10~15자)" /></td>
							</tr>
							<tr>
								<td><input type="password" id="newPwd" name="newPwd" class="input_log" placeholder="신규 비밀번호 (10~15자, 영문+숫자 조합)" autocomplete="off"/></td>
							</tr>
							<tr>
								<td><input type="password" id="newPwdConfirm" name="newPwdConfirm" class="input_log" placeholder="신규 비밀번호 확인 (10~15자, 영문+숫자 조합)" autocomplete="off"/></td>
							</tr>
						</table>
						</form>
						<div class="bottom_btn_log">
							<button type="button" class="btn btn_navy1 btn_log" onclick="javascript:goLogin()">로그인 화면 돌아가기</button>
							<button type="button" class="btn btn_navy1 btn_log" onclick="javascript:confirmPwd()">변경</button>
						</div>
					</div>	 
				</div>
			</div>
		</div>
	</div>
	<!--메인컨텐츠//-->
	
<script type="text/javascript" src="/js/jquery-3.5.1.js"></script>
<script>
	if('${msg}' == 'changePasswordNO') {
		alert('비밀번호 변경이 실패하였습니다.\n다시 시도해주세요.');
	}
	
	function goLogin() {
		location.href="/loginForm"
	}
	
	function confirmPwd() {
		var pwd = $("#pwd").val();
		var newPwd = $("#newPwd").val();
		var newPwdConfirm = $("#newPwdConfirm").val();
		
		if(pwd == "") {
			alert("현재 비밀번호를 입력해주세요.");
			return;
		}
		
		if(newPwd == "") {
			alert("신규 비밀번호를 입력해주세요.");
			return;
		}
		
		if(newPwd.search(/[a-zA-Z]/g) < 0
					|| newPwd.search(/[0-9]/g) < 0
							|| newPwd.length < 10
									|| newPwd.length > 15) { 
			alert('신규 비밀번호는 영문자와 숫자 조합으로 10~15자리로 입력해주세요.');
			return;
		}
		
		if(newPwd.includes('_')) {
			alert('비밀번호에 _ 문자는 입력할 수 없습니다.');
			return;
		}
		
		if(newPwdConfirm == "") {
			alert("신규 비밀번호 확인을 입력해주세요.");
			$("#pwd2").focus();
			return;
		}
		
		if(newPwd != newPwdConfirm) {
			alert("신규 비밀번호와 신규 비밀번호 확인 값이 맞지 않습니다.");
			return;
		}
		
		$("#pwdForm").prop('action', '/changePassword');
		$("#pwdForm").submit();
	}
</script>
</body>
</html>