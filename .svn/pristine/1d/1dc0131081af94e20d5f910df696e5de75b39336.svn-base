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
			<div class="left_wrap"></div>
			<form id="searchForm" method="post">
				<div class="contents_wrap_02">
					<div class="search_box_container">
						<table>
							<caption>
								<details>
									<summary></summary>
								</details>
							</caption>
							<colgroup>
								<col style="width:8%">
								<col style="width:33.75%">
								<col style="width:8%">
								<col style="width:33.75%">
								<col style="width:16.5%">									
							</colgroup>
							<tbody>
							<tr>
								<th>회원명</th>
								<td>
									<input type="text" id="searchName" name="searchName"value="${searchInfo.searchName}" autocomplete="off"/>	
								</td>
								<th></th>
								<td></td>
								<td>
									<button type="button" class="btn btn_blue btn_search f_right" onclick="javascript:searchMember()">검색</button>
								</td>
							</tr>
							</tbody>
						</table>						
					</div>
				</div>
				<input type="hidden" id="pageNo" name="pageNo" value="${memberInfoPage.currentPageNo}"/>
				<input type="hidden" id="userId" name="userId"/>
				<input type="hidden" id="btn" name="btn" value="1">
				<input type="hidden" id="_csrf" name="_csrf" value="${CSRF_TOKEN}"/>
			</form>
			
			<div class="contents_wrap_02 sub_box">
				<h3>회원목록</h3>
				<div class="seach_result">
					<c:if test="${memberInfoPage.totalRecordCount > 0}">
					총 검색 자료 수 : <fmt:formatNumber value="${memberInfoPage.totalRecordCount}" groupingUsed="true"/>건
					</c:if>
				</div>
				<table style="table-layout:fixed;word-break:break-all;"> 
					<caption>
						<details>
							<summary></summary>
						</details>
					</caption>
					<colgroup>
						<col style="width:6%">
						<col style="width:6%">
						<col style="width:12%">
						<col style="width:12%">
						<col style="width:12%">
						<col style="width:25%">
						<col style="width:9%">
						<col style="width:9%">
						<col style="width:9%">												
					</colgroup>
					<tbody>
					<tr>
						<th><input type="checkbox" id="allCheck"/></th>
						<th>NO</th>
						<th>아이디</th>
						<th>회원명</th>
						<th>전화번호</th>
						<th>이메일</th>
						<th>권한</th>
						<th>등록일</th>
						<th class="no_r_line">최종접속일</th>
					</tr>
					<c:choose>
					<c:when test="${empty memberInfoPage.pageList}">
					<tr>
						<td colspan="9" class="no_r_line">
							조회된 목록이 없습니다.
						</td>
					</tr>
					</c:when>
					<c:otherwise>
				 	<c:forEach var="result" items="${memberInfoPage.pageList}" varStatus="status">
           			<tr>
           				<th><input type="checkbox" name="car" value="${result.userId}" <c:if test="${login.loginId eq result.loginId}">disabled</c:if>/></th>
           				<td><fmt:formatNumber value="${memberInfoPage.lastRecordNo - status.index + 1}" groupingUsed="true"/></td>
           				<td title="${result.loginId}" class="site_ellipsis" style="max-width:105px;">${result.loginId}</td>
           				<td title="${result.userName}" class="site_ellipsis" style="max-width:105px;">
           					<a onclick="javascript:detail('${result.userId}')">${result.userName}</a>
           				</td>
           				<td>${result.tel1}</td>
           				<td title="${result.email}" class="site_ellipsis" style="max-width:220px;">${result.email}</td>
           				<td>
            				<c:if test='${result.authorityCd eq "A"}'>
            				관리자
            				</c:if>
            				<c:if test='${result.authorityCd eq "U"}'>
            				사용자
            				</c:if>
           				</td>
           				<td>
            				<fmt:formatDate value="${result.regDt}" pattern="yyyy.MM.dd"/>
           				</td>
           				<td class="no_r_line">
            				<fmt:formatDate value="${result.accessDt}" pattern="yyyy.MM.dd"/>
           				</td>				
           			</tr>
    					</c:forEach> 
					</c:otherwise>
					</c:choose>
					</tbody>
				</table>
					
				<div class="contents_wrap_06 sub_box">
					<div class="paginate_complex">
						<c:if test="${memberInfoPage.totalPageCount > 0}">
							<a class="direction prev" onclick="page(${memberInfoPage.firstPageNo-1 < 1 ? 1 : memberInfoPage.firstPageNo-1})"><span></span> 이전</a>
							<c:forEach var="cnt" begin="${memberInfoPage.firstPageNo}" end="${memberInfoPage.lastPageNo}">
							<a onclick="page(${cnt})" id="${cnt}">${cnt}</a>
							</c:forEach>
							<a class="direction next" onclick="page(${memberInfoPage.lastPageNo+1 > memberInfoPage.totalPageCount ? memberInfoPage.totalPageCount : memberInfoPage.lastPageNo+1})">다음 <span></span></a>
						</c:if>
						
						<c:if test="${login.authorityCd eq 'A'}">
						<div class="paging_btn" id="buttonBox">
						  	<button type="button" class="btn btn_navy1 btn_table" onclick="deleteMember()">삭제</button>
							<button type="button" class="btn btn_navy1 btn_table" onclick="regist()">등록</button>
						</div>
					</c:if>
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
<script type="text/javascript" src="/js/common/util.js"></script>	
<script type="text/javascript" src="/js/jquery-ui.js"></script>
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

	$(document).ready(function() {
		$("#${memberInfoPage.currentPageNo}").css("font-weight", "bold");
		
		$("#allCheck").click(function(){ 
			if($("#allCheck").prop("checked")) {
				$("input[type=checkbox]").prop("checked",true);
			} else {  
				$("input[type=checkbox]").prop("checked",false); 
			} 
		});
	});
	
	$(document).keydown(function(event) {
		if(event.keyCode == '13') {
			event.preventDefault();
			return;
		}
	});
	
	function page(pageNo) {
    	if(pageNo == null || pageNo == '') {
    		pageNo = '1';
    	}
    	
    	$("#pageNo").val(pageNo);
    	$("#searchForm").submit();
    }

    function regist() {
    	$("#searchForm").prop("action", "/system/memberRegister");
    	$("#searchForm").submit();
    }
    
    function detail(userId) {
    	$("#userId").val(userId);
    	
    	$("#searchForm").prop("action", "/system/memberDetail");
    	$("#searchForm").submit();
    }
    
    function deleteMember() {
    	if(!$('input:checkbox[name="car"]').is(":checked")) {
			alert("삭제할 회원을 선택해주세요.");
			return false;
		}
    	
    	if('${memberInfoPage.totalRecordCount}' == 1) {
    		alert('회원은 적어도 하나 이상 존재해야 합니다.');
    		return false;
    	}
    	
		if(confirm("선택한 회원을 삭제 하시겠습니까?")) {
			var str = "";  
			$("input:checkbox[name='car']").each(function (index) {
				if(this.checked) {
					if(str != '') {
						str += ",";
					}
					str += $(this).val();  
				}
			});
			
			var data = { "userIdStr" : str , "_csrf" : '${CSRF_TOKEN}' };
			
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
		        		location.reload();
		        	} else {
		        		alert('삭제에 실패하였습니다.');
		        	}
		        }
		   });
		} else {
			return;
		}
    }
    
    function searchMember() {
		$("#pageNo").val('${memberInfoPage.currentPageNo}');
    
		$("#searchForm").prop("action", "/system/member");
		$("#searchForm").submit();
    }
</script>

</body>
</html>