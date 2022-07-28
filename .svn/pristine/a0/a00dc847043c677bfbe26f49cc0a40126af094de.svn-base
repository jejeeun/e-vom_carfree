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
			<div class="left_wrap">
			</div>
			<div class="contents_wrap_02">
				<div class="search_box_container">
					<form id="searchForm" method="post">
						<table style="border:1px">
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
									<th>검색항목</th>
									<td>
										<select name="searchCondition" id="searchCondition">
											<option value="0">전체</option>	
											<option value="1">제목</option>	
											<option value="2">내용</option>
											<option value="4">작성자</option>
										</select>
									</td>
									<th>검색키워드</th>
									<td>
										<input type="text" name="searchKeyword" id="searchKeyword" value="${searchInfo.searchKeyword}" autocomplete="off" />
									</td>	
									<td >
										<button type="button" class="btn btn_blue btn_search f_right" onclick="javascript:searchBoard()">검색</button>
										<input type="hidden" id="pageNo" name="pageNo" value="${noticeInfoPage.currentPageNo}"/>
										<input type="hidden" id="btn" name="btn" value="1"/>
										<input type="hidden" id="btn2" name="btn2" value="1"/>
										<input type="hidden" id="cd" value="${login.authorityCd}"/>
										<input type="hidden" id="postNo" name="postNo"/>
										<input type="hidden" id="userName" name="userName"/>
										<input type="hidden" id="_csrf" name="_csrf" value="${CSRF_TOKEN}"/>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
				
			<div class="contents_wrap_02 sub_box">
				<h3>공지사항 목록</h3>
				<div class="seach_result">
					<c:if test="${noticeInfoPage.totalRecordCount > 0}">
					총 검색 자료 수 : <fmt:formatNumber value="${noticeInfoPage.totalRecordCount}" groupingUsed="true"/>건
					</c:if>
				</div>
				<table> 
					<caption>
						<details>
							<summary></summary>
						</details>
					</caption>
					<colgroup>
						<c:if test="${login.authorityCd eq 'A'}">
						<col style="width:6%">
						</c:if> 
						<col style="width:6%">
						<col style="width:52%">
						<col style="width:9%">
						<col style="width:9%">
						<col style="width:9%">	
						<col style="width:9%">
					</colgroup>
					<tbody>
					<tr>
						<c:if test="${login.authorityCd eq 'A'}">
						<th>
							<c:if test="${noticeInfoPage.totalRecordCount > 0}">
								<input type="checkbox" id="allCheck"/>
							</c:if>
						</th>
						</c:if>

						<th>NO</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
						<th class="no_r_line">첨부파일</th>
					</tr>
					<c:choose>
					<c:when test="${not empty noticeInfoPage.pageList}">
			 		<c:forEach var="result" items="${noticeInfoPage.pageList}" varStatus="status">
           			<tr>
           				<c:if test="${login.authorityCd eq 'A'}">
           				<th><input type="checkbox" id="car" value="${result.postNo}"/></th>
           				</c:if>
           				<td><fmt:formatNumber value="${result.postNo}" groupingUsed="true"/></td>
           				<td title="${result.title}" class="txt_left site_ellipsis" style="max-width:457px;">
           					<a onclick="detailBoard('${result.postNo}','${result.userName}')">${result.title}</a>
           				</td>
           				<td title="${result.userName}" class="site_ellipsis" style="max-width:79px;">${result.userName}</td>
           				<td>${result.regDt}</td>
           				<td>${result.hits}</td>
           				<td class="no_r_line">
	           				<c:if test="${!empty result.fileName}">
							<input type="hidden" name="filePath" value="${result.filePath}"/>
	   						<a href="javascript:fileDownload('${result.fileName}', '${result.fileExtes}')" class="downloadURL">
	           					<img src="/images/files.png" alt="첨부파일" class="files" />
	           				</a>
	           				</c:if>
           				</td> 
           			</tr>
  						</c:forEach>
  						</c:when>
  						<c:otherwise>
  						<tr>
  							<td colspan="7" class="no_r_line">조회된 목록이 없습니다.</td>
  						</tr>
  						</c:otherwise>
  						</c:choose>
					</tbody>
				</table>
				<div class="contents_wrap_06 sub_box">
					<div class="paginate_complex">
						<c:if test="${noticeInfoPage.totalPageCount > 0}">
							<a class="direction prev" onclick="page(${noticeInfoPage.firstPageNo-1<1 ? 1 : noticeInfoPage.firstPageNo-1})"><span></span> 이전</a>
							<c:forEach var="cnt" begin="${noticeInfoPage.firstPageNo}" end="${noticeInfoPage.lastPageNo}">
							<a onclick="page(${cnt})" id="${cnt}">${cnt}</a>
							</c:forEach>
							<a class="direction next" onclick="page(${noticeInfoPage.lastPageNo+1 > noticeInfoPage.totalPageCount ? noticeInfoPage.totalPageCount : noticeInfoPage.lastPageNo+1})">다음 <span></span></a>
						</c:if>
						<c:if test="${login.authorityCd eq 'A'}">
						<div class="paging_btn" id="buttonBox">
						  	<button type="button" class="btn btn_navy1 btn_table" onclick="deleteBoard()">삭제</button>
							<button type="button" class="btn btn_navy1 btn_table" onclick="regist()">등록</button>
						</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--메인컨텐츠//-->
	
	<form id="fileDownloadForm" method="post">
		<input type="hidden" id="fileName" name="fileName"/>
		<input type="hidden" id="fileExtes" name="fileExtes"/>
		<input type="hidden" id="_csrf" name="_csrf" value="${CSRF_TOKEN}"/>
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
<script src="/js/layout/cims-gnb.js"></script>
<script src="/js/layout/cims-footer.js"></script>
<script src="/js/layout/cims-lnb.js"></script>

<script type="text/javascript">
	if($("#cd").val()=="A"){
		Gnb.draw($('div.navi'),'system');
		Lnb.draw($('div.left_wrap'), 'system', 'system.notice');
		Footer.draw($('div.footer_wrap'));
	}
	
	if($("#cd").val()=="U"){
		Gnb.draw($('div.navi'));
		Lnb.draw($('div.left_wrap'), 'mypage', 'mypage.notice');
		Footer.draw($('div.footer_wrap'));
	}
	
	// 레이아웃에서 페이지 이동 시 필요 (Gnb, Lnb에서 사용됨)
	function linkURL(url) {
		$("#linkForm").prop('action', url);
		$("#linkForm").submit();
	}

	$(document).ready(function() {
		$("#${noticeInfoPage.currentPageNo}").css("font-weight", "bold");
		
		if('${searchInfo.searchCondition}' != '') {
			$("#searchCondition").val('${searchInfo.searchCondition}').prop('selected', true);
		}
		
		$("#allCheck").click(function() { 
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
	   
	function searchBoard() {
		$("#searchForm").prop("action", "/system/notice");
		$("#searchForm").submit();
	}
	
	function regist() {
		$("#searchForm").prop("action", "/system/noticeRegister");
		$("#searchForm").submit();
	}
	
	function detailBoard(postNo, userName) {
		$("#postNo").val(postNo);
		$("#userName").val(userName);
		
		$("#searchForm").prop("action", "/system/noticeDetail");
		$("#searchForm").submit();
	}
	
	function deleteBoard() {
		if($('input:checkbox[id="car"]').is(":checked") == false) {
			alert("삭제할 게시글을 선택해주세요");
			return false;
		}
	
		if(confirm("선택 글을 삭제 하시겠습니까?")) {
			var str = ""; 
			var filePath = "";
	
			$("input:checkbox").each(function (index) {
				if(this.checked) {
					if(str != '') {
						str += ",";
					}
					str += $(this).val();
					
					var tr = $(this).parent().parent();
					var temp = tr.children().eq(6).find('input[type=hidden]').val();
					
					if(temp != null && temp != '') {
						if(filePath != '') {
							filePath += ",";
						}
						
						filePath += $(this).val() + "=" + temp;
					}
				}
			});  
			$("#btn").val(str);
			$("#btn2").val(filePath);
			
			var data = { "btn" : $("#btn").val() , "btn2" : $("#btn2").val() , "_csrf" : '${CSRF_TOKEN}' };
			
			$.ajax({
				async: true,
	            type : 'POST',
	            data : data,
	            url : "/system/deleteBoardList",
	            dataType : "json",
	            //contentType: "application/json; charset=UTF-8",
	            success : function(result) {
	            	if(result.deleteOK) {
	            		alert('삭제되었습니다.');
	            		location.reload();
	            	} else {
	            		alert('삭제에 실패하였습니다.');
	            		return;
	            	}
				}, error : function(error) {

				}
			});
		} else {
			return;
		}
	}
	
	function fileDownload(fileName, fileExtes) {
		$("#fileName").val(fileName);
		$("#fileExtes").val(fileExtes);
		$("#fileDownloadForm").prop('action', '/system/fileDownload');
		$("#fileDownloadForm").submit();
	}
</script>

</body>
</html>