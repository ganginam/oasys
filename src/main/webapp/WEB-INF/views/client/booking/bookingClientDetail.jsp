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
      <link rel="stylesheet" type="text/css" href="/resources/include/css/bookingClientDetail.css" />
      

      <!-- Custom styles for this template -->
       <link href="/resources/include/dist/css/dashboard.css" rel="stylesheet">
      <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
      <script type="text/javascript" src="/resources/include/js/common.js"></script>
      <script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
      <style type="text/css">
  
      </style>
      <script type="text/javascript">
  	$(function(){		
		$("#goPayment").click(function(){
			if(!chkSubmit($('#b_name'), "예약명을")) return;
			else if(!chkSubmit($('#b_email'), "이메일을")) return;
			else if(!chkSubmit($('#b_phone'), "핸드폰 번호를")) return;
			else{
				var result = confirm("예약 및 결제를 하시겠습니까?");
				if(result){
					$.ajax({
						url : "/booking/bookingInsert",
						type : "post",
						data : $("#frm_bdata").serialize(),
						datatype : "text",
						error : function(){
							alert('시스템 오류입니다. 관리자에게 문의하세요.');
						},
						success : function(result){
							var goUrl="";
							console.log(result);
							var txt = result.split(",");
							console.log(txt[0] + "," + txt[1]);
							if(txt[0]=="1"){
								goUrl = "/booking/complete";
							}
							$("#frm_bdata").attr({
								"action":goUrl+"?b_num="+txt[1],
								"method":"POST"
							});
							$("#frm_bdata").submit();
						}
					});
				
				}else{
					location.reload();
				}
			}
		});	
	});//최종 함수
      </script>
   </head>
   <body>
      <div class="location">
                <ul>
                    <li><a href='/'><img src="/resources/images/hotelImages/logo.png" alt="home" class="logoImage" width="25" height="25"></a></li>
                    <li> > </li>
                    <li><a href='/booking/booking'> 예약하기 </a></li>
                    <li> > </li>
                    <li class="current"><a href='/booking/selectRoom'>객실 선택</a></li>
                    <li> > </li>
                    <li class="current"><a href='/booking/bookingClientDetail'>예약 세부사항</a></li>
                </ul>
                <h1 class="text-center">예약 세부사항</h1>
       </div>
       <br/><br/><br/><br/><br/>
   <div id="content" class="content content-suite">
   	<div class="contentContainer container-fluidB">
    		<form id="frm_bdata">
	<div class="main">
	<div class="Leftbar">
	<div class="tbl">
	<div class="imgdiv">
		<img alt="asdasd" src="/resources/images/roomImage/${detail.image1}" width="500px">	
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
						<td><input type="text" id="b_name" name="b_name" value="${member.m_name}" maxlength="5"/>
							<input type="hidden" id="m_no" name="m_no" value="${member.m_no}"/>
							<input type="hidden" id="b_ismember" name="b_ismember" value="회원"/>
							
						</td>
						
					</tr>
					<tr>
						<th scope="row"><label for="email">이메일</label></th>
						<td>					
							<input type="text" id="b_email" name="b_email" value="${member.m_email}"/> 
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="b_phone">휴대폰</label></th>
						<td>
							<input type="text"name="b_phone" id="b_phone" value="${member.m_phone}" />
						</td>
					</tr>
				</tbody>
				</c:if>
				
				<c:if test="${member.m_id == null or member.m_id == '' }">
				<tbody>
					<tr>
						<th scope="row"><label for="res_cust_nm">성명(한글)</label></th>
						<td><input type="text" id="b_name" name="b_name" maxlength="5"/>
							<input type="hidden" id="b_ismember" name="b_ismember" value="비회원"/>
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
						<td colspan="2"><input type="text" id="b_indate" name="b_indate" value="${data.b_indate}" readonly /></td>
					</tr>
					<tr>
						<th scope="row"><label for="">체크아웃</label></th>
						<td colspan="2"><input type="text" id="b_outdate" name="b_outdate" value="${data.b_outdate}" readonly /></td>
					</tr>
					<tr>
						<th scope="row"><label for="">박수</label></th>
						<td colspan="2"><input type="text" id="b_inday" name="b_inday" value="${data.b_inday}" class="w03" readonly /> 박</td>
					</tr>
					<tr>
						<th scope="row"><label for="room_cnt">객실수</label></th>
						<td colspan="2">
							<input type="text" name="b_roomcnt" id="b_roomcnt" style="width:80px" value="${data.b_roomcnt}" readonly>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="room_adult_num">인원수</label></th>
						<td>
							<input type="text" id="b_persons" name="b_persons" class="w30" value="${data.b_persons}" readonly>
						</td>
					</tr>
				</table>
			</div>
		</li>
		<li>
			<div class="tit">02. 객실</div>
			<div class="cont">
			<strong class="rooms">${detail.rg_grade}</strong>
			<input type="hidden" id="rg_grade" name="rg_grade" value="${detail.rg_grade}"/>
				<ul class="lr">
					<li>
						<span></span>						
					</li>
					<li>
						<strong>${data.b_indate}&nbsp;&nbsp;</strong>
						<strong class="ri_charge">${detail.rg_price}원&nbsp;<br/>회원 등급 ${member.mg_grade}<br/>회원 할인율 ${member.mg_discount}%</strong>
						<input type="hidden" id="rg_price" name="rg_price" value="${detail.rg_price}"/>
						<br />
						
					</li>
				</ul>
			</div>
		</li>
	</ul>

	<div class="totalPrice">
		<br/><label>결제 수단</label>
			<select id="p_method" name="p_method">
			<option value="카드">카드</option>
			<option value="무통장입급">무통장입금</option>
		</select><br/>
		<c:if test="${member.m_id != null and member.m_id != '' }">
		<span>요금합계</span>
		<c:set var="discount" value="${(data.b_roomcnt * detail.rg_price * data.b_inday)*(member.mg_discount/100)}" />
		<strong>${data.b_roomcnt * detail.rg_price * data.b_inday-discount} 원</strong>
		<input type="hidden" id="p_pay" name="p_pay" value="${data.b_roomcnt * detail.rg_price * data.b_inday-discount}" />
		<input type="hidden" id="b_payment" name="b_payment" value="${data.b_roomcnt * detail.rg_price * data.b_inday}" />
		</c:if>
		
		<c:if test="${member.m_id == null or member.m_id == '' }">
		<span>요금합계</span>
		<strong>${data.b_roomcnt * detail.rg_price * data.b_inday}원</strong>
		<input type="hidden" id="p_pay" name="p_pay" value="${data.b_roomcnt * detail.rg_price * data.b_inday}"/>
		<input type="hidden" id="b_payment" name="b_payment" value="${data.b_roomcnt * detail.rg_price * data.b_inday}"/>
		</c:if>
	</div>
	<div class="btnCenterGroup">

		<input type="reset" value="취소" class="btn powderblue">
		<input type="button" id="goPayment" value="예약 및 결제" class="btn powderblue">

	</div>
	</div>
	</div>
	</form>
    </div>
   </div>
   </body>
</html>