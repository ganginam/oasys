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
	    	  $("#btn_back2").click(function(){
	    			window.history.back();
	    		});
	    	  
	    	  
	    	  $("#btn_searchId").click(function(){
	    		  var m_name = $("#m_name").val();
	    		  var m_email = $("#m_email").val();
	    		  if(!chkData("#searchId_name", "이름을")) return;
	    		  else if(!chkData("#searchId_email", "이메일을")) return;
	    		  else{
	    			  /* $.ajax({
	    				  async:true,
	    				  type:"post",
	    				  data:"m_name="+m_name&&"m_email="+m_email,
	    				  url:"/common/memberIdSearch",
	    				  dataType:"text",
	    				  success:function(data){
	    					  if(data==null){
	    						  alert("존재하지 않는 회원정보 입니다.");
	    						  $("#searchId_name").val("");
	    						  $("#searchId_name").focus();
	    					  }else{
	    						  alert("귀하의 아이디를 메일로 전송하였습니다.\n메일을 확인해주세요");
	    					  }
	    				  },
	    				  error:function(){
	    					  alert("시스템오류입니다. 관리자에게 문의해주세요");
	    				  }
	    			  }); */
	    			  $("#frm_idSearch").attr({
	    				  "method":"post",
	    				  "action":"/common/memberIdSearch"
	    			  });
	    			  $("#frm_idSearch").submit();
	    		  }
	    	  });//아이디찾기 종료
	    	  
	    	  
	    	  $("#btn_pwSearch").click(function(){
	    		if(!chkData("#searchPw_name", "이름을")) return;
	    		else if(!chkData("#searchPw_id", "아이디를")) return;
	    		else if(!chkData("#searchPw_email", "이메일을")) return;
	    		else{
	    			//window.open("/common/mailFormPw", "메일 인증","width=400, height=300, left=100, top=50");
	    			$("#frm_pwSearch").attr({
	    				"method":"post",
	    				"action":"/common/memberPwSearch"
	    			});
	    			$("#frm_pwSearch").submit();
	    		}
	    	  });
	    	  
	    	});	//최상위 $ 종료
   </script>
   </head>
	<body>
		<div class="container">
			<h1>아이디패스워드 찾기</h1>
			
			<div class="container">			
				<form id="frm_idSearch" class="form-inline">
					<h4>아이디 찾기</h4>
					<table class="table">
						<tr>
							<td>이름</td>
							<td><input type="text" name="m_name" id="searchId_name" placeholder="이름을 입력하세요"/></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" name="m_email" id="searchId_email" placeholder="이메일을 입력해주세요"/></td>
						</tr>
					</table>
					<input type="button" id="btn_searchId" name="btn_searchId" value="확인" class="btn btn-default"/>
					<input type="button" id="btn_back" value="취소" class="btn btn-default"/>
				</form>
			</div>
			
			<div class="container">			
				<form id="frm_pwSearch" class="form-inline">
					<h4>패스워드 찾기</h4>
					<table class="table">
						<tr>
							<td>이름</td>
							<td><input type="text" name="m_name" id="searchPw_name" placeholder="이름을 입력하세요"/></td>
						</tr>
						<tr>
							<td>아이디</td>
							<td><input type="text" name="m_id" id="searchPw_id" placeholder="아이디를 입력해주세요"/></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" name="m_email" id="searchPw_email" placeholder="이메일을 입력해주세요"/></td>
						</tr>
					</table>
					<input type="button" id="btn_pwSearch" name="btn_pwsearch" value="확인" class="btn btn-default"/>
					<input type="button" id="btn_back2" value="취소" class="btn btn-default"/>
				</form>
			</div>
			
		</div>
	</body>
</html>