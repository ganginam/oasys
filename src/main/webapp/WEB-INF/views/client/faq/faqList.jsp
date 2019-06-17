<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		
		<title>faqList.jsp</title>
			
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
		
		<script type="text/javascript">
		
		$(function(){
			
			//검색 후 검색 대상과 검색 단어 출력
			var word="<c:out value='${data.keyword}' />";
			var value="";
			if(word!=""){
				$("#keyword").val("<c:out value='${data.keyword}' />");
				$("#search").val("<c:out value='${data.search}'/>");
				
				if($("#search").val()!='fa_content'){
					//:contains()는 특정 텍스트를 포함한 요소반환
					if($("#search").val()=='fa_type') value = "#list tr td.goDetail";
					else if($("#search").val()=='fa_title') value="#list tr td.goDetail";
					else if($("#search").val()=='fa_content') value="#list tr td.goDetail";
					$(value+":contains('"+word+"')").each(function(){
						var regex = new RegExp(word,'gi');
						$(this).html($(this).html().replace(regex,
								"<span class='required'>"+word+"</span>"));
						
					});
				}
			}
			
			//검색 대상이 변결될 때마다 처리 이벤트
			$("#search").change(function(){
				if($("#search").val()=="all"){
					$("#keyword").val("전체 데이터 조회합니다.");
				}else if($("#search").val()!="all"){
					$("#keyword").val("");
					$("#keyword").focus();
				}
			});
				
			//검색 버튼 클릭 시 처리 이벤트
			$("#searchData").click(function(){
				if($("#search").val() != "all"){
					if(!chkData("#keyword","검색어를"))	return;
					
				}
				goPage();			
			});
			
			//글쓰기 버튼 클릭시 처리 이벤트
			$("#insertFormBtn").click(function(){
				var queryString = "?pageNum="+$("#pageNum").val()+"&amount="+$("#amount").val();
				location.href = "/faq/faqWrite"+queryString;
			});
			
			//제목 클릭 시 상세페이지로 이동을 위한 처리 이벤트
			$(".goDetail").click(function(){
				var fa_num = $(this).parents("tr").attr("Data-num");
				$("#fa_num").val(fa_num);
				console.log("글번호: " + fa_num);
				
			//상세 페이지로 이동하기 위해 form 추가 (id:faqDetail)
			$("faqDetail").attr({
				"method":"get",
				"action":"/faq/faqDetail"
			
			});
			$("#faqDetail").submit();
		});
		    $(".paginate_button a").click(function(e){
		    	e.preventDefault();
		    $("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
		    goPage();
			
		});
	});	//$최종 닫음
	
	//검색을 위한 실질적인 처리함수
	function goPage(){
		if($("#search").val()=="all"){
			$("#keyword").val("");
		}
		$("#f_search").attr({
			"method":"get",
			"action":"/faq/faqList"
		});
		$("#f_search").submit();
	}

		</script>
	</head>
	<body>
		
		<div class="contentContainer container-fluid">
			<div class="contentTit page-header"><h3 class="text-center">자주 하는 질문</h3></div>
		
			<form id="detailForm">
				<input type="hidden" id="fa_num" name="fa_num" />
				<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker .cvo.pageNum}" />
				<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}" />
			</form>
			
			<!-- 검색기능시작 -->		
			
			<div id="faqSearch" class="text-right">
				<form id="f_search" name="f_search" class="form-inline">
					<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
					<div class="form-group">
						<label>검색 조건</label>
						<select id="search" name="search" class="form-control">
							<option value="all">전체</option>
							<option value="fa_type">분류</option>
							<option value="fa_title">제목</option>
						</select>
						<input type="Text" name="keyword" id="keyword" class="form-control" />
						<button type="button" id="searchData" class="btn btn-primary">검색</button>
					</div>
				</form>
			</div>
			
			
			
			<!-- 보이기 시작 -->
			<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
			 <c:forEach var="faq" items="${faqList}" varStatus="status">
			  <div class="panel panel-default">
			    <div class="panel-heading" role="tab" id="heading${status.count}">
			      <h4 class="panel-title">
			        <a data-toggle="collapse" data-parent="#accordion" href="#collapse${status.count}" aria-expanded="${(status.count==1)?'true':'false'}" 
			        <c:if test="${status.count > 1}"> class="collapsed"</c:if>
			        aria-controls="collapse${status.count}">
			          [${faq.fa_type}] ${faq.fa_title}
			        </a>
			      </h4>
			    </div>
			    <div id="collapse${status.count}" class="panel-collapse collapse  <c:if test="${status.count == 1}"> in</c:if>" role="tabpanel" aria-labelledby="heading${status.count}">
			      <div class="panel-body">
			     	${faq.fa_content}
			      </div>
			    </div>
			  </div>
  			</c:forEach>
  
			</div>
			<!-- 보이기 종료 -->		
			

			<%--리스트 종료 --%>
			<%--페이징 처리 --%>
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
			
		</div>
	</body>
</html>
			
			
		