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
			$("#goPayment").click(function(){
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
		
	<div class="contentContainer container-fluidA">		
		<div>			
			<form id="frm_bdata" class="form-horizontal">	
			<table class="table">
				<colgroup>
                     <col width="50%" />
                     <col width="50%" />
				</colgroup>
				<tr>
					<td>						
							<img id="detailimg" src="/uploadStorage/roomGrade/${detail.image1}" width="300px" /><br/>					
							<div class="form-group">
								<input type="text" id="b_indate" name="b_indate" value="${data.b_indate}" readonly="readonly"/>~
								<input type="text" id="b_outdate" name="b_outdate" value="${data.b_outdate}" readonly=readonly/>
								총 <input type="text" id="b_inday" name="b_inday" value="${data.b_inday}"/> 박
							</div>	
							<div class="form-group">
								<label class="col-sm-2 control-label">1박 가격:</label>
								<div class="col-sm-10">
									<input type="text"	id="rg_grade" name="rg_grade" value="${detail.rg_grade}" readonly="readonly"/>
									<input type="text" id="rg_price" name="rg_price" value="${detail.rg_price}" />KRW
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">객실 수 : </label>
								 <div class="col-sm-10">
									<input type="text"	id="b_roomcnt" name="b_roomcnt" value="${data.b_roomcnt}" readonly="readonly" />
								</div>	
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">객실 당 인원 수 :</label> 
								 <div class="col-sm-10">
									<input type="text" id="b_persons" name="b_persons" value="${data.b_persons}" readonly="readonly" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">총 가격:</label>
							 	<div class="col-sm-10"> 
									<input type="text" id="b_payment" name="b_payment" value="${data.b_roomcnt * detail.rg_price * data.b_inday} KRW" readonly="readonly" />
								</div>
							</div>
					</td>
					<td>
						<div>
				               	<table class="table table-bordered">
					                 <colgroup>
					                    <col width="20%" />
					                    <col width="80%" />
					                  </colgroup>
					                <c:if test="${member.m_name != null and member.m_name != '' }">
				                  	<tbody>
				                  		
					                  	<tr>						        				             
					                  		<th>예약 성명 : </th>					                  		
					                  		<td><input type="text" id="b_name" name="b_name" value="${member.m_name}"/>
					                  		<input type="hidden" id="m_no" name="m_no" value="${member.m_no}"/>
					                  		<input type="hidden" id="b_ismember" name="b_ismember" value="회원" />
					                  		</td>
					                  	</tr>	
					                    <tr>
					                    	<th>고객 전화번호 : </th>
					                    	<td><input type="text" id="b_phone" name="b_phone" value="${member.m_phone}" /></td>
					                    </tr>
					                    <tr>
					                    	<th>이 &nbsp;메&nbsp; 일 : </th>
					                    	<td><input type="text" id="b_email" name="b_email" value="${member.m_email}" /></td>
					                    </tr>
				                  </tbody>
				                  </c:if>
				                  <c:if test="${member.m_name == null or member.m_name == ''}">
				                  <tbody>
					                  	<tr>
					                  		<th>예약 성명 : </th>
					                  		<td><input type="text" id="b_name" name="b_name"/>
					                  		<input type="hidden" id="b_ismember" name="b_ismember" value="비회원" />
					                  		</td>
					                  	</tr>	
					                    <tr>
					                    	<th>고객 전화번호 : </th>
					                    	<td><input type="text" id="b_phone" name="b_phone"/></td>
					                    </tr>
					                    <tr>
					                    	<th>이 &nbsp;메&nbsp; 일 : </th>
					                    	<td><input type="text" id="b_email" name="b_email"/></td>
					                    </tr>
				                  </tbody>
				                  </c:if>
				               </table>
					              <div>
					               <table class="table table-bordered">
					                  <colgroup>
					                     <col width="20%" />
					                     <col width="80%" />
					                  </colgroup>
					                  <tbody>
					                  	<tr>
					                  		<th>결제 수단 선택 : </th>
					                  		<td>
					                  			<select name="p_method">
					                  				<option value="card">카드</option>
					                  				<option value="cash">무통장입금</option>
					                  			</select>
					                  		</td>
					                  	</tr>
					                  	<tr>
					                  		<th>총 결제금액 : </th>	
					                  		<td><input type="text" name="b_pay" id="b_pay" value="${data.b_roomcnt * detail.rg_price * data.b_inday} KRW" readonly="readonly"></td>
					                  	</tr>
					                  </tbody>
					               </table>
					             </div>
				               <div class="text-right">
				                  <input type="button" value="결제 및 예약" id="goPayment"  class="btn btn-primary">
				                  <input type="reset" value="취소" id="cancelPayment"  class="btn btn-primary">
				               </div>
						</div>	
					</td>								
				</tr>			
			</table>		
			</form>
		</div>	
	</div> 
	</body>
</html>