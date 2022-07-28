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
			<div class="contents_wrap_02">
				<div class="info_box_container">
					<h2>회원정보관리</h2>
					<form id="updateForm" method="post">
						<input type="hidden" id="_csrf" name="_csrf" value="${CSRF_TOKEN}"/>
						<input type="hidden" id="login_pwd" value="${memberVO.pwd}"/>
						<input type="hidden" id="userId" name="userId" value="${memberVO.userId}"/>
						<input type="hidden" name="modUser" value="${login.userId}"/>
						<table class="info_table">
							<colgroup>
								<col style="width:24%">
								<col style="width:52%">
								<col style="width:24%">
							</colgroup>
							<tbody>
							<tr>
								<th>아이디</th>
								<td colspan="2">
									<input type="text" name="loginId" id="loginId" class="disabled" autocomplete="off" value="${memberVO.loginId}" readonly />
								</td>
							</tr>
							<tr>
								<th><span class="point_red">*</span> 회원명</th>
								<td colspan="2">
									<input type="text" name="userName" id="userName" autocomplete="off" value="${memberVO.userName}" />
								</td>
							</tr>
							<tr>
								<th><span class="point_red">*</span> 생년월일</th>
								<td colspan="2">
									<input type="text" name="birthdate" id="datepicker1" class="calendar" value="${memberVO.birthdate}" autocomplete="off" />
								</td>	
							</tr>
							<tr>
								<th><span class="point_red">*</span> e-Mail</th>
								<td colspan="2">
									<input type="text" name="email" id="email" value="${memberVO.email}" autocomplete="off" />
								</td>
							</tr>
							<tr>
								<th><span class="point_red">*</span> 전화번호</th>
								<td colspan="2">
									<input type="text" name="tel1" id="tel1"value="${memberVO.tel1}"  autocomplete="off" />
								</td>
							</tr>
							<tr>
								<th>비밀번호<p class="txt_preRq">(10~15자리)</p></th>
								<td>
									<input type="password" name="pwd" id="pwd" class="password_reset" autocomplete="off"/>
								</td>
								<td class="search_btn">
									<button type="button" class="btn btn_blue btn_search_b" id="default" onclick="javascript:pwDefault()">비밀번호 초기화</button>
								</td>
							</tr>
							<tr>
								<th><span class="point_red">*</span> 권한</th>
								<td colspan="2">
									<select name="authorityCd" id="authorityCd">
										<option value="A" ${memberVO.authorityCd eq "A" ? "selected" :""}>관리자</option>
										<option value="U" ${memberVO.authorityCd eq "U" ? "selected" :""}>사용자</option>
									</select>
							    </td>
							</tr>	
							<tr>
								<th>최초 접속일</th>
								<td colspan="2">
									<input type="text" id="regDt" class="disabled" value="<fmt:formatDate value='${memberVO.regDt}' pattern='yyyy.MM.dd'/>" autocomplete="off" readonly />
								</td>
							</tr>
							<tr>
								<th>최종 접속일</th>
								<td colspan="2">
									<input type="text" id="accessDt" class="disabled" value="<fmt:formatDate value='${memberVO.accessDt}' pattern='yyyy.MM.dd'/>" autocomplete="off" readonly />
								</td>
							</tr>
							</tbody>
						</table>
					</form>
					<div class="bottom_btn_ct">
						<button type="button" class="btn btn_navy1 btn_bot" onclick="javascript:listGo()">목록</button>
						<c:if test="${memberVO.loginId != login.loginId}">
						<button type="button" class="btn btn_navy1 btn_bot" onclick="javascript:deleteGo()">삭제</button>
						</c:if>
						<button type="button" class="btn btn_navy1 btn_bot" onclick="javascript:modifyGo()">수정</button>
					</div>
				</div>	
			</div>	
		</div>
	</div>
	
	<form id="pageForm" method="post">
		<input type="hidden" id="_csrf" name="_csrf" value="${CSRF_TOKEN}"/>
		<input type="hidden" id="pageNo" name="pageNo" value="${searchInfo.pageNo}"/>
		<input type="hidden" id="searchName" name="searchName" value="${searchInfo.searchName}"/>
		<input type="hidden" id="userId" name="userId" value="${searchInfo.userId}"/>
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
<script type="text/javascript" src="/js/common/util.js"></script>	
<script type="text/javascript" src="/js/jquery-ui.js"></script>
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
	$(".calendar").prop("readonly", true);//입력불가
	
	$("#tel1").keyup(function(event) {
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
			var inputVal = $(this).val();
			$(this).val(inputVal.replace(/[^\0-9\#$%<>^&*\()\-=+_\']/gi,''));
	   }
	});
	
	$(document).keydown(function(event) {
		if(event.keyCode == '13') {
			event.preventDefault();
			return;
		}
	});
	
	function pwDefault() {
		var test1 = $("#loginId").val();
		var userId = $("#userId").val();
		var test2 = test1.substring(0,3);
		
		var result = Math.floor(Math.random() * 100000) + 10000;
		if(result>100000) {
		   result = result - 10000;
		}
		
		var pwd = test2 + result;
		var data = JSON.stringify({ "pwd" : pwd , "userId" : userId , "_csrf" : '${CSRF_TOKEN}' });
		
		$.ajax({
			url: "/system/defaultPassword",
			type: "POST",
	        data: data, 
	        dataType: "text",
	        //contentType: "application/json; charset=UTF-8",
	        success: function(data) {
				alert("회원님의 초기화된 비밀번호 입니다.\n(비밀번호:"+test2+result+")");
				$("#pwd").val(pwd);
				$("#login_pwd").val(pwd);
			}, error:function(data) {
				alert("에러");
			}
		});
	}
	
	function listGo() {
		$("#pageForm").prop("action", "/system/member");
		$("#pageForm").submit();
	}
	
	function deleteGo() {
		if('${memberCnt}' == 1) {
			alert('회원은 적어도 하나 이상 존재해야 합니다.');
			return false;
		}
		
		if(confirm("삭제 하시겠습니까?")) {
			var data = { "userIdStr" : $("#userId").val() , '_csrf' : '${CSRF_TOKEN}' };
			
			$.ajax({
		        async: true,
		        type : 'POST',
		        data : data,
		        url : "/system/deleteMember",
		        dataType : "json",
		        //contentType: "application/json; charset=UTF-8",
		        success : function(data) {
		        	if(data.success == 'Y') {
		        		alert('삭제되었습니다.');
		        		
		        		$("#pageForm").prop("action", "/system/member");
		        		$("#pageForm").submit();
		        	} else {
		        		alert('삭제에 실패하였습니다.');
		        	}
		        }
		   });
		} else {
			return;
		}
	}
	
	function modifyGo() {
		var pwd = $("#pwd").val();
		
		if($("#userName").val()=="") {
			alert("회원명을 입력해 주세요.");
			$("#userName").focus();
			return;
		}
		
		if($("#datepicker1").val()=="") {
			alert("생년월일을 입력해 주세요.");
			$("#datepicker1").focus();
			return;
		}
		
		if($("#email").val()=="") {
			alert("이메일을 입력해 주세요.");
			$("#email").focus();
			return;
		}
		
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	
		if(exptext.test($("#email").val())==false) {
			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			
			alert("이메일 형식이 올바르지 않습니다.");
	
			$("#email").focus();
				
			return;
		}
		
		if($("#tel1").val()=="") {
			alert("전화번호를 입력해 주세요.");
			$("#tel1").focus();
			return;
		}
		
		if(pwd != '') {
			if(pwd.search(/[a-zA-Z]/g) < 0
					|| pwd.search(/[0-9]/g) < 0
							|| pwd.length < 10
									|| pwd.length > 15) {
				alert('비밀번호는 영문자와 숫자 조합으로 10~15자리로 입력해주세요.');
				return;
			}
		}
		
		if(confirm("저장 하시겠습니까?")) {
		    var data = $("#updateForm").serialize();
		    
		    $.ajax({
		        async: true,
		        type : 'POST',
		        data : data,
		        url : "/system/updateMember",
		        dataType : "json",
		        //contentType: "application/json; charset=UTF-8",
		        success : function(result) {
		        	if(result.updateOK) {
				   		alert('저장되었습니다.');
				   		
				   		$("#pageForm").prop('action', '/system/memberDetail');
				   		$("#pageForm").submit();
		        	} else {
		        		alert('저장에 실패하였습니다.');
		        		return;
		        	}
		        }, error : function(error) {
					alert("error : " + error);
		        }
		    });
		} else {
			return;
		}
	}
</script>
	
</body>
</html>