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
	<title>비밀번호 찾기</title>
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
						<h2>비밀번호 찾기</h2>
						<table>
							<tbody>
							<tr>
								<td>
									<p>생년월일은 숫자만 8자리로 입력해주세요(EX:19880206)<br />
									e-mail은 회원정보에 등록된 주소를 작성해주세요.</p>
								</td>	
							</tr>
							<tr>
								<!-- 비밀번호 찾기 실패/성공 여부 -->
								<c:if test="${msg eq 'fail'}">
								<td>비밀번호를 찾지 못했습니다. (관리자에게 문의하세요.)<td>	
								</c:if>
								<c:if test="${msg eq 'success'}">
								<td>회원님의 비밀번호는 ${pwd} 입니다.</td>
								</c:if>	
							</tr>
							</tbody>
						</table>
						<input type="hidden" id="msg" value="${msg }" />
						<form action="findPassword" id="findPassword">
							<table>
								<tr>
									<td><input type="text" name="loginId" id="loginId" class="input_log" placeholder="아이디" autocomplete="off" /></td>
								</tr>
								<tr>
									<td><input type="text" name="userName" id="userName" class="input_log" placeholder="이름"  autocomplete="off" /></td>
								</tr>
								<tr>
									<td><input type="text" name="birthdate" id="birthdate" class="input_log" placeholder="생년월일" autocomplete="off" /></td>
								</tr>
								<tr>
									<td><input type="text" name="email" id="email" class="input_log" placeholder="e-mail" autocomplete="off" /></td>
								</tr>
							</table>
						</form>
						<div class="bottom_btn_log">
							<button type="button" class="btn btn_navy1 btn_log" onclick="javascript:goLogin()">로그인 화면 돌아가기</button>
							<button type="button" class="btn btn_navy1 btn_log" onclick="javascript:findPassword()">찾기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--메인컨텐츠//-->

<script type="text/javascript" src="/js/jquery-3.5.1.js"></script>
<script>
	$("#birthdate").on("keyup", function() {
	    $(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	
	$(document).ready(function() {
		if($("#msg").val() == "fail") {
			alert("입력정보와 일치하는 패스워드를 찾지 못했습니다.");
		}
	});
	
	$(document).keydown(function(event) {
		if(event.keyCode == '13') {
			event.preventDefault();
			return;
		}
	});
	
	function findPassword() {
		var loginId = "";
		var userName = "";
		var birthdate = "";
		var email = "";
		
		loginId = $("#loginId").val();
		userName = $("#userName").val();
		birthdate = $("#birthdate").val();
		email = $("#email").val();
		
		if(loginId == "") {
			alert("아이디를 입력해주세요.");
			return false;
		}
		
		if(userName == "") {
			alert("이름을 입력해주세요.");
			return false;
		}
		
		if(birthdate == "") {
			alert("생년월일을 입력해주세요.");
			return false;
		}
		
		if(email == "") {
			alert("이메일을 입력해주세요.");
			return false;
		}
		
		if($('#loginId').val() != "" && $('#userName').val() != "" 
							&& $('#birthdate').val() != "" && $('#email').val() != "") {
				$("#findPassword").submit();
		}
	}
	
	function goLogin() {
		location.href="/loginForm"
	}
</script>
	
</body>
</html>