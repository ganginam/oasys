<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		
		<title>faqDetail.jsp</title>
		
		<link rel="shortcut icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/icon.png" />
		
		<!-- [if lt IE 9]>
		<script src="../js/html5shiv.js"></script> 
		<![endif]-->
	<!-- 	
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" /> -->
		<link rel="stylesheet" type="text/css" href="/resources/include/css/default.css"/>
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<!-- <script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script> -->
		<script type="text/javascript">	
			var butChk = 0;
			$(function(){
			
			//수정 버튼 클릭 시 처리 이벤트
			$("#updateFormBtn").click(function(){
				//상세 페이지로 이동하기 위해 form 추가 (id:faqDetail)
				$("#f_data").attr({
					"method":"post",
					"action":"/admin/faq/faqModify"
				
				});
				$("#f_data").submit();
			});
			
			//삭제 버튼 클릭시 처리 이벤트
			$("#faqDeleteBtn").click(function(){
				if(confirm("선택하신 내용 삭제하시겠습니까?")){
					$("#f_data").attr({
						"method":"post",
						"action":"/admin/faq/faqDelete"
					
					});
					$("#f_data").submit();
				}
			});
			
			//목록 버튼 클릭 시 처리 이벤트
			$("#faqListBtn").click(function(){
				var queryString= "?pageNum="+$("#pageNum").val()+"&amount="+$("#amount").val();
				location.href="/admin/faq/faqList"+queryString;
			
			});
		});	
		
		</script>
	</head>
	<body>
		<div>
			<div class="contentTit page-header"><h3 class="text-center">게시판 상세보기</h3></div>
			
			<form name="f_date" id="f_data" method="post">
				<input type="hidden" name="fa_num" value="${detail.fa_num}">
				<input type="hidden" name="pageNum" id="pageNum" value="${data.pageNum}">
				<input type="hidden" name="amount" id="amount" value="${data.amount}">
			</form>
		
			<div class="text-right">
				<input type="button" value="수정" id="updateFormBtn"	class="btn btn-primary">
				<input type="button" value="삭제" id="faqDeleteBtn" class="btn btn-primary">
				<input type="button" value="목록" id="faqListBtn" class="btn btn-primary">
			</div>
			<br/>
		
		
		
		
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
							<td>분류</td>
							<td class="text-left">${detail.fa_type}</td>
							<td>제목</td>
							<td class="text-left">${detail.fa_date}</td>
						</tr>
						<tr class="table-height">	
							<td>내용</td>
							<td colspan="3" class="text-left">${detail.fa_content}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>