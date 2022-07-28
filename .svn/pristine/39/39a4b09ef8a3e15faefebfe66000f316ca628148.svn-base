<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"		uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt"		uri="http://java.sun.com/jsp/jstl/fmt" %>
<em>실시간 차량 통행상황</em>
<span class="box_time"><fmt:formatDate value="${now}" pattern="yyyy.MM.dd HH:mm:ss"/> 현재</span>
<a href="javascript:refreshRealTimeList()"><img src="/images/btn_refresh.png" alt="새로고침" class="refresh" /></a>
<table>
	<caption>
		<details>
			<summary>지점, 차선, 통행량, LEZ 적발량, 고농도 적발량</summary>
		</details>
	</caption>
	<colgroup>
		<col style="width:20%">
		<col style="width:16%">
		<col style="width:16%">
		<col style="width:16%">
		<col style="width:16%">
		<col style="width:16%">
	</colgroup>
	<tbody>
	<tr>
		<th rowspan="2">지점</th>
		<th rowspan="2">차선</th>
		<th rowspan="2">통행량</th>
		<th colspan="3" class="no_r_line">적발량</th>
	</tr>
	<tr>
		<th>LEZ</th>
		<th>고농도</th>
		<th class="no_r_line">계절제</th>
	</tr>
    <c:choose>
        <c:when test="${realTimeVehiclePage == null or realTimeVehiclePage.totalRecordCount == 0}">
		<tr><td colspan="5" class="no_r_line">조회된 목록이 없습니다.</td></tr>
        </c:when>
        <c:otherwise>
            <c:forEach var="realTimeVehicle" items="${realTimeVehiclePage.pageList}" varStatus="status">
			<tr>
				<td title="${realTimeVehicle.siteName}" class="site_ellipsis" style="max-width:140px;">${realTimeVehicle.siteName}</td>
				<td title="${realTimeVehicle.laneName}" class="site_ellipsis" style="width:95px;">${realTimeVehicle.laneName}</td>
				<td><fmt:formatNumber value="${realTimeVehicle.realTimeVehicleCount}" groupingUsed="true"/></td>
				<td><fmt:formatNumber value="${realTimeVehicle.lezDisclosureVehicleCount}" groupingUsed="true"/></td>
				<td><fmt:formatNumber value="${realTimeVehicle.highDensityDisclosureVehicleCount}" groupingUsed="true"/></td>
				<td class="no_r_line"><fmt:formatNumber value="${realTimeVehicle.seasonDisclosureVehicleCount}" groupingUsed="true"/></td>
			</tr>
            </c:forEach>
        </c:otherwise>
    </c:choose>
	</tbody>
</table>
<div class="paginate_complex">
	<a class="direction prev" <c:if test="${realTimeVehiclePage.firstPageNo > 1}">onclick="RealTimeDocumentScript.page(${realTimeVehiclePage.firstPageNo - 1})"</c:if>> <span></span> 이전</a>
	<c:forEach var="pageNo" begin="${realTimeVehiclePage.firstPageNo}" end="${realTimeVehiclePage.lastPageNo}" step="1">
		<c:choose>
			<c:when test="${pageNo == realTimeVehiclePage.currentPageNo}">
			<strong style="font-weight: bold;">${pageNo}</strong>
			</c:when>
			<c:otherwise>
			<a onclick="RealTimeDocumentScript.page(${pageNo})">${pageNo}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<a class="direction next" <c:if test="${realTimeVehiclePage.lastPageNo < realTimeVehiclePage.totalPageCount}">onclick="RealTimeDocumentScript.page(${realTimeVehiclePage.lastPageNo + 1})"</c:if>>다음 <span></span></a>
</div>
<script type="text/javascript">
	function refreshRealTimeList() {
		$(".refresh").addClass('refreshOn');
		RealTimeDocumentScript.page(1);
	}
</script>