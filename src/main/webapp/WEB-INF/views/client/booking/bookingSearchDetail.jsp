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
				$("#bookingCancelBtn").click(function(){
					if(confirm("예약 취소하시겠습니까? (예약 취소 승인은 취소 신청 후 3~5일 소요됩니다.)")){
						$.ajax({
							url:"/booking/bookingCancel",
							type:"post",
							data:"b_num="+$("#b_num").val(),
							dataType:"text",
							error:function(){
								alert("에러")
							},
							success:function(data){
								if(data=="Y"){
									alert("예약 취소 신청이 완료되었습니다.(취소 승인은 취소 신청 후 3~5일 소요됩니다.)")
									location.reload();	
								}else if(data=="N"){
									alert("예약 취소 신청이 실패되었습니다. 다시 한 번 시도해 주세요")
								}
								
							}
						})
					}
				});
				$("#goHome").click(function(){
					location.href="/"
				})
				$("#goBack").click(function(){
					history.go(-1);
				})
				
			}); //최상의 종료
		
		</script>
	</head>
	<body>
		<div class="contentContainer container-fluidA">
			<div class="contentTit page-header"><h3 class="text-center">예약 상세보기</h3></div>
				
				<form name="f_data" id="f_data" method="post">
					<input type="hidden" name="b_num" id="b_num" value="${detail.b_num}">
				</form>					
			
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
					<c:choose>
						<c:when test="${not empty detail}">		
							<tr>
								<td>예약번호</td>
								<td class="text-left">${detail.b_num}</td>	
								<td>회원여부</td>
								<td colspan="3" class="text-left">${detail.b_ismember}</td>
							</tr>
							<tr>	
								<td>회원번호</td>
								<td class="text-left">${detail.m_no}</td>
								<td>예약명</td>
								<td colspan="3" class="text-left">${detail.b_name}</td>
							</tr>
							<tr>	
								<td>예약날짜</td>
								<td class="text-left">${detail.b_date}</td>
								<td>체크인</td>
								<td class="text-left">${detail.b_indate}</td>
								<td>체크아웃</td>
								<td class="text-left">${detail.b_outdate}</td>
							</tr>	
							<tr>	
								<td>전화번호</td>
								<td class="text-left">${detail.b_phone}</td>
								<td>이메일</td>
								<td colspan="3" class="text-left">${detail.b_email}</td>
							</tr>
							<tr>	
								<td>방등급</td>
								<td class="text-left">${detail.rg_grade}</td>
								<td>금액</td>
								<td class="text-left">${detail.b_payment}</td>
								<td>예약상태</td>
								<td class="text-left">${detail.b_state}</td>
							</tr>
						</c:when>
				<c:otherwise>
						<td>예약 내역이 존재하지 않거나, 정보를 다시 입력해 주세요</td>
				</c:otherwise>
			</c:choose>		
				</tbody>					
				</table>
				
			</div>
			<%--===========================상세 정보 보여주기 종료========================== --%>
		</div>
		<c:choose>
			<c:when test="${not empty detail}">
				<div class="btnArea col-md-4">
						<input type="button" value="홈" id="goHome" class="btn btn-primary">
						<input type="button" value="예약취소" id="bookingCancelBtn" class="btn btn-primary">				
				</div>
			</c:when>
			<c:otherwise>
				<div class="btnArea col-md-4">
						<input type="button" value="홈" id="goHome" class="btn btn-primary">
						<input type="button" value="뒤로가기" id="goBack" class="btn btn-primary">				
				</div>
			</c:otherwise>
		</c:choose>	
	</body>
</html>