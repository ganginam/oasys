<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
      
      <title>게시글 작성</title>
      
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
      <script>
      	$(document).ready(function(){
      		$("#btnDelete").click(function(){
      			if(confirm("삭제하시겠습니까?")){
      				document.form1.action = "${path}/faq/delete.do";
      				document.form1.submit();
      			}
      		});
      	
      		$("#btnUpdate").click(function(){
      			var type = $("#type").val();
      			var title = $("#title").val();
      			var content = $("#content").val();
      			if(type == ""){
      				alert("분류를 입력하세요");
      				document.form1.type.focus();
      				return;
  				}
      			if(title == ""){
      				alert("제목을 입력하세요");
      				document.form1.title.focus();
      				return;
      			}
      			if(content == ""){
      				alert("내용을 입력하세요");
      				document.form1.content.focus();
      				return;
      				
      			}
      			document.form1.action="${path}/faq/update.do"
      			//폼에 입력한 데이터를 서버로 전송
      			document.form1.submit();
      		});
      	});
      		
      </script>
      
      <script type="text/javascript">
  	</script>
   </head>
<body>
	<h2>게시글 보기</h2>
	<form name="form1" method="post">
		<div>
			분류
			<input name="type" id="type" size="80" value="${dto.type}" placeholder="분류를 입력해주세요">
			<%-- 작성일자 : <fmt:formatDate value="${dto.date}" pattern="yyyy-MM-dd, HH:mm:ss"/> --%>
		</div>
		<div>
			제목
			<input name="title" id="title" size="80" value="${dto.title}" placeholder="제목을 입력해주세요">
		</div>	
		<div>
			내용
			<input name="content" id="content" size="100" value="${dto.content}" placeholder="내용을 입력해주세요">
		</div>	
	<div style="width:650px; text-align: center;">
		<!--게시물 번호를 hidden으로 처리 -->
		<input type="hidden" name="fa_num" value="${dto.fa_num}">
		<button type="button" id="btnUpdate">수정</button>
		<button type="button" id="btnDelete">삭제</button>
	</div>

</form>
</body>
</html>