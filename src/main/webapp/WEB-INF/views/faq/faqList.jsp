<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		
		<title>게시글 목록</title>
<%@ include file="../template/client/header.jsp" %>	

	
		
		<link rel="shortcut icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/icon.png" />
		
		<!-- [if lt IE 9]>
		<script src="../js/html5shiv.js"></script> 
		<![endif]-->
		
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/css/default.css"/>
	
		<script type="text/javascript"></script>
	
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script>
			$(document).ready(function(){
				$("#btnWrite").click(function(){
					//페이지 주소 변경(이동)
					location.href = "#{path}/faq/faqWrite.do";
				});
			});
		</script>
	</head>
<body>
	<h2>고객센터</h2>
	<div class="contentContainer container-fluid">
			<div class="contentTit page-header"><h3 class="text-center">자주 묻는 질문</h3></div>
			
			<form id="detailForm">
				<input type="hidden" id="b_num" name="b_num" />
				<input type="hidden" name="pageNum" id="pageNum" value="1" />
				<input type="hidden" name="amount" id="amount" value="10" />
			</form>
			
			
			
			<div id="faqSearch" class="text-right">
				<form id="f_search" name="f_search" class="form-inline">
					<input type="hidden" name="pageNum" value="1">
					<input type="hidden" name="amount" value="10">
					<div class="form-group">
						<label>검색 조건</label>
						<select id="search" name="search" class="form-control">
							<option value="all">전체</option>
							<option value="fa_type">분류</option>
							<option value="fa_title">제목</option>
							<option value="fa_content">내용</option>
						</select>
						<input type="text" name="keyword" id="keyword" class="form-control" />
						<button type="button" id="searchData" class="btn btn-primary">검색</button>
					</div>
				</form>		
			</div>
		</div>
	

	<button type="button" id="btnWrite">글쓰기</button>
	<table border="1" width="600px">
		<tr>
			<th>번호</th>
			<th>분류</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성일</th>
		</tr>
		<c:forEach var="row" items="${list}">
		<tr>
			<td>${row.fa_num}</td>
			<td><a href="${path}/faq/view.do?fa_num=${row.fa_num}">${row.title}</a></td>
			<td>${row.writer}</td>
			<td>
				<!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
				<fmt:formatDate value="${row.fa_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
			</td>	
		</c:forEach>
		</table>
		
		<a href='<c:url value='../faq/faqWrite'/>' role="button" class="btn btn-outline-info">글쓰기</a>
		
		
	</body>
</html>
			