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
      		$("#send").click(function(){
      			location.href="/mail/mailIdSearch";
      		});
      	});
   </script>
   </head>
	<body>
		<c:if test="${member.m_pwd == null }">
			<h1>귀하의 아이디는  [${member.m_id }] 입니다.</h1>
		</c:if>
			
		<c:if test="${member.m_id != null and member.m_pwd != null }">
			<h1>[${member.m_id }]의 비밀번호는 [${member.m_pwd }] 입니다.</h1>
		</c:if>
		<!-- <input type="button" id="send" value="전송"/> -->
	</body>
</html>