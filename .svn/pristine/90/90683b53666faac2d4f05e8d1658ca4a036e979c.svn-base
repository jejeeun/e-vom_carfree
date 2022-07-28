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
	<meta charset="UTF-8">
	<title>자동차 운행제한 시스템</title>
	<link rel="stylesheet" type="text/css" href="/css/vegas.min.css" />
	<link rel="stylesheet" type="text/css" href="/css/reset.css"/>
	<link rel="stylesheet" type="text/css" href="/css/common.css"/>
	<link rel="stylesheet" type="text/css" href="/css/login.css" />
	<link rel="apple-touch-icon" sizes="180x180" href="/images/favicon/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="32x32" href="/images/favicon/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="/images/favicon/favicon-16x16.png">
	<link rel="manifest" href="/images/favicon/site.webmanifest">
	<meta name="msapplication-TileColor" content="#da532c">
	<meta name="theme-color" content="#ffffff">
</head>	
<body>

<script type="text/javascript" src="/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="/js/vegas.min.js"></script>

<script type="text/javascript">
	/*동영상*/
	$(function(){
		$("body").vegas({
			slides:[
				{src:"/images/night_traffic.jpg",
					video:{
						src:["/images/traffic_1.mp4"],
						loop:true, 
						mute:true
					}
				}
			]
		});
	});
	
	$(document).ready(function() {
		if('${msg}' == 'ID' || '${msg}' == 'PW') {
			alert('아이디나 비밀번호가 잘못 되었습니다.\n다시 입력해주세요.');
		} else if('${msg}' == 'error') {
			alert('비밀번호를 5번 이상 잘못 입력하셨습니다.\n현재 아이디로 다시 로그인 희망 시 관리자에게 문의주세요.');
		} else if('${msg}' == 'changePasswordOK') {
			alert('설정한 신규 비밀번호로 다시 로그인해주세요.');
		}
	});

	// 아이디 찾기
	function findAccount() {
		location.href="/findAccountForm";
	}
	
	// 비밀번호 찾기
	function findPassword() {
		location.href="/findPasswordForm"
	}
	
	// 로그인버튼 누를 시
	function login() {
		if(jQuery.trim($("#loginId").val()).length == 0) {
			alert('아이디를 입력해주세요.');
			$("#loginId").val("");
			$("#loginId").focus();
			return false;
		}
		
		if(jQuery.trim($("#pwd").val()).length == 0) {
			alert('비밀번호를 입력해주세요.');
			$("#pwd").val("");
			$("#pwd").focus();
			return false;
		}
		
		$("#loginform").submit();
	}
	
	// 엔터키 눌렀을 때 로그인 실행
	function enterKey() {
		if(event.keyCode == 13) {
			login();
		}
	}
</script>
	
	<input type="hidden" id="msg" value="${msg}">
	
	<div class="overlay"></div>
	<div class="main_wrap">
		<div class="box_wrap">
			<div class="in_box on">
				<div class="square">
					<span class="l1"></span>
					<span class="l2"></span>
					<span class="l3"></span>
					<span class="l4"></span>
					<p>대구광역시 대중교통<br/>마일리지 연계시스템</p>
				</div>
			</div>
		</div>
<%-- 		<div class="login_wrap">
			<form action="/login" method="post" id="loginform">
				<div class="login_wrapper">
					<img src="images/logo.png" alt="logo" class="login_logo" />
					<div class="login_input">
						<input type="text" id="loginId" name="loginId" value="" placeholder="아이디" class="input_log" autocomplete="off"/>
						<input type="password" id="pwd" name="pwd" placeholder="비밀번호" class="input_log" onkeypress="javascript:enterKey();" autocomplete="new-password"/>
						<button class="login" type="button" onclick="login()">로그인</button>
						<ul class="f_right">
							<li><a href="javascript:findAccount()">아이디 찾기</a></li>
							<li class="login_blank">|</li>
							<li><a href="javascript:findPassword()">비밀번호 찾기</a></li>
						</ul>
						<img src="../images/ej_logo_wh.png" alt="이제이소프트" class="company_logo" />
					</div>
				</div>
			</form>
		</div> --%>
	</div>
	
</body>
</html>