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
					<c:choose>
						<c:when test="${member.m_id != null and member.m_id != ''}">
							<a href="/common/logout">
								<span class="login_str">LOGOUT</span>
							</a>
						</c:when>
						
						<c:otherwise>
							<a href="/common/login">
								<span class="login_str">LOGIN</span>
							</a>
						</c:otherwise>
					</c:choose>
				</div>
				
				<div class="login join">
					<c:choose>
						<c:when test="${member.m_id != null and member.m_id != '' }">
							<a href="/common/info">
								<span class="login_str">INFO</span>
							</a>
						</c:when>
						
						<c:otherwise>
							<a href="/common/check">
								<span class="login_str">JOIN</span>
							</a>
						</c:otherwise>
					</c:choose>
					
				</div>
			</div>
		</div>
		<div id="gnb">
			<div class="depth1_box active">
				<div class="depth2_bg"></div>
				<div class="logo"><h3><a href="/"><img src="/resources/images/hotelImages/logo2.png" alt="호텔 로고" width="45%"></a></h3></div>
				<ul>
					<li class="depth1_1">

						<a href="/">Oasis</a>

						<div class="depth2">
							<div class="depth2_1_1"><a href="">소개</a></div>
							<div class="depth2_1_3"><a href="">오시는 길</a></div>
							<div class="depth2_1_4"><a href="">여행 가이드</a></div>
							<div class="depth2_1_5"><a href="">공지사항</a></div>
						</div>
					</li>
	
					<li class="line"></li>
	
					<li class="depth1_3">
						<a href="">객실</a>
						<div class="depth2">
							<div class="depth2_3_1"><a href="/roomGrade/showRooms">전체보기</a></div>
							<div class="depth2_3_2"><a href="/roomGrade/showDeluxe">디럭스</a></div>
							<div class="depth2_3_3"><a href="/roomGrade/showDeluxeDubble">디럭스 트윈</a></div>
							<div class="depth2_3_3"><a href="/roomGrade/showSuite">스위트</a></div>
							<div class="depth2_3_4"><a href="/roomGrade/showSuiteFamilly">스위트 패밀리</a></div>
						</div>
					</li>
	
					<li class="line"></li>
	
					<li class="depth1_5">
						<a href="">예약</a>
						<div class="depth2">
							<div class="depth2_5_1"><a href="/client/booking/booking">예약하기</a></div>
							<div class="depth2_5_3"><a href="">예약조회</a></div>
						</div>
					</li>
	
					<li class="line"></li>
	
					<li class="depth1_6">
						<a href="">부대시설</a>
						<div class="depth2">
							<div class="depth2_6_3"><a href="">휘트니스클럽</a></div>
							<div class="depth2_6_4"><a href="">스파</a></div>
							<div class="depth2_6_5"><a href="">수영장</a></div>
						</div>
					</li>
	
					<li class="line"></li>
	
					<li class="depth1_7"><a href="">멤버십</a></li>
	
					<li class="line"></li>
	
					<li class="depth1_8">
						<a href="">컨시어지</a>
						<div class="depth2">
							<div class="depth2_8_2"><a href="">층별 안내</a></div>
							<div class="depth2_8_4"><a href="">자주하는 질문</a></div>
							<div class="depth2_8_3"><a href="">문의하기</a></div>
							<div class="depth2_8_4"><a href="/review/reviewList">후기</a></div>
						</div>
					</li>
				</ul>
				<div class="reservation"><a href="/client/booking/booking" id="btn_reservation">예약하기</a></div>
			</div>
		</div>
	</div>

</body>
</html>