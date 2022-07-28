<%--
	Created by IntelliJ IDEA.
	User: naeyoung
	Date: 2018-11-11
	To change this template use File | Settings | File Templates.
--%>
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
	<link rel="stylesheet" type="text/css" href="/css/c3.min.css" />
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
			<!--con_left-->
			<div class="con_left">
				<div class="main_box box_01" id="realTimeDataTable"></div>
			</div>
			<!--con_left//-->

			<!--con_right-->
			<div class="con_right">
				<div class="main_box box_05">
					<em>발령 현황</em>
					( <span class="circle_s redGra "></span>&nbsp;발령중 <span class="circle_s grayGra"></span>&nbsp;발령예정 )
					<a href="javascript:moreSeasonNo()"><img src="/images/btn_more.png" alt="more" class="i_more noticeMoreBtn"/></a>
					<div>
						<div class="marquee">
	                		<ul>
	                			<c:if test="${empty seasonNoInfo}">
	                			<li>
	                				예정중인 단속 정보가 없습니다. 
	                			</li>
	                			</c:if>
	                			<c:if test="${not empty seasonNoInfo}">
		                			<c:forEach var="seasonNo" items="${seasonNoInfo}" varStatus="status">
		                			<li>
		                				<c:if test="${seasonNo.disclosureStatus == 'Y'}">
		                				<span class="noticeTextBox redGra">${seasonNo.disclosureTypeName}</span>
		                				</c:if>
		                				<c:if test="${seasonNo.disclosureStatus == 'N'}">
		                				<span class="noticeTextBox grayGra">${seasonNo.disclosureTypeName}</span>
		                				</c:if>
		                				발령기간 : ${seasonNo.seasonStartDateTimeYmdHi} ~ ${seasonNo.seasonEndDateTimeYmdHi}
		                			</li>
		                			</c:forEach>
	                			</c:if>
	                		</ul>
	                	</div>
	                </div>
				</div>
				
				<div class="main_box box_05">
					<em style="display:block;">통행량 현황</em>

					<div class="countBoxWrap">
						<div class="titleBox blueGra">당월 누적</div>
						<div class="countBox shadow">
							<p>
								<fmt:formatNumber value="${thisMonthTrafficCount}" groupingUsed="true" />
							</p>
						</div>
					</div>
					
					<div class="countBoxWrap">
						<div class="titleBox blueGra">
							<span>당월 일 평균</span>
						</div>
						<div class="countBox shadow">
							<p>
								<fmt:parseNumber var="var1" value="${thisMonthTrafficCount / thisMonthDayCount}" integerOnly="true" />
								<fmt:formatNumber value="${var1}" groupingUsed="true" />
							</p>
						</div>
					</div>
					
					<div class="countBoxWrap">
						<div class="titleBox purpleGra">
							<span>전월 누적</span>
						</div>
						<div class="countBox shadow">
							<p>
								<fmt:formatNumber value="${lastMonthTrafficCount}" groupingUsed="true" />
							</p>
						</div>
					</div>
					<div class="countBoxWrap">
						<div class="titleBox purpleGra">
							<span style="">전월 일 평균</span>
						</div>
						<div class="countBox shadow">
							<p>
								<fmt:parseNumber var="var2" value="${lastMonthTrafficCount / lastMonthDayCount}" integerOnly="true" />
								<fmt:formatNumber value="${var2}" groupingUsed="true" />
							</p>
						</div>
					</div>
				</div>
				<div class="main_box box_05">
				<em>적발량 현황</em>
					<table>
						<caption>
							<details>
								<summary>LEZ 적발량, 고농도 적발량, 계절제 적발량</summary>
							</details>
						</caption>
						<colgroup>
							<col style="width:16%">
							<col style="width:14%">
							<col style="width:14%">
							<col style="width:14%">
							<col style="width:14%">
							<col style="width:14%">
							<col style="width:14%">
						</colgroup>
						<tbody>
						<tr class="title_gray">
							<th rowspan="2">&nbsp;</th>
							<th colspan="2">LEZ 적발량</th>
							<th colspan="2">고농도 적발량</th>
							<th colspan="2" class="no_r_line">계절제 적발량</th>
						</tr>
						<tr class="title_gray">
							<th>당월</th>
							<th>전월</th>
							<th>당월</th>
							<th>전월</th>
							<th>당월</th>
							<th class="no_r_line">전월</th>
						</tr>
						<tr>
							<td>월 누적량</td>
							<td><fmt:formatNumber value="${thisMonthLezDisclosureCount}" groupingUsed="true" /></td>
							<td><fmt:formatNumber value="${lastMonthLezDisclosureCount}" groupingUsed="true" /></td>
							<td><fmt:formatNumber value="${thisMonthHighDensityDisclosureCount}" groupingUsed="true" /></td>
							<td><fmt:formatNumber value="${lastMonthHighDensityDisclosureCount}" groupingUsed="true" /></td>
							<td><fmt:formatNumber value="${thisMonthSeasonDisclosureCount}" groupingUsed="true" /></td>
							<td class="no_r_line"><fmt:formatNumber value="${lastMonthSeasonDisclosureCount}" groupingUsed="true" /></td>
						</tr>
						<tr>
							<td>일평균</td>
							<td>
								<fmt:parseNumber var="var3" value="${thisMonthLezDisclosureCount / thisMonthDayCount}" integerOnly="true" />
								<fmt:formatNumber value="${var3}" groupingUsed="true" />
							</td>
							<td>
								<fmt:parseNumber var="var4" value="${lastMonthLezDisclosureCount / lastMonthDayCount}" integerOnly="true" />
								<fmt:formatNumber value="${var4}" groupingUsed="true" />
							</td>
							<td>
								<fmt:parseNumber var="var5" value="${thisMonthHighDensityDisclosureCount / thisMonthDayCount}" integerOnly="true" />
								<fmt:formatNumber value="${var5}" groupingUsed="true" />
							</td>
							<td>
								<fmt:parseNumber var="var6" value="${lastMonthHighDensityDisclosureCount / lastMonthDayCount}" integerOnly="true" />
								<fmt:formatNumber value="${var6}" groupingUsed="true" />
							</td>
							<td>
								<fmt:parseNumber var="var7" value="${thisMonthSeasonDisclosureCount / thisMonthDayCount}" integerOnly="true" />
								<fmt:formatNumber value="${var7}" groupingUsed="true" />
							</td>
							<td class="no_r_line">
								<fmt:parseNumber var="var8" value="${lastMonthSeasonDisclosureCount / lastMonthDayCount}" integerOnly="true" />
								<fmt:formatNumber value="${var8}" groupingUsed="true" />
							</td>
						</tr>
						</tbody>
					</table>
				</div>
				
				<div class="main_box box_05">
					<em>카메라 운영 현황</em>
					<a href="javascript:moreCameraStatus()"><img src="/images/btn_more.png" alt="more" class="i_more noticeMoreBtn" /></a>
					<table>
				    	<caption>
				            <details>
				                <summary>총 카메라수, On, Off, 수리</summary>
				            </details>
				        </caption>
				        <colgroup>
				            <col style="width:25%">
				            <col style="width:25%">
				            <col style="width:25%">
				            <col style="width:25%">
				        </colgroup>
				        <tbody>
						<tr>
							<th>총 카메라 수</th>
							<th>On</th>
							<th>Off</th>
							<th class="no_r_line">수리</th>
						</tr>
						<tr>
							<td>
								<fmt:formatNumber value="${cameraInfo.totalCameraCount}" groupingUsed="true"/>
							</td>
							<td>
								<fmt:formatNumber value="${cameraInfo.onCameraCount}" groupingUsed="true"/>
							</td>
							<td>
								<fmt:formatNumber value="${cameraInfo.totalCameraCount-cameraInfo.onCameraCount}" groupingUsed="true"/>
							</td>
							<td class="no_r_line">
								<fmt:formatNumber value="${cameraInfo.repairCameraCount}" groupingUsed="true"/>
						    </td>
						</tr>
				        </tbody>
				    </table>
				</div>
				
			</div>
			<!--con_right//-->
		</div>
		<!--center//-->
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
<script type="text/javascript" src="/js/chart/c3.min.js"></script>
<script type="text/javascript" src="/js/chart/d3.v3.min.js"></script>
<script src="/js/layout/cims-gnb.js"></script>
<script src="/js/layout/cims-footer.js"></script>

<script type="text/javascript">
	Gnb.draw($('div.navi'));
	Footer.draw($('div.footer_wrap'));
	
	// 레이아웃에서 페이지 이동 시 필요 (Gnb, Lnb에서 사용됨)
	function linkURL(url) {
		$("#linkForm").prop('action', url);
		$("#linkForm").submit();
	}

    $(document).ready(function () {
        RealTimeDocumentScript.init();
        
        if('${seasonNoInfoCount}' > 1) {
        	var agent = navigator.userAgent.toLowerCase();
        	if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ) {
        		var sec = '${seasonNoInfoCount}' * 10;
            	var cssText = 'marqee2 ' + sec + 's linear infinite';
        	} else {
        		var sec = '${seasonNoInfoCount}' * 8;
            	var cssText = 'marqee ' + sec + 's linear infinite';
        	}
        	
	        $(".marquee > ul").css('animation', cssText);
	        
        } else {
        	if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ) {
	        	$(".marquee > ul").css('animation', 'marqee2 20s linear infinite');
        	} else {
        		$(".marquee > ul").css('animation', 'marqee 16s linear infinite');
        	}
        }
        
    });

    var RealTimeDocumentScript = (function () {
        var _element;
        var _recordSize;
        var _currentPageNo;
        var _realTimeDataTable;

        function _init() {
            _initVar();
            _initElement();
            _initData();
            _initEvent();
        }

        function _initVar() {
            _recordSize = 4;
            _currentPageNo = 1;
        }

        function _initElement() {
            _element = {};

            _realTimeDataTable = $('#realTimeDataTable');
        }

        function _makeParam(elements) {
            var parameter = {};
            for (var key in elements) {
                var value = elements[key].val();
                parameter[key] = value ? value.trim() : '';
            }
            return parameter;
        }

        function _page(pageNo) {
            _currentPageNo = pageNo || 1;
            var parameter = _makeParam(_element);
            parameter['pageNo'] = _currentPageNo;
            _realTimeDataTable.load("/main/realtimelist", { "pageNo" : pageNo , "_csrf" : '${CSRF_TOKEN}' });
        }

        function _initData() {
        }

        function _initEvent() {
            _page(1);
        }

        return {
            init: _init,
			page :_page
        }
    })();
    
    function moreSeasonNo() {
    	$("#linkForm").prop('action', '/regulateManage/seasonNoManage');
    	$("#linkForm").submit();
    }
    
    function moreCameraStatus() {
    	$("#linkForm").prop('action', '/cameraManage/status');
    	$("#linkForm").submit();
    }
</script>

</body>
</html>