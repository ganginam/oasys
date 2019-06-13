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
      		$(function(){
      			var passwd = $("#m_pwd").val();
      			var passwd2 = $("#m_pwd2").val();
      			
      			$("#btn_update").click(function(){
      				if(!chkData("#m_pwd", "변경할 비밀번호를")) return;
      				else if(!chkData("#m_pwd2", "변경할 비밀번호 확인을")) return;
      				else if($("#m_pwd").val()!=$("#m_pwd2").val()){
      					alert("변경할 비밀번호가 일치하지 않습니다.");
      				}
      				else{
      					$("#frm_update").attr({
      						"method":"post",
      						"action":"/common/memberUpdate"
      					});
      					$("#frm_update").submit();
      				}
      			});
      		});
   </script>
   </head>
	<body>
		<div class="container">
			<form id="frm_update" class="form-inlin">
				<table class="table">
					<tr>
						<td><input type="text" name="m_id" id="m_id" value="${member.m_id }"/></td>
					<tr>
						<td><label>변경할 비밀번호</label></td>
						<td><input type="password" id="m_pwd" name="m_pwd" /></td>
					</tr>
					<tr>
						<td><label>변경할 비밀번호 확인</label></td>
						<td><input type="password" id="m_pwd2" name="m_pwd2"/></td>
					</tr>
				</table>
				
				<div class="text-center">
					<input type="button" id="btn_update" value="확인" class="btn btn-default"/>
					<input type="reset" value="초기화" class="btn btn-default"/>
				</div>
			</form>
		</div>
	</body>
</html>