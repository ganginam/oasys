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
      		$("#btn_back").click(function(){
      			window.history.back();
      		});
      		
      		$("#btn_update").click(function(){
      			location.href="/common/update";
      		});
      	});
   </script>
   </head>
	<body>
		<div class="container">
   			<h1>회원 정보</h1>
   			<div>
   				<form class="form-inline">
   					<table class="table">
   						<tr> 
   							<td>아이디</td>
   							<td><input type="text" value="${member.m_id }" readonly="readonly"/></td> 
   						</tr>
   						
   						<tr>
   							<td>이름</td>
   							<td><input type="text" value="${member.m_name }" readonly="readonly"/></td>
   						</tr> 
   						<tr>
   							<td>핸드폰</td>
   							<td>
   								
   								<input type="text" id="m_phone" name="m_phone" value="${member.m_phone }" readonly="readonly"/>
   							</td>
   						</tr>
   						<tr>
   							<td>이메일</td>
   							<td><input type="text" id="m_email" name="m_email" value="${member.m_email }" readonly="readonly"/>
   							</td>
   						</tr>
   						<tr>
   							<td>생년월일</td>
   							<td><input type="text" value="${member.m_birth }" readonly="readonly"/></td>
   						</tr>
   						<tr>
   							<td>성별</td>
   							<td><input type="text" value="${member.m_gender }"/></td>
   						</tr>
   					</table>
   					
   					<div class="text-center">
		   				<input type="button" id="btn_update" value="회원 정보 수정" class="btn btn-default"/>
		   				<input type="button" id="btn_back" value="뒤로 가기"  class="btn btn-default"/>
		   				
   					</div>
   				</form>

   			</div>
   		</div>
	</body>
</html>