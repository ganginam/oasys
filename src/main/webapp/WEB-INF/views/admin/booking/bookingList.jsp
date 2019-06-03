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
		<!-- <link rel="stylesheet" type="text/css" href="/resources/include/css/default.css"/> -->

		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">

		</script>
		
		<!-- Custom styles for this template -->
    	<link href="/resources/include/dist/css/dashboard.css" rel="stylesheet">
    </head>	
	<body>
		
		<div class="contentContainer container-fluid" >
			<%--===========예약 리스트 시작 ===============--%>
			<div id="bookingList">
				<table class="table table-bordered">
					<colgroup>
						<col width="8%">
						<col width="8%">
						<col width="8%">
						<col width="8%">
						<col width="8%">
						<col width="8%">
						<col width="8%">
						<col width="8%">
						<col width="8%">
						<col width="8%">
						<col width="8%">
						<col width="8%">
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
							<th>금액</th>
							<th>예약상태</th>
						</tr>	
					</thead>
					<tbody id="list" class="table-striped">
						<c:choose>
							<c:when test="${not empty bookingList}">
								<c:forEach var="booking" items="${bookingList}" varStatus="status">
									<tr class="tac" data-num="${booking.b_num}">
										<td>${booking.b_num}</td>
										<td>${booking.b_ismember}</td>
										<td>${booking.m_no}</td>
										<td class="goDetail tal">${booking.b_name}</td>
										<td>${booking.b_date}</td>
										<td>${booking.b_indate}</td>
										<td>${booking.b_outdate}</td>
										<td>${booking.b_phone}</td>
										<td>${booking.b_email}</td>
										<td>${bookiing.rg_number}</td>
										<td>${booking.b_payment}</td>
										<td>${booking.b_state}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="12">등록된 예약이 존재하지않습니다.</td>
								</tr>
							</c:otherwise>		
						</c:choose>					
					</tbody>	
				</table>
			</div>	
		</div>
	</body>
</html>