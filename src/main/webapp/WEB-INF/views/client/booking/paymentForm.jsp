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
			$("#goPayment").click(function(){
				$("#f_writeForm").attr({
					"method":"post",
					"action":"넣어합니다"
				})
				$("#f_writeForm").submit();
			})
			
			
		})
		
	</script>
	</head>
	<body>
		<div class="contentContainer container-fluidA">
			<div>
				<form id="f_writeForm" name="f_writeForm" class="form-horizontal">
            
               <table class="table table-bordered">
                  <colgroup>
                     <col width="20%" />
                     <col width="80%" />
                  </colgroup>
                  <tbody>
                  	<tr>
                  		<th>고객 성명</th>
                  		<td><input type="text" id="b_name" name="b_name"></td>
                  	</tr>	
                    <tr>
                    	<th>고객 번호</th>
                    	<td><input type="text" id="b_phone" name="b_phone"></td>
                    </tr>
                    <tr>
                    	<th>이 &nbsp;메&nbsp; 일</th>
                    	<td><input type="text" id="b_email" name="b_email"></td>
                    </tr>
                  </tbody>
               </table>
	              <div>
	               <table class="table table-bordered">
	                  <colgroup>
	                     <col width="10%" />
	                     <col width="40%" />
	                  </colgroup>
	                  <tbody>
	                  	<tr>
	                  		<th>결제 수단 선택</th>
	                  		<td>
	                  			<select name="p_method">
	                  				<option value="card">카드</option>
	                  				<option value="cash">무통장입금</option>
	                  			</select>
	                  		</td>
	                  	</tr>
	                  	<tr>
	                  		<th>총 결제금액</th>
	                  		<td><input type="text" name="p_pay" id="p_pay" value=""></td>
	                  	</tr>
	                  </tbody>
	               </table>
	             </div>
               <div class="text-right">
                  <input type="button" value="결제" id="goPayment"  class="btn btn-primary">
                  <input type="reset" value="취소" id="cancelPayment"  class="btn btn-primary">
               </div>
            </form>
			</div>
		</div>
	</body>
</html>