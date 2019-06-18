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
		<!-- <link rel="stylesheet" type="text/css" href="/resources/include/css/bookingClientDetail.css" /> -->
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
				$("#f_writeForm").attr({
					"method":"post",
					"action":"넣어합니다"
				})
				$("#f_writeForm").submit();
			});		
		});
		
		</script>
		<style type="text/css">
						div .imgdiv{
				margin-bottom:30px;
			}
			input[type=text]{
				padding:5px;
			}
			.tbl{padding:0}
			.tbl table{border-top:2px solid #000}
			.tbl th{border-bottom:1px solid #c9c9c9;font-size:17px;font-family:'nSquare';color:#4d7b9c;}
			.tbl thead th{padding:20px 0 18px 0px;text-align:center;}
			.tbl tbody th{padding:20px 0 18px 25px;vertical-align:top}
			.tbl td{padding:20px 0 18px 35px;border-left:1px solid #c9c9c9;border-bottom:1px solid #c9c9c9;background:#fbfbfb;line-height:1.7}
			.tbl input[type=text]{border:1px solid #999;background-color:#fbfbfb}
			
			 
			.LeftBox	{ float:left; position:relative; width:200px}
			.RightBar{float:right;right:70%;top:0;width:260px;margin-top:-528px;margin-right:200px;}
			ul.summary	{border:3px solid #4d7b9c; margin-bottom:10px; background:#fff }
			ul.summary li	{ position:relative}
			ul.summary li .tit	{ padding:10px 15px; font-weight:600; color: #7595ab; border-bottom:1px dotted #4d7b9c; background:#f9f9f9}
			ul.summary li .cont	{ padding:15px 13px; border-bottom:1px solid #4d7b9c}
			table.normal th	{	font-size:13px; font-weight:400; padding:5px 0;}
			table.normal td	{	font-size:13px; font-weight:400; padding:5px 0;}
			table.normal input[type=text]	{ width:85%; font-size:13px; color:#666; padding-left:5px; border:1px solid #ddd}
			ul.lr li	{ position:relative; font-size:13px; color:#555}
			
			.totalPrice	{ padding:20px 25px; border:3px solid #4d7b9c; background:#f9f9f9; margin-bottom:10px;}
			.totalPrice span	{ float:left; font-weight:600; color: #7595ab;}
			.totalPrice strong	{ float:right; font-weight:500; color:#e84c3d; font-size:15px}
			
			.btnCenterGroup{padding:30px 0 0;background:#fff;text-align:center}
			.btnCenterGroup a{display:inline-block}
			.btn.powderblue{border:2px solid #a4a4a4;background:#fff;line-height:56px;color:#474747; width: 126px; margin-top:-30px;}
			.btn.powderblue:hover{border-color:#4d7b9c;background:#4d7b9c;color:#fff}

		</style>
	</head>
	<body>
	<div class="main">
	<div class="Leftbar">
	<div class="tbl">
	<div class="imgdiv">
		<img alt="asdasd" src="/resources/images/roomImage/${detail.image1}" width="500px">
		<p>이미지 클릭시 해당 객실 상세페이지로 이동합니다.</p>
	</div>
		<table>
			<caption>고객정보</caption>
			<colgroup>
				<col width="20%" />
			</colgroup>
				<tr>
					<th scope="row"><label for="res_cust_nm">성명(한글)</label></th>
					<td><input type="text" name="res_cust_nm" maxlength="5"/></td>
				</tr>
				<tr>
					<th scope="row"><label for="email">이메일</label></th>
					<td>					
						<input type="text"name="mb_email" id="mb_email"/> 
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="mb_phone">휴대폰</label></th>
					<td>
						<input type="text"name="mb_phone1" id="mb_phone1">
					</td>
				</tr>
			</table>
	</div>
	</div>
	<div class="RightBar">
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
		<!-- <a href="" class="btn powderblue">이전</a> -->
		<input type="button" class="btn powderblue" value="이전">
		<!-- <a href="" class="btn powderblue">결제하기</a> -->
		<input type="button"id="goPayment" class="btn powderblue" value="결제하기">
	</div>
	</div>
	</div>
	</body>
</html>