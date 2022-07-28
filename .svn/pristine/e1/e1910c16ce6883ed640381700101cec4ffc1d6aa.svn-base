<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 메인 화면 박스 공지사항 목록 -->
<em>공지사항</em>
<a href=""><img src="/images/btn_more.png" alt="more" class="i_more noticeMoreBtn" /></a>
<table>
	<caption>
	    <details>
	        <summary>NO, 제묵, 작성자, 작성일, 조회수</summary>
	    </details>
	</caption>
	<colgroup>
	    <col style="width:10%">
		<col style="width:54%">
		<col style="width:10%">
		<col style="width:16%">
		<col style="width:10%">
	</colgroup>
	<tbody>
	<tr class="title_line1">
		<th>NO</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th class="no_r_line">조회수</th>
	</tr>
	<c:choose>
	<c:when test="${noticeList == null or noticeList.size() == 0}">
	<tr><td colspan="5" class="no_r_line">조회된 목록이 없습니다.</td></tr>
	</c:when>
	<c:otherwise>
		<c:forEach var="i" begin="0" end="${noticeList.size() > 3 ? 2 : noticeList.size()-1}" varStatus="status">
		<tr>
			<td>${noticeList[i].postNo}</td>
			<td title="${noticeList[i].title}" class="site_ellipsis txt_left" style="max-width:283px;"><a href="javascript:upHit('${noticeList[i].postNo}','${noticeList[i].userName}')">${noticeList[i].title}</a></td>
			<td title="${noticeList[i].userName}" class="site_ellipsis" style="max-width:53px;">${noticeList[i].userName}</td>
			<td>${noticeList[i].regDt}</td>
			<td class="no_r_line">${noticeList[i].hits}</td>
		</tr>
		</c:forEach>
	</c:otherwise>
	</c:choose>
	</tbody>
</table>
<script type="text/javascript">
	$(".noticeMoreBtn").click(noticeMoreBtnOnClick);
	
	function noticeMoreBtnOnClick(e) {
		window.location.href="/login/myNotice";

		e.preventDefault();
	}
    
	function upHit(postNo, userName) {
		location.href = "/login/myNoticeDetail?postNo=" + postNo + "&userName=" + encodeURI(userName);
	}
</script>