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
      <style type="text/css">
  		.container {
  			.center-block();
  			width:300px;
		}
      </style>
      <!-- Custom styles for this template -->
      	<link href="/resources/include/css/common.css" rel="stylesheet">
       <link href="/resources/include/dist/css/dashboard.css" rel="stylesheet">
      <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
      <script type="text/javascript" src="/resources/include/js/common.js"></script>
      <script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
      
	<script type="text/javascript">
			function errorCodeCheck(){
				var codeNumber = "<c:out value='${codeNumber}'/>";
				if(codeNumber != ""){
					switch(parseInt(codeNumber)){
					case 1:
						alert("아이디 또는 비밀번호가 일치하지않습니다.");
						break;
					}
				}
			}
			
			$(function(){
				errorCodeCheck();
				$("#btn_login").click(function(){
					if(!chkData("#m_id", "아이디를")) return;
					else if(!chkData("#m_pwd", "비밀번호를")) return;
					else{
						$("#frm_login").attr({
							"method":"post",
							"action":"/common/login"
						});
						$("#frm_login").submit();
					}
				});
				$("#btn_join").click(function(){
					location.href="/common/check";
				});
				$("#btn_home").click(function(){
					location.href="/";
				});
				$("#btn_logout").click(function(){
					location.href="/common/logout";
				});
				$("#btn_updateForm").click(function(){
					location.href="/common/update";
				});
				$("#btn_search").click(function(){
					location.href="/common/idpwdSearch";
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
                    <li class="current"><a href='login'>로그인</a></li>
                </ul>
                <c:if test="${member.m_id == null or member.m_id=='' }">
                <h1 class="text-center">로그인</h1> 
                </c:if>
       </div>
       <br/><br/><br/><br/><br/>
   <div id="content" class="content content-suite">
      <div class="container">
			<div> 
				<c:if test="${member.m_id == null or member.m_id == '' }">
					<form id="frm_login">  
					
						<div class="form-group">
							<label>아이디</label>
							<div>
								<input type="text" id="m_id" name="m_id" placeholder="아이디를 입력해주세요" class="form-control"/>
							</div>
						</div>

						<div class="form-group">
							<label>비밀번호</label>
							<div>
								<input type="password" id="m_pwd" name="m_pwd" placeholder="비밀번호를 입력해주세요" class="form-control"/>
							</div>
						</div>
						
						<div class="form-group">
							<input type="button" id="btn_login" name="btn_login" value="로그인" class="btn btn-primary"/>  
							<input type="button" id="btn_join" name="btn_join" value="회원가입" class="btn btn-success"/> 
							<br/><br/> 
							<input type="button" id="btn_search" name="btn_search" value="아이디/패스워드 찾기" class="btn btn-default"/>
						</div>	
					</form>
				</c:if>
				
				<c:if test="${member.m_id != null and member.m_id != '' }">
					<fieldset>
						<legend>
							<strong>${member.m_name}님 환영합니다. <span style="color:orange;">[${member.m_type}]</span></strong>
						</legend>
						<input type="button" id="btn_logout" name="btn_logout" value="로그아웃" class="btn btn-danger"/>
						<!-- <input type="button" id="btn_updateForm" name="btn_updateForm" value="회원 정보 수정" class="btn btn-default"/> -->
						<input type="button" id="btn_home" name="btn_home" value="홈" class="btn btn-default"/>
					</fieldset>
				</c:if>
				
				<%-- <c:if test="${member.m_type == '관리자' }">
					<jsp:forward page="admin"></jsp:forward>
				</c:if> --%>
			</div>
		</div>
   </div>
   </body>
</html>