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
		<!-- <link rel="stylesheet" type="text/css" href="/resources/include/css/default.css"/> -->

		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">

		</script>
		
		<!-- Custom styles for this template -->
    	<link href="/resources/include/dist/css/dashboard.css" rel="stylesheet">
	</head>
	<body>
		<div class="contentContainer container-fluidA">
			<div class="contentTit page-header"><h3 class="text-center">회원 등급 관리</h3></div>
			
			<%-- <div id="boardSearch" class="text-right">
				<form id="f_search" name="f_search" class="form-inline">
					<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
					<div class="form-group">
						<label>검색조건</label>
						<select id="search" name="search" class="form-control">
							<option value="all">전체</option>
							<option value="b_title">제목</option>
							<option value="b_content">내용</option>
							<option value="b_name">작성자</option>
						</select>
						<input type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요" class="form-control" />
						<button type="button" id="searchData" class="btn btn-primary btn-sm">검색</button>
					</div>
				</form>
			</div> --%>
			
			
			<%-- <form id="detailForm">
				<input type="hidden" id="b_num" name="b_num" />
				<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum}" />
				<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}" />
			</form> --%>
			
			<div id="boardList">
				<table class="table table-bordered">
					<colgroup>
						<col width="10%">
						<col width="30%">
						<col width="15%">
						<col width="15%">
						<col width="15%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th>회원번호</th>
							<th>이름</th>
							<th>누적금액</th>
							<th>등급</th>
							<th>등급변경일</th>
							<th>변경</th>
						</tr>
					</thead>
					<tbody id="list" class="table-striped">
						<%-- <c:choose>
							<c:when test="${not empty boardList}">
								<c:forEach var="board" items="${boardList}" varStatus="status">
									<tr class="tac" data-num="${board.b_num}">
										<td>${board.b_num}</td>
										<td class="goDetail tal">${board.b_title} 
										<c:if test="${board.r_cnt>0}"><span class="cnt">[${board.r_cnt}]</span></c:if>
										</td>
										<td>${board.b_date}</td>
										<td class="name">${board.b_name}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4">등록된 게시물이 존재하지않습니다.</td>
							</c:otherwise>
						</c:choose> --%>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>