<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
      <link rel="stylesheet" type="text/css" href="/resources/include/css/default.css"/>
      
      <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
      <script type="text/javascript" src="/resources/include/js/common.js"></script>
      <script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
      <script type="text/javascript">
      var value = "";
      	$(function(){
      		var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

      		$("#btn_send").click(function(){
      			if(!emailRule.test($("#tomail").val())){
      				alert("이메일을 입력해주세요");
      				$("#btn_send").focus();
      			}else{
      				alert("메일이 발송되었습니다.");
      			}
      			$.ajax({
					async:true,
					type:"post",
					data:"tomail="+$("#tomail").val(),
					url:"/common/mailSending",
					dataType:"text",
					success:function(data){
						console.log(data);
						value = data;
					},
					error:function(){
						alert("잠시후에 다시 시도해주세요");
					}
				}); 
				//codeCheck();
      		});
      		
      		/* function codeCheck(){
      			var def = new $.Deferred();
      			
      			$.ajax({
					async:true,
					type:"post",
					data:"tomail="+$("#tomail").val(),
					url:"/mail/mailSending",
					dataType:"text",
					success:function(data){
						console.log(data);
						//if(data==$("#code").val()){
						def.resolve(data);
						//	alert("동일한 코드입니다.");
						//}else{
						//	alert("코드가 일치하지 않습니다.");
						//}
					},
					error:function(){
						alert("시스템 오류입니다.");
					}
				});
      			return def.promise();
      		} */
      		
      		$("#btn_codeCheck").click(function(){
      			if($("#code").val().replace(/\s/g,"")==""){
      				alert("코드를 입력해주세요");
      				$("#code").focus();
      			}else{
      				//codeCheck().then(function(data){
      					console.log(value);
      					if(value==$("#code").val()){
							alert("[성공]\n코드가 일치합니다.");
							window.close();
							opener.document.frm_join.emailSuccess.value = '인증완료';
							$("#emailSuccess", opener.document).css("color", "blue");
						}else{
							alert("[실패]\n코드가 일치하지않습니다.");
							opener.document.frm_join.emailSuccess.value = '인증실패';
							$("#emailSuccess", opener.document).css("color", "red");
							
						}
      				//});
      			}
      		});
      	});
      	
      	function getParentText(){
      		//var sum_email = "";
      		document.getElementById("tomail").value = 
      			opener.document.getElementById("m_email").value + "@" + opener.document.getElementById("m_emailTail").value;
      	}
   </script>
   </head>
	<body>
		<div class="container">
		  <h4>메일 보내기</h4> 
		  <form method="post">
		    <div align="center"><!-- 받는 사람 이메일 -->
		    	<!--  -->
		      <input type="text" id="tomail" name="tomail" size="120" style="width:100%" class="form-control" readonly="readonly">
		    </div>
		  		 <label>코드 체크</label>
				<input type="text" id="code" name="code"/>
		    <div align="center">
		    	 
		      <input type="button" id="btn_send" value="메일 전송" class="btn btn-default" onclick="getParentText()">
		      <input type="button" id="btn_codeCheck" name="btn_codeCheck" value="확인" class="btn btn-default"/>
		    </div>

		  </form>
		  
		  	<div class="container">
		  		
			</div>
			
		</div>
		
		
	</body>
</html>