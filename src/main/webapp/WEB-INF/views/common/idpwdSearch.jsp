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
   </script>
   </head>
	<body>
		<div>
			<h1>아이디패스워드 찾기</h1>
			
			<div>			
				<form>
					<h4>아이디 찾기</h4>
					<table>
						<tr>
							<td>이름</td>
							<td><input type="text" name="searchId_name" id="searchId_name" placeholder="이름을 입력하세요"/></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" name="searchId_email" id="searchId_email" placeholder="이메일을 입력해주세요"/></td>
						</tr>
					</table>
					<input type="button" id="btn_searchId" name="btn_searchId" value="확인"/>
				</form>
			</div>
			
			<div>			
				<form>
					<h4>패스워드 찾기</h4>
					<table>
						<tr>
							<td>이름</td>
							<td><input type="text" name="searchPw_name" id="searchPw_name" placeholder="이름을 입력하세요"/></td>
						</tr>
						<tr>
							<td>아이디</td>
							<td><input type="text" name="searchPw_id" id="searchPw_id" placeholder="아이디를 입력해주세요"/></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" name="searchPw_email" id="searchPw_email" placeholder="이메일을 입력해주세요"/></td>
						</tr>
					</table>
					<input type="button" id="btn_pwSearch" name="btn_pwsearch" value="확인"/>
				</form>
			</div>
			
		</div>
	</body>
</html>