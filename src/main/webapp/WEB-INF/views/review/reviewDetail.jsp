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
		<div class="container">
			<h1>상세 페이지</h1>
			
			<form id="f_data" name="f_data" method="post">
   				<input type="hidden" name="b_num" value="${detail.re_num }"/>
   			</form>
   			
   			<table class="table table-bordered">
   				<tbody>
   					<tr>
   						<td>작성자</td>
   						<td class="text-left">${detail.re_name }</td>
   						<td>작성일</td>
   						<td class="text-left">${detail.re_date }</td>
   					</tr>
   					<tr>
   						<td>제목</td>
   						<td colspan="3" class="text-left">${detail.re_title }</td>
   					</tr>
   					<tr class="table-height">
   						<td>내용</td>
   						<td colspan="3" class="text-left">${detail.re_content }</td>
   					</tr>
   				</tbody>
   			</table>
   			
   			<div class="btnArea text-right">
   				<input type="button" value="목록" id="btn_back" class="btn btn-default"/>
   			</div>	
		</div>
	</body>
</html>