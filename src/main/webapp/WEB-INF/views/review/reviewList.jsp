<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
      
      	<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
      	<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />
      	<link rel="stylesheet" type="text/css" href="/resources/include/css/default.css"/>
      
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
      	<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
      	<script type="text/javascript" src="/resources/include/js/common.js"></script>
      	<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
      	<script type="text/javascript">
      		$(function(){
      			//제목 클릭시 상세 페이지 이동을 위한 처리 이벤트
				$(".goDetail").click(function(){
					var b_num = $(this).parents("tr").attr("data-num");
					$("#b_num").val(b_num);
					console.log("글번호 : " + b_num);
					// 상세 페이지로 이동하기 위해 form 추가 (id : detailForm)
					$("#detailForm").attr({
						"method":"get",
						"action":"/review/reviewDetail"
					});
					$("#detailForm").submit();
				});
      		})
      
		</script>
	</head>
	<body>
		<div class="container">
			<br /><br /><br />
			<h1>후기</h1>
			
			<form id="detailForm">
   				<input type="hidden" id="b_num" name="b_num"/>
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
   										<td class="goDetail tal" id="hover">${review.re_title }
   										<c:if test="${review.r_cnt>0 }"><span class="cnt">[${review.r_cnt }]</span></c:if>
   										</td>
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
			
			<div class="contentBtn text-right">
				<input type="button" id="btn_write" class="btn btn-default" value="글쓰기"/>
			</div>
		</div>
	</body>
</html>