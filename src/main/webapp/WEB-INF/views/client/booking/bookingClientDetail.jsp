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
		
		
		<title>예약상세페이지</title>
		
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
			$("#continue").click(function(){
				$("#f_payDetailForm").attr({
					"method":"post",
					"action":"/booking/goPaymentForm"
				})
				$("#f_payDetailForm").submit();
			})
		})
	</script>
	</head>
	<body>
	<div class="contentContainer container-fluidA">
		
		<div>
		<form id="f_payDetailForm">
			<img id="detailimg" src="/uploadStorage/roomGrade/${detail.image1}" /><br/>
				${data.b_indate}~${data.b_outdate} 총 ${data.b_inday} 박<br/>
				${detail.rg_grade} ${detail.rg_price} KRW 1박 <br/>
				객실 수 : ${data.b_roomcnt}<br/>
				객실 당 인원 수 : ${data.b_persons}<br />
				총 가격: ${data.b_roomcnt * detail.rg_price * data.b_inday} KRW
				<input type="hidden" name="p_pay" id="p_pay" value="${data.b_roomcnt * detail.rg_price * data.b_inday}">
			<input class="btn btn-primary" type="button" id="continue" name="continue" value="계속" />
		</form>
		</div>		
	</div> 
	</body>
</html>