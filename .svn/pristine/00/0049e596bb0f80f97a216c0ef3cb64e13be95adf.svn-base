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
				<div class="con40_wrap sub_box con_left">
					
					<div class="con_box con_box_01">
						<em>자원 사용 현황</em>
						<table>
							<caption>
								<details>
									<summary>운영서버, DB서버, 연계서버</summary>
								</details>
							</caption>
							<colgroup>
								<col style="width:15%">
								<col style="width:20%">
								<col style="width:55%">
								<col style="width:10%">
							</colgroup>
							<tbody>
							<tr>
								<th>서버</th>
								<th>자원</th>
								<th colspan="2" class="no_r_line">사용 현황</th>
							</tr>
							<tr>
								<th rowspan="3" class="bb_2line">운영</th>
								<th>CPU</th>
								<td class="no_r_line">
									<div class="status_bar" style="width:${resourceUsageInfo.prodResourceInfo.cpuUsage < 1 ? 1 : resourceUsageInfo.prodResourceInfo.cpuUsage}%;"></div><!-- 1.자원 현황 출력을 위해 같은 수치가 2번 들어갑니다. -->
								</td>
								<td class="no_both_line">${resourceUsageInfo.prodResourceInfo.cpuUsage}%</td><!-- 2.자원 현황 출력을 위해 같은 수치가 2번 들어갑니다. -->
							</tr>
							<tr>
								<th>Memory</th>
								<td class="no_r_line">
									<div class="status_bar" style="width:${resourceUsageInfo.prodResourceInfo.memoryUsage < 1 ? 1 : resourceUsageInfo.prodResourceInfo.memoryUsage}%;"></div><!-- 1.자원 현황 출력을 위해 같은 수치가 2번 들어갑니다. -->
								</td>
								<td class="no_both_line">${resourceUsageInfo.prodResourceInfo.memoryUsage}%</td><!-- 2.자원 현황 출력을 위해 같은 수치가 2번 들어갑니다. -->
							</tr>
							<tr>
								<th class="bb_2line">HDD</th>
								<td class="no_r_line bb_2line">
									<div class="status_bar" style="width:${resourceUsageInfo.prodResourceInfo.hddUsage < 1 ? 1 : resourceUsageInfo.prodResourceInfo.hddUsage}%;"></div><!-- 1.자원 현황 출력을 위해 같은 수치가 2번 들어갑니다. -->
								</td>
								<td class="no_both_line bb_2line">${resourceUsageInfo.prodResourceInfo.hddUsage}%</td><!-- 2.자원 현황 출력을 위해 같은 수치가 2번 들어갑니다. -->
							</tr>
							<tr>
								<th rowspan="3" class="bb_2line">DB</th>
								<th>CPU</th>
								<td class="no_r_line">
									<div class="status_bar" style="width:${resourceUsageInfo.dbResourceInfo.cpuUsage < 1 ? 1 : resourceUsageInfo.dbResourceInfo.cpuUsage}%;"></div><!-- 1.자원 현황 출력을 위해 같은 수치가 2번 들어갑니다. -->
								</td>
								<td class="no_both_line">${resourceUsageInfo.dbResourceInfo.cpuUsage}%</td><!-- 2.자원 현황 출력을 위해 같은 수치가 2번 들어갑니다. -->
							</tr>
							<tr>
								<th>Memory</th>
								<td class="no_r_line">
									<div class="status_bar" style="width:${resourceUsageInfo.dbResourceInfo.memoryUsage < 1 ? 1 : resourceUsageInfo.dbResourceInfo.memoryUsage}%;"></div><!-- 1.자원 현황 출력을 위해 같은 수치가 2번 들어갑니다. -->
								</td>
								<td class="no_both_line">${resourceUsageInfo.dbResourceInfo.memoryUsage}%</td><!-- 2.자원 현황 출력을 위해 같은 수치가 2번 들어갑니다. -->
							</tr>
							<tr>
								<th class="bb_2line">HDD</th>
								<td class="no_r_line bb_2line">
									<div class="status_bar" style="width:${resourceUsageInfo.dbResourceInfo.hddUsage < 1 ? 1 : resourceUsageInfo.dbResourceInfo.hddUsage}%;"></div><!-- 1.자원 현황 출력을 위해 같은 수치가 2번 들어갑니다. -->
								</td>
								<td class="no_both_line bb_2line">${resourceUsageInfo.dbResourceInfo.hddUsage}%</td><!-- 2.자원 현황 출력을 위해 같은 수치가 2번 들어갑니다. -->
							</tr>
							<tr>
								<th rowspan="3">연계</th>
								<th>CPU</th>
								<td class="no_r_line">
									<div class="status_bar" style="width:${resourceUsageInfo.linkResourceInfo.cpuUsage < 1 ? 1 : resourceUsageInfo.linkResourceInfo.cpuUsage}%;"></div><!-- 1.자원 현황 출력을 위해 같은 수치가 2번 들어갑니다. -->
								</td>
								<td class="no_both_line">${resourceUsageInfo.dbResourceInfo.cpuUsage}%</td><!-- 2.자원 현황 출력을 위해 같은 수치가 2번 들어갑니다. -->
							</tr>
							<tr>
								<th>Memory</th>
								<td class="no_r_line">
									<div class="status_bar" style="width:${resourceUsageInfo.linkResourceInfo.memoryUsage < 1 ? 1 : resourceUsageInfo.linkResourceInfo.memoryUsage}%;"></div><!-- 1.자원 현황 출력을 위해 같은 수치가 2번 들어갑니다. -->
								</td>
								<td class="no_both_line">${resourceUsageInfo.linkResourceInfo.memoryUsage}%</td><!-- 2.자원 현황 출력을 위해 같은 수치가 2번 들어갑니다. -->
							</tr>
							<tr>
								<th>HDD</th>
								<td class="no_r_line">
									<div class="status_bar" style="width:${resourceUsageInfo.linkResourceInfo.hddUsage < 1 ? 1 : resourceUsageInfo.linkResourceInfo.hddUsage}%;"></div><!-- 1.자원 현황 출력을 위해 같은 수치가 2번 들어갑니다. -->
								</td>
								<td class="no_both_line">${resourceUsageInfo.linkResourceInfo.hddUsage}%</td><!-- 2.자원 현황 출력을 위해 같은 수치가 2번 들어갑니다. -->
							</tr>
							</tbody>
						</table>
						<div class="squere_wrapper">
							<span class="squere squere_blue"></span> 안전
							<span class="squere squere_green"></span> 원활
							<span class="squere squere_yellow"></span> 양호
							<span class="squere squere_orange"></span> 주의
							<span class="squere squere_red"></span> 위험
						</div>
					</div>
					
					<div class="con_box con_box_02">
						<em>촬영 이미지 파일 관리 기간</em>
						<table>
							<caption>
								<details>
									<summary>불량 파일, 운행 차량 파일, 적발 차량 파일</summary>
								</details>
							</caption>
							<colgroup>
								<col style="width:35%">
								<col style="width:75%">
							</colgroup>
							<tbody>
							<tr>
								<th class="txt_left">불량 파일</th>
								<td class="no_r_line"><input type="text" name="" value="${dbTableInfo.fileDelCycleInfo.data1}" class="w80p txt_center" readonly disabled /> 일</td>
							</tr>
							<tr>
								<th class="txt_left">운행 차량 파일</th>
								<td class="no_r_line"><input type="text" name="" value="${dbTableInfo.fileDelCycleInfo.data2}" class="w80p txt_center" readonly disabled /> 일</td>
							</tr>
							<tr>
								<th class="txt_left">적발 차량 파일</th>
								<td class="no_r_line"><input type="text" name="" value="${dbTableInfo.fileDelCycleInfo.data3}" class="w80p txt_center" readonly disabled /> 일</td>
							</tr>
							</tbody>
						</table>
					</div>
<%-- 					
					<div class="con_box con_box_03">
						<em>파일 백업 주기</em>
						<table>
							<caption>
								<details>
									<summary>반복 설정, 작업 요일/일자</summary>
								</details>
							</caption>
							<colgroup>
								<col style="width:35%">
								<col style="width:75%">
							</colgroup>
							<tbody>
							<tr>
								<th class="txt_left">반복 설정</th>
								<td class="no_r_line">
									<select name="type" id="type" class="w86p txt_center" disabled>
										<option value="" selected>주 단위</option>	
										<option value="">월 단위</option>
									</select>
								</td>
							</tr>
							<tr>
								<th class="txt_left">작업 요일/일자</th>
								<td class="no_r_line">
									<select name="type" id="type" class="w86p txt_center" disabled>
										<option value="" selected>월</option> <!-- 반복 설정이 월 단위일 경우 일자 중 택-->
										<option value="">화</option>	
										<option value="">수</option>
										<option value="">목</option>
										<option value="">금</option>
										<option value="">토</option>
										<option value="">일</option>
									</select>
								</td>
							</tr>
							</tbody>
						</table>
					</div> --%>
					
				</div>
		
				<div class="con60_wrap sub_box con_right">
<!-- 				
					<div class="con_box con_box_04">
						<em class="mabot_00">CIMS 상태</em>
						<div class="toggleWrapper"><input type="checkbox" id="tgbtn1" checked /><label class="toggle toggle2" for="tgbtn1"></label></div>
					</div> -->
					
					<div class="con_box con_box_05">
						<em>DB 전체 사용 현황</em>
						<div>RTVI : <span class="txt_b txt_navy">${dbTableInfo.dbUsageStatus}</span> GB</div>
					</div>
					<div class="con_box con_box_06 pa_28">
						<em>주요 테이블 사용 현황</em> <span>(데이터 용량 순)</span>
						<table>
							<caption>
								<details>
									<summary></summary>
								</details>
							</caption>
							<colgroup>
								<col style="width:6%">
								<col style="width:30%">
								<col style="width:18%">
								<col style="width:18%">
								<col style="width:18%">
							</colgroup>
							<tbody>
							<tr>
								<th>NO</th>
								<th>테이블 명</th>
								<th>자료수</th>
								<th>데이터 용량</th>
								<th class="no_r_line">인덱스 용량</th>
							</tr>
							<c:if test="${empty dbTableInfo.dbTableUsageStatus}">
							<tr>
								<td colspan="5" class="no_r_line">조회된 목록이 없습니다.</td>
							</tr>
							</c:if>
							<c:if test="${not empty dbTableInfo.dbTableUsageStatus}">
							<c:forEach var="usage" items="${dbTableInfo.dbTableUsageStatus}" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td title="${usage.tableComment}" class="site_ellipsis" style="max-width:183px;">${usage.tableComment}</td>
								<td>${usage.tableRows} 만</td>
								<td>${usage.dataSize} GB</td>
								<td class="no_r_line">${usage.indexSize} GB</td>
							</tr>
							</c:forEach>
							</c:if>
							</tbody>
						</table>
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
	Lnb.draw($('div.left_wrap'), 'system', 'system.configuration');
	Footer.draw($('div.footer_wrap'));
	
	// 레이아웃에서 페이지 이동 시 필요 (Gnb, Lnb에서 사용됨)
	function linkURL(url) {
		$("#linkForm").prop('action', url);
		$("#linkForm").submit();
	}
	
	$(document).keydown(function(event) {
		if(event.keyCode == '13') {
			event.preventDefault();
			return;
		}
	});
</script>
</body>
</html>