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
		<link rel="stylesheet" type="text/css" href="/resources/include/css/bookingClientDetail.css" />
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
			
			$("#goPayment").click(function(){
				console.log("이쿠욧");
				var result = confirm("예약 및 결제를 하시겠습니까?");
				if(result){
					$("#frm_bdata").attr({
						"method":"post",
						"action":"/booking/bookingInsert"
					});
					$("#frm_bdata").submit();
				}else{
					location.reload();
				}
			});
		});//최종 함수
		</script>

	</head>
	<body>
	<form id="frm_bdata">
	<div class="main">
	<div class="Leftbar">
	<div class="tbl mb50">
	<div class="imgdiv">
		<img alt="asdasd" src="/resources/images/roomImage/${detail.image1}" width="500px">
		<p>이미지 클릭시 해당 객실 상세페이지로 이동합니다.</p>
	</div>
		<table>
			<caption>고객정보</caption>
			<colgroup>
				<col width="20%" />
			</colgroup>
				<c:if test="${member.m_id != null and member.m_id != '' }">
				<tbody>
					<tr>
						<th scope="row"><label for="res_cust_nm">성명(한글)</label></th>
						<td><input type="text" id="b_name" name="b_ name res_cust_nm" maxlength="5"/>
							<input type="hidden" id="m_no" name="m_no" value="${member.m_no}"/>
						</td>
						
					</tr>
					<tr>
						<th scope="row"><label for="email">이메일</label></th>
						<td>					
							<input type="text" id="b_email" name="b_email"/> 
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="b_phone">휴대폰</label></th>
						<td>
							<input type="text"name="b_phone" id="b_phone">
						</td>
					</tr>
				</tbody>
				</c:if>
				
				<c:if test="${member.m_id == null or member.m_id == '' }">
				<tbody>
					<tr>
						<th scope="row"><label for="res_cust_nm">성명(한글)</label></th>
						<td><input type="text" id="b_name" name="b_ name res_cust_nm" maxlength="5"/></td>
					</tr>
					<tr>
						<th scope="row"><label for="email">이메일</label></th>
						<td>					
							<input type="text" id="b_email" name="b_email"/> 
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="b_phone">휴대폰</label></th>
						<td>
							<input type="text"name="b_phone" id="b_phone">
						</td>
					</tr>
				</tbody>
				</c:if>
			</table>
	</div>
	</div>
	<div class="RightBar">
	<div id="_tip_box_item"></div>
	<ul class="summary">
		<li>
			<div class="tit">01. 일정</div>
			<div class="cont">
				<table class="normal">
				<caption>일정 선택</caption>
				<colgroup>
					<col width="23%" />
					<col width="34%" />
					<col width="43%" />
				</colgroup>
					<tr>
						<th scope="row"><label for="">체크인</label></th>
						<td colspan="2"><input type="text" value="${data.b_indate}" readonly /></td>
					</tr>
					<tr>
						<th scope="row"><label for="">체크아웃</label></th>
						<td colspan="2"><input type="text" value="${data.b_outdate}" readonly /></td>
					</tr>
					<tr>
						<th scope="row"><label for="">박수</label></th>
						<td colspan="2"><input type="text" value="${data.b_inday}" class="w03" readonly /> 박</td>
					</tr>
					<tr>
						<th scope="row"><label for="room_cnt">객실수</label></th>
						<td colspan="2">
							<input type="text" name="room_cnt" id="room_cnt" style="width:80px" value="${data.b_roomcnt}" readonly>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="room_adult_num">인원수</label></th>
						<td>
							<input type="text" name="room_adult_num" class="w30" value="${data.b_persons}" readonly>
						</td>
					</tr>
				</table>
			</div>
		</li>
		<li>
			<div class="tit">02. 객실</div>
			<div class="cont">
				<strong class="rooms">${detail.rg_grade}</strong>
				<ul class="lr">
					<li>
						<span></span>						
					</li>
					<li>
						<strong>${data.b_indate}&nbsp;&nbsp;</strong>
						<strong class="ri_charge">${detail.rg_price}원&nbsp;</strong>
						<br />
					</li>
				</ul>
			</div>
		</li>
	</ul>
	<div class="totalPrice">
		<span>요금합계</span>
		<strong id="price_total">${data.b_roomcnt * detail.rg_price * data.b_inday}원</strong>
	</div>
	<div class="btnCenterGroup">
		<a href="" class="btn powderblue btn_s">이전</a>
		<a href="/roomGrade/showDeluxe" class="btn powderblue btn_s">결제하기</a></span>
	</div>
	</div>
	</div>
	</form>
	</body>
</html>