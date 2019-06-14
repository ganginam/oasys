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
      $(function() {
			/* 저장 버튼 클릭 시 처리 이벤트 */
			$("#noticeInsertBtn").click(function() {
				if(!chkSubmit($("#n_name"), '작성자를')) return;
				else if(!chkSubmit($('#n_title'), "글제목을")) return;
				else if(!chkSubmit($('#n_content') , "작성할 내용을")) return;
		
				else {
					$("#f_writeForm").attr({
						"method":"post" ,
						"action" : "/admin/notice/noticeInsert"
					});
					$("#f_writeForm").submit();
				}
			});
			
			/* 취소 버튼 클릭 시 처리 이벤트 */
			$("#noticeCancelBtn").click(function() {
				$("#f_writeForm").each(function () {
					this.reset();
				});
			});
		
			/* 목록 버튼 클릭 시 처리 이벤트 */
			$("#noticeListBtn").click(function() {
				var queryString = "?pageNum =" + $("pagenum").val() + "&amount =" + $("#amount").val();
				location.href="/admin/notice/noticeList" + queryString;
			});
		});
      	
      
      </script>
   </head>
   <body>
      <div class="contentContainer container-fluidA">
       <div class="contentTit page-header"><h3 class="text-center">공지사항 글 작성</h3></div>
		
			<div class="contentTB text-center">
				<form id="f_writeForm" name="f_writeForm" class="form-horizontal">
					<input type="hidden" name="pageNum" id="pageNum" value="${data.pageNum}" />
					<input type="hidden" name="amount" id="amount" value="${data.amount}" />
					<table class="table table-bordered">
						<colgroup>
							<col width="20%" />
							<col width="80%" />
						</colgroup>
						<tbody>
							<tr>
								<td>작성자</td>
								<td class="text-left"><input type="text" name="n_name"  id="n_name" class="form-control" /></td>
							</tr>
							<tr>
								<td>글 제목</td>
								<td class="text-left"><input type="text" name="n_title" id="n_title" class="form-control" /></td>
							</tr>
							<tr>
								<td>글 내용</td>
								<td class="text-left"><textarea name="n_content" id="n_content" class="form-control" rows="8"></textarea></td>
							</tr>
						</tbody>
					</table>
				
					<div class="text-right">
						<input type="button" value="저장" id="noticeInsertBtn" class="btn btn-primary">
						<input type="reset" value="취소" id="noticeCancelBtn" class="btn btn-primary">
						<input type="button" value="목록" id="noticeListBtn" class="btn btn-primary">
					</div>
				</form>
			</div>
      </div>
   </body>
</html>