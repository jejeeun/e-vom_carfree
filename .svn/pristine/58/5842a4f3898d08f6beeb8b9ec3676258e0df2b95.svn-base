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
    <meta charset="UTF-8">
    <title>자동차 운행제한 시스템</title>
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
				<div class="search_box_container">
					<form id="searchForm" method="post">
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
									<th>연계 시작일</th>
									<td>
										<input type="text" id="startStDt" name="startStDt" class="calendarTime" value="${searchInfo.startStDt}" readonly />
										~
										<input type="text" id="endStDt" name="endStDt" class="calendarTime" value="${searchInfo.endStDt}" readonly />
									</td>
									<th>연계 종료일</th>
									<td>
										<input type="text" id="startEdDt" name="startEdDt" class="calendarTime" value="${searchInfo.startEdDt}" readonly />
										~
										<input type="text" id="endEdDt" name="endEdDt" class="calendarTime" value="${searchInfo.endEdDt}" readonly />
									</td>
									<td>
										<button type="button" class="btn btn_blue btn_search f_right" onclick="javascript:page()">검색</button>
										<input type="hidden" id="btId" name="btId" value="${searchInfo.btId}"/>
										<input type="hidden" id="pageNo" name="pageNo" value="${searchInfo.pageNo}"/>
										<input type="hidden" id="listPage" name="listPage" value="${listPage}"/>
										<input type="hidden" id="type" name="type" value="${searchInfo.type}"/>
										<input type="hidden" id="startDate" name="startDate" value="${searchInfo.startDate}"/>
										<input type="hidden" id="endDate" name="endDate" value="${searchInfo.endDate}"/>
										<input type="hidden" id="_csrf" name="_csrf" value="${CSRF_TOKEN}"/>
									</td>
								</tr>
							</tbody>
						</table>
					</form>						
				</div>				
			</div>
			
			<div class="contents_wrap_02 sub_box">
				<h3>연계 상세이력 목록</h3>
				<div class="seach_result">
					<c:if test="${not empty interfaceDetailInfoPage.pageList}">
					총 검색 자료 수 : <fmt:formatNumber value="${interfaceDetailInfoPage.totalRecordCount}" groupingUsed="true"/>건
					</c:if>
				</div>
				<table> 
					<caption>
						<details>
							<summary>연계 상세이력 목록</summary>
						</details>
					</caption>
					<colgroup>
						<col style="width:8%">
						<col style="width:8%">
						<col style="width:48%">
						<col style="width:18%">
						<col style="width:18%">
					</colgroup>
					<tbody>
						<tr>
							<th>NO</th>
							<th>배치아이디</th>
							<th>배치설명</th>
							<th>연계 시작일</th>
							<th class="no_r_line">연계 종료일</th>
						</tr>
						<c:if test="${empty interfaceDetailInfoPage.pageList}">
						<tr><td colspan="5" class="no_r_line">조회된 목록이 없습니다.</td></tr>
						</c:if>
						<c:if test="${not empty interfaceDetailInfoPage.pageList}">
						<c:forEach var="result" items="${interfaceDetailInfoPage.pageList}" varStatus="status">
						<tr>
							<td><fmt:formatNumber value="${interfaceDetailInfoPage.totalRecordCount - ((interfaceDetailInfoPage.currentPageNo - 1) * interfaceDetailInfoPage.recordSize) - status.index}" groupingUsed="true"/></td>
							<td>${result.btId}</td>
							<td title="${result.note}" class="site_ellipsis" style="max-width:412px;">${result.note}</td>
							<td>${result.stDt}</td>
							<td class="no_r_line">
								<c:if test="${empty result.edDt}">
								-
								</c:if>
								<c:if test="${not empty result.edDt}">
								${result.edDt}
								</c:if>
							</td>
						</tr>
						</c:forEach>
						</c:if>
					</tbody>
				</table>
				
				<div class="paginate_complex">
					<c:if test="${interfaceDetailInfoPage.totalPageCount > 0}">
						<a class="direction prev" onclick="page(${interfaceDetailInfoPage.firstPageNo-1 < 1 ? 1 : interfaceDetailInfoPage.firstPageNo-1})"><span></span> 이전</a>
						<c:forEach var="cnt" begin="${interfaceDetailInfoPage.firstPageNo}" end="${interfaceDetailInfoPage.lastPageNo}">
						<a onclick="page(${cnt})" id="${cnt}">${cnt}</a>
						</c:forEach>
						<a class="direction next" onclick="page(${interfaceDetailInfoPage.lastPageNo+1 > interfaceDetailInfoPage.totalPageCount ? interfaceDetailInfoPage.totalPageCount : interfaceDetailInfoPage.lastPageNo+1})">다음 <span></span></a>
					</c:if>
					<div class="paging_btn">
						<button type="button" class="btn btn_gray btn_table" onclick="goList()">목록</button>
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
<script type="text/javascript" src="/js/jquery.datetimepicker.full.js"></script>
<script type="text/javascript" src="/js/common/util.js"></script>
<script src="/js/layout/cims-gnb.js"></script>
<script src="/js/layout/cims-footer.js"></script>
<script src="/js/layout/cims-lnb.js"></script>
<script type="text/javascript">
	Gnb.draw($('div.navi'),'system');
	Lnb.draw($('div.left_wrap'), 'system', 'system.interface');
	Footer.draw($('div.footer_wrap'));
	
	// 레이아웃에서 페이지 이동 시 필요 (Gnb, Lnb에서 사용됨)
	function linkURL(url) {
		$("#linkForm").prop('action', url);
		$("#linkForm").submit();
	}
	
	$(document).ready(function() {
		$("#${interfaceDetailInfoPage.currentPageNo}").css("font-weight", "bold");
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
    
    function goList() {
    	$("#pageNo").val($("#listPage").val());
    	
    	$("#searchForm").prop("action", "/system/interfaceList");
    	$("#searchForm").submit();
    }
    
    $('.calendarTime').datetimepicker({
    	datepicker: true,
    	timepicker: true,
    	format:'Y.m.d H:i',
		onShow: function () {
			this.setOptions({
				maxDate: new Date()
			})
		},
		lang: 'kr'
    });
</script>
</body>
</html>