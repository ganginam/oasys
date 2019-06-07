<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>​


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		
		
		<title>예약 세부사항</title>
		
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
			/*목록 버튼 클릭 시 처리 이벤트*/
			
			$("#bookingListBtn").click(function(){
				var queryString= "?pageNum="+$("#pageNum").val()+"&amount="+$("#amount").val();
				location.href="/admin/booking/bookingList"+queryString;
			});
			
		});//최종
		
	</script>
	</head>
	<body>
		<div class="contentContainer container-fluidA">
			<div class="contentTit page-header"><h3 class="text-center">예약 수정</h3></div>
				
				<form name="f_data" id="f_data" method="post">
					<input type="hidden" name="b_num" id="b_num" value="${bookingUpdateData.b_num}">
					<input type="hidden" name="pageNum" id="pageNum" value="${bookingUpdateData.pageNum}">
					<input type="hidden" name="amount" id="amount" value="${bookingUpdateData.amount}">
				</form>					
			<div class="btnArea col-md-4">
				<input type="button" value="수정완료" id="updateFormBtn" class="btn btn-primary">
				<input type="button" value="취소" id="bookingCancelBtn" class="btn btn-primary">
				<input type="button" value="목록" id="bookingListBtn" class="btn btn-primary">		
			</div>	
			<br/>
			<div class="contentTB text-center">
				<table class="table table-bordered">
					<colgroup>
						<col width="16%" />
						<col width="16%" />
						<col width="17%" />
						<col width="17%" />
						<col width="17%" />
						<col width="17%" />					
					</colgroup>
					<tbody>		
						<tr>
							<td>예약번호</td>
							<td class="text-left">${bookingUpdateData.b_num}</td>	
							<td>회원여부</td>
							<td colspan="3" class="text-left">${bookingUpdateData.b_ismember}</td>
						</tr>
						<tr>	
							<td>회원번호</td>
							<td class="text-left">${updateData.m_no}</td>
							<td>예약명</td>
							<td colspan="3" class="text-left">
							<input type="text" id="b_name" name="b_name" class="form-control" value="${bookingUpdateData.b_name}" /></td>
						</tr>
						<tr>
							<fmt:parseDate var="b_date" value="${bookingUpdateData.b_date}" pattern="yyyy-MM-dd"/>
							<td>예약날짜</td>
							<td class="text-left">
							<input type="date" id="b_date" name="b_date" value='<fmt:formatDate value="${b_date}" pattern="yyyy-MM-dd"/>' />
							</td>
							<td>체크인</td>
							<td class="text-left">${updateDate.b_indate}</td>
							<td>체크아웃</td>
							<td class="text-left">${updateData.b_outdate}</td>
						</tr>	
						<tr>	
							<td>전화번호</td>
							<td class="text-left">${updateData.b_phone}</td>
							<td>이메일</td>
							<td colspan="3" class="text-left">${updateData.b_email}</td>
						</tr>
						<tr>	
							<td>방등급</td>
							<td class="text-left">${updateData.rg_grade}</td>
							<td>금액</td>
							<td class="text-left">${updateData.b_payment}</td>
							<td>예약상태</td>
							<td class="text-left">${updateData.b_state}</td>
						</tr>							
				</table>
			</div>
		</div>
	</body>
</html>