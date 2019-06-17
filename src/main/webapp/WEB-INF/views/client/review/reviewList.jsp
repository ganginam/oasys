<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
      <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
      <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />
      <link rel="stylesheet" type="text/css" href="/resources/include/css/lightbox.css"/>
      <link rel="stylesheet" type="text/css" href="/resources/include/css/default.css"/>
      <link rel="stylesheet" type="text/css" href="/resources/include/css/showroom.css"/>
      
      <!-- Custom styles for this template -->
       <link href="/resources/include/dist/css/dashboard.css" rel="stylesheet">
      <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
      <script type="text/javascript" src="/resources/include/js/common.js"></script>
      <script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
      <style type="text/css">
      		#hover:hover{
				font-weight:bold;
				cursor:pointer;
			}
			
			.cnt{
				color:orange;
				font-size:12px;
			}
			
			.required{
				font-weight:bold;
				font-style:italic;
			}
      	</style>
      <script type="text/javascript">
      		$(function(){
      			//제목 클릭시 상세 페이지 이동을 위한 처리 이벤트
				$(".goDetail").click(function(){
					var re_num = $(this).parents("tr").attr("data-num");
					$("#re_num").val(re_num);
					console.log("글번호 : " + re_num);
					// 상세 페이지로 이동하기 위해 form 추가 (id : detailForm)
					$("#detailForm").attr({
						"method":"get",
						"action":"/review/reviewDetail"
					});
					$("#detailForm").submit();
				});
      			
      			$("#btn_write").click(function(){
      				location.href="/review/reviewWrite";
      			});
      			
      			$(".paginate_button a").click(function(e){
    		    	e.preventDefault();
    			});
      		});
      
		</script>
   </head>
   <body>
      <div class="location">
                <ul>
                    <li><a href='/'><img src="/resources/images/hotelImages/logo.png" alt="home" class="logoImage" width="25" height="25"></a></li>
                    <li> > </li>
                    <li><a href=''>컨시어지</a></li>
                    <li> > </li>
                    <li class="current"><a href='#'>후기</a></li>
                </ul>
                <h1 class="text-center">후기</h1>
       </div>
       <br/><br/><br/><br/><br/> 
   <div id="content" class="content content-suite">
		<div class="container">
			<form id="detailForm">
   				<input type="hidden" id="re_num" name="re_num"/>
   				<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker .cvo.pageNum}" />
				<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}" />
   			</form>
   			
			<div id="reviewList">
				<table class="table">
					<thead>
						<tr>
							<th data-value="re_num" class="order">글 번호</th>
							<th>글 제목</th>
							<th data-value="re_date" class="order">작성일</th>
							<th class="borcle">작성자</th>
						</tr>
					</thead>
					
					<tbody id="list">
					
						<!-- 데이터 출력 -->
   						<c:choose>
   							<c:when test="${not empty reviewList }">
   								<c:forEach var="review" items="${reviewList }" varStatus="status">
   									<tr class="tac" data-num="${review.re_num }">
   										<td>${review.re_num }</td>
   										<td class="goDetail tal" id="hover">${review.re_title }</td>
   										<td>${review.re_date }</td>
   										<td class="name">${review.re_name }</td>
   									</tr>
   								</c:forEach>
   							</c:when>
   							<c:otherwise>
   								<tr>
   									<td colspan="4" class="tac">등록된 게시물이 존재하지 않습니다.</td>
   								</tr>
   							</c:otherwise>
   						</c:choose> 
					</tbody>
				</table>
			</div>
			
			<!-- 페이징 처리 -->
   			<div class="text-center">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li class="paginate_button previous">
							<A HREF="${pageMaker.startPage -1}">Previous</a>
						</li>
					</c:if>
					
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li class="paginate_button ${pageMaker.cvo.pageNum == num ?'active':''}">	<!-- 선택된 페이지 색깔 주기 -->
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
   			
			<c:if test="${member.m_id != null and member.m_id != '' }">
			<div class="contentBtn text-right">
				<input type="button" id="btn_write" class="btn btn-default" value="글쓰기"/>
			</div>
			</c:if>
		</div>
   </div>
   </body>
</html>