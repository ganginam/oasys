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
      var butChk = 0;
		$(function() {
			/* 목록 버튼 클릭 시 처리 이벤트 */
			$("#noticeListBtn").click(function(){
				var queryString = "?pageNum="+$("#pageNum").val()+"&amount="+$("#amount").val();
				location.href="/admin/notice/noticeList"+queryString;
			});
			
			/* 수정 버튼 클릭 시 처리 이벤트 */
			$("#updateFormBtn").click(function() {
				$("#f_data").attr({
					"method":"get",
					"action":"/admin/notice/noticeUpdateForm"
				});
				$("#f_data").submit();
			
			});	
				
			/* 삭제 버튼 클릭 시 처리 이벤트 */
			$("#noticeDeleteBtn").click(function () {
				if(confirm("선택하신 공지글을 삭제하시겠습니까?")){
				
					$("#f_data").attr({
						"method":"get",
						"action":"/admin/notice/noticeDelete"
					});
					$("#f_data").submit();
				}
				/* $.ajax({
					//url : "/"		
					type : "post",
					data : "j_no = " + $("#j_no").val(),
					dataType : "text" , 
					error : function() {
						alert('시스템 오류입니다. 관리자에게 문의 하세요.');
					}
			
				}); */
			});
		});
      
      </script>
   </head>
   <body>
      <div class="contentContainer container-fluidA">
        <div class="contentTit page-header"><h3 class="text-center"> 공지사항 상세보기</h3></div>
			
			<form name="f_data" id="f_data" method="post">
				<input type="hidden" name="n_num" value="${detail.n_num}">
				<input type="hidden" name="pageNum" id="pageNum" value="${data.pageNum}" />
				<input type="hidden" name="amount" id="amount" value="${data.amount}" />
			</form>
			
			
				<div class="text-right">
					<input type="button" value="수정" id="updateFormBtn" class="btn btn-primary" >
					<input type="button" value="삭제" id="noticeDeleteBtn" class="btn btn-primary"> 
					<input type="button" value="목록" id="noticeListBtn" class="btn btn-primary">
				</div>
			</div><br />
		
			<div class="contentTB text-center">
				<table class="table table-bordered">
					<colgroup>
						<col width="17%" />
						<col width="33%" />
						<col width="17%" />
						<col width="33%" />
					</colgroup>
					<tbody>
						<tr>
							<td>작성자</td>
							<td class="text-left">${detail.n_name}</td>
							<td>작성일</td>
							<td class="text-left">${detail.n_date}</td>
						</tr>
						<tr>
							<td>제목</td>
							<td colspan="3" class="text-left">${detail.n_title}</td>
						</tr>
						<tr class="table-height">
							<td>내용</td>	
							<td colspan="3" class="text-left">${detail.n_content}</td>
						</tr>	
					</tbody>
				</table>
			</div>		
     
   </body>
</html>