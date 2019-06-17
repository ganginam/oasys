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
      <div class="location">
                <ul>
                    <li><a href='/'><img src="/resources/images/hotelImages/logo.png" alt="home" class="logoImage" width="25" height="25"></a></li>
                    <li> > </li>
                    <li><a href=''> 메뉴대분류이름 </a></li>
                    <li> > </li>
                    <li class="current"><a href='#'>INFO</a></li>
                </ul>
                <h1 class="text-center">회원정보</h1>
       </div>
       <br/><br/><br/><br/><br/>
   <div id="content" class="content content-suite">
 				<div class="container">

   			<div>
   				<form class="form-inline">
   					<table class="table">
   						<tr> 
   							<td><strong>아이디</strong></td>
   							<td>${member.m_id }</td> 
   						</tr>
   						
   						<tr>
   							<td><strong>이름</strong></td>
   							<td>${member.m_name }</td>
   						</tr> 
   						<tr>
   							<td><strong>핸드폰</strong></td>
   							<td>${member.m_phone }</td>
   						</tr>
   						<tr>
   							<td><strong>이메일</strong></td>
   							<td>${member.m_email }</td>
   						</tr>
   						<tr>
   							<td><strong>생년월일</strong></td>
   							<td>${member.m_birth }</td>
   						</tr>
   						<tr>
   							<td><strong>성별</strong></td>
   							<td>${member.m_gender }</td>
   						</tr>
   						<tr>
   							<td><strong>회원 등급</strong></td>
   							<td>${member.mg_grade}</td>
   						</tr>
   						<tr>
   							<td><strong>총 이용 금액</strong></td>
   							<td>${member.m_total }</td>
   						</tr>
   						<tr>
   							<td><strong>올해 이용 금액</strong></td>
   							<td>${member.m_ytotal }</td>
   						</tr>
   					</table>
   					
   					<div class="text-center">
		   				<input type="button" id="btn_update" value="회원 정보 수정" class="btn btn-primary"/>
		   				<input type="button" id="btn_back" value="뒤로 가기"  class="btn btn-default"/>
		   				
   					</div>
   				</form>

   			</div>
   		</div>
   </div>
   </body>
</html>