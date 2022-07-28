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
	<link rel="stylesheet" type="text/css" href="/css/jquery-ui.css" />
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
			<div class="contents_wrap_02">
				<div class="info_box_container">
					<h2>회원정보등록</h2>
					<form id="registForm" method="post">
						<input type="hidden" name="regId" value="${login.userId}"/>
						<input type="hidden" id="_csrf" name="_csrf" value="${CSRF_TOKEN}"/>
						<input type="hidden" id="afterCheckId"/>			
						<table class="info_table">
							<colgroup>
								<col style="width:24%">
								<col style="width:52%">
								<col style="width:24%">
							</colgroup>
							<tbody>
							<tr>
								<th><span class="point_red">*</span> 아이디<p class="txt_preRq">(15자리이내)</p></th>
								<td>
									<input type="text" name="loginId" id="loginId" class="id_check" autocomplete="off" />
								</td>
								<td class="search_btn">
									<button type="button" class="btn btn_blue btn_search_b" id="idck">중복확인</button>
								</td>					
							</tr>
							<tr>
								<th><span class="point_red">*</span> 회원명</th>
								<td colspan="2"><input type="text" name="userName" id="userName" autocomplete="off" /></td>
							</tr>
							<tr>
								<th><span class="point_red">*</span> 생년월일</th>
								<td colspan="2"><input type="text" name="birthdate" id="datepicker1" class="calendar" autocomplete="off" /></td>	
							</tr>
							<tr>
								<th><span class="point_red">*</span> e-Mail</th>
								<td colspan="2"><input type="text" name="email" id="email" autocomplete="off" /></td>
							</tr>
							<tr>
								<th><span class="point_red">*</span> 전화번호</th>
								<td colspan="2"><input type="text" name="tel1" id="tel1" autocomplete="off" /></td>
							</tr>
							<tr>
								<th><span class="point_red">*</span> 비밀번호<p class="txt_preRq">(10~15자리)</p></th>
								<td colspan="2"><input type="password" name="pwd" id="pwd" placeholder="10~15자 이내, 영문/숫자 조합으로 입력" autocomplete="new-password"/> </td></tr>
							<tr>
								<th><span class="point_red">*</span> 비밀번호 확인<p class="txt_preRq">(10~15자리)</p></th>
								<td colspan="2"><input type="password" name="pwdconfirm" id="pwdconfirm" placeholder="10~15자 이내, 영문/숫자 조합으로 입력" autocomplete="off" /></td></tr>
							<tr>
								<th><span class="point_red">*</span> 권한</th>
								<td colspan="2">
									<select name="authorityCd" id="authorityCd">
										<option value="A">관리자</option>	
										<option value="U" selected>사용자</option>
									</select>
							    </td>
							</tr>
							</tbody>
						</table>
					</form>
					<div class="bottom_btn_ct">
						<button type="button" class="btn btn_navy1 btn_bot" onclick="javascript:listGo()">목록</button>
						<button type="button" class="btn btn_navy1 btn_bot" onclick="javascript:registGo()">저장</button>
					</div>
				</div>	
			</div>	
		</div>
	</div>
	<!--메인컨텐츠//-->
	
	<form id="pageForm" method="post">
		<input type="hidden" id="_csrf" name="_csrf" value="${CSRF_TOKEN}"/>
		<input type="hidden" id="pageNo" name="pageNo" value="${searchInfo.pageNo}"/>
		<input type="hidden" id="searchName" name="searchName" value="${searchInfo.searchName}"/>
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
<script type="text/javascript" src="/js/jquery-ui.js"></script>
<script type="text/javascript" src="/js/common/util.js"></script>
<script type="text/javascript" src="/js/jquery.datetimepicker.full.js"></script>
<script src="/js/layout/cims-gnb.js"></script>
<script src="/js/layout/cims-footer.js"></script>
<script src="/js/layout/cims-lnb.js"></script>

<script type="text/javascript">
	Gnb.draw($('div.navi'),'system');
	Lnb.draw($('div.left_wrap'), 'system', 'system.member');
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
	
	$(document).keydown(function(event) {
		if(event.keyCode == '13') {
			event.preventDefault();
			return;
		}
	});
	
	//아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
	var idck = 0;
	$(function() {
	    //idck 버튼을 클릭했을 때 
	    $("#idck").click(function() {
			if($("#loginId").val() != "" && jQuery.trim($("#loginId").val()).length != 0) {
		        var userId =  $("#loginId").val(); 
		        
		        $.ajax({
		            async: true,
		            type : 'POST',
		            data : { "userId" : userId , "_csrf" : '${CSRF_TOKEN}' },
		            url : "/system/idCheck",
		            dataType : "json",
		            //contentType: "application/json; charset=UTF-8",
		            success : function(data) {
		                if (data.cnt > 0) {
		                    alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
		                    $("#loginId").val("");
		                    $("#loginId").focus();
		                } else {
		                    alert("사용 가능한 아이디입니다.");
		                    $("#userName").focus();
		                    $("#afterCheckId").val(userId);
		                    //아이디가 중복하지 않으면  idck = 1 
		                    idck = 1;
		                }
		            }, error : function(error) {
		                alert("error : " + error);
		            }
		        });
			} else {
				alert('아이디을 입력해주세요.')
				$("#loginId").val("");
				$("#loginId").focus();
				return;
			}
	    });
	});
	
	$("#tel1").keyup(function(event) {
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
			var inputVal = $(this).val();
			$(this).val(inputVal.replace(/[^\0-9\-\']/gi,''));
	   }
	});
	
	$("#datepicker1").datetimepicker({ 
		format: 'Y.m.d',
		maxDate: new Date()
	});
	$("#datepicker1").prop("readonly", true);//입력불가
	
	function registGo() {
		var userId =  $("#loginId").val(); 
		var pwd = $("#pwd").val();
		var afterCheckId = $("#afterCheckId").val();
		
		if($("#loginId").val() == "") {
			alert("아이디를 입력해주세요.");
			$("#loginId").focus();
			return ;
		}
		
		if(userId.length > 15) {
			alert("아이디는 15자리 이하로 입력해주세요.");
			$("#loginId").focus();
			return;
		}
		
		if(userId != afterCheckId) {
			idck = 0;
		}
		
		if(userId == afterCheckId) {
			idck = 1;	 
		}
		
	    if(idck == 0) {
			alert('아이디 중복체크를 해주세요.');
	        return ;
	    }
		
		if($("#userName").val() == "") {
			alert("회원명을 입력해주세요.");
			$("#userName").focus();
			return ;
		}
		
		if($("#datepicker1").val() == "") {
			alert("생년월일을 입력해주세요.");
			$("#datepicker1").focus();
			return ;
		}
		
		if($("#email").val() == "") {
			alert("이메일을 입력해주세요.");
			$("#email").focus();
			return ;
		}
	
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	
		if(exptext.test($("#email").val()) == false) {
			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			
			alert("이메일 형식이 올바르지 않습니다.");
	
			$("#email").focus();
			return ;
		}
		 
		if($("#tel1").val() == "") {
			alert("전화번호를 입력해주세요.");
			$("#tel1").focus();
			return ;
		}
		
		if($("#tel1").val().length > 20) {
			alert("전화번호는 20자리 이하로 입력해주세요.");
			$("#tel1").focus();
			return ;
		}
	 	
		if($("#pwd").val() == "") {
			alert("비밀번호를 입력해주세요.");
			$("#pwd").focus();
			return ;
		}
		
		if($("#pwd").val().search(/[a-zA-Z]/g) < 0
				|| $("#pwd").val().search(/[0-9]/g) < 0
						|| $("#pwd").val().length < 10
								|| $("#pwd").val().length > 15) { 
			alert('비밀번호는 영문자와 숫자 조합으로 10~15자리로 입력해주세요.');
			return;
		}
		
		if($("#pwd").val().includes('_')) {
			alert('비밀번호에 _ 문자는 입력할 수 없습니다.');
			return;
		}
	 	
		if($("#pwd").val() != $("#pwdconfirm").val()) {
			alert("현재 비밀번호와 비밀번호 확인 값이 같지 않습니다.");
			$("#pwdconfirm").focus();
			return;
		}
		
		if(confirm("등록 하시겠습니까?")) {
			var data = $("#registForm").serialize();
			
			$.ajax({
				async: true,
	            type : 'POST',
	            data : data,
	            url : "/system/registMember",
	            dataType : "json",
	            //contentType: "application/json; charset=UTF-8",
	            success : function(result) {
	            	if(result.insertOK) {
	            		alert('등록되었습니다.');
	            		
	            		$("#linkForm").prop('action', '/system/member');
	            		$("#linkForm").submit();
	            	} else {
	            		alert('등록에 실패하였습니다.')
	            		return;
	            	}
				}, error : function(error) {
				}
			});
		} else {
			return;
		}
	}
	
	function listGo() {
		$("#pageForm").prop("action", "/system/member");
		$("#pageForm").submit();
	}
</script>
	
</body>
</html>