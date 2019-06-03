<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
      
      <title>ASDF</title>
      
      <link rel="shortcut icon" href="/resources/images/icon.png" />
      <link rel="apple-touch-icon" href="/resources/images/icon.png" />
      
      <!-- <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet"> -->

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
			});
		</script>
   </head>
	<body>
		<div class="container">
			<h1>로그인</h1>
			<div>
				<c:if test="${login.m_id == null or login.m_id == '' }">
					<form id="frm_login" class="form-horizontal">
					
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
							<input type="button" id="btn_login" name="btn_login" value="로그인" class="btn btn-default"/>
							<input type="button" id="btn_join" name="btn_join" value="회원가입" class="btn btn-default"/>
							<input type="button" id="btn_search" name="btn_search" value="아이디/패스워드 찾기" class="btn btn-default"/>
						</div>	
					</form>
				</c:if>
				
				<c:if test="${login.m_id != null and login.m_id != '' }">
					<fieldset>
						<legend>
							<strong>${login.m_name }님 환영합니다.</strong>
						</legend>
						<input type="button" id="btn_logout" name="btn_logout" value="로그아웃" class="btn btn-default"/>
						<input type="button" id="btn_updateForm" name="btn_updateForm" value="회원 정보 수정" class="btn btn-default"/>
						<input type="button" id="btn_home" name="btn_home" value="홈" class="btn btn-default"/>
					</fieldset>
				</c:if>
			</div>
		</div>
		
	</body>
</html>