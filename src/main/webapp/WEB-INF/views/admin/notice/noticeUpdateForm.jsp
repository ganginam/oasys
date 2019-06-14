<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      
      <link href="/resources/include/css/common.css" rel="stylesheet">
      
      
      
      <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
      <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />
      <link rel="stylesheet" type="text/css" href="/resources/include/css/default.css"/>
      
      <!-- Custom styles for this template -->
       <link href="/resources/include/dist/css/dashboard.css" rel="stylesheet">

      <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
      <script type="text/javascript" src="/resources/include/js/common.js"></script>
      <script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
      <script type="text/javascript">
      $(function(){
			/* 수정 버튼 클릭 시 처리 이벤트 */
			$("#noticeUpdateBtn").click(function(){
				if(!chkSubmit($('#n_title'), "글제목을")) return;
				else if(!chkSubmit($('#n_content'), "작성할 내용을")) return;
				else {
					$("#f_updateForm").attr({
						"method":"post",
						"action":"/admin/notice/noticeUpdate"
					});
					$("#f_updateForm").submit();
				}
			});
			
			/* 취소 버튼 클릭 시 처리 이벤트 */
			$("#noticeCancelBtn").click(function(){
				$("#f_updateForm").each(function(){
					this.reset();
				});
			});
			
			/* 목록 버튼 클릭 시 처리 이벤트 */
			$("#noticeListBtn").click(function(){
				var queryString = "?pageNum="+$("#pageNum").val()+"&amount="+$("#amount").val();
				location.href="/admin/notice/noticeList"+queryString;
			});
		});
      
      </script>
   </head>
   <body>
      <div class="contentContainer container-fluidA">
       <div class="contentTit page-header"><h3 class="text-center">게시판 글수정</h3></div>
			
			<div class="contentTB text-center">
				<form id="f_updateForm" name="f_updateForm">
					<input type="hidden" id="n_num" name="n_num" value="${updateData.n_num}" />
					<input type="hidden" name="pageNum" id="pageNum" value="${data.pageNum}" />
					<input type="hidden" name="amount" id="amount" value="${data.amount}" />
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
								<td class="text-left">${updateData.n_num}</td>
								<td>작성일</td>
								<td class="text-left">${updateData.n_date}</td>
							</tr>
							<tr>
								<td>작성자</td>
								<td colspan="3" class="text-left">${updateData.n_name}</td>
							</tr>
							<tr>
								<td>글제목</td>
								<td colspan="3" class="text-left">
								<input type="text" name="n_title" id="n_title" class="form-control" value="${updateData.n_title}" /></td>
							</tr>
							<tr class="table-height">
								<td>내용</td>
								<td colspan="3" class="text-left">
								<textarea name="n_content" id="n_content" rows="8" class="form-control">${updateData.n_content}</textarea></td>
							</tr>
							
						</tbody>
					</table>
				</form>
			</div>
			
			<div class="contentBtn text-right">
				<input type="button" value="수정" id="noticeUpdateBtn"  class="btn btn-primary">
				<input type="button" value="취소" id="noticeCancelBtn"  class="btn btn-primary">
				<input type="button" value="목록" id="noticeListBtn"  class="btn btn-primary">
			</div>
      </div>
   </body>
</html>