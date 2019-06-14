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
			var rangeDate = 31; // set limit day
			var setSdate, setEdate;
			$("#from").datepicker({
				altField: '#b_indate',
			    dateFormat: 'yy-mm-dd',
			    minDate: 0,
			    onSelect: function(selectDate){
			        var stxt = selectDate.split("-");
			            stxt[1] = stxt[1] - 1;
			        var sdate = new Date(stxt[0], stxt[1], stxt[2]);
			        var edate = new Date(stxt[0], stxt[1], stxt[2]);
			            edate.setDate(sdate.getDate() + rangeDate);
			        
			        $('#to').datepicker('option', {
			            minDate: selectDate,
			            beforeShow : function () {
			                $("#to").datepicker( "option", "maxDate", edate );                
			                setSdate = selectDate;
			                console.log(setSdate)
			        }});
			        //to 설정
			    }
			    //from 선택되었을 때
			});			            
			$("#to").datepicker({
				altField: '#b_outdate',
			    dateFormat: 'yy-mm-dd',
			    onSelect : function(selectDate){
			        setEdate = selectDate;
			        console.log(setEdate)
			    }
			});
			
			/*유효성 검사*/
			$('#btn').on('click', function(e){
			 	var t1 = $('div#from').val().split("-");
			    var t2 = $('div#to').val().split("-");
			    var t1date = new Date(t1[0], t1[1], t1[2]);
			    var t2date = new Date(t2[0], t2[1], t2[2]);
			    var diff = t2date - t1date;
			    var currDay = 24 * 60 * 60 * 1000;
			    var b_inDay = parseInt(diff/currDay);
				if($('div#from').val() == ''){
			        alert('시작일을 선택해주세요.');
			        $('div#from').focus();
			        return false;
			    }else if($('div#to').val() == ''){
			        alert('종료일을 선택해주세요.');
			        $('div#to').focus();
			        return false;
			    }else if(parseInt(diff/currDay) > rangeDate){
			    	alert('예약기간은 ' + rangeDate + '일을 초과할 수 없습니다.');        
			        return false;
			    }
			    	
			    	$("#b_inday").val(b_inDay);
			    	
			    	
			    	
			    	$("#f_date").attr({
			    		"method":"get",
			    		"action":"/booking/selectRoom"
			    	});
			    	$("#f_date").submit();
			  
			});			
			//조회 버튼 클릭
		}); //$최종
	</script>
	</head>
	<body>
		<div class="contentContainer container-fluidA">
		
			<form id="f_date" class="form-inline">
			<input type="hidden" id="b_inday" name="b_inday" />
			<input type="hidden" id="b_indate" name="b_indate" />
			<input type="hidden" id="b_outdate" name="b_outdate" />
			<div class="wrap">
				  <div class="form-group">
				      <label>시작일</label>
				      <div id="from"></div>
				  </div>
				  <div class="form-group">
				  	   <label>종료일</label>
				      <div id="to"></div>
				  </div>
				  
				   <div>
				  	<label>객실 수</label>
				  	<select class="form-control" id="b_roomcnt" name="b_roomcnt">
				  	<option value="1">1</option>
				  	<option value="2">2</option>
				  	<option value="3">3</option>
				  	</select>
				
				  	<label>객실 당 인원</label>
				  	<select class="form-control" id="b_persons" name="b_persons">
				  	<option value="1">1</option>
				  	<option value="2">2</option>
				  	<option value="3">3</option>
				  	</select>
				  </div>				  
			</div>	
			<button class="btn btn-primary" id="btn">조회</button>
		</form>
		</div>
	</body>
</html>