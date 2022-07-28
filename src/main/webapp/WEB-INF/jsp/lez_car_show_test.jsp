<%--
	Created by IntelliJ IDEA.
	User: naeyoung
	Date: 2018-11-12
	To change this template use File | Settings | File Templates.
--%>
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
								<col style="width:25%">
								<col style="width:8%">
								<col style="width:25%">
								<col style="width:8%">
								<col style="width:26%">
							</colgroup>
							<tbody>
							<tr>
								<th><span class="point_red">*</span>적발유형</th>
								<td>
									<select id="disclosureType" name="disclosureType">
										<option value="">선택</option>
										<option value="S">상시(LEZ)</option>
										<option value="H">비상시(고농도)</option>
									</select>
								</td>
								<th id="seasonText1">
									<c:if test="${searchInfo.disclosureType != 'S'}">
										<span class="point_red">*</span>발령번호
									</c:if>
									<c:if test="${searchInfo.disclosureType == 'S' }">
										<span class="point_red">*</span>차수번호
									</c:if>
								</th>
								<td>
									<select id="seasonNo" name="seasonNo">
										<option value="">선택</option>
									</select>
								</td>
								<th><span class="point_red">*</span>기간</th>
								<td>
									<input type="text" name="startDate" id="startDate" class="calendar" readonly />
									~
									<input type="text" name="endDate" id="endDate" class="calendar" readonly />
									<input type="checkbox" id="isToday" class="_check_box" /><label for="isToday">오늘</label>
								</td>
							</tr>
							<tr>
								<th>지점</th>
								<td>
									<select id="siteId" name="siteId">
										<option value="">전체</option>
									</select>
								</td>
								<th>카메라</th>
								<td>
									<select id="cameraId" name="cameraId">
										<option value="">전체</option>
									</select>
								</td>
								<th>차선</th>
								<td>
									<select id="laneId" name="laneId">
										<option value="">전체</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>차량번호</th>
								<td>
									<input id="carRegNo" type="text" name="carRegNo" />
								</td>
								<th>차대번호</th>
								<td colspan="3">
									<input id="carSerNo" type="text" name="carSerNo" />
								</td>
							</tr>
							<tr>
								<th>정렬 기준</th>
								<td>
									<select id="alignment" name="alignment">
										<option value="">선택</option>
										<option value="shotDt">적발일시</option>
										<option value="site">지점</option>
										<option value="lane">차선</option>
										<option value="carRegNo">차량번호</option>
										<option value="carSerNo">차대번호</option>
									</select>
								</td>
								<th>정렬 순서</th>
								<td>
									<select id="order" name="order">
										<option value="">선택</option>
										<option value="ASC">오름차순</option>
										<option value="DESC">내림차순</option>
									</select>
								</td>
								<th>목록</th>
								<td class="search_btn">
									<select id="recordSize" name="recordSize">
										<option value="20">20개</option>
										<c:forEach var="index" begin="50" end="200" step="50">
											<option value="${index}">${index}개</option>
										</c:forEach>
									</select>
									<input type="hidden" id="pageNo" name="pageNo"/>
									<input type="hidden" id="shotDt" name="shotDt"/>
									<input type="hidden" id="_csrf" name="_csrf" value="${CSRF_TOKEN}"/>
									<button type="button" class="btn btn_blue btn_search" id="search" onclick="DocumentScript.search()">검색</button>
								</td>
							</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
			<div class="contents_wrap_02 sub_box" id="dataTable">
				<h3 id="seasonText2">
					<c:if test="${searchInfo.disclosureType != 'S'}">
					고농도 적발차량 목록
					</c:if>
					<c:if test="${searchInfo.disclosureType == 'S'}">
					LEZ 적발차량 목록
					</c:if>
				</h3>
				<div class="seach_result">
					<c:if test="${disclosureVehiclePage.totalRecordCount > 0}">
					총 검색 자료 수 : <fmt:formatNumber value="${disclosureVehiclePage.totalRecordCount}" groupingUsed="true"/>건
					</c:if>
				</div>
				<table>
					<caption>
						<details>
							<summary></summary>
						</details>
					</caption>
					<colgroup>
						<col style="width:8%">
						<col style="width:8%">
						<col style="width:18%">
						<col style="width:24%">
						<col style="width:12%">
						<col style="width:12%">
						<col style="width:18%">
					</colgroup>
					<tbody>
					<tr>
						<th rowspan="2">NO</th>
						<th rowspan="2" id="seasonText3">
							<c:if test="${searchInfo.disclosureType != 'S'}">
							발령번호
							</c:if>
							<c:if test="${searchInfo.disclosureType == 'S'}">
							차수번호
							</c:if>
						</th>
						<th colspan="3">최초 적발 정보</th>
						<th rowspan="2">차량번호</th>
						<th rowspan="2" class="no_r_line">차대번호</th>
					</tr>
					<tr>
						<th>적발 일시</th>
						<th>지점</th>
						<th>차선</th>
					</tr>
					<c:choose>
						<c:when test="${disclosureVehiclePage == null or disclosureVehiclePage.totalRecordCount == 0}">
							<tr><td colspan="12" class="no_r_line">조회된 목록이 없습니다.</td></tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="disclosure" items="${disclosureVehiclePage.pageList}" varStatus="status">
								<tr>
									<td>
										<c:choose>
										<c:when test="${searchInfo.order eq 'ASC'}">
										<fmt:formatNumber value="${status.count + disclosureVehiclePage.firstRecordNo}" groupingUsed="true"/>
										</c:when>
										<c:otherwise>
										<fmt:formatNumber value="${disclosureVehiclePage.totalRecordCount - ((disclosureVehiclePage.currentPageNo - 1) * disclosureVehiclePage.recordSize) - status.index}" groupingUsed="true"/>
										</c:otherwise>
										</c:choose>
									</td>
									<td>${disclosure.seasonNo}</td>
									<td>${disclosure.shotDateTime}</td>
									<td title="${disclosure.site.siteName}" class="site_ellipsis" style="max-width:210px;">${disclosure.site.siteName}</td>
									<td title="${disclosure.lane.laneName}" class="site_ellipsis" style="max-width:104px;">${disclosure.lane.laneName}</td>
									<td onclick="DocumentScript.detail('${disclosure.carRegNo}', '${disclosure.shotDt}')" class="cur_po txt_black">${disclosure.carRegNo}</td>
									<td class="no_r_line">${disclosure.carSerNo}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
				<%--// TODO custom taglib으로 변경--%>
				<c:if test="${disclosureVehiclePage.totalRecordCount > 0}">
				<div class="paginate_complex">
					<a class="direction prev" <c:if test="${disclosureVehiclePage.firstPageNo > 1}">onclick="DocumentScript.page(${disclosureVehiclePage.firstPageNo - 1})"</c:if>> <span></span> 이전</a>
					<c:forEach var="pageNo" begin="${disclosureVehiclePage.firstPageNo}" end="${disclosureVehiclePage.lastPageNo}" step="1">
						<c:choose>
							<c:when test="${pageNo == disclosureVehiclePage.currentPageNo}">
								<strong style="font-weight: bold;">${pageNo}</strong>
							</c:when>
							<c:otherwise>
								<a onclick="DocumentScript.page(${pageNo})">${pageNo}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<a class="direction next" <c:if test="${disclosureVehiclePage.lastPageNo < disclosureVehiclePage.totalPageCount}">onclick="DocumentScript.page(${disclosureVehiclePage.lastPageNo + 1})"</c:if>>다음 <span></span></a>
					<c:if test="${login.authorityCd eq 'A'}">
					<div class="paging_btn" id="buttonBox">
					  	<button type="button" class="btn btn_navy1 btn_table" onclick="DocumentScript.excelDownload();"><img src="/images/icon_excel.png" alt="엑셀 다운로드"> 다운로드</button>
					</div>
					</c:if>
				</div>
				</c:if>
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
<script src="/js/layout/cims-lnb.js"></script>
<script src="/js/layout/cims-footer.js"></script>

<script type="text/javascript">
	Gnb.draw($('div.navi'), 'disclosure');
	Lnb.draw($('div.left_wrap'), 'disclosure', 'disclosure.search');
	Footer.draw($('div.footer_wrap'));
	
	// 레이아웃에서 페이지 이동 시 필요 (Gnb, Lnb에서 사용됨)
	function linkURL(url) {
		$("#linkForm").prop('action', url);
		$("#linkForm").submit();
	}

	$(document).ready(function () {
		DocumentScript.init('${seasonMap}', '${siteMap}', '${laneListMap}', '${siteCameraListMap}', '${cameraListMap}');
	});
	
	$(document).keydown(function(event) {
		if(event.keyCode == '13') {
			event.preventDefault();
			return;
		}
	});

	var DocumentScript = (function () {
		var _recordSize;
		var _currentPageNo;
		var _element;
		var _dataTable;
		var _seasonMap;
		var _seasonNo;
		var _siteMap;
		var _laneListMap;
		var _siteCameraListMap;
		var _cameraListMap;
		var _allowTimes;
		var _errorMessage;
		var _checkBoxes;

		function _init(seasonMap, siteMap, laneListMap, siteCameraListMap, cameraListMap) {
			_initVar(seasonMap, siteMap, laneListMap, siteCameraListMap, cameraListMap);
			_initElement();
			_initData();
			_initEvent();
		}

		function _initVar(seasonMap, siteMap, laneListMap, siteCameraListMap, cameraListMap) {
			_recordSize = 20;
			_currentPageNo = 1;
			_seasonMap = JSON.parse(seasonMap || '{}');
			_siteMap = JSON.parse(siteMap || '{}');
			_laneListMap = JSON.parse(laneListMap || '{}');
			_siteCameraListMap = JSON.parse(siteCameraListMap || '{}');
			_cameraListMap = JSON.parse(cameraListMap || '{}');
			_allowTimes = _makeAllowTimes();
			_errorMessage = '오류가 발생했습니다. 잠시 후 다시 시도해주세요.';
		}

		function _makeAllowTimes() {
			var allowTimes = [];
			for(var h = 0; h < 24; h++) {
				for(var m = 0; m <= 50; m+=10) {
					allowTimes.push(Util.pad(h, 2) + ":" + Util.pad(m, 2));
				}
			}
			return allowTimes;
		}

		function _initElement() {
			_element = {};

			_element['disclosureType'] = $('#disclosureType');
			_element['seasonNo'] = $('#seasonNo');

			_element['startDate'] = $('#startDate');
			_element['endDate'] = $('#endDate');

			_element['siteId'] = $('#siteId');
			_element['cameraId'] = $('#cameraId');
			_element['laneId'] = $('#laneId');

			_element['carRegNo'] = $('#carRegNo');
			_element['carSerNo'] = $('#carSerNo');

			_element['alignment'] = $('#alignment');
			_element['order'] = $('#order');
			_element['recordSize'] = $('#recordSize');

			_dataTable = $('#dataTable');
			_checkBoxes = $('._check_box');
		}

		function _initData() {
			if('${searchInfo.startDate}' == '') {
				var today = new Date();
				_element['endDate'].val(Util.dateFormat(today));
				today.setTime(today.getTime() - (6*24*60*60*1000));
				_element['startDate'].val(Util.dateFormat(today));
				_element['siteId'].html(_makeOptions(_siteMap, 'site'));
			} else {
				_element['disclosureType'].val('${searchInfo.disclosureType}').prop('selected', true);
				_element['seasonNo'].html(_makeOptions(_seasonMap, 'seasonNo'));
				_element['seasonNo'].val('${searchInfo.seasonNo}').prop('selected', true);
				_element['startDate'].val('${searchInfo.startDate}');
				_element['endDate'].val('${searchInfo.endDate}');
				_element['siteId'].html(_makeOptions(_siteMap, 'site'));
				_element['siteId'].val('${searchInfo.siteId}').prop('selected', true);
				_element['cameraId'].html(_makeOptions(_siteCameraListMap['${searchInfo.siteId}'], 'camera'));
				_element['cameraId'].val('${searchInfo.cameraId}').prop('selected', true);
				_element['laneId'].html(_makeOptions(_cameraListMap['${searchInfo.cameraId}'], 'lane'));
				_element['laneId'].val('${searchInfo.laneId}').prop('selected', true);
				_element['carRegNo'].val('${searchInfo.carRegNo}');
				_element['carSerNo'].val('${searchInfo.carSerNo}');
				_element['alignment'].val('${searchInfo.alignment}').prop('selected', true);
				_element['order'].val('${searchInfo.order}').prop('selected', true);
				_element['recordSize'].val('${searchInfo.recordSize}').prop('selected', true);
			}
		}

		function _initEvent() {
			_element['startDate'].datetimepicker({
				format: 'Y.m.d',
				onShow: function () {
					this.setOptions({
						maxDate: new Date()
					})
				},
				allowTimes: _allowTimes,
				lang: 'kr'
			});
			_element['endDate'].datetimepicker({
				format: 'Y.m.d',
				onShow: function () {
					this.setOptions({
						minDate: _element['startDate'].val() ? _element['startDate'].val() : false
					})
				},
				allowTimes: _allowTimes,
				lang: 'kr'
			});
			_element['disclosureType'].change(_onDisclosureTypeChange);
			_element['seasonNo'].change(_onSeasonNoChange);
			_element['siteId'].change(_onSiteChange);
			_element['cameraId'].change(_onCameraChange);
			_checkBoxes.change(_onCheckBoxChange);
		}

		function _onCheckBoxChange(event) {
			var target = event.currentTarget;
			if (target.id === 'isToday') {
				_toggleDate(target.checked);
			}
		}
		
		function _onDisclosureTypeChange(event) {
			var target = event.currentTarget;
			
			if(target.value == 'S') {
				$("#seasonText1").html('<span class="point_red">*</span>차수번호');
				$("#seasonText2").html('LEZ 적발차량 목록');
				$("#seasonText3").html('차수번호');
			} else {
				$("#seasonText1").html('<span class="point_red">*</span>발령번호');
				$("#seasonText2").html('고농도 적발차량 목록');
				$("#seasonText3").html('발령번호');
			}
			
			if(target.value == '') {
				$("#seasonNo").html('<option value="">선택</option>');
			} else {
				$.ajax({
					async: true,
		            type : 'POST',
		            data : { "disclosureType" : target.value , "_csrf" : '${CSRF_TOKEN}' },
		            url : "/disclosure/getSeasonMap",
		            dataType : "json",
		            //contentType: "application/json; charset=UTF-8",
		            success : function(result) {
		            	_seasonMap = result;
						_element['seasonNo'].html(_makeOptions(result, 'seasonNo'));
						
						_seasonNoSet();
					}, error : function(error) {
		
					}
				});
			}
		}
		
		function _onSeasonNoChange(event) {
			var target = event.currentTarget;
			_seasonDateSet();
		}
		
		function _onStartDateChange(event) {
			var target = event.currentTarget;
			
			var str = target.value;
			var startDate = new Date(str.replace('.', '').replace('.', ''));
			
			var endStr = _element['endDate'].val();
			var endDate = new Date(endStr.replace('.', '').replace('.', ''));

			if(endDate.getTime() - startDate.getTime() > 6*24*60*60*1000 || startDate.getTime() > endDate.getTime()) {
				var seasonNo = _element['seasonNo'].val();
				var seasonEdDateStr = _seasonMap[seasonNo]['seasonEdDate'];
				var seasonEdDate = new Date(seasonEdDateStr.substr(0, 4), seasonEdDateStr.substr(4, 2) - 1, seasonEdDateStr.substr(6, 2));
				
				var tmpDate = startDate;
				tmpDate.setTime(tmpDate.getTime() + (6*24*60*60*1000));
				
				if(seasonEdDate.getTime() < tmpDate.getTime()) {
					tmpDate = seasonEdDate;
				}
				
				_element['endDate'].val(Util.dateFormat(tmpDate));
			}
		}

		function _onSiteChange(event) {
			var target = event.currentTarget;
			_element['cameraId'].html(_makeOptions(_siteCameraListMap[target.value], 'camera'));
			_element['laneId'].html(_makeOptions(_laneListMap[target.value], 'lane'));
		}

		function _onCameraChange(event) {
			var target = event.currentTarget;
			if(_element['cameraId'].val() != '') {
				_element['laneId'].html(_makeOptions(_cameraListMap[target.value], 'lane'));
			} else {
				_element['laneId'].html(_makeOptions(_laneListMap[_element['siteId'].val()], 'lane'));
			}
		}
		
		function _resetElement() {
			_element['disclosureType'].val('${searchInfo.disclosureType}').prop('selected', true);
			_element['seasonNo'].val('${searchInfo.seasonNo}').prop('selected', true);
			_element['startDate'].prop('disabled', false);
			_element['startDate'].val('${searchInfo.startDate}');
			_element['endDate'].prop('disabled', false);
			_element['endDate'].val('${searchInfo.endDate}');
			_element['siteId'].val('${searchInfo.siteId}').prop('selected', true);
			_element['cameraId'].val('${searchInfo.cameraId}').prop('selected', true);
			_element['laneId'].val('${searchInfo.laneId}').prop('selected', true);
			_element['carRegNo'].val('${searchInfo.carRegNo}');
			_element['carSerNo'].val('${searchInfo.carSerNo}');
			_element['alignment'].val('${searchInfo.alignment}').prop('selected', true);
			_element['order'].val('${searchInfo.order}').prop('selected', true);
			_element['recordSize'].val('${searchInfo.recordSize}').prop('selected', true);
		}

		function _makeOptions(dataMap, type) {
			var optionTemplateSeason = '<option value="{=value}">{=value}</option>';
			var optionTemplateCamera = '<option value="{=' + type + 'Id}">{=' + type + 'Id}</option>';
			var optionTemplate = '<option value="{=' + type + 'Id}">{=' + type + 'Name}</option>';
			var optionTag = '<option value="">전체</option>';
			if(type === 'seasonNo') {
				if(Object.keys(dataMap).length > 0) {
					optionTag = '';
				}
				
				for (var key in dataMap) {
					optionTag += Util.processTpl(optionTemplateSeason, { value : key });
				}
			} else if(type === 'camera' && dataMap != null) {
				for (var i=0;i<Object.keys(dataMap).length;i++) {
					for(var j=i+1;j<Object.keys(dataMap).length;j++) {
						if(dataMap[i].cameraId == dataMap[j].cameraId) {
							var index = dataMap.indexOf(dataMap[i]);
							dataMap.splice(index, 1);
						}
					}
				}
				for (var key in dataMap) {
					optionTag += Util.processTpl(optionTemplateCamera, dataMap[key]);
				}
			} else {
				for (var key in dataMap) {
					optionTag += Util.processTpl(optionTemplate, dataMap[key]);
				}
			}
			return optionTag;
		}

		function _toggleDate(isChecked) {
			if (isChecked) {
				var today = new Date();
				_element['endDate'].val(Util.dateFormat(today));
				_element['startDate'].val(Util.dateFormat(today));
			}
			_element['startDate'].prop('disabled', isChecked);
			_element['endDate'].prop('disabled', isChecked);
		}

		function _page(pageNo) {
			_currentPageNo = pageNo || 1;
			
			$("#pageNo").val(_currentPageNo);
			$("#searchForm").prop('action', '');
			$("#searchForm").submit();
		}

		function _search() {
			if(_element['disclosureType'].val() == "") {
				alert('적발유형을 선택해주세요.');
				return false;
			}
			
			if(_element['seasonNo'].val() == "") {
				if(_element['disclosureType'].val() == "S") {
					alert('차수번호를 선택해주세요.');
				} else {
					alert('발령번호를 선택해주세요.');
				}
				return false;
			}
			
			if(_element['startDate'].val() == "" || _element['endDate'].val() == "") {
				alert('기간을 입력해주세요.');
				return false;
			}
			
			var startYear = _element['startDate'].val().substr(0, 4);
			var startMonth = _element['startDate'].val().substr(5, 2);
			var startDay = _element['startDate'].val().substr(8, 2);
			var startDate = new Date(startYear, startMonth-1, startDay);
			var startDateStr = '' + startYear + startMonth + startDay;
			
			var endYear = _element['endDate'].val().substr(0, 4);
			var endMonth = _element['endDate'].val().substr(5, 2);
			var endDay = _element['endDate'].val().substr(8, 2);
			var endDate = new Date(endYear, endMonth-1, endDay);
			var endDateStr = '' + endYear + endMonth + endDay;
			
			if(startDate.getTime() <= endDate.getTime() - (7*24*60*60*1000)) {
				alert('일주일의 기간만 조회가 가능합니다. \n기간을 다시 입력해주세요.');
				return false;
			}
			
			if(startDate.getTime() > endDate.getTime()) {
				alert('시작일자보다 종료일자가 더 이전일 수 없습니다. \n기간을 다시 입력해주세요.');
				return false;
			}
			
			var seasonNo = _element['seasonNo'].val();
			
			var seasonStDate = _seasonMap[seasonNo]['seasonStDate'];
			var seasonEdDate = _seasonMap[seasonNo]['seasonEdDate'];
			
			if(seasonStDate > startDateStr || seasonEdDate < endDateStr) {
				if(_element['disclosureType'].val() == "S") {
					alert('현재 지정된 차수번호의 기간 내에서만 검색할 수 있습니다.\n기간을 다시 입력해주세요.');
				} else {
					alert('현재 지정된 발령번호의 발령기간 내에서만 검색할 수 있습니다.\n기간을 다시 입력해주세요.');
				}
				
				$("#isToday").prop("checked", false);
				_element['startDate'].prop("disabled", false);
				_element['endDate'].prop("disabled", false);
				
				_seasonDateSet();
				return false;
			}
			
			_element['startDate'].prop("disabled", false);
			_element['endDate'].prop("disabled", false);
			
			$("#pageNo").val('1');
			$("#searchForm").prop('action', '');
			$("#searchForm").submit();
		}

		function _detail(carRegNo, shotDt) {
			$("#pageNo").val(_currentPageNo);
			$("#shotDt").val(shotDt);
			$("#searchForm").prop("action", "/disclosure/search/detail/" + encodeURI(carRegNo));
			$("#searchForm").submit();
		}
		
		function _excelDownload() {
			if(confirm('현재 조회된 목록 ${disclosureVehiclePage.totalRecordCount}건 전체에 대해\n엑셀 파일로 다운로드 받으시겠습니까?')) {
				if('${disclosureVehiclePage.totalRecordCount}' > 1000000) {
					alert('100만 건이 넘는 데이터에 대해서는 엑셀 파일로 출력할 수 없습니다.\n현재 조회된 데이터 수 : ${disclosureVehiclePage.totalRecordCount}');
				} else {
					_resetElement();
					$("#pageNo").val('1');
					
					var popupOption = "width=400, height=420, top=400, left=450, resizable=no, scrollbars=no, status=no, toolbar=no, menubar=no";
					window.open('', 'excelPopupDisclosure', popupOption);
					
					$("#searchForm").prop('target', 'excelPopupDisclosure');
					$("#searchForm").prop('action', '/disclosure/search/excelPopup');
					$("#searchForm").submit();
					
					$("#searchForm").prop('target', '_self');
				}
			} else {
				return;
			}
		}
		
		function _seasonNoSet() {
			var seasonNo = Object.keys(_seasonMap);
			
			var today = new Date();
			var todayStr = '' + today.getFullYear() + (today.getMonth() + 1) + today.getDate();
			
			var startDate = _element['startDate'].val().replace('.', '').replace('.', '');
			var endDate = _element['endDate'].val().replace('.', '').replace('.', '');
			
			var disclosureType = _element['disclosureType'].val();
			
			for(var i=0;i<seasonNo.length;i++) {
				var seasonData = _seasonMap[seasonNo[i]];

				if(disclosureType == seasonData['disclosureType']) {
					var seasonStDateStr = seasonData['seasonStDate'];
					var seasonStDate = new Date(seasonStDateStr.substr(0, 4), seasonStDateStr.substr(4, 2) - 1, seasonStDateStr.substr(6, 2));
					
					var seasonEdDateStr = seasonData['seasonEdDate'];
					var seasonEdDate = new Date(seasonEdDateStr.substr(0, 4), seasonEdDateStr.substr(4, 2) - 1, seasonEdDateStr.substr(6, 2));
					
					if(seasonStDateStr <= todayStr && todayStr <= seasonEdDateStr) {
						_element['seasonNo'].val(seasonData['seasonNo']).prop("selected", true);
					} else if(todayStr > seasonEdDateStr) {
						_element['seasonNo'].val(seasonData['seasonNo']).prop("selected", true);
					}
				}
			}
			
			_seasonDateSet();
		}
		
		function _seasonDateSet() {
			var seasonNo = _element['seasonNo'].val();
			
			var seasonStDateStr = _seasonMap[seasonNo]['seasonStDate'];
			var seasonStDate = new Date(seasonStDateStr.substr(0, 4), seasonStDateStr.substr(4, 2) - 1, seasonStDateStr.substr(6, 2));
			var seasonEdDateStr = _seasonMap[seasonNo]['seasonEdDate'];
			var seasonEdDate = new Date(seasonEdDateStr.substr(0, 4), seasonEdDateStr.substr(4, 2) - 1, seasonEdDateStr.substr(6, 2));
			
			var today = new Date();
			var todayYY = today.getFullYear();
			var todayMM = today.getMonth() + 1;
			var todayDD = today.getDate();
			var todayStr = '' + todayYY + (todayMM < 10 ? '0'+todayMM : todayMM) + (todayDD < 10 ? '0' + todayDD : todayDD);
			
			var tmpDate = new Date();
			
			if(seasonStDateStr <= todayStr && todayStr <= seasonEdDateStr) {
				_element['endDate'].val(Util.dateFormat(today));
				tmpDate = today;
			} else if(seasonEdDateStr < todayStr) {
				_element['endDate'].val(Util.dateFormat(seasonEdDate));
				tmpDate = seasonEdDate;
			}
			
			tmpDate.setTime(tmpDate.getTime() - (6*24*60*60*1000));
			
			if(tmpDate.getTime() < seasonStDate.getTime()) {
				tmpDate = seasonStDate;
			}
			
			_element['startDate'].val(Util.dateFormat(tmpDate));
		}

		return {
			init: _init,
			page: _page,
			search: _search,
			detail: _detail,
			excelDownload: _excelDownload
		}
	})();
</script>

</body>
</html>