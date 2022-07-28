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
	<div class="con_wrap" id="test">
		<div class="con_center">
			<div class="left_wrap">
			</div>
			<div class="contents_wrap_05">
				<div class="info_box_container">
					<h2>내 정보 관리</h2>
					<form id="certificationForm" method="post">
						<input type="hidden" id="_csrf" name="_csrf" value="${CSRF_TOKEN}"/>
						<div class="certi_table_container">
							<h3>본인인증</h3>
							<table class="certi_table">
								<tbody>
								<tr>
									<td><input type="text" name="loginId" id="loginId" placeholder="아이디" autocomplete="off"/></td>
								</tr>
								<tr>
									<td><input type="password" name="pwd" id="pwd" placeholder="비밀번호" onkeypress="javascript:enterKey();" autocomplete="new-password"/></td>
								</tr>
								</tbody>
							</table>
							<div class="bottom_btn">
								<button type="button" class="btn btn_navy2 btn_bot2" onclick="javascript:certification()">본인인증</button>
							</div>
						</div>
					</form>	
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
<script type="text/javascript" src="/js/common/util.js"></script>	
<script type="text/javascript" src="/js/jquery-ui.js"></script>
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

	if('${msg}' == 'loginNO') {
		alert ('아이디나 비밀번호가 잘못 입력되었습니다.');
	} else if('${msg}' == 'notSameId') {
		alert('로그인한 계정으로 본인인증 해주세요.');
	}
	
	function enterKey() {
		if(event.keyCode == 13) {
			certification();
		}
	}

	function certification(){
		if($("#loginId").val()==""){
			alert("아이디를 입력해주세요.");
			return;
		}
		
		if($("#pwd").val()==""){
			alert("비밀번호를 입력해주세요.");
			return;
		}
		
		$("#certificationForm").prop('action', '/myInforManagment');
		$("#certificationForm").submit();
	}
</script>

</body>
</html>