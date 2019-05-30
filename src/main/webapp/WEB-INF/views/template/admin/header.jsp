<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
    <!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

		<title>Insert title here</title>
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script src="/resources/include/js/header.js"></script>
		<!-- <script src="../js/main.js"></script> -->
		
		<link href="/resources/include/css/common.css" rel="stylesheet">
		<link href="/resources/include/css/main.css" rel="stylesheet">
	</head>
	<body>
	<div id="header" style="transform: matrix(1, 0, 0, 1, 0, 0);">
		<div class="top_util_container">
			<div class="top_util">
				<div class="weather">
			        <span>SEOUL</span>
			        <span id="nowTime">9:40AM</span>
			    </div>
				<script>
					function nowTime() {
						var now = new Date();
						var	h = now.getHours(),
								m = now.getMinutes(),
								ap = h > 11 ? "PM" : "AM";
						h -= h > 12 ? 12 : 0;
						h = ( h < 10 ? "0" : "" ) + h;
						m = ( m < 10 ? "0" : "" ) + m;
						var span = document.getElementById("nowTime");
						span.innerText = h + ":" + m + ap;
					}
					nowTime();
					setInterval( nowTime, 1000 * 60 );
				</script>
				<div class="login">
					<a href="">
						<span class="login_str">LOGIN</span>
					</a>
				</div>
				<div class="login join">
					<a href="">
						<span class="login_str">JOIN</span>
					</a>
				</div>
			</div>
		</div>
		<div id="gnb">
			<div class="depth1_box active">
				<div class="depth2_bg"></div>
				<div class="logo"><h3><a href=""><img src="" alt="호텔 로고"></a></h3></div>
				<ul>
					<li class="line"></li>
					
					<li class="depth1_1">
						<a href="">더 플라자 관리자 모드</a>
					</li>
	
					<li class="line"></li>
	
					
				</ul>
			</div>
		</div>
	</div>

</body>
</html>