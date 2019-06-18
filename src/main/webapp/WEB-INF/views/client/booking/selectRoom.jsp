<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
      <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
      <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />
      <link rel="stylesheet" type="text/css" href="/resources/include/css/lightbox.css"/>
      <link rel="stylesheet" type="text/css" href="/resources/include/css/default.css"/>
      <link rel="stylesheet" type="text/css" href="/resources/include/css/selectroom.css"/>
      
      <!-- Custom styles for this template -->
       <link href="/resources/include/dist/css/dashboard.css" rel="stylesheet">
      <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
      <script type="text/javascript" src="/resources/include/js/common.js"></script>
      <script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
      <style type="text/css">       
      </style>
      <script type="text/javascript">
      $(function(){
			$(".goDetail").click(function(){
				var rg_grade = $(this).parents("tr").attr("data-name");
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
			$(".goJSP").click(function(){
				
				var grade = $(this).parents("tr").attr("data-name");
				console.log(grade);
				if(grade=="디럭스(CITY)"||grade=="디럭스(RIVER)"){
					location.href="/roomGrade/showDeluxe";
				}else if(grade=="디럭스 트윈(CITY)"||grade=="디럭스 트윈(RIVER)"){
					location.href="/roomGrade/showDeluxeDubble";
				}else if(grade=="스위트(CITY)"||grade=="스위트(RIVER)"){
					location.href ="/roomGrade/showSuite"
				}else if(grade=="스위트 패밀리(CITY)"||grade=="스위트 패밀리(RIVER)"){
					location.href = "/roomGrade/showSuiteFamilly";
				}
			})
		}); //$최종		

      </script>
   </head>
   <body>
      <div class="location">
                <ul>
                    <li><a href='/'><img src="/resources/images/hotelImages/logo.png" alt="home" class="logoImage" width="25" height="25"></a></li>
                    <li> > </li>
                    <li><a href='/booking/booking'> 예약하기 </a></li>
                    <li> > </li>
                    <li class="current"><a href='/booking/selectRoom'>객실선택</a></li>
                </ul>
                <h1 class="text-center">객실 선택</h1>
       </div>
       <br/><br/><br/><br/><br/>
   <div id="content" class="content content-suite">
      		<div class="contentContainer container-fluidA">
			<form id="b_data" name="b_data">
				<input type="hidden" id="rg_grade" name="rg_grade" />
				<input type="hidden" id="b_indate" name="b_indate" value="${data.b_indate}" />
				<input type="hidden" id="b_outdate" name="b_outdate" value="${data.b_outdate}"/>
				<input type="hidden" id="b_inday" name="b_inday" value="${data.b_inday}" />
				<input type="hidden" id="b_roomcnt" name="b_roomcnt" value="${data.b_roomcnt}"/>
				<input type="hidden" id="b_persons" name="b_persons" value="${data.b_persons}" />
			</form>
			<div>
			<div class="reset">
			<table>
				<thead>
					<tr>
						<th>입실일자</th>
						<th>퇴실일자</th>
						<th>뒤로가기</th>
					</tr>
					<tr>
						<td>${data.b_indate}</td>
						<td>${data.b_outdate}</td>
						<td><input type="button" id="reBooking" name="reBooking" value="다시 선택" class="btn btn-success"/> </td>
					</tr>
				</thead>
			</table>
			</div>
			
				<c:choose>
					<c:when test="${not empty roomList}">
					<table>
						<thead>
							<tr>
								<th>객실 등급</th>
								<th>남은 객실 수</th>
								<th>1박당 가격</th>
								<th>대표 이미지</th>
								<!-- <th>선택하세요</th> -->
								
							</tr>
						</thead>
						<tbody>
						<c:forEach var="room" items="${roomList}" varStatus="status">
							<tr data-name="${room.rg_grade}">
								<td class="goDetail" >${room.rg_grade}</td>
								<td class="goDetail" >${room.b_roomcnt}</td>
								<td class="goDetail" >${room.rg_price}</td>
								<td class="goJSP">
									<img alt="로딩중.." src="/resources/images/roomImage/${room.image1}" width="300px">
									<p>이미지 클릭시 해당 객실 상세페이지로 이동합니다.</p>
								</td>
								<!-- <td><input type="button" class="selectRoomBtn btn btn-primary" value="선택" /></td> -->
							</tr>
						</c:forEach>
						</tbody>
					</table>
					</c:when>
					<c:otherwise>
						<div>예약 가능한 방이 존재하지 않습니다.</div>				
					</c:otherwise>
			</c:choose>
			</div>
		</div>
   </div>
   </body>
</html>