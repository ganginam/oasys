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
		
		
		<title>예약조회페이지</title>
		
		<link rel="shortcut icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/icon.png" />
		
		<!-- [if lt IE 9]>
		<script src="../js/html5shiv.js"></script> 
		<![endif]-->
		
		<link href="/resources/include/css/common.css" rel="stylesheet">
		
		<link href="/resources/include/css/default.css" rel="stylesheet">
      
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />
		<!-- Custom styles for this template -->
    	<link href="/resources/include/dist/css/dashboard.css" rel="stylesheet">
    	<link href="/resources/include/css/jquery-ui.css" rel="stylesheet">

		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/jquery-ui.js"></script>
		
		<script type="text/javascript">
		
		$(function(){
			$("#bookingSearchBtn").click(function(){
				$("#f_writeForm").attr({
					"method":"post",
					"action":"/booking/bookingSearch"
				})
				$("#f_writeForm").submit();
			})
		});
		</script>
		
	</head>
	<body>
		<div class="contentContainer container-fluid">
         <div class="contentTit page-header"><h3 class="text-center">예약 조회</h3></div>
         <div class="contentTB text-center">
            <form id="f_writeForm" name="f_writeForm" class="form-horizontal">
            
               <table class="table table-bordered">
                  <colgroup>
                     <col width="20%" />
                     <col width="80%" />
                  </colgroup>
                  <tbody>
                  	<tr>
                  		<th>예약번호 : </th>
                  		<td><input type="text" name="b_num" class="form-control"></td>
                    </tr>
                  	<tr>
                  		<th>예약자 성명 : </th>
                  		<td><input type="text" name="b_name" class="form-control"></td>
                    </tr>
                    <tr>
                  		<th>예약자 번호 : </th>
                  		<td><input type="text" name="b_phone" class="form-control"></td>
                    </tr>
                  </tbody>
               </table>
               <div class="text-right">
               <input type="button" value="조회" id="bookingSearchBtn"  class="btn btn-primary">
               <input type="reset" value="취소" id="CancelBtn"  class="btn btn-primary">
            </div>
            </form>
         </div>
      </div>
      
      <!-- <div class="modal fade" id="bookingModal" tabindex="-1" role="dialog" aria-labelledby="bookingModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="bookingModalLabel">예약 상세정보</h4>
	      </div>
	      <div class="modal-body">
	        <form id="f_resultBooking" name="f_resultBooking">
	          <div class="form-group">
	            <label for="b_num" class="control-label">예약 번호</label>
	            <input type="text" class="form-control" name="b_num" id="b_num" value="" readonly="readonly"/>
	          </div>
	          <div class="form-group">
	            <label for="b_name" class="control-label">예약자 번호</label>
	            <input type="text" class="form-control" name="b_phone" id="b_phone" value="" readonly="readonly"/>
	          </div>
	          <div class="form-group">
	            <label for="b_name" class="control-label">예약자명</label>
	            <input type="text" class="form-control" name="b_name" id="b_name" value="" readonly="readonly"/>
	          </div>
	          <div class="form-group">
	            <label for="rg_grade" class="control-label">객실등급</label>
	            <input type="text" class="form-control" name="rg_grade" id="rg_grade" value="" readonly="readonly"/>
	          </div>
	          <div class="form-group">
	            <label for="b_indate" class="control-label">입실일자</label>
	            <input type="text" class="form-control" name="b_indate" id="b_indate" value="" readonly="readonly"/>
	          </div>
	          <div class="form-group">
	            <label for="b_outdate" class="control-label">퇴실일자</label>
	            <input type="text" class="form-control" name="b_outdate" id="b_outdate" value="" readonly="readonly"/>
	          </div>
	          <div class="form-group">
	            <label for="rg_price" class="control-label">결제하신 금액</label>
	            <input type="text" class="form-control" name="b_payment" id="rg_price" value="" readonly="readonly"/>
	          </div>
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary" id="cancelBookingbookingBtn" data-button="cancelBookingBtn">예약 취소</button>
	      </div>
	    </div>
	  </div>
	</div> -->
	</body>
</html>