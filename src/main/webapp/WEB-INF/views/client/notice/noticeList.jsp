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
		$(function () {
			
			var word="<c:out value = '${data.keyword}'/>";
			var value="";
			if(word!=""){
				$("#keyword").val("<c:out value='${data.keyword}' />")
				$("#search").val("<c:out value='${data.search}' />")
				
				if($("#search").val()!='n_content'){
					if($("#search").val()=='n_title') value ="#list tr td.goDetail";
					else if($("#search").val()=='n_name') value="#list tr td.name";
					$(value+":contains('"+word+"')").each(function() {
						var regex = new RegExp(word,'gi');
						$(this).html($(this).html().replace(regex,"<span class='required'>"+word+"</span>"));
					});
				}
			}
		
		
			/* 제목 클릭 시 상세페이지로 이동을 위한 처리 이벤트 */
			$(".goDetail").click(function() {
				var n_num = $(this).parents("tr").attr("data-num");
				$("#n_num").val(n_num);
				console.log("글번호 : " + n_num);
				//상세 페이지로 이동하기 위해 form 추가 (id : detailForm)
				$("#detailForm").attr({
					"method" : "get" ,
					"action" : "/client/notice/noticeDetail"
				});
				$("#detailForm").submit();
			});
		
			$("#search").change(function(){
				if($("#search").val()=="all"){
					$("#keyword").val("전체 데이터 조회합니다.");
				}else if($("#search").val()!="all"){
					$("#keyword").val("");
					$("#keyword").focus();
				}
			});
			
			$("#searchData").click(function(){
				if($("#search").val()!="all"){
					if(!chkData("#keyword", "검색어를")) 
						return;
				}
				goPage();
			});
			
			
			/* 페이징 처리 */
			$(".paginate_button a").click(function(e){
				e.preventDefault();
				$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
				goPage();
			}); 
		
		
		});
		
		function goPage(){
			if($("#search").val()=="all"){
				$("#keyword").val("");
			}
			$("#f_search").attr({
				"method":"get",
				"action":"/client/notice/noticeList"
			});
			$("#f_search").submit();
		}	
		
		</script>
	</head>
	<body>
		<div class="contentContainer container-fluidA">
			<div class="contentTit page-header"><h3 class="text=center">공지사항</h3></div>
			<form id="detailForm">
				<input type="hidden" id="n_num" name="n_num" />
				<input type="hidden" id="pageNum" name="pageNum" value="${pageMaker.cvo.pageNum}" />
				<input type="hidden" id="amount" name="amount" value="${pageMaker.cvo.amount}" /> 
			</form>
			
			<div id="noticeSearch" class="text-right">
				<form id="f_search" name="f_search" class="form-inline">
					<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
					<div class="form-group">
						<label>검색조건</label>
						<select id="search" name="search" class="form-control">
							<option value="all">전체</option>
							<option value="n_title">제목</option>
							<option value="n_content">내용</option>
							<option value="n_name">작성자</option>
						</select>
						<input type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요" class="form-control" />
						<button type="button" id="searchData" class="btn btn-primary btn-sm">검색</button>
					</div>
				</form>
			</div>
			<br />
			<!--                      -->
			<div id="noticeList">
				<table class="table table-bordered">
					<colgroup>
						<col width="8%">
						<col width="60%">
						<col width="17%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th>글번호</th>
							<th>글제목</th>
							<th>작성일</th>
							<th>작성자</th>	
						</tr>
					</thead>
					<tbody id="list" class="table-striped">
						<c:choose>
							<c:when test="${not empty noticeList}">
								<c:forEach var="notice" items="${noticeList}" varStatus="status">
									<tr class="tac" data-num="${notice.n_num}">
										<td>${notice.n_num}</td>
										<td class="goDetail tal">${notice.n_title}				
								
										</td>
										<td>${notice.n_date}</td>
										<td class="name">${notice.n_name}</td>
									</tr>	
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4">등록된 게시물이 존재 하지않습니다.</td>
								</tr>			
							</c:otherwise>
						</c:choose>	
					</tbody>
				</table>
			</div>
			
			<div class="text-center">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li class="paginate_button previous">
							<a href="${pageMaker.startPage -1}">Previous</a>
						</li>
					</c:if>
					
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li class="paginate_button ${pageMaker.cvo.pageNum == num ? 'active' : ''}" >
							<a href="${num}">${num}</a>
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