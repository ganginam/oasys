<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		
		
		<title>Insert title here</title>
		
		<link rel="shortcut icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/icon.png" />
		
		<!-- [if lt IE 9]>
		<script src="../js/html5shiv.js"></script> 
		<![endif]-->
		
		<link href="/resources/include/css/common.css" rel="stylesheet">
		
		
      
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/css/default.css"/>
		
		<!-- Custom styles for this template -->
    	<link href="/resources/include/dist/css/dashboard.css" rel="stylesheet">

		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function(){
				var word = "<c:out value = '${data.keyword}'/>";
				var value = "";
				if(word!=""){
					$("#keyword").val("<c:out value='${data.keyword}' />");
					$("#search").val("<c:out value='${data.search}' />");
					
					if($("#search").val()=='m_name') value = "#list tr td.mbName";
					else if($("#search").val()=='m_phone') value="#list tr td.mbPhone";
					else if($("#search").val()=='m_id') value="#list tr td.mbId";
					else if($("#search").val()=='m_email') value="#list tr td.mbEmail";
					$(value+":contains('"+word+"')").each(function(){
						var regex = new RegExp(word,'gi');
						$(this).html($(this).html().replace(regex, "<span class='required'>"+word+"</span>"));
					});
				}
				
				$("#mSearch").change(function(){
					if($("#search").val()=="allMember"){
						//$("#keyword").val("전체 회원 조회합니다.");
					}else if($("#mSearch").val()!="allMember"){
						//$("#keyword").val("");
						//$("#keyword").focus();
					}
				});
				
				$("#searchData").click(function(){
					goPage();
				});
				
				$(".paginate_button a").click(function(e){
					e.preventDefault();
					$("#f_mSearch").find("input[name='pageNum']").val($(this).attr("href"));
					goPage();
				});
				
				
				$("#GradeDataUpdateBtn").click(function(){
					location.href="/admin/member/gradeDataUpdate";
				});
				
				$("#mbGradeUpdateBtn").click(function(){
					location.href="/admin/member/updateMembergrade";
				});
				
				$("#yearTotalResetBtn").click(function(){
					if(confirm("전체회원의 연간 누적금액을 초기화하시겠습니까?")){
						location.href="/admin/member/yearTotalReset";
					}
				});
				
			}); //최상위 function 종료 
			
			function goPage(){
				if($("#search").val()=="allMember"){
				}
				$("#f_mSearch").attr({
					"method":"get",
					"action":"/admin/member/mgrade"
				});
				$("#f_mSearch").submit();
			}
		</script>
		
		
	</head>
	<body>
		<div class="contentContainer container-fluidA">


			<!-- 회원 등급 관리 리스트 ----------------------->
			<div class="contentTit page-header"><h3>회원등급관리</h3></div>
			
			<div class="text-left mgrade-div">
				<input type="button" value="업데이트" id="GradeDataUpdateBtn" class="btn btn-default">
				<!-- <input type="button" value="수정" id="insertFormBtn" class="btn btn-default"> -->
				<input type="button" value="등급조정" id="mbGradeUpdateBtn" class="btn btn-success">
				<input type="button" value="연간 누적 금액 초기화" id="yearTotalResetBtn" class="btn btn-danger">
			</div>
			
			<!-- 회원 검색 부분 -->
			<div id="memberSearch" class="text-right mgrade-div">
				<form id="f_mSearch" name="f_mSearch" class="form-inline">
					<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
					<div class="form-group">
						<label>검색조건</label>
						<select id="search" name="search" class="form-control">
							<option value="allMember">전체회원</option>
							<option value="upgradeMember">등급변경대상</option>
						</select>
						<!-- <input type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요" class="form-control" /> -->
						<button type="button" id="searchData" class="btn btn-primary btn-sm">검색</button>
					</div>
				</form>
			</div>
			
			
			<form id="detailForm">
				<input type="hidden" id="m_num" name="m_num" />
				<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum}" />
				<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}" />
			</form>
			
			<div>
				<table class="table table-bordered">
					<colgroup>
						<col width="5%">
						<col width="7%">
						<col width="4%">
						<col width="10%">
						<col width="10%">
						<col width="8%">
						<col width="8%">
						<col width="10%">
						<col width="10%">
						<col width="15%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th>회원번호</th>
							<th>이름</th>
							<th>성별</th>
							<th>아이디</th>
							<th>전화번호</th>
							<th>현재등급</th>
							<th>조정등급</th>
							<th>연간 누적 금액</th>
							<th>총 누적 금액</th>
							<th>등급 변경일</th>
							<th>가입일</th>
						</tr>
					</thead>
					<tbody id="list">
						<c:choose>
							<c:when test="${not empty mbGradeList}">
								<c:forEach var="mbgrade" items="${mbGradeList}" varStatus="status">
									<tr data-num="${mbgrade.m_no}">
										<td>${mbgrade.m_no}</td>
										<td>${mbgrade.m_name}</td>
										<td>${mbgrade.m_gender}</td>
										<td>${mbgrade.m_id}</td>
										<td>${mbgrade.m_phone}</td>
										<td>${mbgrade.mg_grade}</td>
										<td>${mbgrade.mg_upgrade}</td>
										<td>${mbgrade.m_ytotal}</td>
										<td>${mbgrade.m_total}</td>
										<td>${mbgrade.mg_date}</td>
										<td>${mbgrade.m_joindate}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="13">회원이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			
			<!-- 회원 조회 페이징처리 -->
			<div class="text-center">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li class="paginate_button previous">
							<a href="${pageMaker.startPage -1}">Previous</a>
						</li>
					</c:if>
					
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li class="paginate_button ${pageMaker.cvo.pageNum == num ? 'active' : ''}">
							<a href="${num}">${num}</a>
						</li>
					</c:forEach>
					
					<c:if test="${pageMaker.next}">
						<li class="paginate_button next">
							<a href="${pageMaker.endPage +1}">Next</a>
						</li>
					</c:if>
				</ul>
			</div>
			
			
		</div>
		
		
	</body>
</html>