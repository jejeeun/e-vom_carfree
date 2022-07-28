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
	<form id="codeForm" method="post">
		<input type="hidden" id="_csrf" name="_csrf" value="${CSRF_TOKEN}"/>
		<input type="hidden" id="userId" value="${login.userId}">
		<input type="hidden" name="changeText" id="changeText">
		<div class="con_wrap">
			<div class="con_center">
				<div class="left_wrap">
				</div>
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
								<th>그룹코드명</th>
								<td>
									<input type="text" name="groupKeyword" id="groupKeyword" value="${code.groupKeyword}" />									
								</td>
								<th>세부코드명</th>
								<td>
									<input type="text" name="commonKeyword" id="commonKeyword" value="${code.commonKeyword}" />			
								</td>
								<td>
									<button type="button" class="btn btn_blue btn_search f_right" id="searchButton" onclick="return false;">검색</button>
								</td>
							</tr>
							</tbody>
						</table>						
					</div>					
				</div>
				
				<div class="contents_wrap_02 sub_box">
					<input type="hidden" id="saveRow" value="${groupCodeListCnt}"/>
					<input type="hidden" id="originRow" value="1"/>
					<input type="hidden" name ="selectRow" id="selectRow" value="0"/>  
					<input type="hidden" id="groupCd" name="groupCd"/>
					<h3>그룹 코드</h3>
					<div class="seach_result" id="codeCnt">
						총 검색 자료 수 : <fmt:formatNumber value="${groupCodeListCnt}" groupingUsed="true"/>건
					</div>
					<table style="width:98%;">
						<caption>
							<details>
								<summary>NO, 코드, 그룹코드명, Value</summary>
							</details>
						</caption>
						<colgroup>
							<col style="width:6%">
							<col style="width:6%">
							<col style="width:10%">
							<col style="width:15%">
							<col style="width:7%">
							<col style="width:7%">
							<col style="width:7%">
							<col style="width:7%">
							<col style="width:7%">
							<col style="width:7%">
							<col style="width:7%">
							<col style="width:7%">
							<col style="width:7%">
						</colgroup>
						<thead>
						<tr>
							<th rowspan="2"><input type="checkbox" id="allCheck"/></th>
							<th rowspan="2">NO</th>
							<th rowspan="2">코드</th>
							<th rowspan="2">그룹코드명</th>
							<th class="no_r_line" colspan="10">Value</th>
						</tr>
						<tr>
							<th>1</th>
							<th>2</th>
							<th>3</th>
							<th>4</th>
							<th>5</th>
							<th>6</th>
							<th>7</th>
							<th>8</th>
							<th class="no_r_line">9</th>
						</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					<div class="scroll">
						<table>
							<caption>
								<details>
									<summary></summary>
								</details>
							</caption>
							<colgroup>
								<col style="width:6%">
								<col style="width:6%">
								<col style="width:10%">
								<col style="width:15%">
								<col style="width:7%">
								<col style="width:7%">
								<col style="width:7%">
								<col style="width:7%">
								<col style="width:7%">
								<col style="width:7%">
								<col style="width:7%">
								<col style="width:7%">
								<col style="width:7%">
							</colgroup>
							<tbody id="searchTable1">
							<c:choose>
							<c:when test="${not empty groupCodeList}">
							<c:forEach var="result" items="${groupCodeList}" varStatus="status">
	           				<tr>
		           				<td onclick="event.cancelBubble=true;"><input type="checkbox" id="car" value="${result.groupCd}" class="ck1"/></td>
		           				<td class="cnt"><fmt:formatNumber value="${status.count}" groupingUsed="true"/></td>
		           				<td><input type='text' value="${result.groupCd}" class='groupCd'/></td>
		           				<td><input type='text' value="${result.cdName}" class='cdName'/></td>
		           				<td><input type='text' value="${result.data1}" class='data data1'/></td>
		           				<td><input type='text' value="${result.data2}" class='data data2'/></td>
		           				<td><input type='text' value="${result.data3}" class='data data3'/></td>
		           				<td><input type='text' value="${result.data4}" class='data data4'/></td>
		           				<td><input type='text' value="${result.data5}" class='data data5'/></td>
		           				<td><input type='text' value="${result.data6}" class='data data6'/></td>
		           				<td><input type='text' value="${result.data7}" class='data data7'/></td>
		           				<td><input type='text' value="${result.data8}" class='data data8'/></td>
		           				<td class="no_r_line">
		           					<input type='text' value="${result.data9}" class='data data9'/>
		           					<input type="checkbox" id="TEST" value="${result.groupCd}" class='ck12' style="display:none;"/>
		           					<input type="hidden" class="useGb" value="${result.useGb}"/>
		           				</td>
	           				</tr>
	   						</c:forEach> 
	   						</c:when>
	   						<c:otherwise>
	         				<tr>
	         					<td class="no_r_line" colspan="13">빈 테이블 입니다.</td>
	         				</tr>
	         				</c:otherwise>
	   						</c:choose>
							</tbody>
						</table>
					</div>
					<div class="table_btn_rt">
					  	<button type="button" class="btn btn_navy1 btn_table" onclick="javascript:deleteCode('group')">삭제</button>
						<button type="button" class="btn btn_navy1 btn_table" onclick="javascript:newGroupCode()">신규</button>
						<button type="button" class="btn btn_navy1 btn_table" onclick="javascript:saveGroupCode()">저장</button>
					</div>
				</div>		
				
				<div class="contents_wrap_02 sub_box">
					<h3>세부 코드</h3>
					<div class="seach_result" id="codeDetailCnt">
						총 검색 자료 수 : 0건
					</div>
					<input type="hidden" id="saveRow2" value="">
					<input type="hidden" id="selectRow2" value="0">
					<table style="width:98%;">
						<caption>
							<details>
								<summary>NO, 코드, 세부코드명, Value</summary>
							</details>
						</caption>
						<colgroup>
							<col style="width:6%">
							<col style="width:6%">
							<col style="width:10%">
							<col style="width:15%">
							<col style="width:7%">
							<col style="width:7%">
							<col style="width:7%">
							<col style="width:7%">
							<col style="width:7%">
							<col style="width:7%">
							<col style="width:7%">
							<col style="width:7%">
							<col style="width:7%">													
						</colgroup>
						<tbody>
						<tr>
							<th rowspan="2"><input type="checkbox" id="allCheck2"></th>
							<th rowspan="2">NO</th>
							<th rowspan="2">코드</th>
							<th rowspan="2">세부코드명</th>
							<th class="no_r_line" colspan="10">Value</th>
						</tr>
						<tr>
							<th>1</th>
							<th>2</th>
							<th>3</th>
							<th>4</th>
							<th>5</th>
							<th>6</th>
							<th>7</th>
							<th>8</th>
							<th class="no_r_line">9</th>
						</tr>
						</tbody>
					</table>
					<div class="scroll">
						<input type="hidden" id="selectGroupCd" name="selectGroupCd"/>
						<table style="width:100%;">
							<caption>
								<details>
									<summary></summary>
								</details>
							</caption>
							<colgroup>
								<col style="width:6%">
								<col style="width:6%">
								<col style="width:10%">
								<col style="width:15%">
								<col style="width:7%">
								<col style="width:7%">
								<col style="width:7%">
								<col style="width:7%">
								<col style="width:7%">
								<col style="width:7%">
								<col style="width:7%">
								<col style="width:7%">
								<col style="width:7%">													
							</colgroup>
							<tbody id="searchTable2">
		         				<tr>
		         					<td class="no_r_line" colspan="13">빈 테이블 입니다.</td>
		         				</tr>
							</tbody>
						</table>
					</div>
					<div class="table_btn_rt">
					  	<button type="button" class="btn btn_navy1 btn_table" onclick="javascript:deleteCode('detail')">삭제</button>
						<button type="button" class="btn btn_navy1 btn_table" onclick="javascript:newCommonCode()">신규</button>
						<button type="button" class="btn btn_navy1 btn_table" onclick="javascript:saveCommonCode()">저장</button>
					</div>
				</div>				
			</div>
		</div>
	</form>
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
	Lnb.draw($('div.left_wrap'), 'system', 'system.code');
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

	var changeCnt1 = 0;
	var changeCnt2 = 0;

	function html1(result) {
		var html =	'<tr>'	+
						'<td onclick="event.cancelBubble=true;">'	+
							'<input type="checkbox" id="car" value="' + (result != null ? result.groupCd : "") + '" class="ck1"/>'	+
						'</td>'	+
						'<td class="cnt">' + (result != null ? result.rnum : "") + '</td>'	+
						'<td><input type="text" value="' + (result != null ? result.groupCd : "") + '" class="groupCd"/></td>' + 
						'<td><input type="text" value="' + (result != null ? (result.cdName == null ? '' : result.cdName) : "") + '" class="cdName"/></td>'	+
						'<td><input type="text" value="' + (result != null ? result.data1 : "") + '" class="data data1"/></td>'		+
						'<td><input type="text" value="' + (result != null ? result.data2 : "") + '" class="data data2"/></td>'		+
						'<td><input type="text" value="' + (result != null ? result.data3 : "") + '" class="data data3"/></td>'		+
						'<td><input type="text" value="' + (result != null ? result.data4 : "") + '" class="data data4"/></td>'		+
						'<td><input type="text" value="' + (result != null ? result.data5 : "") + '" class="data data5"/></td>'		+
						'<td><input type="text" value="' + (result != null ? result.data6 : "") + '" class="data data6"/></td>'		+
						'<td><input type="text" value="' + (result != null ? result.data7 : "") + '" class="data data7"/></td>'		+
						'<td><input type="text" value="' + (result != null ? result.data8 : "") + '" class="data data8"/></td>'		+
						'<td class="no_r_line">'	+
							'<input type="text" value="' + (result != null ? result.data9 : "") + '" class="data data9"/>'	+
							'<input type="checkbox" value="' + (result != null ? result.groupCd : "") + '" style="display:none;" class="ck12"/>'	+
							'<input type="hidden" class="useGb" value="' + (result != null ? result.useGb : "I") + '"/>'	+
						'</td>'	+
					'</tr>';
		return html;
	}
				
	function html2(result) {
		var html =	'<tr>'	+
						'<td><input type="checkbox" id="cr" value="' + (result != null ? result.commonCd : "") + '" class="ck2"/></td>'	+
						'<td>' + (result != null ? result.rnum : "") + '</td>'	+
						'<td><input type="text" value="' + (result != null ? result.commonCd : "") + '" class="commonCd"/></td>'	+
						'<td><input type="text" value="' + (result != null ? result.cdName : "") + '" class="cdName"/></td>'	+
						'<td><input type="text" value="' + (result != null ? result.data1 : "") + '" class="data data1"/></td>'		+
						'<td><input type="text" value="' + (result != null ? result.data2 : "") + '" class="data data2"/></td>'		+
						'<td><input type="text" value="' + (result != null ? result.data3 : "") + '" class="data data3"/></td>'		+
						'<td><input type="text" value="' + (result != null ? result.data4 : "") + '" class="data data4"/></td>'		+
						'<td><input type="text" value="' + (result != null ? result.data5 : "") + '" class="data data5"/></td>'		+
						'<td><input type="text" value="' + (result != null ? result.data6 : "") + '" class="data data6"/></td>'		+
						'<td><input type="text" value="' + (result != null ? result.data7 : "") + '" class="data data7"/></td>'		+
						'<td><input type="text" value="' + (result != null ? result.data8 : "") + '" class="data data8"/></td>'		+
						'<td class="no_r_line">'	+
							'<input type="text" value="' + (result != null ? result.data9 : "") + '" class="data data9"/>'	+
							'<input type="hidden" class="useGb" value="' + (result != null ? result.useGb : "I") + '"/>'	+
						'</td>'	+
					'</tr>';
		return html;
	}
	
	$("#searchTable1 tr").click(function(){ 	//searchTable1행을 클릭했을 때
		if(changeChk(changeCnt2)) {
			$(".ck12").each(function() {
				this.checked = false;
			});
			
			var tr = $(this);//클릭한 행
			fillSearchTable2(tr);
		}
	});
	  
	$("#searchTable2 tr").click(function(){//searchTable2 행 클릭했을 때
	 	var tr = $(this);
		var trNum = $("#searchTable2 tr").index(this);
		tr.children().find('.ck22').prop("checked",true);
		$("#selectRow2").val(trNum);//searchTable2 행의 인덱스값 반영
	}); 
	
	$("#searchTable1").bind("change paste", function() {
		changeCnt1++;
	});
	
	$("#searchTable2").bind("change paste", function() {
		changeCnt2++;
	});
	
	function changeChk(changeCnt) {
		if((changeCnt == null ? 0 : changeCnt) > 0) {
			if(confirm('변경된 내용이 있습니다. 그대로 진행하시겠습니까?')) {
				return true;
			} else {
				return false;
			}
		} else {
			return true;
		}
	}
	
	$("#searchButton").click(function() {
		if(changeChk(changeCnt1 + changeCnt2)) {
			var data = JSON.stringify({ "groupKeyword" : encodeURI($("#groupKeyword").val()) 
									  , "commonKeyword" : encodeURI($("#commonKeyword").val())
									  ,	"_csrf" : '${CSRF_TOKEN}' });
			
			$.ajax({
		        async: true,
		        type : 'POST',
		        data : data,
		        url : "/system/searchCode",
		        dataType : "json",
		        //contentType: "application/json; charset=UTF-8",
		        success : function(data) {
		       		$("#searchTable1").empty();
		       		$("#searchTable2").empty();
		        	if(data.codeList != null && data.codeList.length > 0) {
		        		for(var i=0;i<data.codeList.length;i++) {
			        		$("#searchTable1").append(html1(data.codeList[i]));
		        		}
		        	} else {
		        		$("#searchTable1").append("<td class='bin' colspan='13'>빈 테이블 입니다.</td>");
		        	}
		
		       		if(data.detailCodeList == null || data.detailCodeList.length == 0) {
		       			$("#searchTable2").append("<td class='bin' colspan='13'>빈 테이블 입니다.</td>");
		       		} else {
		        		for(var i=0;i<data.detailCodeList.length;i++) {
			        		$("#searchTable2").append(html2(data.detailCodeList[i]));
		        		}
		       		}
		       		
		       		$("#codeCnt").html('총 검색 자료 수 : ' + (data.codeList != null ? data.codeList.length : 0) + ' 건');
		       		$("#codeDetailCnt").html('총 검색 자료 수 : ' + (data.detailCodeList != null ? data.detailCodeList.length : 0) + ' 건');
		       		
		       		$("#searchTable1 tr").click(function(){ 	//searchTable1행을 클릭했을 때
		       			$(".ck12").each(function() {
		       				this.checked = false;
		       			});
		       			
		       			var tr = $(this);//클릭한 행
		       			fillSearchTable2(tr);
		       		});
		        }, error : function(error, request, status) {
		            alert("error : " + error + ", code : " + request.status + ", message : " + request.responseText);
		        }
		   });
			changeCnt1 = 0;
			changeCnt2 = 0;
		}
		return;
	});
	
	$("#allCheck").click(function(){ 
		if($("#allCheck").prop("checked")) {
			$(".ck1").prop("checked",true);
		} else {  
			$(".ck1").prop("checked",false); 
		} 
	});
	$("#allCheck2").click(function(){ 
		if($("#allCheck2").prop("checked")) {
			$(".ck2").prop("checked",true);
		} else {  
			$(".ck2").prop("checked",false); 
		} 
	});
	
	function deleteCode(codeKind){
		var id, str, table, data;
		
		if(codeKind == 'group') {				// 그룹 코드 삭제 시
			id = 'car';
			str = '그룹';
			table = 'searchTable1';
		} else if(codeKind == 'detail') {		// 세부 코드 삭제 시
			id = 'cr';
			str = '세부';
			table = 'searchTable2';
		}
		
		if($('input:checkbox[id=' + id + ']').is(":checked") == false){//searchTable1 체크박스가 체크된게 없으면
			alert("삭제할 " + str + " 코드를 선택해주세요.");
			return;
		} else if(confirm("삭제하시겠습니까?")) {
			if(codeKind == 'group') {
				//searchTable1 체크박스가 체크된 것 값을 ","로 연결하여 groupCode 변수에 저장
				var groupCode = $("input[id=" + id + "]:checked").map(function() { return this.value; }).get().join(",");
				data = JSON.stringify({ "groupCd" : groupCode, "_csrf" : '${CSRF_TOKEN}' });
			} else if(codeKind == 'detail') {
				var groupcode = $("#selectGroupCd").val();
				//searchTable2 체크박스가 체크된 것 값을 ","로 연결하여 commonCode 변수에 저장
				var commonCode = $("input[id=" + id + "]:checked").map(function() { return this.value; }).get().join(",");
				data = JSON.stringify({ "groupCd" : groupcode , "commonCd" : commonCode, "_csrf" : '${CSRF_TOKEN}' });
			}
			 
			$.ajax({
		         async: true,
		         type : 'POST',
		         data : data,
		         url : "/system/deleteCode",
		         dataType : "json",
		         //contentType: "application/json; charset=UTF-8",
		         success : function(data) {
		        	 	if(data.et){
		        	 		alert(data.et+"의 세부 코드가 있어서 삭제가 불가능합니다.");
		        	 		return;
		        	 	}
		        	 	
		        	 	alert(data.data);
	        	 		for(var i=$("[id=" + id + "]:checked").length-1; i>-1; i--){ 
		      	        	  $("[id=" + id + "]:checked").eq(i).closest("tr").remove(); 
	      	        	}
	        	 		﻿
	      	        	changeCnt1 = 0;
	        	 		changeCnt2 = 0;
	        	 		
	        	 		location.reload();
		         }, error : function(error) {
		             alert("error : " + error);
		         }
		    });
			return;
		 }  else {
		 	return;
		 } 
	}
	
	function newGroupCode(){
		var ck = $("#searchTable1").find("td").html();//searchTable1 행에 포함된 글자를 ck변수에 저장
		var cnt = $("#saveRow").val();//searchTable1 행의 갯수 변수 cnt 저장
		cnt++;//행의 갯수 추가
		
		var row =  html1();
	
		if(ck == "빈 테이블 입니다."){//searchTable1 글자에 "빈 테이블 입니다."포함 될 경우 
			$('#searchTable1').empty();	//searchTable1 둘째 행 삭제
			$("#searchTable1").append(row);
		} else {
			$("#saveRow").val(cnt);//행의 갯수 추가한 것을 반영	
			$('#searchTable1').prepend(row);//searchTable1 첫 행에 행 추가
		}
		
		$("#searchTable2").empty();//searchTable2 행 전체 삭제
		$("#searchTable2").append("<tr><td class='bin' colspan='13'>빈 테이블 입니다.</td></tr>");//searchTable2 행 추가 반영
		
		$("#selectRow2").val("0");//searchTable2 선택행 "0"으로 초기화	 
		$("#searchTable1 tr:eq(0)").find('.groupCd').focus();//searchTable1 그룹 코드 칼럼에 포커스
		$("#selectRow").val("0");//searchTable2 선택행 "0"으로 초기화
	}
	
	function newCommonCode(){
		var no = $("#selectRow").val();//searchTable1 선택 행 
		var ck = $("#searchTable2").find("td").html();//searchTable2 행에 포함된 글자를 ck변수에 저장
		var textTest = $("#selectGroupCd").val();//선택한 그룹 코드의 코드 저장
		var usegb = $("#searchTable1 tr:eq("+no+")").find('.useGb').val();//searchTable1 선택 행의 사용 여부
		
	 	if(textTest == null || textTest == ""){//선택한 그룹 코드가 없을 때 
			alert("그룹 정보를 선택해주세요.");
			return;
		}
	
		if(usegb == "N"){//searchTable1 선택 행의 사용 여부가 "N"일 경우 
			alert("사용하지 않는 그룹 코드입니다. 그룹 코드를 먼저 수정해주세요.");
			return;
		} 
	
		var cnt2 = $("#saveRow2").val();//searchTable2 행의갯수
		cnt2++;//searchTable2행 추가
		
		var row = html2(); 
	
		if(ck == "빈 테이블 입니다."){//searchTable2 행에 포함된 글자가 "빈 테이블 입니다."경우
			$('#searchTable2').empty();//searchTable2 둘째 행 삭제	
			$("#searchTable2").append(row);
		} else {
			$('#searchTable2').prepend(row);//searchTable2 첫 행에 행추가 반영
		}
	
		$("#saveRow2").val(cnt2);//searchTable2 행추가 반영
		$('#searchTable2 tr:eq(0)').find(".commonCd").focus();//searchTable2 첫 행의 공통 코드의 포커스
	}
	
	
	function saveGroupCode(){
		var check;
		var cdName = new Array();
		var groupcode = new Array();
		var data1 = new Array();
		var data2 = new Array();
		var data3 = new Array();
		var data4 = new Array();
		var data5 = new Array();
		var data6 = new Array();
		var data7 = new Array();
		var data8 = new Array();
		var data9 = new Array();
		var usegb = new Array();
		var userId =  new Array();
		var save = new Array();
		var str = "";
		
		$("input[id=car]:checked").each(function(i) {
			var tr = $(this).parent().parent();
			var td = tr.children();
	
			usegb[i] = td.eq(12).find(".useGb").val();
			
			if(usegb[i] == "I") {
				save[i] =  $("#searchTable1 tr").index(tr);
			}
			
			if(usegb[i] == "U") {
				save[i] =  $("#searchTable1 tr").index(tr);
			} 
		});
		
		for(var i=0;i<save.length;i++) {
			var tr = $("#searchTable1").children().eq(save[i]);
			var td = tr.children();
			groupcode[i] = jQuery.trim(td.eq(2).find(".groupCd").val());
			cdName[i] = jQuery.trim(td.eq(3).find(".cdName").val());
			data1[i] = jQuery.trim(td.eq(4).find(".data1").val());
			data2[i] = jQuery.trim(td.eq(5).find(".data2").val());
			data3[i] = jQuery.trim(td.eq(6).find(".data3").val());
			data4[i] = jQuery.trim(td.eq(7).find(".data4").val());
			data5[i] = jQuery.trim(td.eq(8).find(".data5").val());
			data6[i] = jQuery.trim(td.eq(9).find(".data6").val());
			data7[i] = jQuery.trim(td.eq(10).find(".data7").val());
			data8[i] = jQuery.trim(td.eq(11).find(".data8").val());
			data9[i] = jQuery.trim(td.eq(12).find(".data9").val());
			usegb[i] = jQuery.trim(td.eq(12).find(".useGb").val());
			userId[i] = $("#userId").val();
			
			if(cdName[i] == "") {
				alert("그룹명을 입력해 주세요.");
				td.eq(3).find(".cdName").focus();
				return;
			}
	
			if(groupcode[i] == "") {
				alert("그룹코드를 입력해 주세요.");
				td.eq(2).find(".groupCd").focus();
				return;
			}
		}
		
		if(save.length == 0) {
			alert("저장할 그룹 코드를 선택해 주세요.");
			return;
		}
	
		jQuery.ajaxSettings.traditional = true;
	
		var allData = { "groupCd" : groupcode , "userId" : userId
	            , "cdName": cdName, "data1" : data1, "data2" : data2, "data3" : data3
	            , "data4" : data4, "data5" : data5, "data6" : data6, "data7" : data7
	            , "data8" : data8, "data9" : data9, "useGb" : usegb, "_csrf" : '${CSRF_TOKEN}' };
	
		if(confirm("저장하시겠습니까?")) {
			$.ajax({
				async: true,
				type : 'POST',
				data : JSON.stringify(allData),
				dataType : "json",
				//contentType: "application/json; charset=UTF-8",
				url : "/system/saveGroupCode",
				success : function(data) {
					if(data.et) {
						alert(data.et + "와 같은 그룹 코드가 있어 저장할 수 없습니다.");
		       
						return;
					} else {
						location.reload();
					}
				}, error : function(error, status, request) {
					alert("error : " + error + ", code : " + request.status + ", message : " + request.responseText);
				}
			});
		} else {
			return;
		}
	}	
	
	function saveCommonCode() {
		var userId = $("#userId").val();//로그인한 유저아이디
		var check;
		var cdName = new Array();
		var commoncode = new Array();
		var groupcode = new Array();
		var data1 = new Array();
		var data2 = new Array();
		var data3 = new Array();
		var data4 = new Array();
		var data5 = new Array();
		var data6 = new Array();
		var data7 = new Array();
		var data8 = new Array();
		var data9 = new Array();
		var usegb = new Array();
		var userId =  new Array();
		var checkbox = $("input:checkbox[id=cr]:checked");
		
		if( $('input:checkbox[id=cr]').is(":checked") == false){//searchTable2 체크박스가 체크된게 없으면
			alert("저장할 세부 코드를 선택해 주세요.");
			return;
		}
		
		checkbox.each(function(i) {
			var tr = $(this).parent().parent();
			var td = tr.children();
	
			commoncode[i] = td.eq(2).find(".commonCd").val();
			cdName[i] = td.eq(3).find(".cdName").val();
			data1[i] = td.eq(4).find(".data1").val();
			data2[i] = td.eq(5).find(".data2").val();
			data3[i] = td.eq(6).find(".data3").val();
			data4[i] = td.eq(7).find(".data4").val();
			data5[i] = td.eq(8).find(".data5").val();
			data6[i] = td.eq(9).find(".data6").val();
			data7[i] = td.eq(10).find(".data7").val();
			data8[i] = td.eq(11).find(".data8").val();
			data9[i] = td.eq(12).find(".data9").val();
			usegb[i] = td.eq(12).find(".useGb").val();
			groupcode[i] = $("#selectGroupCd").val();
			userId[i] = $("#userId").val();
		});
	
		jQuery.ajaxSettings.traditional = true;
		
		var allData = { "commonCd" : commoncode ,"groupCd" : groupcode , "userId" : userId
	             , "cdName": cdName, "data1" : data1, "data2" : data2, "data3" : data3
	             , "data4" : data4, "data5" : data5, "data6" : data6, "data7" : data7
	             , "data8" : data8, "data9" : data9, "useGb" : usegb, "_csrf" : '${CSRF_TOKEN}' };
	
		if(check != "n") {
			if(confirm("저장하시겠습니까?")) {
				$.ajax({
					async: true,
			        type : 'POST',
			        data :JSON.stringify(allData),
			        url : "/system/saveDetailCode",
			        dataType : "json",
			        //contentType: "application/json; charset=UTF-8",
			        success : function(data) {
						if(data.et) {
							alert(data.et+"의 공통 코드가 있어 저장할 수 없습니다.");
		       
		        	 		return;
		        	 	} else {
		        	 		location.reload();
		        	 	}
			        }, error : function(error, status, request) {
			            alert("error : " + error + ", code : " + request.status + ", message : " + request.responseText);
					}
				});
			} else {
			 	return;
			}
		}
	}
	
	function fillSearchTable2(tr) {
		var td = tr.children();//클릭한 행의 td
		var no = td.eq(1).text();//클릭한 행의 두번째 td값(no값)
		var ck = tr.children().find('.ck12').val();//클릭한 행의 체크박스 값
		var groupcode = tr.children().find('.groupCd').val();//클릭한 행의 그룹코드 값
		var usegb = tr.children().find('.useGb').val();//클릭한 행의 사용여부 
		var groupkeyword = $("#groupKeyword").val();//그룹검색 단어
		var commonkeyword = $("#commonKeyword").val();//공통코드검색 단어
		
		tr.children().find('.ck12').prop("checked",true);
		
		var trNum = $("#searchTable1 tr").index(tr);//searchTable1 선택행의 인덱스 값
		
		tr.children().find('input[type="text"]').change(function() { 
			tr.find('.useGb').val("U");
		});
		
		$("#selectGroupCd").val(groupcode); //선택행의 그룹코드값을 hidden id="groupCd" 에 반영
		
		if(trNum >= 0 && usegb == "Y") { //선택행이 있고 사용여부가 'Y' 면은
			$.ajax({
		         async: true,
		         type : 'POST',
		         data : JSON.stringify({ "groupCd" : groupcode, '_csrf' : '${CSRF_TOKEN}' }),
		         url : "/system/selectDetailCode",
		         dataType : "json",
		         //contentType: "application/json; charset=UTF-8",
		         success : function(data) {
		        	$("#searchTable2").empty();
					if(data.detailCodeList != null && data.detailCodeList.length > 0) {
			        	for(var i=0;i<data.detailCodeList.length;i++) {
							$("#searchTable2").append(html2(data.detailCodeList[i]));		        		
			        	}
					} else {
						$("#searchTable2").append("<td class='no_r_line' colspan='13'>빈 테이블 입니다.</td>");
					}
	
					$("#saveRow2").val($('#searchTable2 tr').length);
		    		$("#codeDetailCnt").html("총 검색 자료 수 : " + $('#searchTable2 tr').length + " 건");
		    		$("#selectGroupCd").val(groupcode);
		         },	error : function(error) {
		             alert("error : " + error);
		         }
		     });
		}
		
		if(trNum >= 0 && usegb == "N") {//선택행이 있고 사용여부가 'N'이면
			$("#searchTable2  tr").remove();//searchTable2 빈 테이블 입니다. 행추가.
			 var row = "<tr>"; 
	  			 row += "<td class='no_r_line' colspan='13'>빈 테이블 입니다.</td>"; 
	  			 row += "</tr>"; 
	  			
	  			 $("#searchTable2").append(row);
		}
		
		if($("#saveRow2").val("1")) {//searchTable2 빈 테이블 입니다. 가 있으면
			$("#saveRow2").val("0");//searchTable2 행의 갯수 0 초기화
			$("#codeDetailCnt").html("총 검색 자료 수 : "+$("#saveRow2").val()+" 건");//searchTable2 '0'건으로 초기화
		}
		
		changeCnt2 = 0;
	}
</script>

</body>
</html>