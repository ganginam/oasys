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
      		//비밀번호 값
      		var passwd = $("#m_pwd").val();
      		//비밀번호 확인 값
			var passwd2 = $("#m_pwd2").val();
		
      		//핸드폰번호 나누기
      		var beforeStr = "${member.m_phone}";
      		var afterStr = beforeStr.split("-");
      		
      		//기존 비밀번호 값
			var oldpwd = "${member.m_pwd}";
		
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
			
			$("#m_oldpwd").keyup(function(){
				if($("#m_oldpwd").val() != oldpwd){
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
      			if(!chkData("#m_oldpwd", "기존 비밀번호를")) return;
      			else if(!chkData("#m_pwd", "변경할 비밀번호를")) return;
      			else if(!chkData("#m_pwd2", "변경할 비밀번호를 다시 한번")) return;
      			else if(!chkData("#m_phone", "변경할 핸드폰 번호를")) return;
      			/* else if(!chkData("#email", "변경할 이메일을")) return;
      			else if(!chkData("#emailTail", "변경할 이메일 뒷주소를")) return;	 */
      			else{
      				/* var sum_email = $("#email").val()+"@"+$("#emailTail").val();
      				$("#m_email").val(sum_email); */ 
      				
      				$("#frm_update").attr({
      					"method":"post",
      					"action":"/common/memberUpdate"
      				});
      				$("#frm_update").submit();
      			}
      		});
      		 
      		
			
      		$("#btn_back").click(function(){
      			window.history.back();
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
      <div class="location">
                <ul>
                    <li><a href='/'><img src="/resources/images/hotelImages/logo.png" alt="home" class="logoImage" width="25" height="25"></a></li>
                    <li> > </li>
                    <li><a href=''>로그인 </a></li>
                    <li> > </li>
                    <li class="current"><a href='#'>회원 정보 수정</a></li>
                </ul>
                <h1 class="text-center">회원 정보 수정</h1>
       </div>
       <br/><br/><br/><br/><br/>
   <div id="content" class="content content-suite">
      <div class="container">
   			<div>
   				<form id="frm_update" class="form-inline">
   					<table class="table">
   						<tr> 
   							<td>아이디</td>
   							<td>${member.m_id }</td> 
   						</tr>
   						<tr>
   							<td>기존 비밀번호</td>
   							<td><input type="password" id="m_oldpwd" name="m_oldpwd" placeholder="기존 비밀번호를 입력해주세요"/>
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
   							<td>${member.m_name }</td>
   						</tr> 
   						<tr>
   							<td>핸드폰</td>
   							<td>
   								<%-- <input type="text" id="first" name="first" value="${phone[0]}"/>
   								<label>-</label>
   								<input type="text" id="middle" name="middle" value="${phone[1]}"/>
   								<label>-</label>
   								<input type="text" id="last" name="last" value="${phone[2]}"/> --%>
   								<input type="text" id="m_phone" name="m_phone" value="${member.m_phone }" maxlength="13"/>
   								<label> - 를 넣어서 입력해주세요</label>
   							</td>
   						</tr>
   						<tr>
   							<td>이메일</td>
   							<td><input type="text" id="m_email" name="m_email" value="${member.m_email }"/></td>
   						</tr>
   						<tr>
   							<td>생년월일</td>
   							<td>${member.m_birth }</td>
   						</tr>
   						<tr>
   							<td>성별</td>
   							<td>${member.m_gender }</td>
   						</tr>
   					</table>
   					
   					<div class="text-center">
		   				<input type="button" id="btn_update" class="btn btn-primary" value="수정 완료"/> 
		   				<input type="reset" id="reset" value="초기화" class="btn btn-default"/>
		   				<input type="button" id="btn_back" value="뒤로 가기"  class="btn btn-default"/>
		   				<input type="button" id="btn_delete" value="회원 탈퇴" class="btn btn-danger"/>
   					</div>
   				</form>

   			</div>
   		</div>
   </div>
   </body>
</html>