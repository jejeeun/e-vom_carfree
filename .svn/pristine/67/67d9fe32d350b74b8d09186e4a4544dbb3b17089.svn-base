<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"		uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt"		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>자동차 운행제한 시스템</title>
	<link rel="stylesheet" type="text/css" href="/css/jquery-ui.css"/>
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

	<div class="loading_wrap">
		<p>
			엑셀 파일을 다운로드 중입니다.<br />
			다운로드가 완료되기 전까지<br />
			창을 닫지 말아주세요.
		</p>
		<div class="loading"></div>
		<img src="/images/icon_excel.png" alt="엑셀 다운로드중" class="excelLoading" />
	</div>


	<form id="searchForm" method="post">
		<input type="hidden" id="_csrf" name="_csrf"/>
		<input type="hidden" id="pageNo" name="pageNo"/>
		<input type="hidden" id="startDate" name="startDate"/>
		<input type="hidden" id="endDate" name="endDate"/>
		<input type="hidden" id="disclosureType" name="disclosureType"/>
		<input type="hidden" id="seasonNo" name="seasonNo"/>
		<input type="hidden" id="siteId" name="siteId"/>
		<input type="hidden" id="cameraId" name="cameraId"/>
		<input type="hidden" id="laneId" name="laneId"/>
		<input type="hidden" id="carRegNo" name="carRegNo"/>
		<input type="hidden" id="carSerNo" name="carSerNo"/>
		<input type="hidden" id="alignment" name="alignment"/>
		<input type="hidden" id="order" name="order"/>
		<input type="hidden" id="duplicateYn" name="duplicateYn"/>
	</form>

<script type="text/javascript" src="/js/jquery-3.5.1.js"></script>
<script>
	$(document).ready(function() {
		var parent = opener.document;
		
		$("#_csrf").val($(parent).find("#_csrf").val());
		$("#pageNo").val('1');
		$("#startDate").val($(parent).find("#startDate").val());
		$("#endDate").val($(parent).find("#endDate").val());
		$("#disclosureType").val($(parent).find("#disclosureType").val());
		$("#seasonNo").val($(parent).find("#seasonNo").val());
		$("#siteId").val($(parent).find("#siteId").val());
		$("#cameraId").val($(parent).find("#cameraId").val());
		$("#laneId").val($(parent).find("#laneId").val());
		$("#carRegNo").val($(parent).find("#carRegNo").val());
		$("#carSerNo").val($(parent).find("#carSerNo").val());
		$("#alignment").val($(parent).find("#alignment").val());
		$("#order").val($(parent).find("#order").val());
		$("#duplicateYn").val($(parent).find("#duplicateYn").val());
		
		$("#searchForm").prop('action', '${url}');
		$("#searchForm").submit();
	});
</script>

</body>
</html>