<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		
		<title>관리자</title>
		
		<link rel="shortcut icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/icon.png" />
		
		<!-- [if lt IE 9]>
		<script src="../js/html5shiv.js"></script> 
		<![endif]-->
		
	<!-- 	<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" /> -->
		<link rel="stylesheet" type="text/css" href="/resources/include/css/default.css"/>
	
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<!-- <script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script> -->
		<script type="text/javascript">
		$(function(){
			
			//제목 클릭 시 상세페이지로 이동을 위한 처리 이벤트
			$(".goDetail").click(function(){
				var qa_num = $(this).parents("tr").attr("data-num");
				$("#qa_num").val(qa_num);
				console.log("글번호: " + qa_num);
			
				//상세 페이지로 이동하기 위해 form 추가
				$("#detailForm").attr({
					"method":"get",
					"action":"/admin/qna/qnaDetail"
				});
				$("#detailForm").submit();
					
			});
			
			
			$(".paginate_button a").click(function(e){
				e.preventDefault();
				$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
				goPage();
			});
		});
		
		//검색을 위한 실질적인 처리함수
		function goPage(){
			if($("#search").val()=="all"){
				$("#keyword").val("");
			}
			$("#f_search").attr({
				"method":"get",
				"action":"/admin/qna/qnaList"
			});
			$("#f_search").submit();
		}
		
		
		</script>
		</head>
		<body>
			<div> <!-- class="contentContainer container-fluid" -->
				<div class="contentTit page-header"><h3 class="text-center">문의게시판(관리자)</h3></div>
				<form id="detailForm">
						<input type="hidden" id="qa_num" name="qa_num" />
						<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum}" />
						<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}" />
				</form>
		<!-- 검색기능시작 -->
		
		<div id="boardSearch" class="text-right">
			<form id="f_search" name="f_search" class="form-inline">
				<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
				<div class="form-group">
				<label>검색 조건</label>
				<select id="search" name="search" class="form-control">
					<option value="all">전체</option>
					<option value="qa_title">제목</option>
					<option value="qa_content">내용</option>
					<option value="qa_author">작성자</option>
				</select>
				<input type="text" name="keyword" id="keyword" class="form-control" />
				<button type="button" id="searchData" class="btn btn-primary">검색</button>
			</div>
		</form>
	</div>
	
	
				<div id="qnaList">
				<table class="table table-bordered">
					<colgroup>
						<col width="10%">
						<col width="50%">
						<col width="20%">
						<col width="20%">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>날짜</th>
						</tr>
				</thead>
				<tbody id="list" class="table-striped">
					<c:choose>
						<c:when test="${not empty qnaList}">
							<c:forEach var="qna" items="${qnaList}" varStatus="status">
								<tr class="tac" data-num="${qna.qa_num}">
									<td>${qna.qa_num}</td>
									
									<td class="goDetail tal">${qna.qa_title}
									
									<c:if test="${qna.r_cnt>0}"><span class="cnt">[${qna.r_cnt}]</span></c:if>
									</td>
									<td class="author">${qna.qa_author}</td>
									<td>${qna.qa_date}</td>
									
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
						
							<tr>
								<td colspan="6">등록된 게시물이 존재하지 않습니다.</td>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
					<!-- 리스트 종료 -->
					<!-- 페이징 처리 -->	
		<div class="text-center">
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<li class="paginate_button previous">
						<a href="${pageMaker.startPage -1}">Previous</a>
					</li>
				</c:if>
				
				<c:forEach var="qa_num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					<li class="paginate_button ${pageMaker.cvo.pageNum == qa_num ?'active':''}">
						<a href="${qa_num}">${qa_num}</a>
					</li>
				</c:forEach>
				
				<c:if test="${pageMaker.next}">
					<li class="paginate_button next"> 
						<a href="${pageMaker.endPage +1}">Next</a>
					</li>
				</c:if>
				</ul>
			</div>
		</div>
	</body>
</html>
		