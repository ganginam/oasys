<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="email" value="${fn:split(member.m_email, '@') }"/>
<%-- <c:set var="phone" value="${fn:split(member.m_phone, '-' }"/> --%>
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
      		//비밀번호 값
      		var passwd = $("#m_pwd").val();
      		//비밀번호 확인 값
			var passwd2 = $("#m_pwd2").val();
		
      		//핸드폰번호 나누기
      		var beforeStr = "${member.m_phone}";
      		var afterStr = beforeStr.split("-");
      		
      		//기존 비밀번호 값
			var oldPwd = "${member.m_pwd}";
		
			var sum_phone = $("#first").val()+"-"+$("#middle").val()+"-"+$("#last").val();
			$("#sum_phone").val(sum_phone);
			
			var email = "${email[1]}";
      		$("#selectEmail").val(email).prop("selected", "true");
			
			$("#m_pwd").keyup(function(){
				//아이디 값
	      		/* var userId = "${login.m_id}";
				if(passwd.indexOf(userId) > -1){
					$("#check").html("비밀번호에 아이디를 포함할  수 없습니다.");
					$("#check").attr("color", "#FF0000");
				} */
				$("#chkNotice").html("");
			});
			
			$("#m_pwd2").keyup(function(){
				if($("#m_pwd").val() != $("#m_pwd2").val()){
					$("#chkNotice").html("비밀번호가 일치하지 않습니다.");
					$("#chkNotice").attr("color", "#FF0000");
				}else{
					$("#chkNotice").html("비밀번호가 일치합니다.");
					$("#chkNotice").attr("color", "#0054FF");
				}
			});
			
			$("#m_oldPwd").keyup(function(){
				if($("#m_oldPwd").val() != oldPwd){
					$("#chkOld").html("기존 비밀번호가 일치하지 않습니다.");
					$("#chkOld").attr("color", "#FF0000");
				}else{
					$("#chkOld").html("기존 비밀번호가 일치합니다.");
					$("#chkOld").attr("color", "#0054FF");
				}
			});
			
			//email select
			$("#selectEmail").change(function(){
		 		if($(this).val()==1){
		 			$("#emailTail").val("");
		 			$("#emailTail").focus();
		 		} else{
		 			$("#emailTail").val($(this).val());
		 			//$("#emailTail").attr("readonly", true);
		 		}
		 	});
			
      		$("#btn_update").click(function(){
      			if(!chkData("#m_oldPwd", "기존 비밀번호를")) return;
      			else if(!chkData("#m_pwd", "변경할 비밀번호를")) return;
      			else if(!chkData("#m_pwd2", "변경할 비밀번호를 다시 한번")) return;
      			else if(!chkData("#m_phone", "변경할 핸드폰 번호를")) return;
      			else if(!chkData("#email", "변경할 이메일을")) return;
      			else if(!chkData("#emailTail", "변경할 이메일 뒷주소를")) return;	
      			else{
      				var sum_email = $("#email").val()+"@"+$("#emailTail").val();
      				$("#m_email").val(sum_email); 
      				
      				$("#frm_update").attr({
      					"method":"post",
      					"action":"/common/memberUpdate"
      				});
      				$("#frm_update").submit();
      			}
      		});
      		 
      		
			
      		$("#btn_back").click(function(){
      			location.href="/";
      		});
      		
      		$("#btn_delete").click(function(){
      			location.href="/common/delete";
      		});
      		
      	
      	});	//최상위 $종료
    	
      	function idPwdCheck(){
      		
      		if(userPwd.indexOf(userId) > -1){
      			alert("비밀번호에 아이디를 포함할 수 없습니다.");
      		}
      	}
   </script>
   </head>
	<body>
		<div class="container">
   			<h1>회원가입</h1>
   			<div>
   				<form id="frm_update" class="form-inline">
   					<table class="table">
   						<tr> 
   							<td>아이디</td>
   							<td><input type="text" value="${member.m_id }" readonly="readonly"/></td> 
   						</tr>
   						<tr>
   							<td>기존 비밀번호</td>
   							<td><input type="password" id="m_oldPwd" name="m_oldPwd" placeholder="기존 비밀번호를 입력해주세요"/>
   								<font id="chkOld" size="2"></font>
   							</td>
   						</tr>
   						<tr>
   							<td>변경할 비밀번호</td>
   							<td><input type="password" id="m_pwd" name="m_pwd" placeholder="비밀번호를 입력해주세요"/>
   								<font id="check" size="2"></font>
   							</td>
   						</tr>
   						<tr>
   							<td>비밀번호 확인</td>
   							<td><input type="password" id="m_pwd2" name="m_pwd2" placeholder="동일한 비밀번호를 입력해주세요"/>
   								<font id="chkNotice" size="2"></font>
   							</td>
   						</tr>
   						<tr>
   							<td>이름</td>
   							<td><input type="text" value="${member.m_name }" readonly="readonly"/></td>
   						</tr> 
   						<tr>
   							<td>핸드폰</td>
   							<td>
   								<%-- <input type="text" id="first" name="first" value="${phone[0]}"/>
   								<label>-</label>
   								<input type="text" id="middle" name="middle" value="${phone[1]}"/>
   								<label>-</label>
   								<input type="text" id="last" name="last" value="${phone[2]}"/> --%>
   								<input type="text" id="m_phone" name="m_phone" value="${member.m_phone }"/>
   							</td>
   						</tr>
   						<tr>
   							<td>이메일</td>
   							<td><input type="text" id="email" name="email" value="${email[0] }"/>@
   								<input type="text" id="emailTail" name="emailTail"/>
   								<select id="selectEmail" name="selectEmail">
   									<option value="">직접입력</option>
   									<option value="naver.com">naver</option>
   									<option value="daum.net">daum</option>
   									<option value="nate.com">nate</option>
   									<option value="google.com">google</option>
   									<option value="hanmail.com">hanmail</option>
   								</select>
   								<input type="hidden" id="m_email" name="m_email"/>
   								<input type="button" id="emailCheck" name="emailCheck" value="인증하기"/>
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
		   				<input type="button" id="btn_update" class="btn btn-default" value="수정 완료"/>
		   				<input type="reset" id="reset" value="초기화" class="btn btn-default"/>
		   				<input type="button" id="btn_back" value="뒤로 가기"  class="btn btn-default"/>
		   				<input type="button" id="btn_delete" value="회원 탈퇴" class="btn btn-danger"/>
   					</div>
   				</form>

   			</div>
   		</div>

	</body>
</html>