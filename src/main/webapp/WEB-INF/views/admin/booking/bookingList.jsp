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
		
		
		<title>예약 리스트</title>
		
		<link rel="shortcut icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/icon.png" />
		
		<!-- [if lt IE 9]>
		<script src="../js/html5shiv.js"></script> 
		<![endif]-->
		
		<link href="/resources/include/css/common.css" rel="stylesheet">
		
		
      
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />
		<!-- <link rel="stylesheet" type="text/css" href="/resources/include/css/default.css"/> -->
			<!-- Custom styles for this template -->
    	<link href="/resources/include/dist/css/dashboard.css" rel="stylesheet">

		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
		$(function(){
			/*검색 후 검색 대상과 검색 단어 출력*/
			var word="<c:out value='${date.keyword}' />";
			var value="";
			if(word != ""){
				$("#keyword").val("<c:out value='${data.keyword}' />");
				$("#search").val("<c:out value='${data.search}' />");
				
				if($("#search").val()=='b_num') value = "#list tr td.goDetail";
				else if($("#search").val()=='b_name') value="#list tr td.name";
				$(value+":contains('"+word+"')").each(function(){
					var regex = new RegExp(word, "gi");
					$(this).html($(this).html().replace(regex, "<span class='required'>"+word+"</span>"));
				});
			}
			
			/*검색 대상이 변경될 때마다 처리 이벤트*/
			$("#search").change(function(){
				if($("#search").val()=="all"){
					$("#keyword").val("전체 데이터 조회합니다.");	
				}else if($("#search").val() !="all"){
				$("#keyword").val("");
				$("#keyword").focus();
				}
				
			});
			
			/*검색 버튼 클릭 시 처리 이벤트*/
			$("#searchData").click(function(){
				if($("#search").val() != "all"){
					if(!chkData("#keyword","검색어를")) return;
				}
				goPage();;
			});
			
			/*페이지 버튼 처리 이벤트*/
			$(".paginate_button a").click(function(e){
				e.preventDefault();
				$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
				goPage();
			});
			
			/*예약 번호 클릭 시 처리 이벤트*/
			$(".goDetail").click(function(){
				var b_num = $(this).attr("data-num");
				$("#b_num").val(b_num);
				
			
				//상세 페이지로 이동하기 위해 form 추가(id:detailForm)
				$("#detailForm").attr({
				"method":"get",
				"action":"/admin/booking/bookingDetail"	
				});
			$("#detailForm").submit();
			});
			
			/*예약등록 버튼 클릭시 처리 이벤트*/
			
			
			
			
		}); //최종$
		
		
		/*검색을 위한 실질적인 처리함수*/
		function goPage(){
			if($("#search").val()=="all"){
				$("keyword").val("");
			}
			$("#f_search").attr({
				"method":"get",
				"action":"/admin/booking/bookingList"
			});
			$("#f_search").submit();
		}
		</script>
    </head>	
	<body>
		
		<div class="contentContainer container-fluidA">
			<div class="contentTit page-header"><h3 class="text-center">예약관리 리스트</h3></div>
			
			<form id="detailForm">
				<input type="hidden" id="b_num" name="b_num" />
				<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum}" />
				<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}" />
			</form>
			
			<%--==============검색기능 시작========================= --%>
			
			<div id="bookingSearch" class="text-right">
				<form id="f_search" name="f_search" class="form-inline">
					<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
					<div class="form-group">
						<label>검색 조건</label>
						<select id="search" name="search" class="form-control">
							<option value="all">전체</option>
							<option value="b_num">예약번호</option>
							<option value="b_name">예약자명</option>
						</select>		
					<input type="text" name="keyword" id="keyword" class="form-control" />
					<button type="button" id="searchData" class="btn btn-primary">검색</button>
					</div>
				</form>
			
			</div>	
			
			<%--===========예약 리스트 시작 ===============--%>
			<div id="bookingList">
				<table class="table table-bordered table-hover">
					<colgroup>
						<col width="7%">
						<col width="7%">
						<col width="7%">
						<col width="7%">
						<col width="7%">
						<col width="7%">
						<col width="7%">
						<col width="7%">
						<col width="7%">
						<col width="7%">
						<col width="7%">
						<col width="7%">
						<col width="7%">
					</colgroup>		
					<thead>
						<tr>
							<th>예약번호</th>
							<th>회원여부</th>
							<th>회원번호</th>
							<th>예약명</th>
							<th>예약날짜</th>
							<th>체크인</th>
							<th>체크아웃</th>
							<th>전화번호</th>
							<th>이메일</th>
							<th>방등급</th>
							<th>방호수</th>
							<th>금액</th>
							<th>예약상태</th>
						</tr>	
					</thead>
					<tbody id="list" class="table-striped">
						<c:choose>
							<c:when test="${not empty bookingList}">
								<c:forEach var="booking" items="${bookingList}" varStatus="status">
									<tr class="goDetail" data-num="${booking.b_num}">
										<td>${booking.b_num}</td>
										<td>${booking.b_ismember}</td>
										<td>${booking.m_no}</td>
										<td>${booking.b_name}</td>
										<td>${booking.b_date}</td>
										<td>${booking.b_indate}</td>
										<td>${booking.b_outdate}</td>
										<td>${booking.b_phone}</td>
										<td>${booking.b_email}</td>
										<td>${booking.rg_grade}</td>
										<td>${booking.r_number}</td>
										<td>${booking.b_payment}</td>
										<td>${booking.b_state}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="13">예약내역이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>		
						</c:choose>					
					</tbody>	
				</table>
			</div>	
			<%--===============예약 리스트 종료======================== --%>
		
			<%--==========================페이징 처리=========================== --%>
			<div class="text-center">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li class="paginate_button previous">
							<a href="${pageMaker.startPage -1}">Previous</a>
						</li>
					</c:if>
					
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li class="paginate_button ${pageMaker.cvo.pageNum == num ?'active':''}">
							<a href="${num}">${num}</a>
						</li>
					</c:forEach>
									
				<c:if test="${pageMaker.next}">
					<li class="paginate_button next">
						<a href="${pageMaker.endPage +1}">next</a>		
					</li>	
				</c:if>	
				</ul>
			</div>
			<div>
				<input type="button" value="예약등록" id="insertFormBtn" class="btn btn-default">
			</div>	
		</div>
	</body>
</html>