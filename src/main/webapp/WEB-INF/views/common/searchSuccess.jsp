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
      <link rel="stylesheet" type="text/css" href="/resources/include/css/showroom.css"/>
      
      <!-- Custom styles for this template -->
       <link href="/resources/include/dist/css/dashboard.css" rel="stylesheet">
      <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
      <script type="text/javascript" src="/resources/include/js/common.js"></script>
      <script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
      <style type="text/css">
         
         
         
      </style>
       <script type="text/javascript">
      
      	$(function(){
      		$("#send").click(function(){
      			location.href="/mail/mailIdSearch";
      		});
      	});
   </script>
   </head>
   <body>
      <div class="location">
                <ul>
                    <li><a href='/'><img src="/resources/images/hotelImages/logo.png" alt="home" class="logoImage" width="25" height="25"></a></li>
                    <li> > </li>
                    <li><a href=''> 메뉴대분류이름 </a></li>
                    <li> > </li>
                    <li class="current"><a href='/'>ID/PW 찾기</a></li>
                </ul>
                <h1 class="text-center">ID/PW 찾기</h1>
       </div>
       <br/><br/><br/><br/><br/>
   <div id="content" class="content content-suite">
		<c:if test="${member.m_pwd == null }">
			<h1>귀하의 아이디는  <span style="color:orange;">[${member.m_id }]</span> 입니다.</h1>
		</c:if>
			 
		<c:if test="${member.m_id != null and member.m_pwd != null }">
			<h1><span style="color:oragne;">[${member.m_id }]</span>의 비밀번호는 <span style="color:oragne;">[${member.m_pwd }]</span> 입니다.</h1>
		</c:if>
		<!-- <input type="button" id="send" value="전송"/> -->
   </div>
   </body>
</html>