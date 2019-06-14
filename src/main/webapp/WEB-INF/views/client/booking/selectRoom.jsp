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
		
		
		<title>예약하기</title>
		
		<link rel="shortcut icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/icon.png" />
		
		<!-- [if lt IE 9]>
		<script src="../js/html5shiv.js"></script> 
		<![endif]-->
		
		<link href="/resources/include/css/common.css" rel="stylesheet">
		
		<link href="/resources/include/css/default.css" rel="stylesheet">
      
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />
		<!-- <link rel="stylesheet" type="text/css" href="/resources/include/css/default.css"/> -->
		<!-- Custom styles for this template -->
    	<link href="/resources/include/dist/css/dashboard.css" rel="stylesheet">
    	<link href="/resources/include/css/jquery-ui.css" rel="stylesheet">

		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/jquery-ui.js"></script>
		<script type="text/javascript">
		$(function(){
			$(".selectRoomBtn").click(function(){
				var rg_grade = $(this).parents("div").attr("data-name");
				$("#rg_grade").val(rg_grade);
				
				$("#b_data").attr({
					"method":"get",
					"action":"/booking/bookingClientDetail"
				});
				$("#b_data").submit();
			});
			
			$("#reBooking").click(function(){
				location.href="/booking/booking";
			});
		}); //$최종		
	</script>
	</head>
	<body>
		<div class="contentContainer container-fluidA">
			<form id="b_data" name="b_data">
				<input type="hidden" id="rg_grade" name="rg_grade" />
				<input type="hidden" id="b_indate" name="b_indate" value="${data.b_indate}" />
				<input type="hidden" id="b_outdate" name="b_outdate" value="${data.b_outdate}"/>
				<input type="hidden" id="b_inday" name="b_inday" value="${data.b_inday}" />
				<input type="hidden" id="b_roomcnt" name="b_roomcnt" value="${data.b_roomcnt}"/>
				<input type="hidden" id="b_persons" name="b_persons" value="${data.b_persons}" />
			</form>
			<label>${data.b_indate} ~ ${data.b_outdate} </label>
			<input type="button" id="reBooking" name="reBooking" value="다시 선택" />
			<div>
				<c:choose>
					<c:when test="${not empty roomList}">
						<c:forEach var="room" items="${roomList}" varStatus="status">
							<div class="goDetail" data-name="${room.rg_grade}">${room.rg_grade} 남은 객실 수 : ${room.b_roomcnt} <br/>
							${room.rg_price}KRW 1박 가격
							<input type="button" class="selectRoomBtn btn btn-primary" value="선택" />
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div>예약 가능한 방이 존재하지 않습니다.</div>				
					</c:otherwise>
			</c:choose>
			</div>
		</div>
	</body>
</html>