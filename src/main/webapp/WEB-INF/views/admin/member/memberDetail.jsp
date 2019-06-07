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
						<th colspan="2">가입일</th>
						<td colspan="2">${mData.m_joindate}</td>
						<th>약관동의</th>
						<td>${mData.m_agreement}</td>
					<tr>
					<tr>
						<th>이름</th>
						<td>${mData.m_name}</td>
						<th>성별</th>
						<td>${mData.m_gender}</td>
						<th>전화번호</th>
						<td>${mData.m_phone}</td>
						<th>이메일</th>
						<td>${mData.m_email}</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>${mData.m_birth}</td>
						<th>아이디</th>
						<td>${mData.m_id}</td>
						<th colspan="2">비밀번호 변경일</th>
						<td colspan="2">${mData.m_pwdchanged}</td>
					</tr>
					<tr>
					
						<th>결제누적금액</th>
						<td>${mData.m_total}</td>
						<th>회원등급</th>
						<td>${mData.mg_grade}</td>
						<th>회원 할인율</th>
						<td>${mData.mg_discount}</td>
						<th>등급변경일</th>
						<td>${mData.mg_date}</td>
					</tr>
				</table>
			</div>
			<br/>
			<div class="contentTit page-header"><h3>예약 내역</h3></div>
		
			<div>
				<table class="table table-bordered">
				
				</table>
			</div>
			<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		</div>
	</body>
</html>