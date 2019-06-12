<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			
		</script>
	</head>
	<body>
		<div class="contentContainer container-fluidA">
			<div class="contentTit page-header"><h3>회원 상세 정보</h3></div>
		
			<div>
				<table class="table table-bordered">
					<tr>
						<th>회원번호</th>
						<td>${mData.m_no}</td>
						<th>가입일</th>
						<td>${mData.m_joindate}</td>
						<th>약관동의</th>
						<td>${mData.m_agreement}</td>
						<th>성별</th>
						<td>${mData.m_gender}</td>
					<tr>
					<tr>
						<th>이름</th>
						<td>${mData.m_name}</td>
						<th>생년월일</th>
						<td>${mData.m_birth}</td>
						<th>전화번호</th>
						<td>${mData.m_phone}</td>
						<th>이메일</th>
						<td>${mData.m_email}</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>${mData.m_id}</td>
						<th>연간 누적 금액</th>
						<td>${mData.m_ytotal}</td>
						<th>총 누적 금액</th>
						<td>${mData.m_total}</td>
						<th>회원 할인율</th>
						<td>${mData.mg_discount}</td>
					</tr>
					<tr>
						<th>비밀번호 변경일</th>
						<td>${mData.m_pwdchanged}</td>
						<th>회원 등급</th>
						<td>${mData.mg_grade}</td>
						<th colspan="2">등급 변경일</th>
						<td colspan="2">${mData.mg_date}</td>
					</tr>
				</table>
			</div>
			<br/>
			<div class="contentTit page-header"><h3>예약 내역</h3></div>
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
									<td colspan="13">등록된 예약이 존재하지않습니다.</td>
								</tr>
							</c:otherwise>		
						</c:choose>					
					</tbody>	
				</table>
			<br/><br/><br/><br/><br/><br/><br/><br/>
		</div>
	</body>
</html>