<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		
		<title>writeForm.jsp</title>
		
		<link rel="shortcut icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/icon.png" />
		
		<!-- [if lt IE 9]>
		<script src="../js/html5shiv.js"></script> 
		<![endif]-->
		
		<!-- <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" /> -->
		<link rel="stylesheet" type="text/css" href="/resources/include/css/default.css"/>
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<!-- <script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script> -->
		<script type="text/javascript">
			$(function(){
				//저장 버튼 클릭 시 처리 이벤트
				$("#faqInsertBtn").click(function(){
					if(!chkSubmit($('#fa_type'), "분류를"))	return;
					else if(!chkSubmit($('#fa_title'), "제목을"))	return;
					else if(!chkSubmit($('#fa_content'), "내용을"))	return;
					else{
						$("#f_faqWrite").attr({
							"method":"post",
							"action":"/admin/faq/faqInsert"
						});
						$("#f_faqWrite").submit();
					}
				});
					
				//취소 버튼 클릭 시 처리 이벤트
				$("#faqCancelBtn").click(function(){
					$("#f_faqWrite").each(function(){
						this.reset();
					});
				});
				
				//목록 버튼 클릭 시 처리 이벤트
				$("#faqListBtn").click(function(){
					var queryString = "?pageNum="+$("#pageNum").val()+"&amount="+$("#amount").val();
					location.href = "/admin/faq/faqList"+queryString;
				});
			});
				
			</script>
		</head>
		<body>
			<div>
				<div class="contentTit page-header"><h3 class="text-center">게시판 글작성</h3></div>
				
				<div class="contentTB text-center">
					<form id="f_faqWrite" name="f_faqWrite" class="form-horizontal">
						<input type="hidden" name="pageNum" id="pageNum" value="${data.pageNum}">
						<input type="hidden" name="amount" id="amount" value="${data.amount}">
						<table class="table table-bordered">
							<colgroup>
								<col width="20%" />
								<col width="80%" />
							</colgroup>
						<tbody>
							<tr>
								<td>분류</td>
								<td class="text-left"><input type="text" name="fa_type" id="fa_type" class="form-control" /></td>
							</tr>
							<tr>
								<td>제목</td>
								<td class="text-left"><input type="text" name="fa_title" id="fa_title" class="form-control" /></td>
								
							</tr>
							<tr>
								<td>내용</td>
								<td class="text-left"><textarea name="fa_content" id="fa_content" class="form-control" rows="8"></textarea></td>
							</tr>
						</tbody>
					</table>
					
					<div class="text-right">
						<input type="button" value="저장" id="faqInsertBtn" class="btn btn-primary">
						<input type="button" value="취소" id="faqCancelBtn" class="btn btn-primary">
						<input type="button" value="목록" id="faqListBtn" class="btn btn-primary">
					</div>
				</form>
			</div>
		</div>
	</body>
</html>
		
	
				