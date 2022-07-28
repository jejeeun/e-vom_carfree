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
									<th>유형</th>
									<td colspan="3">
										<select name="type" id="type">
											<option value="">전체</option>	
											<option value="SND">송신</option>	
											<option value="RCV">수신</option>
										</select>
									</td>
									<td>
										<button type="button" class="btn btn_blue btn_search f_right" onclick="javascript:page()">검색</button>
										<input type="hidden" id="pageNo" name="pageNo" value="${interfaceInfoPage.currentPageNo}"/>
										<input type="hidden" id="btId" name="btId" value=""/>
										<input type="hidden" id="listPage" name="listPage" value="1"/>
										<input type="hidden" id="_csrf" name="_csrf" value="${CSRF_TOKEN}"/>
									</td>
								</tr>
							</tbody>
						</table>
					</form>						
				</div>					
			</div>
			
			<input type="hidden" id="page" name="page" value="1">
			<input type="hidden" id="btn" name="btn" value="1">
			<div class="contents_wrap_02 sub_box">
				<h3>연계 이력 목록</h3>
				<div class="seach_result">
					<c:if test="${not empty interfaceInfoPage.pageList}">
					총 검색 자료 수 : <fmt:formatNumber value="${interfaceInfoPage.totalRecordCount}" groupingUsed="true"/>건
					</c:if>
				</div>
				<table> 
					<caption>
						<details>
							<summary>연계이력 목록</summary>
						</details>
					</caption>
					<colgroup>
						<col style="width:8%">
						<col style="width:8%">
						<col style="width:18%">
						<col style="width:40%">
						<col style="width:8%">
						<col style="width:18%">
					</colgroup>
					<tbody>
						<tr>
							<th>NO</th>
							<th>배치아이디</th>
							<th>배치이름</th>
							<th>배치설명</th>
							<th>상태</th>
							<th class="no_r_line">최근 연계 실행일</th>
						</tr>
						<c:if test="${empty interfaceInfoPage.pageList}">
						<tr style="display:none;"><td colspan="5" class="no_r_line">조회된 목록이 없습니다.</td></tr>
						</c:if>
						<c:if test="${not empty interfaceInfoPage.pageList}">
						<c:forEach var="result" items="${interfaceInfoPage.pageList}" varStatus="status">
						<tr>
							<td><fmt:formatNumber value="${status.count + interfaceInfoPage.firstRecordNo}" groupingUsed="true"/></td>
							<td>
								<c:if test="${empty result.latestEdDt}">
								${result.btId}
								</c:if>
								<c:if test="${not empty result.latestEdDt}">
								<a onclick="javascript:detail('${result.btId}')">${result.btId}</a>
								</c:if>
							</td>
							<td title="${result.btNm}" class="site_ellipsis" style="max-width:155px;">${result.btNm}</td>
							<td title="${result.note}" class="site_ellipsis" style="max-width:340px; text-align:left;">${result.note}</td>
							<td>
								<c:if test="${result.useYn == 'Y'}">
								<div class="toggleWrapper"><input type="checkbox" id="tgbtn1" checked disabled/><label class="toggle cursorDf" for="tgbtn1"></label></div>
								</c:if>
								<c:if test="${result.useYn == 'N'}">
								<div class="toggleWrapper"><input type="checkbox" id="tgbtn1" disabled/><label class="toggle cursorDf" for="tgbtn1"></label></div>
								</c:if>
							</td>
							<td class="no_r_line">
								<c:if test="${empty result.latestEdDt}">
								-
								</c:if>
								<c:if test="${not empty result.latestEdDt}">
								${result.latestEdDt}
								</c:if>
							</td>
						</tr>
						</c:forEach>
						</c:if>
					</tbody>
				</table>
				<div class="paginate_complex">
					<c:if test="${interfaceInfoPage.totalPageCount > 0}">
						<a class="direction prev" onclick="page(${interfaceInfoPage.firstPageNo-1 < 1 ? 1 : interfaceInfoPage.firstPageNo-1})"><span></span> 이전</a>
						<c:forEach var="cnt" begin="${interfaceInfoPage.firstPageNo}" end="${interfaceInfoPage.lastPageNo}">
						<a onclick="page(${cnt})" id="${cnt}">${cnt}</a>
						</c:forEach>
						<a class="direction next" onclick="page(${interfaceInfoPage.lastPageNo+1 > interfaceInfoPage.totalPageCount ? interfaceInfoPage.totalPageCount : interfaceInfoPage.lastPageNo+1})">다음 <span></span></a>
					</c:if>
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
		$("#${interfaceInfoPage.currentPageNo}").css("font-weight", "bold");
		
		$("#startDate").datetimepicker({
			format: 'Y.m.d',
			onShow: function () {
				this.setOptions({
					maxDate: new Date()
				})
			},
			lang: 'kr'
		});
		$("#endDate").datetimepicker({
			format: 'Y.m.d',
			onShow: function () {
				this.setOptions({
					minDate: $("#startDate").val() ? $("#startDate").val() : false
				})
			},
			lang: 'kr'
		});
		
		if('${searchInfo.startDate}' == '') {
			var today = new Date();
			$("#endDate").val(Util.dateFormat(today));
			today.setTime(today.getTime() - (6*24*60*60*1000));
			$("#startDate").val(Util.dateFormat(today));
		} else {
			$("#startDate").val('${searchInfo.startDate}');
			$("#endDate").val('${searchInfo.endDate}');
		}
		
		if('${searchInfo.type}' != '') {
			$("#type").val('${searchInfo.type}').prop('selected', true);
		}
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
    
    function detail(btId) {
    	$("#btId").val(btId);
    	$("#pageNo").val(1);
    	$("#listPage").val('${interfaceInfoPage.currentPageNo}');
    	
    	$("#searchForm").prop("action", "/system/interfaceDetailList");
    	$("#searchForm").submit();
    }
</script>
</body>
</html>