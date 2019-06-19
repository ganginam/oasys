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
			$("#home").click(function(){
				location.href="/";
				
			});		
		});
      
      
      </script>
   </head>
   <body>
      <div class="location">
                <ul>
                    <li><a href='/'><img src="/resources/images/hotelImages/logo.png" alt="home" class="logoImage" width="25" height="25"></a></li>
                    <li> > </li>
                    <li><a href=''> 예약하기</a></li>
                    <li> > </li>
                    <li class="current"><a href='/'>결제완료</a></li>
                </ul>
                <h1 class="text-center">예약 및 결제가 완료 되었습니다.</h1>
       </div>
       <br/><br/><br/><br/><br/>
   <div id="content" class="content content-suite">
   <div class="contentContainer container-fluidC">
 		<div class="tbl mb50">
		<table>
			<caption>고객정보</caption>
			<colgroup>
				<col width="20%" />
			</colgroup>
					<tr>
						<th scope="row"><label for="res_cust_nm">성명(한글)</label></th>
						<td><input type="text" id="b_name" name="b_name" value="${data.b_name}" maxlength="5"/>
							<input type="hidden" id="m_no" name="m_no" value="${member.m_no}"/>
							<input type="hidden" id="b_ismember" name="b_ismember" value="회원"/>
							
						</td>
						
					</tr>
					<tr>
						<th scope="row"><label for="email">이메일</label></th>
						<td>					
							<input type="text" id="b_email" name="b_email" value="${data.b_email}"/> 
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="b_phone">휴대폰</label></th>
						<td>
							<input type="text"name="b_phone" id="b_phone" value="${data.b_phone}" />
						</td>
					</tr>	
					<tr>
						<th scope="row"><label for="b_phone">예약번호</label></th>
						<td>
							<input type="text"name="b_phone" id="b_phone" value="${data.b_num}" />
						</td>
					</tr>	
			</table>
	</div>
	<div class="btnCenterGroup">
     <input type="button"  id="home" name="home" value="홈" class="btn btn-primary">
   </div>
   </div>
   </div>
   </body>
</html>