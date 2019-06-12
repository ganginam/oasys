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
			/*수정완료 버튼 클릭 시 처리 이벤트*/
			$("#bookingUpdateBtn").click(function(){
				$("#f_updateForm").attr({
					"method":"post",
					"action":"/admin/booking/bookingUpdate"
				});
				$("#f_updateForm").submit();
			});
			
			/*취소 버튼 클릭 시 처리 이벤트*/
			$("#bookingCancelBtn").click(function(){
				$("#f_updateForm").each(function(){
					this.reset();
				});
			});
			
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
				
				<form name="f_updateForm" id="f_updateForm" method="post">
					<input type="hidden" name="b_num" id="b_num" value="${bookingUpdateData.b_num}">
					<input type="hidden" name="pageNum" id="pageNum" value="${bookingUpdateData.pageNum}">
					<input type="hidden" name="amount" id="amount" value="${bookingUpdateData.amount}">
					
					<div class="btnArea col-md-4">
						<input type="button" value="수정완료" id="bookingUpdateBtn" class="btn btn-primary">
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
									<td class="text-left">${bookingUpdateData.m_no}</td>
									<td>예약명</td>
									<td colspan="3" class="text-left">${bookingUpdateData.b_name}</td>
								</tr>
								<tr>					
									<td>예약날짜</td>
									<td class="text-left">
									<input type=text name="b_date" id="b_date" value="${bookingUpdateData.b_date}" readonly=readonly />
									</td>
									
									<td>체크인</td>
									<fmt:parseDate var="b_indate" value="${bookingUpdateData.b_indate}" pattern="yyyy-MM-dd" />
									<td class="text-left">
									<input type="date" id="b_indate" name="b_indate" value='<fmt:formatDate value="${b_indate}" pattern="yyyy-MM-dd"/>' />
									</td>
									
									<td>체크아웃</td>
									<fmt:parseDate var="b_outdate" value="${bookingUpdateData.b_outdate}" pattern="yyyy-MM-dd" />
									<td class="text-left">
									<input type="date" id="b_outdate" name="b_outdate" value="<fmt:formatDate value='${b_outdate}' pattern='yyyy-MM-dd' />" />
									</td>
								</tr>	
								<tr>	
									<td>전화번호</td>
									<td class="text-left">${bookingUpdateData.b_phone}</td>
									<td>이메일</td>
									<td colspan="3" class="text-left">${bookingUpdateData.b_email}</td>
								</tr>
								<tr>	
									<td>방등급</td>
									<td class="text-left">
									<select id="rg_grade" name="rg_grade">
										<option value="${bookingUpdateData.rg_grade}">${bookingUpdateData.rg_grade}</option>
										<option value="디럭스 트윈">디럭스 트윈</option>
										<option value="디럭스">디럭스</option> 
									
									</select>
									</td>
									<td>금액</td>
									<td class="text-left">
									<input type="text" id="b_payment" name="b_payment" value="${bookingUpdateData.b_payment}" />
									</td>
									
									<td>예약상태</td>
									<td class="text-left">
									<select id="b_state" name="b_state">
										<option value="${bookingUpdateData.b_state}">${bookingUpdateData.b_state}</option>
										<option value="예약완료">예약완료</option>
										<option value="예약취소">예약취소</option>
									</select>
									</td>
									
								</tr>							
					</table>
				</div>
			</form>	
		</div>
	</body>
</html>