<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		
		<title>qnaUpdate.jsp</title>
		
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
				//수정 버튼 클릭 시 처리
				$("#qnaUpdateBtn").click(function(){
				    if(!chkSubmit($('#qa_title'), "제목을")) return;
					else if(!chkSubmit($('#qa_content'), "내용을")) return;
					else{
						$("#f_updateForm").attr({
							"method":"post",
							"action":"/qna/qnaUpdate"
						});
						$("#f_updateForm").submit();
					}
				});
			
				//취소 버튼 클릭 시
				$("#qnaCancelBtn").click(function(){
					$("#f_updateForm").each(function(){
						this.reset();	
					
					});
				});
				
				//목록 버튼 클릭 시
				$("#qnaListBtn").click(function(){
					location.href = "/qna/qnaList";	
				});
			});
		
</script>
	</head>
<body>
	<div class="contentContainer container-fluid">
		<div class="contentTit page-header"><h3 class="text-center">QnA 글수정</h3></div>
	
	<div class="contentTB text-center">
		<form id="f_updateForm" name="f_updateForm">
			<input type="hidden" id="qa_num" name="qa_num" value="${updateData.qa_num}" />
			<input type="hidden" id="pageNum" name="pageNum" value="${updateData.pageNum}" />
			<input type="hidden" id="amount" name="amount" value="${updateData.amount}" />
			
			<table class="table table-bordered">
				<colgroup>
					<col width="17%" />
					<col width="33%" />
					<col width="17%" />
					<col width="33%" />
				</colgroup>
				<tbody>
					<tr>
						<td>글번호</td>
						<td class="text-left">${updateData.qa_num}</td>
						
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="3" class="text-left">${updateData.qa_author}</td>
					</tr>
					<tr>
						<td>글제목</td>
						<td colspan="3" class="text-left">
						<input type="text" name="qa_title" id="qa_title" class="form-control" value="${updateData.qa_title}" /></td>
					</tr>
					<tr class="table-height">
						<td>내용</td>
						<td colspan="3" class="text-left">
						<textarea name="qa_content" id="qa_content" rows="8" class="form-control" >${updateData.qa_content}</textarea></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td colspan="3" class="text-left">
							<input type="password" name="qa_pwd" id="qa_pwd">
							<label>수정할 비번을 입력해 주세요.</label>
						</td>
					</tr>
				</tbody>
			</table>	
		</form>
	</div>
	
	<div class="contentBtn text-right">
		<input type="button" value="수정" id="qnaUpdateBtn" class="btn btn-primary">
		<input type="button" value="취소" id="qnaCancelBtn" class="btn btn-primary">
		<input type="button" value="목록" id="qnaListBtn" class="btn btn-primary">
	</div>
</div>				
</body>
</html>